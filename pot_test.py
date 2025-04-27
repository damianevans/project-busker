import os
import shutil
from gpiozero import MCP3008, LEDBoard, LEDBarGraph, Button, LED
import signal, time, argparse, datetime, sys

#def button_func():
#    global button_clicked
#    button_clicked = 1+(button_clicked%3)
#    return

numlines = 8
button_clicked = 0
#button = Button("GPIO15")
#button.when_pressed = button_func

pots = [MCP3008(channel=n) for n in range(numlines)]     
vals = [0] * numlines

while True:
    new_vals = [1- int(pots[n].value*100)/100 for n in range(numlines)]
    for i, nv in enumerate(new_vals):
        if abs(vals[i]-nv) > 0.02:
            vals[i] = nv


    print('-----------')
    now = datetime.datetime.now()
    print(now.strftime("%Y-%m-%d %H:%M:%S"))
    for n in range(numlines):
        print(f'Pot {n+1} set to: {vals[n]:.3f}')
    print('-----------')
    sys.stdout.write(u"\u001b[1000D\u001b[11A")
    time.sleep(1)
       
