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
L Device:Q_NPN_BCE Q2
U 1 1 5D9BD4F9
P 8900 3350
F 0 "Q2" H 9090 3396 50  0000 L CNN
F 1 "BCE_NPN" H 9090 3305 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Wide" H 9100 3450 50  0001 C CNN
F 3 "~" H 8900 3350 50  0001 C CNN
	1    8900 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 5D9BD505
P 9600 3350
F 0 "R10" V 9393 3350 50  0000 C CNN
F 1 "270" V 9484 3350 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" V 9530 3350 50  0001 C CNN
F 3 "~" H 9600 3350 50  0001 C CNN
	1    9600 3350
	0    -1   1    0   
$EndComp
Wire Wire Line
	9450 3350 9100 3350
$Comp
L Device:R R9
U 1 1 5D9BD50C
P 8800 2650
F 0 "R9" H 8730 2604 50  0000 R CNN
F 1 "100k" H 8730 2695 50  0000 R CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" V 8730 2650 50  0001 C CNN
F 3 "~" H 8800 2650 50  0001 C CNN
	1    8800 2650
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5D9BD51B
P 8800 2250
F 0 "#PWR05" H 8800 2000 50  0001 C CNN
F 1 "GND" H 8805 2077 50  0000 C CNN
F 2 "" H 8800 2250 50  0001 C CNN
F 3 "" H 8800 2250 50  0001 C CNN
	1    8800 2250
	1    0    0    1   
$EndComp
Wire Wire Line
	8800 2250 8800 2500
$Comp
L Amplifier_Operational:LM741 U1
U 1 1 5D9E17E1
P 4600 2350
F 0 "U1" H 4944 2396 50  0000 L CNN
F 1 "LM741" H 4600 2500 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4650 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm741.pdf" H 4750 2500 50  0001 C CNN
	1    4600 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5D9E1D67
P 4250 3850
F 0 "BT1" H 4368 3946 50  0000 L CNN
F 1 "Battery_Cell" H 4368 3855 50  0000 L CNN
F 2 "Battery:BatteryHolder_Eagle_12BH611-GR" V 4250 3910 50  0001 C CNN
F 3 "~" V 4250 3910 50  0001 C CNN
	1    4250 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:Battery_Cell BT2
U 1 1 5D9E22ED
P 4700 3850
F 0 "BT2" H 4818 3946 50  0000 L CNN
F 1 "Battery_Cell" H 4818 3855 50  0000 L CNN
F 2 "Battery:BatteryHolder_Eagle_12BH611-GR" V 4700 3910 50  0001 C CNN
F 3 "~" V 4700 3910 50  0001 C CNN
	1    4700 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 3850 4450 3850
Wire Wire Line
	4800 3850 4950 3850
Wire Wire Line
	5350 3850 5350 2450
Wire Wire Line
	5350 2450 4900 2450
Wire Wire Line
	4050 3850 3850 3850
$Comp
L power:GND #PWR03
U 1 1 5D9E2D66
P 4450 4050
F 0 "#PWR03" H 4450 3800 50  0001 C CNN
F 1 "GND" V 4455 3922 50  0000 R CNN
F 2 "" H 4450 4050 50  0001 C CNN
F 3 "" H 4450 4050 50  0001 C CNN
	1    4450 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4050 4450 3950
Connection ~ 4450 3850
Wire Wire Line
	4450 3850 4350 3850
NoConn ~ 4900 2350
NoConn ~ 4900 2250
$Comp
L Device:R_Small R4
U 1 1 5D9E33CE
P 4700 1950
F 0 "R4" H 4641 1904 50  0000 R CNN
F 1 "2.2k" H 4641 1995 50  0000 R CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" H 4700 1950 50  0001 C CNN
F 3 "~" H 4700 1950 50  0001 C CNN
	1    4700 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 2050 4600 1950
Wire Wire Line
	4800 1950 5000 1950
Wire Wire Line
	5000 1950 5000 2650
Wire Wire Line
	5000 2650 4700 2650
$Comp
L Device:R_Small R3
U 1 1 5D9E48CB
P 4500 2950
F 0 "R3" V 4696 2950 50  0000 C CNN
F 1 "1k" V 4605 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" H 4500 2950 50  0001 C CNN
F 3 "~" H 4500 2950 50  0001 C CNN
	1    4500 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4500 2850 4500 2650
