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
leds_on = False
#eq = {'bass': 1., 'mid': 1., 'treb': 1.}
#fx = {'wet': 1., 'dry': 1., 'delay': 1., 'reverb':1., 'distort': 1., 'wah': 1.}
fx = {'bass': 1., 'mid': 1., 'treb': 1.,'wet': 1., 'dry': 1., 'delay': 1., 'reverb':1., 'distort': 1., 'wah': 1.}
data_lock = threading.Lock()
max_RMS = 0
VU_factor = 1
vu_leds  = LEDBarGraph(14, 16, 25, 6, 5, 17)



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
    global amplitude
    amplitude = pyo64.RMS(mix, function=RMS_meter_callback)

    def getDataMessage(address, *args):
        if address == "/data/eq":
            #with data_lock:
            fx['bass'], fx['mid'], fx['treb'], fx['wet'], fx['dry'], fx['delay'], fx['reverb'], fx['distort'], fx['wah'] = args
            filter.mul = [fx['bass']*100, fx['mid']*100, fx['treb']*100]
            dry.mul         = 1 - fx['dry']
            wet.mul         =     fx['wet'] 
            delay.delay     =     fx['delay']
            reverb.size     =     fx['reverb']
            distort.drive   =     fx['distort']
            wah.mul         =     fx['wah']

        #oldvalues = eq
        #if address == "/data/eq":
        #    with data_lock:
        #        eq['bass'], eq['mid'], eq['treb'] = args
        #    filter.mul = [eq['bass']*100, eq['mid']*100, eq['treb']*100]
        #    #print(f"Data received: bass = {eq['bass']}, mid = {eq['mid']}, treb = {eq['treb']}")
        #if address ==  "/data/fx":
        #    with data_lock:
        #        fx['wet'], fx['dry'], fx['delay'], fx['reverb'], fx['distort'], fx['wah'] = args
        #    dry.mul         = 1 - fx['dry']
        #    wet.mul         =     fx['wet'] 
        #    delay.delay     =     fx['delay']
        #    reverb.size     =     fx['reverb']
        #    distort.drive   =     fx['distort']
        #    wah.mul         =     fx['wah']

    recv = pyo64.OscDataReceive(port=9900, address="/data/*", function=getDataMessage)
    
    while(True):
        time.sleep(0.05)

def controlLoop():
    numlines = 8

    
    pots = [MCP3008(channel=n) for n in range(numlines)]  
    vals = [0] * numlines
    sender = pyo64.OscDataSend(types="fffffffff", port = 9900, address = "/data/eq", host = "localhost")
    #fxSender = pyo64.OscDataSend(types="fff", port = 9900, address = "/data/fx", host = "localhost")


    while True:
        with data_lock:
            new_vals = [1- int(pots[n].value*100)/100 for n in range(numlines)]
            for i, nv in enumerate(new_vals):
                if abs(vals[i]-nv) > 0.02:
                    vals[i] = nv

        wet = vals[0]
        bass = vals[1]*2
        mid = vals[2]*2
        treb = vals[3]*2
        dry = 1 - wet
        delay = vals[4]
        reverb = vals[5]
        distort = vals[6]**0.05
        wah = vals[7]*30
        #eqSender.send([bass, mid, treb])
        #fxSender.send([wet, dry, delay, reverb, distort, wah])
        sender.send([bass, mid, treb, wet, dry, delay, reverb, distort, wah])
        time.sleep(0.05)

if __name__ == "__main__":
    # Create two threads
    thread1 = threading.Thread(target=inputLoop)
    thread2 = threading.Thread(target=controlLoop)

    # Start the threads
    thread1.start()
    thread2.start()

    try:
        # Join the threads to the main thread to keep them running
        thread1.join()
        thread2.join()
    except KeyboardInterrupt:
        print("Main thread stopped")          
