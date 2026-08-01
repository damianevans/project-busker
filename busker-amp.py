import pyo64
import time
import os
import shutil
import logging
from gpiozero import MCP3008, LEDBarGraph, LED
import threading
from modules.bt_footswitch_recv import ESP32BLEClient
import asyncio

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Audio server
s = pyo64.Server()

# Select input/output device(s) if supported by this pyo64 build
# Prefer explicit input/output setters; fall back to setInOutDevice if present.
AUDIO_DEVICE_INDEX = 1
if hasattr(s, "setInputDevice") and hasattr(s, "setOutputDevice"):
    try:
        s.setInputDevice(AUDIO_DEVICE_INDEX)
        s.setOutputDevice(AUDIO_DEVICE_INDEX)
        logger.info(f"Set input/output device to index {AUDIO_DEVICE_INDEX}")
    except Exception as e:
        logger.warning(f"Could not set input/output device: {e}")
elif hasattr(s, "setInOutDevice"):
    try:
        s.setInOutDevice(AUDIO_DEVICE_INDEX)
        logger.info(f"Set in/out device to index {AUDIO_DEVICE_INDEX} (setInOutDevice)")
    except Exception as e:
        logger.warning(f"Could not set in/out device: {e}")
else:
    logger.info("No device selection methods available on Server() — using defaults")

s.boot()
s.start()

# Audio inputs
audio    = pyo64.Input()
dry      = pyo64.Input()

# File paths
cdir        = os.path.dirname(os.path.abspath(__file__))
silence     = os.path.join(cdir, 'silent.wav')
loop_file   = os.path.join(cdir, 'pedalloop.wav')

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

loop_vol    = 0.9

# Initialize loop player once - don't recreate it
loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol)
loop_rec    = None
looperState = oldLooperState = "IDLE"

# Effects chain
follow   = pyo64.Follower(audio)
wahfq    = pyo64.Scale(follow, outmin=300, outmax=20000)
chorus   = pyo64.Chorus(audio, feedback=0.25, bal=1)
reverb   = pyo64.Freeverb(chorus)
distort  = pyo64.Disto(reverb)
filter   = pyo64.MultiBand(distort, num=3, mul=[1,1,1])
wet      = pyo64.Mix([filter])
wah      = pyo64.ButBP(wet, freq=wahfq, q=30)

mix = pyo64.Mix([dry, wet, wah]).out()       # Main effects mix

# State
amplitude = None
leds_on = True
fx = {'bass': 0, 'mid': 0, 'treb': 0,'wet': 0, 'dry': 0, 'chorus': 0, 'reverb':0, 'distort': 0, 'wah': 0}
data_lock = threading.Lock()
max_RMS = 0.0

# GPIO VU LEDs
led_gr1 = "BOARD16" # GPIO23
led_gr2 = "BOARD15" # GPIO22
led_gr3 = "BOARD36" # GPIO 16
led_gr4 = "BOARD31" #GPIO 6

led_yel1 = "BOARD29" #GPIO 5
led_yel2 = "BOARD22" #GPIO 25
led_yel3 = "BOARD18" #GPIO 24

led_red1 = "BOARD10" #GPIO15 / RX
led_red2 = "BOARD8" #GPIO14 / TX

vu_leds = LEDBarGraph(led_gr1, led_gr2, led_gr3, led_gr4,
                      led_yel1, led_yel2, led_yel3,
                      led_red1, led_red2)
vu_leds.off()
vu_leds.value = 0
bt_led = LED("BOARD11") # GPIO 17
looper_led_red = LED("BOARD7") #GPIO4
looper_led_green = LED("BOARD13") #GPIO27


