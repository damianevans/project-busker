#!/usr/bin/env python3
# A guitar effects application for raspberry pi
import os
import shutil
from gpiozero import MCP3008, LEDBoard, LEDBarGraph, Button, LED
import signal, time, argparse
import pyo64



debug = True 
#leds_on = args.no_leds
meter = True
#meter = args.meter
looptest = False
#looptest = args.looptest

numlines = 8
#pot_leds = LEDBoard(4, 27, 13, 26, 23, 22, 12, 24, pwm=True)
#vu_leds  = LEDBarGraph(14, 16, 25, 6, 5, 17)

pots = [MCP3008(n) for n in range(numlines)]     
vals = [0] * numlines


max_RMS = 0
VU_factor = 1

# set up pyo64.input and effectgs
s = pyo64.Server()
s.setInputDevice(1)
s.setOutputDevice(1)
s.boot()
s.start()
audio    = pyo64.Input()
audio    = pyo64.Input()
dry      = pyo64.Input()

# wah effect
follow   = pyo64.Follower(audio)
wahfq    = pyo64.Scale(follow, outmin=300, outmax=20000)

delay    = pyo64.SmoothDelay(audio, feedback=0.15)
reverb   = pyo64.Freeverb(delay)
distort  = pyo64.Disto(reverb)
eq       = pyo64.MultiBand(distort, num=3, mul=[1,1,1])
wet      = pyo64.Mix([eq])
wah      = pyo64.ButBP(wet, freq=wahfq, q=30)
mix       = pyo64.Mix([dry,wet,wah]).out()


recording = False
looping   = False

while True:
    #I wired all my pots backwards, so the "1.0-" below compensates for that
    #You can swap the outermost wire to the other outermost pin on the pot to the same effect
    new_vals = [1.0-int(pots[n].value*100)/100 for n in range(numlines)]
    for i, nv in enumerate(new_vals):
        if abs(vals[i]-nv) > 0.05:
            vals[i] = nv

    #filter.mul = [fx['bass']*100, fx['mid']*100, fx['treb']*100]
    dry.mul         = 1 - vals[0]
    wet.mul         = vals[0] 
    delay.delay     = vals[1]
    reverb.size     = vals[2]
    distort.drive   = vals[3]**0.05
    wah.mul         = vals[4]*30
    eq.mul          = [vals[5]*2, vals[6]*2, vals[7]*2]
#    if leds_on:
#        pot_leds.value = [vals[n] for n in range(len(pot_leds))]

 #   eq.mul          = [vals[5]*2, vals[6]*2, vals[7]*2]


# Available effects in the pyo64.module are:
#   Disto(input, drive=0.75, slope=0.5, mul=1, add=0)[source]
#   Delay(input, delay=0.25, feedback=0, maxdelay=1, mul=1, add=0)
#   SDelay(input, delay=0.25, maxdelay=1, mul=1, add=0)
#   Waveguide(input, freq=100, dur=10, minfreq=20, mul=1, add=0)
#   AllpassWG(input, freq=100, feed=0.95, detune=0.5, minfreq=20, mul=1, add=0)
#   Freeverb(input, size=0.5, damp=0.5, bal=0.5, mul=1, add=0)
#   WGVerb(input, feedback=0.5, cutoff=5000, bal=0.5, mul=1, add=0)
#   Chorus(input, depth=1, feedback=0.25, bal=0.5, mul=1, add=0)
#   Harmonizer(input, transpo=- 7.0, feedback=0, winsize=0.1, mul=1, add=0)
#   FreqShift(input, shift=100, mul=1, add=0)
#   STRev(input, inpos=0.5, revtime=1, cutoff=5000, bal=0.5, roomSize=1, firstRefGain=- 3, mul=1, add=0)
#   SmoothDelay(input, delay=0.25, feedback=0, crossfade=0.05, maxdelay=1, mul=1, add=0)
#   Clip(input, min=- 1.0, max=1.0, mul=1, add=0)
#   Degrade(input, bitdepth=16, srscale=1.0, mul=1, add=0)
#   Mirror(input, min=0.0, max=1.0, mul=1, add=0)
#   Compress(input, thresh=- 20, ratio=2, risetime=0.01, falltime=0.1, lookahead=5.0, knee=0, outputAmp=False, mul=1, add=0)
#   Gate(input, thresh=- 70, risetime=0.01, falltime=0.05, lookahead=5.0, outputAmp=False, mul=1, add=0)
#   Expand(input, downthresh=- 40, upthresh=- 10, ratio=2, risetime=0.01, falltime=0.1, lookahead=5.0, outputAmp=False, mul=1, add=0)