Wire Wire Line
	4500 3050 4500 3150
$Comp
L Device:R_Small R5
U 1 1 5D9E5132
P 4700 2950
F 0 "R5" V 4896 2950 50  0000 C CNN
F 1 "1k" V 4805 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" H 4700 2950 50  0001 C CNN
F 3 "~" H 4700 2950 50  0001 C CNN
	1    4700 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 2850 4700 2650
Connection ~ 4700 2650
Wire Wire Line
	4700 3050 4700 3350
Wire Wire Line
	4700 3350 4450 3350
Wire Wire Line
	4450 3350 4450 3850
Connection ~ 4600 1950
Connection ~ 4450 3950
Wire Wire Line
	4450 3950 4450 3850
Wire Wire Line
	4450 3950 5450 3950
Wire Wire Line
	5450 3950 5450 3750
Wire Wire Line
	5450 1600 4750 1600
$Comp
L Connector:Conn_Coaxial J1
U 1 1 5D9E86EC
P 4650 1100
F 0 "J1" H 4678 1076 50  0000 L CNN
F 1 "to biopac" H 4678 985 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 4650 1100 50  0001 C CNN
F 3 "~" H 4650 1100 50  0001 C CNN
	1    4650 1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 1300 4650 1300
Wire Wire Line
	4600 1950 4600 1300
Wire Wire Line
	4750 1600 4750 1300
$Comp
L Amplifier_Operational:LM741 U2
U 1 1 5D9F27CD
P 7200 2150
F 0 "U2" H 7544 2196 50  0000 L CNN
F 1 "LM741" H 7200 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7250 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm741.pdf" H 7350 2300 50  0001 C CNN
	1    7200 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 3650 7050 3650
Wire Wire Line
	7400 3650 7950 3650
Wire Wire Line
	7950 3650 7950 2250
Wire Wire Line
	7950 2250 7500 2250
Wire Wire Line
	6650 3650 6450 3650
Wire Wire Line
	6450 3650 6450 2250
Wire Wire Line
	6450 2250 6900 2250
$Comp
L power:GND #PWR04
U 1 1 5D9F27E6
P 7050 3850
F 0 "#PWR04" H 7050 3600 50  0001 C CNN
F 1 "GND" V 7055 3722 50  0000 R CNN
F 2 "" H 7050 3850 50  0001 C CNN
F 3 "" H 7050 3850 50  0001 C CNN
	1    7050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3850 7050 3750
Connection ~ 7050 3650
Wire Wire Line
	7050 3650 6950 3650
NoConn ~ 7500 2150
NoConn ~ 7500 2050
$Comp
L Device:R_Small R7
U 1 1 5D9F27F1
P 7300 1750
F 0 "R7" H 7241 1704 50  0000 R CNN
F 1 "2.2k" H 7241 1795 50  0000 R CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" H 7300 1750 50  0001 C CNN
F 3 "~" H 7300 1750 50  0001 C CNN
	1    7300 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 1850 7200 1750
Wire Wire Line
	7400 1750 7600 1750
Wire Wire Line
	7600 1750 7600 2450
Wire Wire Line
	7600 2450 7300 2450
$Comp
L Device:R_Small R6
U 1 1 5D9F27FB
P 7100 2750
F 0 "R6" V 7296 2750 50  0000 C CNN
F 1 "1k" V 7205 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" H 7100 2750 50  0001 C CNN
F 3 "~" H 7100 2750 50  0001 C CNN
	1    7100 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 2650 7100 2450
Wire Wire Line
	7100 2850 7100 2950
$Comp
L Device:R_Small R8
U 1 1 5D9F2803
P 7300 2750
F 0 "R8" V 7496 2750 50  0000 C CNN
F 1 "1k" V 7405 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" H 7300 2750 50  0001 C CNN
F 3 "~" H 7300 2750 50  0001 C CNN
	1    7300 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 2650 7300 2450
Connection ~ 7300 2450
Wire Wire Line
	7300 2850 7300 3150
Wire Wire Line
	7300 3150 7050 3150
Wire Wire Line
	7050 3150 7050 3650
Connection ~ 7200 1750
Connection ~ 7050 3750
Wire Wire Line
	7050 3750 7050 3650
Wire Wire Line
	7050 3750 8050 3750