def RMS_meter_callback(*args):
    """Callback from pyo RMS meter. Normalizes using the current observed max_RMS and decays max over time."""
    global max_RMS
    try:
        val = float(args[0])
    except Exception:
        return

    with data_lock:
        # Update peak tracking and decay
        if val > max_RMS:
            max_RMS = val
        elif max_RMS > 0.05:
            max_RMS = max(0.0, max_RMS - 0.005)

        # Normalize: avoid double-dividing by the number of LEDs
        if leds_on and max_RMS > 0:
            led_value = min(1.0, val / max_RMS)
        else:
            led_value = 0.0

        try:
            vu_leds.value = led_value
        except Exception as e:
            logger.debug(f"Failed to set VU LED value: {e}")


def inputLoop():
    """OSC message handler for effect parameters and looper state changes."""
    global amplitude, loop_rec, loop_play, loop_file, silence
    amplitude = pyo64.RMS(mix, function=RMS_meter_callback)

    def getDataMessage(address, *args):
        global amplitude, loop_rec, loop_play, loop_file, silence
        try:
            if address == "/data/eq":
                with data_lock:
                    (fx['bass'], fx['mid'], fx['treb'], fx['wet'], fx['dry'],
                     fx['chorus'], fx['reverb'], fx['distort'], fx['wah']) = args

                    # Apply parameter changes to audio objects
                    filter.mul = [fx['bass']*100, fx['mid']*100, fx['treb']*100]
                    dry.mul = 1 - fx['dry']
                    wet.mul = fx['wet']
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
                    with data_lock:
                        if loop_play is not None and hasattr(loop_play, 'isPlaying') and loop_play.isPlaying():
                            try:
                                loop_play.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_play: {e}")
                        if loop_rec is not None:
                            try:
                                loop_rec.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_rec: {e}")
                            loop_rec = None

                elif localLooperState == "RECORDING":
                    logger.info("Starting recording...")
                    looper_led_red.on()
                    looper_led_green.off()

                    with data_lock:
                        if loop_play is not None and hasattr(loop_play, 'isPlaying') and loop_play.isPlaying():
                            try:
                                loop_play.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_play before record: {e}")
                        if loop_rec is not None:
                            try:
                                loop_rec.stop()
                            except Exception:
                                pass

                        # Clear the loop file and start fresh recording
                        try:
                            shutil.copy(silence, loop_file)
                            loop_rec = pyo64.Record(mix, filename=loop_file, fileformat=0, sampletype=1)
                            logger.info("Recording active")
                        except Exception as e:
                            logger.error(f"Failed to start recording: {e}")

                elif localLooperState == "PLAYBACK":
                    looper_led_red.off()
                    looper_led_green.on()

                    with data_lock:
                        if loop_rec is not None:
                            logger.info("Stopping recording...")
                            try:
                                loop_rec.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_rec: {e}")
                            loop_rec = None
                            # Wait for file to be written and flushed
                            time.sleep(0.2)

                        if loop_play is not None and hasattr(loop_play, 'isPlaying') and loop_play.isPlaying():
                            try:
                                loop_play.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping existing loop_play: {e}")

                        try:
                            logger.info("Starting playback...")
                            loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol).out()
                        except Exception as e:
                            logger.error(f"Failed to start playback: {e}")

                elif localLooperState == "STOPPED":
                    looper_led_red.off()
                    looper_led_green.blink()

                    with data_lock:
                        if loop_play is not None and hasattr(loop_play, 'isPlaying') and loop_play.isPlaying():
                            try:
                                loop_play.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_play on STOPPED: {e}")
                        if loop_rec is not None:
                            try:
                                loop_rec.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_rec on STOPPED: {e}")
                            loop_rec = None

                    logger.info("Playback stopped")

                elif localLooperState == "ERASE":
                    with data_lock:
                        if loop_play is not None and hasattr(loop_play, 'isPlaying') and loop_play.isPlaying():
                            try:
                                loop_play.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_play on ERASE: {e}")
                        if loop_rec is not None:
                            try:
                                loop_rec.stop()
                            except Exception as e:
                                logger.warning(f"Error stopping loop_rec on ERASE: {e}")
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

    recv = pyo64.OscDataReceive(port=9900, address="/data/*", function=getDataMessage)

    while(True):
        time.sleep(0.05)  # Sleep to avoid busy waiting


