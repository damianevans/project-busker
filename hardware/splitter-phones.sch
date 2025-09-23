EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Mono-to-Stereo Headphone Amplifier with Volume Control"
Date "2025-09-23"
Rev "1.0"
Comp "xAI"
Comment1 "Splits mono line-level input to power amp and stereo headphones"
Comment2 "Uses BC549B transistors, 9V supply, 10k potentiometer"
Comment3 ""
Comment4 ""
$EndDescr

# Power Supply
$Comp
L power:+9V #PWR01
U 1 1 66F4A001
P 4000 500
F 0 "#PWR01" H 4000 600 50  0001 C CNN
F 1 "+9V" H 4000 400 50  0000 C CNN
F 2 "" H 4000 500 50  0001 C CNN
F 3 "" H 4000 500 50  0001 C CNN
    1    4000 500
    1    0    0    -1  
$EndComp
$Comp
L power:GND #GND01
U 1 1 66F4A002
P 4000 6500
F 0 "#GND01" H 4000 6600 50  0001 C CNN
F 1 "GND" H 4000 6400 50  0000 C CNN
F 2 "" H 4000 6500 50  0001 C CNN
F 3 "" H 4000 6500 50  0001 C CNN
    1    4000 6500
    1    0    0    -1  
$EndComp

# Input Connector (Mono Mixer)
$Comp
L Connector:Conn_01x02 J1
U 1 1 66F4A003
P 1000 3000
F 0 "J1" H 1100 3100 50  0000 L CNN
F 1 "Conn_01x02" H 1100 3000 50  0000 L CNN
F 2 "" H 1000 3000 50  0001 C CNN
F 3 "" H 1000 3000 50  0001 C CNN
    1    1000 3000
    1    0    0    -1  
$EndComp
Text GLabel 1500 3000 0    50   Input ~ 0
Mono_In
Text Notes 1500 2800 0    50   ~ 0
Mixer Mono Input (3.5mm/1/4" jack)

# Power Amp Output Connector
$Comp
L Connector:Conn_01x02 J2
U 1 1 66F4A004
P 2500 2000
F 0 "J2" H 2600 2100 50  0000 L CNN
F 1 "Conn_01x02" H 2600 2000 50  0000 L CNN
F 2 "" H 2500 2000 50  0001 C CNN
F 3 "" H 2500 2000 50  0001 C CNN
    1    2500 2000
    -1   0    0    1   
$EndComp
Text GLabel 2000 2000 2    50   Output ~ 0
Power_Amp_Out
Text Notes 2000 1800 0    50   ~ 0
To Power Amplifier (Mono)

# Headphone Output Connector
$Comp
L Connector:Conn_01x03 J3
U 1 1 66F4A005
P 7000 5000
F 0 "J3" H 7100 5100 50  0000 L CNN
F 1 "Conn_01x03" H 7100 5000 50  0000 L CNN
F 2 "" H 7000 5000 50  0001 C CNN
F 3 "" H 7000 5000 50  0001 C CNN
    1    7000 5000
    -1   0    0    1   
$EndComp
Text GLabel 6500 4800 2    50   Output ~ 0
HP_L
Text GLabel 6500 5000 2    50   Output ~ 0
HP_R
Text GLabel 6500 5200 2    50   Output ~ 0
GND
Text Notes 6500 4600 0    50   ~ 0
Headphone Out (3.5mm Stereo)

# Splitter Resistors
$Comp
L Device:R R1
U 1 1 66F4A006
P 2000 2500
F 0 "R1" H 2050 2600 50  0000 C CNN
F 1 "1k" H 2050 2400 50  0000 C CNN
F 2 "" H 2000 2500 50  0001 C CNN
F 3 "" H 2000 2500 50  0001 C CNN
    1    2000 2500
    1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 66F4A007
P 2000 3500
F 0 "R2" H 2050 3600 50  0000 C CNN
F 1 "1k" H 2050 3400 50  0000 C CNN
F 2 "" H 2000 3500 50  0001 C CNN
F 3 "" H 2000 3500 50  0001 C CNN
    1    2000 3500
    1    0    0    -1  
$EndComp

# Input Capacitor
$Comp
L Device:C C1
U 1 1 66F4A008
P 2500 3500
F 0 "C1" H 2550 3600 50  0000 C CNN
F 1 "1uF" H 2550 3400 50  0000 C CNN
F 2 "" H 2500 3500 50  0001 C CNN
F 3 "" H 2500 3500 50  0001 C CNN
    1    2500 3500
    1    0    0    -1  
$EndComp

# Potentiometer (Volume Control)
$Comp
L Device:R_POT VR1
U 1