Wire Wire Line
	8050 3750 8050 1400
Wire Wire Line
	8050 1400 7350 1400
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5D9F2816
P 7250 900
F 0 "J2" H 7278 876 50  0000 L CNN
F 1 "To biopac" H 7278 785 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 7250 900 50  0001 C CNN
F 3 "~" H 7250 900 50  0001 C CNN
	1    7250 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 1100 7250 1100
Wire Wire Line
	7200 1750 7200 1100
Wire Wire Line
	7350 1400 7350 1100
Wire Wire Line
	6650 3650 6650 4650
Wire Wire Line
	6650 4650 3850 4650
Wire Wire Line
	3850 4650 3850 3850
Wire Wire Line
	6950 3650 6950 4450
Wire Wire Line
	6950 4450 4350 4450
Wire Wire Line
	4350 4450 4350 3850
Connection ~ 4350 3850
Wire Wire Line
	7100 3650 7100 4250
Wire Wire Line
	7100 4250 4500 4250
Wire Wire Line
	4500 4250 4500 3850
Connection ~ 4500 3850
Wire Wire Line
	7400 3650 7400 4150
Wire Wire Line
	7400 4150 4950 4150
Wire Wire Line
	4950 4150 4950 3850
Connection ~ 4950 3850
Wire Wire Line
	4950 3850 5350 3850
Connection ~ 3850 3850
Wire Wire Line
	3850 2450 4300 2450
Wire Wire Line
	3850 3850 3850 2450
$Comp
L Device:R R1
U 1 1 5D8A39C8
P 2300 3550
F 0 "R1" V 2093 3550 50  0000 C CNN
F 1 "270" V 2184 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" V 2230 3550 50  0001 C CNN
F 3 "~" H 2300 3550 50  0001 C CNN
	1    2300 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 3550 2800 3550
$Comp
L Device:R R2
U 1 1 5D8A40B7
P 3100 2850
F 0 "R2" H 3030 2804 50  0000 R CNN
F 1 "100k" H 3030 2895 50  0000 R CNN
F 2 "Resistor_THT:R_Box_L13.0mm_W4.0mm_P9.00mm" V 3030 2850 50  0001 C CNN
F 3 "~" H 3100 2850 50  0001 C CNN
	1    3100 2850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5D8A5853
P 2300 3950
F 0 "#PWR01" H 2300 3700 50  0001 C CNN
F 1 "GND" H 2305 3777 50  0000 C CNN
F 2 "" H 2300 3950 50  0001 C CNN
F 3 "" H 2300 3950 50  0001 C CNN
	1    2300 3950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D8A668A
P 3100 2450
F 0 "#PWR02" H 3100 2200 50  0001 C CNN
F 1 "GND" H 3105 2277 50  0000 C CNN
F 2 "" H 3100 2450 50  0001 C CNN
F 3 "" H 3100 2450 50  0001 C CNN
	1    3100 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 2450 3100 2700
Wire Wire Line
	4500 3150 3100 3150
Wire Wire Line
	3100 3150 3100 3000
Wire Wire Line
	8800 2950 7100 2950
Wire Wire Line
	5450 3750 7050 3750
Connection ~ 5450 3750
Wire Wire Line
	5450 3750 5450 1600
Wire Wire Line
	7350 1100 7450 1100
Wire Wire Line
	7450 1100 7450 900 
Wire Wire Line
	4750 1300 4850 1300
Wire Wire Line
	4850 1300 4850 1100
$Comp
L Arduino:Arduino_Due_Shield XA1
U 1 1 5DAE7245
P 3550 6250
F 0 "XA1" V 3497 3923 60  0000 R CNN
F 1 "Arduino_Due_Shield" V 3603 3923 60  0000 R CNN
F 2 "Arduino:Arduino_Due_Shield" H 4250 9000 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-due" H 4250 9000 60  0001 C CNN
	1    3550 6250
	0    1    1    0   
