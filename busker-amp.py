import pyo64
import time
import os
import shutil
from gpiozero import MCP3008, LEDBarGraph, LED
import threading
from modules.bt_footswitch_recv import ESP32BLEClient
import asyncio


s = pyo64.Server()
s.setInOutDevice(1)
s.boot()
s.start()

audio    = pyo64.Input()
dry      = pyo64.Input()

cdir        = os.path.dirname(os.path.abspath(__file__))
silence     = cdir+'/silent.wav'
loop_file   = cdir+'/pedalloop.wav'
print(f"Using silence file: {silence}")
print(f"Using loop file: {loop_file}")
shutil.copy(silence,loop_file)
loop_vol    = 0.9

# Initialize loop player once - don't recreate it
loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol)
loop_rec    = None
looperState = oldLooperState = "IDLE"

follow   = pyo64.Follower(audio)
wahfq    = pyo64.Scale(follow, outmin=300, outmax=20000)
chorus   = pyo64.Chorus(audio, feedback=0.25, bal=1)
#delay    = pyo64.SmoothDelay(audio, feedback=0.15)
reverb   = pyo64.Freeverb(chorus)
distort  = pyo64.Disto(reverb)
filter   = pyo64.MultiBand(distort, num=3, mul=[1,1,1])
wet      = pyo64.Mix([filter])
wah      = pyo64.ButBP(wet, freq=wahfq, q=30)

mix = pyo64.Mix([dry, wet, wah]).out()       # Main effects mix

amplitude = None
leds_on = False
#eq = {'bass': 1., 'mid': 1., 'treb': 1.}
#fx = {'wet': 1., 'dry': 1., 'delay': 1., 'reverb':1., 'distort': 1., 'wah': 1.}
fx = {'bass': 0, 'mid': 0, 'treb': 0,'wet': 0, 'dry': 0, 'chorus': 0, 'reverb':0, 'distort': 0, 'wah': 0}
data_lock = threading.Lock()
max_RMS = 0
VU_factor = 1
vu_leds  = LEDBarGraph(14, 16, 25, 6, 5, 27)
bt_led = LED("BOARD11")


def RMS_meter_callback(*args):
    global max_RMS, VU_factor, meter
    # set VU max to highest value, but back off highest value over time
    if args[0] > max_RMS:
        max_RMS = args[0]
        VU_factor = 20/max_RMS # number of VU bars is 20
    elif max_RMS > 0.05:  
        max_RMS -= 0.005
    if leds_on:
        vu_leds.value = min([1,args[0]*VU_factor/20])

def inputLoop():
    global amplitude, loop_rec, loop_play, loop_file, silence
    amplitude = pyo64.RMS(mix, function=RMS_meter_callback)
    def getDataMessage(address, *args):
        global amplitude, loop_rec, loop_play, loop_file, silence
        if address == "/data/eq":
            #with data_lock:
            fx['bass'], fx['mid'], fx['treb'], fx['wet'], fx['dry'], fx['chorus'], fx['reverb'], fx['distort'], fx['wah'] = args
            filter.mul = [fx['bass']*100, fx['mid']*100, fx['treb']*100]
            dry.mul         = 1 - fx['dry']
            wet.mul         =     fx['wet'] 
            chorus.depth    =     fx['chorus']
        #    delay.delay     =     fx['delay']            
            reverb.size     =     fx['reverb']
            distort.drive   =     fx['distort']
            wah.mul         =     fx['wah']
        elif address == "/data/looperstate":
            localLooperState = args[0].upper()  
            print(f"Looper state changed to: {localLooperState}")
            if localLooperState == "IDLE":    
                # Stop everything
                if loop_play.isPlaying():
                    loop_play.stop()    
                if loop_rec is not None:
                    loop_rec.stop()
                    loop_rec = None
                    
            elif localLooperState == "RECORDING":
                print("Starting recording...")
                # Stop playback and start recording
                if loop_play.isPlaying():
                    loop_play.stop()
                if loop_rec is not None:
                    loop_rec.stop()
                
                # Clear the loop file and start fresh recording
                shutil.copy(silence, loop_file)
                
                # Create new Record object and start recording
                loop_rec = pyo64.Record(mix, filename=loop_file, fileformat=0, sampletype=1)
                print("Recording active")
                
            elif localLooperState == "PLAYBACK":
                # Stop recording if active
                if loop_rec is not None:
                    print("Stopping recording...")
                    loop_rec.stop()
                    loop_rec = None
                    # FIX 2: Give more time for the file to be written and flushed
                    time.sleep(0.2)  # Increased from 0.1 to 0.2
                
                # Stop current player and create new one with updated file
                if loop_play.isPlaying():
                    loop_play.stop()
       
                # Recreate the player with the new recorded content
                print("Starting playback...")
                loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol,).out()
            elif localLooperState == "STOPPED":
                # Stop everything but keep recorded content
                if loop_play.isPlaying():
                    loop_play.stop()    

                if loop_rec is not None:
                    loop_rec.stop()
                    loop_rec = None
                print("Playback stopped")
                
            elif localLooperState == "ERASE":
                # Stop everything and clear the loop
                if loop_play.isPlaying():
                    loop_play.stop()
                if loop_rec is not None:
                    loop_rec.stop()
                    loop_rec = None
                
                # Clear the loop file
                shutil.copy(silence, loop_file)
                
                # Recreate player with empty file
                loop_play = pyo64.SfPlayer(loop_file, loop=True, mul=loop_vol)
                loop_play.stop()
                print("Loop erased")

    recv = pyo64.OscDataReceive(port=9900, address="/data/*", function=getDataMessage)
    
    while(True):
        time.sleep(0.05)  # Sleep to avoid busy waiting
            

