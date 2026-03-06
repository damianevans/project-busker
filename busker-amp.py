"""
Busker Amp - Guitar Effects and Looper Application
Optimized for Raspberry Pi 4 with AudioInjector HAT
Performance improvements:
- Thread-safe audio parameter updates
- Reduced VU meter update rate (10Hz vs 20Hz)
- Simplified effect chain
- Improved error handling
- Removed dead code
"""

import pyo64
import time
import os
import shutil
import logging
import threading
from gpiozero import MCP3008, LEDBarGraph, LED
from modules.bt_footswitch_recv import ESP32BLEClient
import asyncio

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# ============================================================================
# AUDIO SERVER INITIALIZATION
# ============================================================================

s = pyo64.Server()
s.setInOutDevice(1)
s.boot()
s.start()

# Audio inputs
audio    = pyo64.Input(chnl=0)      # Left channel - Guitar with effects
dry      = pyo64.Input(chnl=0)      # Left channel input for dry signal
vu_input = pyo64.Input(chnl=1)      # Right channel - VU meter input (not mixed to output)

# ============================================================================
# FILE PATHS AND LOOP INITIALIZATION
# ============================================================================

cdir      = os.path.dirname(os.path.abspath(__file__))
silence   = os.path.join(cdir, 'silent.wav')
loop_file = os.path.join(cdir, 'pedalloop.wav')

logger.info(f"Using silence file: {silence}")
logger.info(f"Using loop file: {loop_file}")

# Initialize loop file safely
try:
    if os.path.exists(loop_file):
        os.remove(loop_file)
    shutil.copy(silence, loop_file)
except Exception as e:
    logger.error(f"Error initializing loop file: {e}")
    raise

loop_vol = 0.9

# Initialize loop player once - don't recreate it
loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol)
loop_rec = None
looperState = oldLooperState = "IDLE"

# ============================================================================
# EFFECT CHAIN - OPTIMIZED
# ============================================================================

# Wah effect
follow = pyo64.Follower(audio)
wahfq  = pyo64.Scale(follow, outmin=300, outmax=20000)

# Effects processing chain
chorus  = pyo64.Chorus(audio, feedback=0.25, bal=1)
reverb  = pyo64.Freeverb(chorus)
distort = pyo64.Disto(reverb)
filter  = pyo64.MultiBand(distort, num=3, mul=[1, 1, 1])

# Wah filter (butterworth bandpass with reduced Q for better performance)
wah = pyo64.ButBP(filter, freq=wahfq, q=20)

# Main mix: dry signal + wet effects + wah
mix = pyo64.Mix([dry, filter, wah]).out()

# ============================================================================
# EFFECT PARAMETERS AND SYNCHRONIZATION
# ============================================================================

amplitude_right = None
leds_on = True

# Effect control dictionary
fx = {
    'bass': 0, 'mid': 0, 'treb': 0,
    'wet': 0, 'dry': 0, 'chorus': 0,
    'reverb': 0, 'distort': 0, 'wah': 0
}

# Thread synchronization
data_lock = threading.Lock()

# VU meter tracking
max_RMS_right = 0
VU_factor_right = 1

# ============================================================================
# GPIO SETUP - VU METER LEDs
# ============================================================================

# Green LEDs (3 levels)
led_gr1 = "BOARD16"  # GPIO23
led_gr2 = "BOARD15"  # GPIO22
led_gr3 = "BOARD36"  # GPIO16
led_gr4 = "BOARD31"  # GPIO6

# Yellow LEDs (2 levels)
led_yel1 = "BOARD29"  # GPIO5
led_yel2 = "BOARD22"  # GPIO25
led_yel3 = "BOARD18"  # GPIO24

# Red LEDs (peak indicators)
led_red1 = "BOARD10"  # GPIO15 / RX
led_red2 = "BOARD8"   # GPIO14 / TX

# VU meter LED bar graph (9 total LEDs)
vu_leds = LEDBarGraph(led_gr1, led_gr2, led_gr3, led_gr4,
                      led_yel1, led_yel2, led_yel3,
                      led_red1, led_red2)
vu_leds.off()
vu_leds.value = 0

# Bluetooth and looper status LEDs
bt_led = LED("BOARD11")          # GPIO17
looper_led_red = LED("BOARD7")   # GPIO4
looper_led_green = LED("BOARD13")  # GPIO27


# ============================================================================
# VU METER THREAD - OPTIMIZED
# ============================================================================

