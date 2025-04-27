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
L Analog_ADC:MCP3008 U1
U 1 1 67FBE032
P 5650 3740
F 0 "U1" H 5650 4421 50  0000 C CNN
F 1 "MCP3008" H 5650 4330 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5750 3840 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21295d.pdf" H 5750 3840 50  0001 C CNN
	1    5650 3740
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV3
U 1 1 67FD3406
P 1760 2570
F 0 "RV3" H 1691 2616 50  0000 R CNN
F 1 "R_POT" H 1691 2525 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PC-16_Single_Horizontal" H 1760 2570 50  0001 C CNN
F 3 "~" H 1760 2570 50  0001 C CNN
	1    1760 2570
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 67FD3C84
P 1760 2790
F 0 "#PWR06" H 1760 2540 50  0001 C CNN
F 1 "GND" H 1765 2617 50  0000 C CNN
F 2 "" H 1760 2790 50  0001 C CNN
F 3 "" H 1760 2790 50  0001 C CNN
	1    1760 2790
	1    0    0    -1  
$EndComp
Wire Wire Line
	1760 2790 1760 2720
$Comp
L power:+3.3V #PWR05
U 1 1 67FD4922
P 1760 2350
F 0 "#PWR05" H 1760 2200 50  0001 C CNN
F 1 "+3.3V" H 1775 2523 50  0000 C CNN
F 2 "" H 1760 2350 50  0001 C CNN
F 3 "" H 1760 2350 50  0001 C CNN
	1    1760 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1760 2420 1760 2350
$Comp
L Device:R_POT RV4
U 1 1 67FD8D4D
P 1760 3430
F 0 "RV4" H 1691 3476 50  0000 R CNN
F 1 "R_POT" H 1691 3385 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PC-16_Single_Horizontal" H 1760 3430 50  0001 C CNN
F 3 "~" H 1760 3430 50  0001 C CNN
	1    1760 3430
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 67FD8D53
P 1760 3650
F 0 "#PWR08" H 1760 3400 50  0001 C CNN
F 1 "GND" H 1765 3477 50  0000 C CNN
F 2 "" H 1760 3650 50  0001 C CNN
F 3 "" H 1760 3650 50  0001 C CNN
	1    1760 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1760 3650 1760 3580
$Comp
L power:+3.3V #PWR07
U 1 1 67FD8D5A
P 1760 3210
F 0 "#PWR07" H 1760 3060 50  0001 C CNN
F 1 "+3.3V" H 1775 3383 50  0000 C CNN
F 2 "" H 1760 3210 50  0001 C CNN
F 3 "" H 1760 3210 50  0001 C CNN
	1    1760 3210
	1    0    0    -1  
$EndComp
Wire Wire Line
	1760 3280 1760 3210
$Comp
L Device:R_POT RV2
U 1 1 67FDA1F0
P 1750 1680
F 0 "RV2" H 1681 1726 50  0000 R CNN
F 1 "R_POT" H 1681 1635 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PC-16_Single_Horizontal" H 1750 1680 50  0001 C CNN
F 3 "~" H 1750 1680 50  0001 C CNN
	1    1750 1680
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 67FDA1F6
P 1750 1900
F 0 "#PWR04" H 1750 1650 50  0001 C CNN
F 1 "GND" H 1755 1727 50  0000 C CNN
F 2 "" H 1750 1900 50  0001 C CNN
F 3 "" H 1750 1900 50  0001 C CNN
	1    1750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1900 1750 1830
$Comp
L power:+3.3V #PWR03
U 1 1 67FDA1FD
P 1750 1460
F 0 "#PWR03" H 1750 1310 50  0001 C CNN
F 1 "+3.3V" H 1765 1633 50  0000 C CNN
F 2 "" H 1750 1460 50  0001 C CNN
F 3 "" H 1750 1460 50  0001 C CNN
	1    1750 1460
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1530 1750 1460
$Comp
L Device:R_POT RV1
U 1 1 67FDB00C
P 1750 900
F 0 "RV1" H 1681 946 50  0000 R CNN
F 1 "R_POT" H 1681 855 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PC-16_Single_Horizontal" H 1750 900 50  0001 C CNN
F 3 "~" H 1750 900 50  0001 C CNN
	1    1750 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 67FDB012
P 1750 1120
F 0 "#PWR02" H 1750 870 50  0001 C CNN
F 1 "GND" H 1755 947 50  0000 C CNN
F 2 "" H 1750 1120 50  0001 C CNN
F 3 "" H 1750 1120 50  0001 C CNN
	1    1750 1120
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1120 1750 1050
$Comp
L power:+3.3V #PWR01
U 1 1 67FDB019
P 1750 680
F 0 "#PWR01" H 1750 530 50  0001 C CNN
F 1 "+3.3V" H 1765 853 50  0000 C CNN
F 2 "" H 1750 680 50  0001 C CNN
F 3 "" H 1750 680 50  0001 C CNN
	1    1750 680 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 750  1750 680 
Wire Wire Line
	4100 4420 4100 3840
Wire Wire Line
	5060 3750 4120 3750
