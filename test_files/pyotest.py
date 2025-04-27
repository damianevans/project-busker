import pyo
from signal import pause
s = pyo.Server()
s.setInOutDevice(1)
s.boot().start()
a = pyo.Sine(mul=0.1).out()
pause()