def vu_meter_loop():
    """
    Dedicated thread for VU meter LED updates (Right channel monitoring).
    Reduced from 20Hz to 10Hz update rate for better CPU efficiency.
    """
    global amplitude_right, max_RMS_right, VU_factor_right
    
    amplitude_right = pyo64.RMS(vu_input)
    
    while True:
        try:
            if amplitude_right is not None:
                rms_value = amplitude_right.get(all=True)
                if rms_value:
                    current_rms = rms_value[0]
                    with data_lock:
                        # Set VU max to highest value, but decay over time
                        if current_rms > max_RMS_right:
                            max_RMS_right = current_rms
                            VU_factor_right = 9 / max_RMS_right  # 9 bars total
                        elif max_RMS_right > 0.05:
                            max_RMS_right -= 0.005
                        
                        if leds_on:
                            # Normalize to 0-1 range for LED bar graph
                            led_value = min(1.0, current_rms * VU_factor_right / 9)
                            vu_leds.value = led_value
        except Exception as e:
            logger.error(f"VU meter error: {e}")
        
        # 100ms sleep = 10Hz update rate (sufficient for LED feedback)
        time.sleep(0.1)


# ============================================================================
# INPUT LOOP - OSC MESSAGE HANDLING
# ============================================================================

def inputLoop():
    """
    OSC message handler for effect parameters and looper state changes.
    Maintains thread safety with data_lock.
    """
    global loop_rec, loop_play, loop_file, silence
    
    def getDataMessage(address, *args):
        """
        Callback for OSC messages. Prioritizes audio processing over VU meter.
        """
        global loop_rec, loop_play, loop_file, silence
        
        try:
            if address == "/data/eq":
                # Update effect parameters with thread safety
                with data_lock:
                    (fx['bass'], fx['mid'], fx['treb'], fx['wet'], fx['dry'],
                     fx['chorus'], fx['reverb'], fx['distort'], fx['wah']) = args
                    
                    # Apply parameter changes to audio objects
                    filter.mul = [fx['bass'] * 100, fx['mid'] * 100, fx['treb'] * 100]
                    dry.mul = 1 - fx['dry']
                    filter.mul = fx['wet']  # Note: filter acts as wet signal
                    chorus.depth = fx['chorus']
                    reverb.size = fx['reverb']
                    distort.drive = fx['distort']
                    wah.mul = fx['wah']
            
            elif address == "/data/looperstate":
                localLooperState = args[0].upper()
                logger.info(f"Looper state changed to: {localLooperState}")
                
                if localLooperState == "IDLE":
                    looper_led_red.off()
                    looper_led_green.off()
                    if loop_play.isPlaying():
                        loop_play.stop()
                    if loop_rec is not None:
                        loop_rec.stop()
                        loop_rec = None
                
                elif localLooperState == "RECORDING":
                    logger.info("Starting recording...")
                    looper_led_red.on()
                    looper_led_green.off()
                    
                    if loop_play.isPlaying():
                        loop_play.stop()
                    if loop_rec is not None:
                        loop_rec.stop()
                    
                    # Clear and reset loop file
                    try:
                        shutil.copy(silence, loop_file)
                        loop_rec = pyo64.Record(mix, filename=loop_file,
                                               fileformat=0, sampletype=1)
                        logger.info("Recording active")
                    except Exception as e:
                        logger.error(f"Failed to start recording: {e}")
                
                elif localLooperState == "PLAYBACK":
                    looper_led_red.off()
                    looper_led_green.on()
                    
                    if loop_rec is not None:
                        logger.info("Stopping recording...")
                        loop_rec.stop()
                        loop_rec = None
                        # Wait for file to be written and flushed
                        time.sleep(0.2)
                    
                    if loop_play.isPlaying():
                        loop_play.stop()
                    
                    try:
                        logger.info("Starting playback...")
                        loop_play = pyo64.SfPlayer(loop_file, loop=True,
                                                  mul=loop_vol).out()
                    except Exception as e:
                        logger.error(f"Failed to start playback: {e}")
                
                elif localLooperState == "STOPPED":
                    looper_led_red.off()
                    looper_led_green.blink()
                    
                    if loop_play.isPlaying():
                        loop_play.stop()
                    if loop_rec is not None:
                        loop_rec.stop()
                        loop_rec = None
                    
                    logger.info("Playback stopped")
                
                elif localLooperState == "ERASE":
                    if loop_play.isPlaying():
                        loop_play.stop()
                    if loop_rec is not None:
                        loop_rec.stop()
                        loop_rec = None
                    
                    try:
                        shutil.copy(silence, loop_file)
                        loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol)
                        loop_play.stop()
                        logger.info("Loop erased")
                    except Exception as e:
                        logger.error(f"Failed to erase loop: {e}")
        
        except Exception as e:
            logger.error(f"Error handling OSC message {address}: {e}")
    
    # Create OSC receiver
    recv = pyo64.OscDataReceive(port=9900, address="/data/*",
                               function=getDataMessage)
    
    # Keep loop running
    while True:
        time.sleep(0.05)