Wire Wire Line
	4120 3750 4120 3430
Wire Wire Line
	4120 3430 1910 3430
Wire Wire Line
	4260 3640 4260 2570
Wire Wire Line
	4260 2570 1910 2570
Wire Wire Line
	5060 3750 5060 3740
Wire Wire Line
	5060 3740 5050 3740
Wire Wire Line
	5050 3540 4390 3540
Wire Wire Line
	4390 3540 4390 1680
Wire Wire Line
	4390 1680 1900 1680
Wire Wire Line
	4530 3440 4530 1470
Wire Wire Line
	4530 1470 2060 1470
Wire Wire Line
	2060 1470 2060 900 
Wire Wire Line
	2060 900  1900 900 
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 67FFA9E7
P 6960 3730
F 0 "J3" H 6988 3706 50  0000 L CNN
F 1 "Conn_01x04_Female" H 6988 3615 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6960 3730 50  0001 C CNN
F 3 "~" H 6960 3730 50  0001 C CNN
	1    6960 3730
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3640 6760 3640
Wire Wire Line
	6760 3640 6760 3630
Wire Wire Line
	6760 3730 6250 3730
Wire Wire Line
	6250 3730 6250 3740
Wire Wire Line
	6760 3830 6250 3830
Wire Wire Line
	6250 3830 6250 3840
Wire Wire Line
	6760 3930 6250 3930
Wire Wire Line
	6250 3930 6250 3940
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 6800854A
P 2040 4870
F 0 "J2" H 1932 5155 50  0000 C CNN
F 1 "Conn_01x04_Female" H 1932 5064 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 2040 4870 50  0001 C CNN
F 3 "~" H 2040 4870 50  0001 C CNN
	1    2040 4870
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2240 4770 3250 4770
Wire Wire Line
	3250 4770 3250 4420
Wire Wire Line
	3250 4420 4100 4420
Wire Wire Line
	4450 4040 4450 4970
Wire Wire Line
	4450 4970 2240 4970
Wire Wire Line
	5050 4140 4570 4140
Wire Wire Line
	4570 4140 4570 5070
Wire Wire Line
	4570 5070 2240 5070
Wire Wire Line
	5050 3940 4270 3940
Wire Wire Line
	4270 3940 4270 4870
Wire Wire Line
	4270 4870 2240 4870
Wire Wire Line
	5050 3840 4100 3840
Wire Wire Line
	5050 3640 4260 3640
Wire Wire Line
	4530 3440 5050 3440
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 6802B279
P 1960 4140
F 0 "J1" H 1852 4325 50  0000 C CNN
F 1 "Conn_01x02_Female" H 2290 4280 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1960 4140 50  0001 C CNN
F 3 "~" H 1960 4140 50  0001 C CNN
	1    1960 4140
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 6802E1BB
P 2160 4240
F 0 "#PWR010" H 2160 3990 50  0001 C CNN
F 1 "GND" H 2165 4067 50  0000 C CNN
F 2 "" H 2160 4240 50  0001 C CNN
F 3 "" H 2160 4240 50  0001 C CNN
	1    2160 4240
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR09
U 1 1 6802E6D0
P 2160 4140
F 0 "#PWR09" H 2160 3990 50  0001 C CNN
F 1 "+3.3V" H 2175 4313 50  0000 C CNN
F 2 "" H 2160 4140 50  0001 C CNN
F 3 "" H 2160 4140 50  0001 C CNN
	1    2160 4140
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 6803EFF7
P 7110 2900
F 0 "J4" H 7002 3085 50  0000 C CNN
F 1 "Conn_01x02_Female" H 7440 3040 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 7110 2900 50  0001 C CNN
F 3 "~" H 7110 2900 50  0001 C CNN
	1    7110 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 6803EFFD
P 6910 3000
F 0 "#PWR012" H 6910 2750 50  0001 C CNN
F 1 "GND" H 6915 2827 50  0000 C CNN
F 2 "" H 6910 3000 50  0001 C CNN
F 3 "" H 6910 3000 50  0001 C CNN
	1    6910 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR011
U 1 1 6803F003
P 6910 2900
F 0 "#PWR011" H 6910 2750 50  0001 C CNN
F 1 "+3.3V" H 6925 3073 50  0000 C CNN
F 2 "" H 6910 2900 50  0001 C CNN
F 3 "" H 6910 2900 50  0001 C CNN
	1    6910 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3240 5700 3240
Wire Wire Line
	6910 2900 5700 2900
Wire Wire Line
	5700 2900 5700 3240
Connection ~ 6910 2900
Connection ~ 5700 3240
Wire Wire Line
	5700 3240 5850 3240
Wire Wire Line
	5550 4340 5660 4340
Wire Wire Line
	6520 3000 6520 4500
Wire Wire Line
	6520 4500 5660 4500
Wire Wire Line
	5660 4500 5660 4340
Wire Wire Line
	6520 3000 6910 3000
Connection ~ 6910 3000
Connection ~ 5660 4340
Wire Wire Line
	5660 4340 5850 4340
Wire Wire Line
	5050 4040 4450 4040
$EndSCHEMATC
