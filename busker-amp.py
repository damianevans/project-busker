import pyo64
import time
from gpiozero import MCP3008, LEDBarGraph
import threading

s = pyo64.Server()
s.setInOutDevice(1)
s.boot()
s.start()

audio    = pyo64.Input()
dry      = pyo64.Input()
filter   = pyo64.MultiBand(audio, num=3, mul=[1,1,1]).out()
follow   = pyo64.Follower(audio)
wahfq    = pyo64.Scale(follow, outmin=300, outmax=20000)

delay    = pyo64.SmoothDelay(audio, feedback=0.15)
reverb   = pyo64.Freeverb(delay)
distort  = pyo64.Disto(reverb)
wet      = pyo64.Mix([filter])
wah      = pyo64.ButBP(wet, freq=wahfq, q=30)
mix       = pyo64.Mix([dry,wet,wah]).out()
amplitude = None
eq = {'bass': 1., 'mid': 1., 'treb': 1.}
fx = {'wet': 1., 'dry': 1., 'delay': 1., 'reverb':1., 'distort': 1., 'wah': 1.}
data_lock = threading.Lock()
vu_leds  = LEDBarGraph(14, 16, 25, 6, 5, 17)

def inputLoop():
    def getDataMessage(address, *args):
        #oldvalues = eq
        if address == "/data/eq":
            with data_lock:
                eq['bass'], eq['mid'], eq['treb'] = args
            filter.mul = [eq['bass']*100, eq['mid']*100, eq['treb']*100]
            # print(f"Data received: bass = {eq['bass']}, mid = {eq['mid']}, treb = {eq['treb']}")
        if address ==  "data/fx":
            with data_lock:
                fx['wet'], fx['dry'], fx['delay'], fx['reverb'], fx['distort'], fx['wah'] = args
            dry.mul         = 1 - fx['dry']
            wet.mul         =     fx['wet'] 
            delay.delay     =     fx['delay']
            reverb.size     =     fx['reverb']
            distort.drive   =     fx['distort']**0.05
            wah.mul         =     fx['wah']*30

    recv = pyo64.OscDataReceive(port=9900, address="/data/*", function=getDataMessage)
    
    while(True):
        time.sleep(0.1)

def controlLoop():
    numlines = 8
    global amplitude
    amplitude = pyo64.RMS(mix, function=RMS_meter_callback)
    
    pots = [MCP3008(channel=n) for n in range(numlines)]  
    eqSender = pyo64.OscDataSend(types="fff", port = 9900, address = "/data/eq", host = "localhost")
    fxSender = pyo64.OscDataSend(types="fff", port = 9900, address = "/data/vol", host = "localhost")

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

    while True:
        with data_lock:
            bass = round(float(pots[0].value),3)
            mid  = round(float(pots[1].value),3)
            treb = round(float(pots[2].value),3)
            vol  = round(float(pots[7].value),3)

        sender.send([bass, mid, treb])
        volSender.send([vol])
        time.sleep(0.5)