EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R1
U 1 1 678AF768
P 4000 2700
F 0 "R1" V 4207 2700 50  0000 C CNN
F 1 "100" V 4116 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3930 2700 50  0001 C CNN
F 3 "~" H 4000 2700 50  0001 C CNN
	1    4000 2700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 678B0ABA
P 3100 2700
F 0 "J1" H 3208 2881 50  0000 C CNN
F 1 "Input" H 3208 2790 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 3100 2700 50  0001 C CNN
F 3 "~" H 3100 2700 50  0001 C CNN
	1    3100 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 678B125D
P 3300 3450
F 0 "#PWR0101" H 3300 3200 50  0001 C CNN
F 1 "GND" H 3305 3277 50  0000 C CNN
F 2 "" H 3300 3450 50  0001 C CNN
F 3 "" H 3300 3450 50  0001 C CNN
	1    3300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2700 3850 2700
$Comp
L Device:C C1
U 1 1 678B1D9F
P 4300 2700
F 0 "C1" V 4552 2700 50  0000 C CNN
F 1 "100nF" V 4461 2700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4338 2550 50  0001 C CNN
F 3 "~" H 4300 2700 50  0001 C CNN
	1    4300 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 2700 4800 2700
$Comp
L Device:R R2
U 1 1 678B2D41
P 4450 3100
F 0 "R2" H 4520 3146 50  0000 L CNN
F 1 "1M" H 4520 3055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4380 3100 50  0001 C CNN
F 3 "~" H 4450 3100 50  0001 C CNN
	1    4450 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 678B3215
P 5100 3300
F 0 "R3" V 5307 3300 50  0000 C CNN
F 1 "100K" V 5216 3300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5030 3300 50  0001 C CNN
F 3 "~" H 5100 3300 50  0001 C CNN
	1    5100 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 678B382E
P 5450 3900
F 0 "R4" H 5520 3946 50  0000 L CNN
F 1 "330" H 5520 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5380 3900 50  0001 C CNN
F 3 "~" H 5450 3900 50  0001 C CNN
	1    5450 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 678B43FD
P 5450 4200
F 0 "C3" H 5568 4246 50  0000 L CNN
F 1 "100uF" H 5568 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D6.3mm_H5.0mm_P2.50mm" H 5488 4050 50  0001 C CNN
F 3 "~" H 5450 4200 50  0001 C CNN
	1    5450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2950 4450 2700
Connection ~ 4450 2700
$Comp
L Device:C C2
U 1 1 678B4DB2
P 4200 3100
F 0 "C2" H 4315 3146 50  0000 L CNN
F 1 "100pF" H 4315 3055 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4238 2950 50  0001 C CNN
F 3 "~" H 4200 3100 50  0001 C CNN
	1    4200 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2950 4450 2950
Connection ~ 4450 2950
Wire Wire Line
	4450 3250 4200 3250
$Comp
L power:GND #PWR0102
U 1 1 678B6DA8
P 4450 3450
F 0 "#PWR0102" H 4450 3200 50  0001 C CNN
F 1 "GND" H 4455 3277 50  0000 C CNN
F 2 "" H 4450 3450 50  0001 C CNN
F 3 "" H 4450 3450 50  0001 C CNN
	1    4450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2800 5450 2800
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 678B83C6
P 6550 2800
F 0 "J2" H 6522 2774 50  0000 R CNN
F 1 "Output" H 6522 2683 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 6550 2800 50  0001 C CNN
F 3 "~" H 6550 2800 50  0001 C CNN
	1    6550 2800
	-1   0    0    -1  
$EndComp
Connection ~ 6350 2800
Wire Wire Line
	6350 2800 6550 2800
$Comp
L power:GND #PWR0103
U 1 1 678BCF0B
P 6350 3500
F 0 "#PWR0103" H 6350 3250 50  0001 C CNN
F 1 "GND" H 6355 3327 50  0000 C CNN
F 2 "" H 6350 3500 50  0001 C CNN
F 3 "" H 6350 3500 50  0001 C CNN
	1    6350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2900 6350 3500
Wire Wire Line
	4800 2900 4800 3300
Wire Wire Line
	4800 3300 4950 3300
Wire Wire Line
	5450 2800 5450 3300
Connection ~ 5450 2800
Wire Wire Line
	5450 2800 6350 2800
$Comp
L Device:R_POT RV1
U 1 1 678BEEB9
P 5450 3600
F 0 "RV1" H 5380 3646 50  0000 R CNN
F 1 "100K" H 5380 3555 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK163_Single_Horizontal" H 5450 3600 50  0001 C CNN
F 3 "~" H 5450 3600 50  0001 C CNN
	1    5450 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5450 3450 5450 3300
Connection ~ 5450 3300
Wire Wire Line
	4800 3300 4800 3600
Wire Wire Line
	4800 3600 5300 3600
Wire Wire Line
	5250 3300 5450 3300
Connection ~ 4800 3300
Connection ~ 6350 3500
Wire Wire Line
	6350 3500 6350 3550
$Comp
L power:GND #PWR0104
U 1 1 678C5AD4
P 5450 4500
F 0 "#PWR0104" H 5450 4250 50  0001 C CNN
F 1 "GND" H 5455 4327 50  0000 C CNN
F 2 "" H 5450 4500 50  0001 C CNN
F 3 "" H 5450 4500 50  0001 C CNN
	1    5450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3450 4450 3250
Connection ~ 4450 3250
Wire Wire Line
	5450 4550 5450 4500
Connection ~ 5450 4500
Wire Wire Line
	5450 4500 5450 4350
Wire Wire Line
	3300 3450 3300 2800
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 678F750F
P 6200 2350
F 0 "J3" H 6308 2631 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6308 2540 50  0000 C CNN
F 2 "" H 6200 2350 50  0001 C CNN
F 3 "~" H 6200 2350 50  0001 C CNN
	1    6200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2250 5100 2250
Wire Wire Line
	5100 2250 5100 2700
Wire Wire Line
	5100 2900 5800 2900
Wire Wire Line
	5800 2900 5800 2350
Wire Wire Line
	5800 2350 6200 2350
$Comp
L power:GND #PWR0105
U 1 1 678FAABF
P 6150 2550
F 0 "#PWR0105" H 6150 2300 50  0001 C CNN
F 1 "GND" H 6155 2377 50  0000 C CNN
F 2 "" H 6150 2550 50  0001 C CNN
F 3 "" H 6150 2550 50  0001 C CNN
	1    6150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2450 6400 2450
Wire Wire Line
	6150 2550 6400 2550
Wire Wire Line
	6400 2550 6400 2450
Connection ~ 6400 2450
$Comp
L Amplifier_Operational:NE5532 U1
U 1 1 678ADEE9
P 5100 2800
F 0 "U1" H 5100 3167 50  0000 C CNN
F 1 "NE5532" H 5100 3076 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5100 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 5100 2800 50  0001 C CNN
	1    5100 2800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