# ============================================================================
# CONTROL LOOP - POT/SLIDER INPUT
# ============================================================================

def controlLoop():
    """
    Reads analog potentiometer values and sends them via OSC.
    """
    numlines = 8
    
    pots = [MCP3008(channel=n) for n in range(numlines)]
    vals = [0] * numlines
    sender = pyo64.OscDataSend(types="fffffffff", port=9900,
                              address="/data/eq", host="localhost")
    
    while True:
        try:
            # Read pot values with deadzone (0.1)
            new_vals = [1 - int(pots[n].value * 100) / 100
                       for n in range(numlines)]
            
            # Only send if values changed significantly
            for i, nv in enumerate(new_vals):
                if abs(vals[i] - nv) > 0.1:
                    vals[i] = nv
            
            # Map pot values to effect parameters
            wet = vals[0]
            bass = vals[1] * 2
            mid = vals[2] * 2
            treb = vals[3] * 2
            dry = 1 - wet
            chorus = vals[4]
            reverb = vals[5]
            distort = vals[6] ** 0.05  # Exponential mapping for better feel
            wah = vals[7] * 30
            
            # Send via OSC
            sender.send([bass, mid, treb, wet, dry, chorus, reverb, distort, wah])
            
            time.sleep(0.05)
        
        except Exception as e:
            logger.error(f"Error in control loop: {e}")
            time.sleep(0.1)


# ============================================================================
# PEDAL/BLUETOOTH LOOP
# ============================================================================

async def pedalLoop():
    """
    Manages Bluetooth connection to ESP32 footswitch controller.
    """
    global looperState, oldLooperState
    
    bt_led.blink(on_time=0.5, off_time=0.75)  # Indicate startup
    looper_led_red.off()
    looper_led_green.off()
    looperState = oldLooperState = "IDLE"
    
    ble_client = ESP32BLEClient("ESP32")
    loopSender = pyo64.OscDataSend(types="s", port=9900,
                                  address="/data/looperstate",
                                  host="localhost")
    
    try:
        # Connect to ESP32
        if not await ble_client.connect():
            logger.error("Failed to connect to ESP32. Try re-starting the device.")
            return
        
        logger.info("Connected to ESP32")
        
        # Main loop
        while ble_client.connected:
            try:
                await asyncio.sleep(0.5)
                bt_led.on()  # Connected indicator
                
                looperState = ble_client.get_latest_looperstate()
                if looperState != oldLooperState:
                    # Flash LED to indicate state change
                    bt_led.blink(on_time=0.1, off_time=0.1, n=2)
                    await ble_client.send_message("RECV:" + looperState)
                    oldLooperState = looperState
                    loopSender.send([looperState])
            
            except KeyboardInterrupt:
                logger.info("Shutting down...")
                break
            except Exception as e:
                logger.error(f"Error in pedal loop: {e}")
                await asyncio.sleep(1)
    
    except Exception as e:
        logger.error(f"Application error: {e}")
    
    finally:
        await ble_client.disconnect()
        bt_led.off()
        logger.info("Disconnected from ESP32")


async def run_pedal_loop():
    """
    Wrapper to keep the async event loop running.
    """
    global pedal_loop_task
    pedal_loop_task = asyncio.create_task(pedalLoop())
    while True:
        await asyncio.sleep(0.07)


# ============================================================================
# MAIN ENTRY POINT
# ============================================================================

if __name__ == "__main__":
    logger.info("=== Busker Amp Starting ===")
    logger.info(f"Audio device: {s.getOutputDevice()}")
    
    # Create and start threads
    thread1 = threading.Thread(target=inputLoop, name="InputLoop", daemon=False)
    thread2 = threading.Thread(target=controlLoop, name="ControlLoop", daemon=False)
    thread3 = threading.Thread(target=vu_meter_loop, name="VUMeterLoop", daemon=True)
    
    thread1.start()
    logger.info("Input loop started")
    
    thread2.start()
    logger.info("Control loop started")
    
    thread3.start()
    logger.info("VU meter loop started")
    
    try:
        asyncio.run(run_pedal_loop())
    except KeyboardInterrupt:
        logger.info("Main thread interrupted")
    finally:
        try:
            pedal_loop_task.cancel()
        except:
            pass
        
        # Join worker threads
        thread1.join(timeout=2)
        thread2.join(timeout=2)
        
        logger.info("=== Busker Amp Stopped ===")
