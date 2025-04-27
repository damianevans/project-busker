import pyo64
import time
from gpiozero import MCP3008
import threading

s = pyo64.Server()
s.setInOutDevice(1)
s.boot()
s.start()

audio    = pyo64.Input()
filter   = pyo64.MultiBand(audio, num=3, mul=[1,1,1]).out()
eq = {'bass': 1., 'mid': 1., 'treb': 1.}
data_lock = threading.Lock()

def inputLoop():
    def getDataMessage(address, *args):
        #oldvalues = eq
        if address == "/data/eq":
            with data_lock:
                eq['bass'], eq['mid'], eq['treb'] = args
            filter.mul = [eq['bass']*100, eq['mid']*100, eq['treb']*100]
            # print(f"Data received: bass = {eq['bass']}, mid = {eq['mid']}, treb = {eq['treb']}")
        if address ==  "data/vol":
            ampl = round( args[0], 2)
            s.amp(ampl)
            print(f"Amp = {ampl}")

    rec = pyo64.OscDataReceive(port=9900, address="/data/*", function=getDataMessage)
    
    while(True):
        time.sleep(0.1)

def controlLoop():
    numlines = 8
    
    pots = [MCP3008(channel=n) for n in range(numlines)]  
    sender = pyo64.OscDataSend(types="fff", port = 9900, address = "/data/eq", host = "localhost")
    volSender = pyo64.OscDataSend(types="fff", port = 9900, address = "/data/vol", host = "localhost")

    while True:
        with data_lock:
            bass = round(float(pots[0].value),3)
            mid  = round(float(pots[1].value),3)
            treb = round(float(pots[2].value),3)
            vol  = round(float(pots[7].value),3)

        sender.send([bass, mid, treb])
        volSender.send([vol])
        time.sleep(0.5)

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