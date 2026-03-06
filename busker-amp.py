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

audio    = pyo64.Input(chnl=0)      # Left channel - Guitar with effects
dry      = pyo64.Input(chnl=0)      # Left channel input
vu_input = pyo64.Input(chnl=1)      # Right channel - Standalone VU meter

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

amplitude_right = None
leds_on = True
#eq = {'bass': 1., 'mid': 1., 'treb': 1.}
#fx = {'wet': 1., 'dry': 1., 'delay': 1., 'reverb':1., 'distort': 1., 'wah': 1.}
fx = {'bass': 0, 'mid': 0, 'treb': 0,'wet': 0, 'dry': 0, 'chorus': 0, 'reverb':0, 'distort': 0, 'wah': 0}
data_lock = threading.Lock()
max_RMS_right = 0
VU_factor_right = 1
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


def vu_meter_loop():
    """Dedicated thread for VU meter LED updates (Right channel monitoring)"""
    global amplitude_right, max_RMS_right, VU_factor_right
    amplitude_right = pyo64.RMS(vu_input)
    
    while True:
        if amplitude_right is not None:
            rms_value = amplitude_right.get(all=True)
            if rms_value:
                current_rms = rms_value[0]
                with data_lock:
                    # set VU max to highest value, but back off highest value over time
                    if current_rms > max_RMS_right:
                        max_RMS_right = current_rms
                        VU_factor_right = 9/max_RMS_right  # number of VU bars is 9
                    elif max_RMS_right > 0.05:  
                        max_RMS_right -= 0.005
                    if leds_on:
                        vu_leds.value = min([1, current_rms * VU_factor_right / 9])
        time.sleep(0.05)  # ~20Hz update rate for smooth visual feedback


def inputLoop():
    global loop_rec, loop_play, loop_file, silence
    
    def getDataMessage(address, *args):
        global loop_rec, loop_play, loop_file, silence
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
        elif address == "/data/looper