def controlLoop():
    numlines = 8
    pots = [MCP3008(channel=n) for n in range(numlines)]
    vals = [0] * numlines
    sender = pyo64.OscDataSend(types="fffffffff", port = 9900, address = "/data/eq", host = "localhost")

    while True:
        try:
            # Read pot values with deadzone (0.1)
            new_vals = [1- int(pots[n].value*100)/100 for n in range(numlines)]

            # Only send if values changed significantly
            for i, nv in enumerate(new_vals):
                if abs(vals[i]-nv) > 0.1:
                    vals[i] = nv

            # Map pot values to effect parameters
            wet = vals[0]
            bass = vals[1]*2
            mid = vals[2]*2
            treb = vals[3]*2
            dry = 1 - wet
            chorus = vals[4]
            reverb = vals[5]
            distort = vals[6]**0.05
            wah = vals[7]*30

            # Send via OSC
            sender.send([bass, mid, treb, wet, dry, chorus, reverb, distort, wah])

        except Exception as e:
            logger.error(f"Error in control loop: {e}")

        time.sleep(0.05)


async def pedalLoop():
    global looperState, oldLooperState

    bt_led.blink(on_time=0.5, off_time=0.75)  # Blink to indicate start
    looper_led_red.off()
    looper_led_green.off()
    looperState = oldLooperState = "IDLE"
    ble_client = ESP32BLEClient("ESP32")
    loopSender = pyo64.OscDataSend(types="s", port = 9900, address = "/data/looperstate", host = "localhost")

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
                bt_led.on()  # Turn on the LED to indicate connection

                looperState = ble_client.get_latest_looperstate()
                if looperState != oldLooperState:
                    # flash the LED to indicate state change
                    bt_led.blink(on_time=0.1, off_time=0.1, n=2)
                    await ble_client.send_message("RECV:" + looperState)
                    oldLooperState = looperState
                    loopSender.send([looperState])  # Send the state to the server

            except KeyboardInterrupt:
                logger.info("Shutting down...")
                break
            except Exception as e:
                logger.error(f"Error in pedal loop: {e}")
                await asyncio.sleep(1)

    except Exception as e:
        logger.error(f"Application error: {e}")

    finally:
        try:
            await ble_client.disconnect()
        except Exception:
            pass
        bt_led.off()
        logger.info("Disconnected from ESP32")


async def run_pedal_loop():
    global pedal_loop_task
    pedal_loop_task = asyncio.create_task(pedalLoop())  # Start pedalLoop initially
    while True:
        await asyncio.sleep(0.07)  # Keep the event loop running


if __name__ == "__main__":
    logger.info("=== Busker Amp Starting ===")

    # Log selected audio devices if available
    audio_devices = []
    if hasattr(s, 'getInputDevice'):
        try:
            audio_devices.append(f"in={s.getInputDevice()}")
        except Exception:
            pass
    if hasattr(s, 'getOutputDevice'):
        try:
            audio_devices.append(f"out={s.getOutputDevice()}")
        except Exception:
            pass
    logger.info(f"Audio device: {' '.join(audio_devices) if audio_devices else 'default'}")

    # Create and start threads
    thread1 = threading.Thread(target=inputLoop, name="InputLoop", daemon=False)
    thread2 = threading.Thread(target=controlLoop, name="ControlLoop", daemon=False)

    thread1.start()
    logger.info("Input loop started")

    thread2.start()
    logger.info("Control loop started")

    try:
        asyncio.run(run_pedal_loop())
    except KeyboardInterrupt:
        logger.info("Main thread interrupted")
    finally:
        try:
            pedal_loop_task.cancel()
        except Exception:
            pass

        # Join worker threads
        thread1.join(timeout=2)
        thread2.join(timeout=2)

        logger.info("=== Busker Amp Stopped ===")