def controlLoop():
    numlines = 8

    
    pots = [MCP3008(channel=n) for n in range(numlines)]  
    vals = [0] * numlines
    sender = pyo64.OscDataSend(types="fffffffff", port = 9900, address = "/data/eq", host = "localhost")

    while True:
        with data_lock:
            new_vals = [1- int(pots[n].value*100)/100 for n in range(numlines)]
            for i, nv in enumerate(new_vals):
                if abs(vals[i]-nv) > 0.1:
                    vals[i] = nv

        wet = vals[0]
        bass = vals[1]*2
        mid = vals[2]*2
        treb = vals[3]*2
        dry = 1 - wet
        chorus = vals[4]
        reverb = vals[5]
        distort = vals[6]**0.05
        wah = vals[7]*30

 
        sender.send([bass, mid, treb, wet, dry, chorus, reverb, distort, wah])
        time.sleep(0.05)

async def pedalLoop():
    global looperState
    global oldLooperState
    bt_led.blink(on_time=0.5, off_time=0.75)  # Blink to indicate start
    looperState = oldLooperState = "IDLE"
    ble_client = ESP32BLEClient("ESP32")
    #print("Connecting to ESP32...")
    loopSender = pyo64.OscDataSend(types="s", port = 9900, address = "/data/looperstate", host = "localhost")
    try:
        # Connect to ESP32
        if not await ble_client.connect():
            print("Failed to connect to ESP32. Try re-starting the device.")
            return
        
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
                # Optional: Send a test message every 30 seconds
                # await ble_client.send_message("Hello from Pi!")
                
            except KeyboardInterrupt:
                print("\nShutting down...")
                break
                
    except Exception as e:
        print(f"Application error: {e}")
        
    finally:
        await ble_client.disconnect()
        bt_led.off()

async def run_pedal_loop():
   global pedal_loop_task
   pedal_loop_task = asyncio.create_task(pedalLoop())  # Start pedalLoop initially
   while True:
       await asyncio.sleep(0.07)  # Keep the event loop running


if __name__ == "__main__":
    # Create threads
    thread1 = threading.Thread(target=inputLoop)
    thread2 = threading.Thread(target=controlLoop)
    # thread3 = threading.Thread(
    #     target=display_loop, 
    #     args=(fx, looperState, oldLooperState, data_lock), 
    #     daemon=True
    # )

    thread1.start()
    thread2.start()
    # thread3.start()
    try:
        asyncio.run(run_pedal_loop())
        # Join the threads to the main thread to keep them running
    except KeyboardInterrupt:
        print("Main thread stopped")          
    finally:
        pedal_loop_task.cancel()
        thread1.join()
        thread2.join()