$EndComp
NoConn ~ 1400 7550
NoConn ~ 1500 7550
NoConn ~ 1600 7550
NoConn ~ 1700 7550
NoConn ~ 1800 7550
NoConn ~ 1900 7550
NoConn ~ 2000 7550
NoConn ~ 2100 7550
NoConn ~ 2200 7550
NoConn ~ 2300 7550
NoConn ~ 2400 7550
NoConn ~ 2500 7550
NoConn ~ 2600 7550
NoConn ~ 2700 7550
NoConn ~ 2800 7550
NoConn ~ 2900 7550
NoConn ~ 3000 7550
NoConn ~ 3100 7550
NoConn ~ 3200 7550
NoConn ~ 3300 7550
NoConn ~ 3400 7550
NoConn ~ 3500 7550
NoConn ~ 3600 7550
NoConn ~ 3700 7550
NoConn ~ 3800 7550
NoConn ~ 3900 7550
NoConn ~ 4000 7550
NoConn ~ 4100 7550
NoConn ~ 4200 7550
NoConn ~ 4300 7550
NoConn ~ 4400 7550
NoConn ~ 4500 7550
NoConn ~ 4600 7550
NoConn ~ 5500 7550
NoConn ~ 5600 7550
NoConn ~ 5700 7550
NoConn ~ 4700 7550
NoConn ~ 4800 7550
NoConn ~ 4900 7550
NoConn ~ 5100 7550
NoConn ~ 5200 7550
NoConn ~ 5550 6300
NoConn ~ 6150 6000
NoConn ~ 6150 6100
NoConn ~ 6150 6200
NoConn ~ 6150 6300
NoConn ~ 6150 6400
NoConn ~ 6150 6500
NoConn ~ 5700 4950
NoConn ~ 5600 4950
NoConn ~ 5500 4950
NoConn ~ 4400 4950
NoConn ~ 4500 4950
NoConn ~ 4600 4950
NoConn ~ 4700 4950
NoConn ~ 4800 4950
NoConn ~ 4900 4950
NoConn ~ 5000 4950
NoConn ~ 5100 4950
NoConn ~ 5200 4950
NoConn ~ 5300 4950
NoConn ~ 5400 4950
NoConn ~ 2800 4950
NoConn ~ 2900 4950
NoConn ~ 3000 4950
NoConn ~ 3100 4950
NoConn ~ 3200 4950
NoConn ~ 3300 4950
NoConn ~ 3400 4950
NoConn ~ 3500 4950
NoConn ~ 3600 4950
NoConn ~ 3700 4950
NoConn ~ 3800 4950
NoConn ~ 3900 4950
NoConn ~ 4000 4950
NoConn ~ 2600 4950
NoConn ~ 2500 4950
NoConn ~ 1400 4950
NoConn ~ 1500 4950
NoConn ~ 1600 4950
NoConn ~ 1700 4950
NoConn ~ 1800 4950
NoConn ~ 1900 4950
NoConn ~ 2000 4950
NoConn ~ 2100 4950
NoConn ~ 2200 4950
Wire Wire Line
	4100 4950 4100 4750
Wire Wire Line
	4100 4750 8800 4750
Wire Wire Line
	4200 4950 4200 4700
Wire Wire Line
	4200 4700 3100 4700
NoConn ~ 5000 7550
Wire Wire Line
	5400 7550 5400 7750
Wire Wire Line
	5400 7750 6650 7750
Wire Wire Line
	6650 7750 6650 5250
Wire Wire Line
	6650 5250 9900 5250
Wire Wire Line
	9900 5250 9900 3350
Wire Wire Line
	9900 3350 9750 3350
Wire Wire Line
	5300 7550 5300 7700
Wire Wire Line
	5300 7700 1000 7700
Wire Wire Line
	1000 3550 1000 7700
Wire Wire Line
	1000 3550 2150 3550
Wire Wire Line
	2300 3950 2300 4950
$Comp
L Device:Q_NPN_BCE Q1
U 1 1 5D8A091B
P 3000 3550
F 0 "Q1" H 3190 3596 50  0000 L CNN
F 1 "BCE_NPN" H 3190 3505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Wide" H 3200 3650 50  0001 C CNN
F 3 "~" H 3000 3550 50  0001 C CNN
	1    3000 3550
	1    0    0    1   
$EndComp
Wire Wire Line
	3100 4700 3100 3750
Wire Wire Line
	3100 3350 3100 3150
Connection ~ 3100 3150
Wire Wire Line
	8800 4750 8800 3550
Wire Wire Line
	8800 2800 8800 2950
Connection ~ 8800 2950
Wire Wire Line
	8800 2950 8800 3150
$EndSCHEMATC
