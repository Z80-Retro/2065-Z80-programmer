EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date "2021-09-05"
Rev "2.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L dk_Interface-I-O-Expanders:MCP23017-E_SP U1
U 1 1 612A3F3B
P 4800 2900
F 0 "U1" H 5300 3850 60  0000 C CNN
F 1 "MCP23017-E_SP" H 5350 3700 60  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 5000 3100 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en023709" H 5000 3200 60  0001 L CNN
F 4 "MCP23017-E/SP-ND" H 5000 3300 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP23017-E/SP" H 5000 3400 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 5000 3500 60  0001 L CNN "Category"
F 7 "Interface - I/O Expanders" H 5000 3600 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en023709" H 5000 3700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP23017-E-SP/MCP23017-E-SP-ND/894272" H 5000 3800 60  0001 L CNN "DK_Detail_Page"
F 10 "IC I/O EXPANDER I2C 16B 28SDIP" H 5000 3900 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 5000 4000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5000 4100 60  0001 L CNN "Status"
	1    4800 2900
	1    0    0    -1  
$EndComp
$Comp
L JWlib:2N7000 Q2
U 1 1 612B47AC
P 2450 3900
F 0 "Q2" V 2701 3900 50  0000 C CNN
F 1 "2N7000" V 2792 3900 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92" H 2650 3825 50  0001 L CIN
F 3 "https://rocelec.widen.net/view/pdf/orqxwkxkq1/ONSM-S-A0003544006-1.pdf?t.download=true&u=5oefqw" H 2450 3900 50  0001 L CNN
F 4 "MOSFET N-CH 60V 200MA TO92-3" H 2450 3900 50  0001 C CNN "Description"
F 5 "2N7000TACT-ND" H 2450 3900 50  0001 C CNN "Digi-Key_PN"
F 6 "2N7000TA" H 2450 3900 50  0001 C CNN "MPN"
F 7 "onsemi" H 2450 3900 50  0001 C CNN "Manufacturer"
	1    2450 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 612B9D7F
P 2050 3750
F 0 "R3" V 1950 3700 50  0000 L CNN
F 1 "2K7" V 2050 3700 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1980 3750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 2050 3750 50  0001 C CNN
F 4 "RES 2.7K OHM 5% 1/8W AXIAL" H 2050 3750 50  0001 C CNN "Description"
F 5 "CF18JT2K70CT-ND" H 2050 3750 50  0001 C CNN "Digi-Key_PN"
F 6 "CF18JT2K70" H 2050 3750 50  0001 C CNN "MPN"
F 7 "Stackpole Electronics Inc" H 2050 3750 50  0001 C CNN "Manufacturer"
	1    2050 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 4000 2050 4000
Wire Wire Line
	2050 3900 2050 4000
Connection ~ 2050 4000
Wire Wire Line
	2050 3600 2100 3600
Wire Wire Line
	2450 3600 2450 3700
Wire Wire Line
	2100 3600 2100 3500
Connection ~ 2100 3600
Wire Wire Line
	2100 3600 2450 3600
$Comp
L power:+3.3V #PWR06
U 1 1 612BC81B
P 2100 3500
F 0 "#PWR06" H 2100 3350 50  0001 C CNN
F 1 "+3.3V" H 2115 3673 50  0000 C CNN
F 2 "" H 2100 3500 50  0001 C CNN
F 3 "" H 2100 3500 50  0001 C CNN
	1    2100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4000 2850 4000
$Comp
L Device:R R4
U 1 1 612BD71E
P 2850 3750
F 0 "R4" V 2750 3700 50  0000 L CNN
F 1 "2K7" V 2850 3700 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2780 3750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 2850 3750 50  0001 C CNN
F 4 "RES 2.7K OHM 5% 1/8W AXIAL" H 2850 3750 50  0001 C CNN "Description"
F 5 "CF18JT2K70CT-ND" H 2850 3750 50  0001 C CNN "Digi-Key_PN"
F 6 "CF18JT2K70" H 2850 3750 50  0001 C CNN "MPN"
F 7 "Stackpole Electronics Inc" H 2850 3750 50  0001 C CNN "Manufacturer"
	1    2850 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3900 2850 4000
Connection ~ 2850 4000
$Comp
L power:+5V #PWR07
U 1 1 612BE44F
P 2850 3500
F 0 "#PWR07" H 2850 3350 50  0001 C CNN
F 1 "+5V" H 2865 3673 50  0000 C CNN
F 2 "" H 2850 3500 50  0001 C CNN
F 3 "" H 2850 3500 50  0001 C CNN
	1    2850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3500 2850 3550
$Comp
L JWlib:2N7000 Q1
U 1 1 612D0203
P 2400 2800
F 0 "Q1" V 2651 2800 50  0000 C CNN
F 1 "2N7000" V 2742 2800 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92" H 2600 2725 50  0001 L CIN
F 3 "https://rocelec.widen.net/view/pdf/orqxwkxkq1/ONSM-S-A0003544006-1.pdf?t.download=true&u=5oefqw" H 2400 2800 50  0001 L CNN
F 4 "MOSFET N-CH 60V 200MA TO92-3" H 2400 2800 50  0001 C CNN "Description"
F 5 "2N7000TACT-ND" H 2400 2800 50  0001 C CNN "Digi-Key_PN"
F 6 "2N7000TA" H 2400 2800 50  0001 C CNN "MPN"
F 7 "onsemi" H 2400 2800 50  0001 C CNN "Manufacturer"
	1    2400 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 612D0209
P 2000 2650
F 0 "R1" V 1900 2600 50  0000 L CNN
F 1 "2K7" V 2000 2600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1930 2650 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 2000 2650 50  0001 C CNN
F 4 "RES 2.7K OHM 5% 1/8W AXIAL" H 2000 2650 50  0001 C CNN "Description"
F 5 "CF18JT2K70CT-ND" H 2000 2650 50  0001 C CNN "Digi-Key_PN"
F 6 "CF18JT2K70" H 2000 2650 50  0001 C CNN "MPN"
F 7 "Stackpole Electronics Inc" H 2000 2650 50  0001 C CNN "Manufacturer"
	1    2000 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2900 2000 2900
Wire Wire Line
	2000 2800 2000 2900
Connection ~ 2000 2900
Wire Wire Line
	2000 2500 2050 2500
Wire Wire Line
	2400 2500 2400 2600
Wire Wire Line
	2050 2500 2050 2400
Connection ~ 2050 2500
Wire Wire Line
	2050 2500 2400 2500
$Comp
L power:+3.3V #PWR04
U 1 1 612D0218
P 2050 2400
F 0 "#PWR04" H 2050 2250 50  0001 C CNN
F 1 "+3.3V" H 2065 2573 50  0000 C CNN
F 2 "" H 2050 2400 50  0001 C CNN
F 3 "" H 2050 2400 50  0001 C CNN
	1    2050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2900 2800 2900
$Comp
L Device:R R2
U 1 1 612D021F
P 2800 2650
F 0 "R2" V 2700 2600 50  0000 L CNN
F 1 "2K7" V 2800 2600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2730 2650 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 2800 2650 50  0001 C CNN
F 4 "RES 2.7K OHM 5% 1/8W AXIAL" H 2800 2650 50  0001 C CNN "Description"
F 5 "CF18JT2K70CT-ND" H 2800 2650 50  0001 C CNN "Digi-Key_PN"
F 6 "CF18JT2K70" H 2800 2650 50  0001 C CNN "MPN"
F 7 "Stackpole Electronics Inc" H 2800 2650 50  0001 C CNN "Manufacturer"
	1    2800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2800 2800 2900
Connection ~ 2800 2900
Wire Wire Line
	2800 2900 3100 2900
$Comp
L power:+5V #PWR05
U 1 1 612D0228
P 2800 2400
F 0 "#PWR05" H 2800 2250 50  0001 C CNN
F 1 "+5V" H 2815 2573 50  0000 C CNN
F 2 "" H 2800 2400 50  0001 C CNN
F 3 "" H 2800 2400 50  0001 C CNN
	1    2800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2400 2800 2450
Wire Wire Line
	2850 4000 3150 4000
Wire Wire Line
	4500 3900 3550 3900
Wire Wire Line
	3550 3900 3550 2900
Text Label 4250 3900 0    50   ~ 0
SDA
Text Label 4250 4000 0    50   ~ 0
SCK
Wire Wire Line
	6050 4000 6350 4000
Wire Wire Line
	6350 3900 6050 3900
Text Label 6050 3900 0    50   ~ 0
SDA
Text Label 6050 4000 0    50   ~ 0
SCK
Wire Wire Line
	4500 2300 4250 2300
Text Label 4250 2300 0    50   ~ 0
A0
Text Label 4250 2400 0    50   ~ 0
A1
Text Label 4250 2500 0    50   ~ 0
A2
Text Label 4250 2600 0    50   ~ 0
A3
Text Label 4250 2700 0    50   ~ 0
A4
Text Label 4250 2800 0    50   ~ 0
A5
Text Label 4250 2900 0    50   ~ 0
A6
Text Label 4250 3000 0    50   ~ 0
A7
Text Label 4250 3100 0    50   ~ 0
A8
Text Label 4250 3200 0    50   ~ 0
A9
Text Label 4250 3300 0    50   ~ 0
A10
Text Label 4250 3400 0    50   ~ 0
A11
Text Label 4250 3500 0    50   ~ 0
A12
Text Label 4250 3600 0    50   ~ 0
A13
Text Label 4250 3700 0    50   ~ 0
A14
Text Label 4250 3800 0    50   ~ 0
A15
Wire Wire Line
	4250 2400 4500 2400
Wire Wire Line
	4500 2500 4250 2500
Wire Wire Line
	4250 2600 4500 2600
Wire Wire Line
	4500 2700 4250 2700
Wire Wire Line
	4250 2800 4500 2800
Wire Wire Line
	4500 2900 4250 2900
Wire Wire Line
	4250 3000 4500 3000
Wire Wire Line
	4500 3100 4250 3100
Wire Wire Line
	4250 3200 4500 3200
Wire Wire Line
	4500 3300 4250 3300
Wire Wire Line
	4250 3400 4500 3400
Wire Wire Line
	4500 3500 4250 3500
Wire Wire Line
	4250 3600 4500 3600
Wire Wire Line
	4500 3700 4250 3700
Wire Wire Line
	4250 3800 4500 3800
Wire Wire Line
	6350 2300 6250 2300
Wire Wire Line
	6050 2400 6350 2400
Wire Wire Line
	6350 2500 6050 2500
Wire Wire Line
	6350 2600 6050 2600
Wire Wire Line
	6350 2700 6050 2700
Wire Wire Line
	6050 2800 6350 2800
Wire Wire Line
	6050 3100 6350 3100
Wire Wire Line
	6050 3200 6350 3200
Wire Wire Line
	6050 3300 6350 3300
Wire Wire Line
	6050 3400 6350 3400
Wire Wire Line
	6050 3500 6350 3500
Wire Wire Line
	6050 3600 6350 3600
Wire Wire Line
	6050 3700 6350 3700
Wire Wire Line
	6050 3800 6350 3800
Text Label 6050 3100 0    50   ~ 0
D0
Text Label 6050 3200 0    50   ~ 0
D1
Text Label 6050 3300 0    50   ~ 0
D2
Text Label 6050 3400 0    50   ~ 0
D3
Text Label 6050 3500 0    50   ~ 0
D4
Text Label 6050 3600 0    50   ~ 0
D5
Text Label 6050 3700 0    50   ~ 0
D6
Text Label 6050 3800 0    50   ~ 0
D7
Wire Wire Line
	4500 4100 4300 4100
Wire Wire Line
	4900 4500 4900 4550
$Comp
L power:GND #PWR09
U 1 1 6136EB30
P 4900 4550
F 0 "#PWR09" H 4900 4300 50  0001 C CNN
F 1 "GND" H 4905 4377 50  0000 C CNN
F 2 "" H 4900 4550 50  0001 C CNN
F 3 "" H 4900 4550 50  0001 C CNN
	1    4900 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 6136EC7E
P 4300 4550
F 0 "#PWR08" H 4300 4300 50  0001 C CNN
F 1 "GND" H 4305 4377 50  0000 C CNN
F 2 "" H 4300 4550 50  0001 C CNN
F 3 "" H 4300 4550 50  0001 C CNN
	1    4300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4100 6150 4100
Wire Wire Line
	6150 4100 6150 4200
Wire Wire Line
	6350 4200 6150 4200
Connection ~ 6150 4200
Wire Wire Line
	6150 4200 6150 4450
$Comp
L power:GND #PWR010
U 1 1 61370F0A
P 6150 4450
F 0 "#PWR010" H 6150 4200 50  0001 C CNN
F 1 "GND" H 6155 4277 50  0000 C CNN
F 2 "" H 6150 4450 50  0001 C CNN
F 3 "" H 6150 4450 50  0001 C CNN
	1    6150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4300 6250 4300
$Comp
L power:+5V #PWR02
U 1 1 61384D04
P 4900 2050
F 0 "#PWR02" H 4900 1900 50  0001 C CNN
F 1 "+5V" H 4915 2223 50  0000 C CNN
F 2 "" H 4900 2050 50  0001 C CNN
F 3 "" H 4900 2050 50  0001 C CNN
	1    4900 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2050 4900 2100
$Comp
L power:+5V #PWR03
U 1 1 6138A73C
P 6750 2050
F 0 "#PWR03" H 6750 1900 50  0001 C CNN
F 1 "+5V" H 6765 2223 50  0000 C CNN
F 2 "" H 6750 2050 50  0001 C CNN
F 3 "" H 6750 2050 50  0001 C CNN
	1    6750 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2050 6750 2100
$Comp
L Device:C_Small C1
U 1 1 613B5E69
P 3400 1050
F 0 "C1" H 3492 1096 50  0000 L CNN
F 1 ".1uF" H 3492 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3400 1050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C315C104M5U5TA7303.pdf" H 3400 1050 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V Z5U RADIAL" H 3400 1050 50  0001 C CNN "Description"
F 5 "399-9859-1-ND‎" H 3400 1050 50  0001 C CNN "Digi-Key_PN"
	1    3400 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 613B76B2
P 3850 1050
F 0 "C2" H 3942 1096 50  0000 L CNN
F 1 ".1uF" H 3942 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3850 1050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C315C104M5U5TA7303.pdf" H 3850 1050 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V Z5U RADIAL" H 3850 1050 50  0001 C CNN "Description"
F 5 "399-9859-1-ND‎" H 3850 1050 50  0001 C CNN "Digi-Key_PN"
	1    3850 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 613BAFE5
P 4300 1050
F 0 "C3" H 4392 1096 50  0000 L CNN
F 1 ".1uF" H 4392 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4300 1050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C315C104M5U5TA7303.pdf" H 4300 1050 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V Z5U RADIAL" H 4300 1050 50  0001 C CNN "Description"
F 5 "399-9859-1-ND‎" H 4300 1050 50  0001 C CNN "Digi-Key_PN"
	1    4300 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1150 3850 1150
Wire Wire Line
	4200 1150 4200 1300
Connection ~ 3850 1150
Wire Wire Line
	3850 1150 4200 1150
$Comp
L power:GND #PWR014
U 1 1 613C3DA4
P 4200 1300
F 0 "#PWR014" H 4200 1050 50  0001 C CNN
F 1 "GND" H 4205 1127 50  0000 C CNN
F 2 "" H 4200 1300 50  0001 C CNN
F 3 "" H 4200 1300 50  0001 C CNN
	1    4200 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 613C415E
P 4200 900
F 0 "#PWR013" H 4200 750 50  0001 C CNN
F 1 "+5V" H 4215 1073 50  0000 C CNN
F 2 "" H 4200 900 50  0001 C CNN
F 3 "" H 4200 900 50  0001 C CNN
	1    4200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 950  4200 950 
Connection ~ 3850 950 
Wire Wire Line
	3850 950  3400 950 
Wire Wire Line
	4200 900  4200 950 
Connection ~ 4200 950 
Connection ~ 4200 1150
Wire Wire Line
	4200 1150 4300 1150
$Comp
L power:+5V #PWR018
U 1 1 613D5608
P 5600 4300
F 0 "#PWR018" H 5600 4150 50  0001 C CNN
F 1 "+5V" H 5615 4473 50  0000 C CNN
F 2 "" H 5600 4300 50  0001 C CNN
F 3 "" H 5600 4300 50  0001 C CNN
	1    5600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1800 1350 1800
Wire Wire Line
	1350 1800 1350 4000
Wire Wire Line
	1350 4000 2050 4000
Wire Wire Line
	1450 2900 1450 1700
Wire Wire Line
	1450 1700 1250 1700
Wire Wire Line
	1450 2900 2000 2900
Wire Wire Line
	1250 1400 1350 1400
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 613F31D3
P 1050 1600
F 0 "J1" H 1250 1150 50  0000 C CNN
F 1 "Conn_01x05" H 1250 1250 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 1050 1600 50  0001 C CNN
F 3 "https://media.digikey.com/PDF/Data%20Sheets/Sullins%20PDFs/xRxCzzzSxxN-RC_ST_11635-B.pdf" H 1050 1600 50  0001 C CNN
F 4 "Generic connector, single row, 01x05" H 1050 1600 50  0001 C CNN "Description"
F 5 "S1011EC-05-ND" H 1050 1600 50  0001 C CNN "Digi-Key_PN"
F 6 "PRPC005SAAN-RC" H 1050 1600 50  0001 C CNN "MPN"
F 7 "Sullins Connector Solutions" H 1050 1600 50  0001 C CNN "Manufacturer"
	1    1050 1600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 613F6799
P 1700 1350
F 0 "#PWR015" H 1700 1100 50  0001 C CNN
F 1 "GND" H 1705 1177 50  0000 C CNN
F 2 "" H 1700 1350 50  0001 C CNN
F 3 "" H 1700 1350 50  0001 C CNN
	1    1700 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 613F6CF4
P 1350 1400
F 0 "#PWR016" H 1350 1250 50  0001 C CNN
F 1 "+5V" H 1365 1573 50  0000 C CNN
F 2 "" H 1350 1400 50  0001 C CNN
F 3 "" H 1350 1400 50  0001 C CNN
	1    1350 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR017
U 1 1 613F759A
P 1950 1600
F 0 "#PWR017" H 1950 1450 50  0001 C CNN
F 1 "+3.3V" H 1965 1773 50  0000 C CNN
F 2 "" H 1950 1600 50  0001 C CNN
F 3 "" H 1950 1600 50  0001 C CNN
	1    1950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1600 1950 1600
Wire Wire Line
	1500 1500 1250 1500
Wire Wire Line
	1500 1500 1500 1350
Wire Wire Line
	1500 1350 1700 1350
Wire Wire Line
	9450 3150 9100 3150
Wire Wire Line
	9450 3050 9100 3050
Wire Wire Line
	9450 2950 9100 2950
Wire Wire Line
	9450 2850 9100 2850
Wire Wire Line
	9450 2750 9100 2750
Wire Wire Line
	9450 2650 9100 2650
Wire Wire Line
	9450 2550 9100 2550
Wire Wire Line
	9450 2450 9100 2450
Text Label 8250 3750 0    50   ~ 0
D0
Text Label 8250 3850 0    50   ~ 0
D1
Text Label 8250 3550 0    50   ~ 0
D2
Text Label 8250 3150 0    50   ~ 0
D3
Text Label 8250 3050 0    50   ~ 0
D4
Text Label 8250 3250 0    50   ~ 0
D5
Text Label 8250 3350 0    50   ~ 0
D6
Text Label 8250 3650 0    50   ~ 0
D7
Wire Wire Line
	8600 3850 8250 3850
Wire Wire Line
	8600 3750 8250 3750
Wire Wire Line
	8600 3650 8250 3650
Wire Wire Line
	8600 3550 8250 3550
Wire Wire Line
	8600 3450 8050 3450
Wire Wire Line
	8600 3350 8250 3350
Wire Wire Line
	8600 3250 8250 3250
Wire Wire Line
	8600 3150 8250 3150
Wire Wire Line
	8600 3050 8250 3050
Wire Wire Line
	8600 2850 8250 2850
Wire Wire Line
	8600 2750 8250 2750
Wire Wire Line
	8600 2650 8250 2650
Wire Wire Line
	8600 2550 8250 2550
Wire Wire Line
	8600 2450 8250 2450
Text Label 9450 3450 2    50   ~ 0
A0
Text Label 9450 3350 2    50   ~ 0
A1
Text Label 9450 3250 2    50   ~ 0
A2
Text Label 9450 3150 2    50   ~ 0
A3
Text Label 9450 3050 2    50   ~ 0
A4
Text Label 9450 2950 2    50   ~ 0
A5
Text Label 9450 2850 2    50   ~ 0
A6
Text Label 9450 2750 2    50   ~ 0
A7
Text Label 9450 2650 2    50   ~ 0
A8
Text Label 9450 2550 2    50   ~ 0
A9
Text Label 9450 2450 2    50   ~ 0
A10
Text Label 8250 2450 0    50   ~ 0
A11
Text Label 8250 2550 0    50   ~ 0
A12
Text Label 8250 2650 0    50   ~ 0
A13
Text Label 8250 2750 0    50   ~ 0
A14
Text Label 8250 2850 0    50   ~ 0
A15
Wire Wire Line
	9100 3450 9450 3450
Wire Wire Line
	9100 3250 9450 3250
Wire Wire Line
	9100 3750 9450 3750
Text Label 9450 4350 2    50   ~ 0
~RD
Wire Wire Line
	9100 3850 9450 3850
Text Label 9450 4250 2    50   ~ 0
~WR
Wire Wire Line
	9100 3950 9450 3950
Text Label 8250 4250 0    50   ~ 0
~MREQ
Text Label 8250 4350 0    50   ~ 0
~IORQ
Wire Wire Line
	9100 3350 9450 3350
Text Label 9450 3750 2    50   ~ 0
~M1
Wire Wire Line
	8250 4250 8600 4250
Wire Wire Line
	9100 4350 9450 4350
Text Label 9450 3950 2    50   ~ 0
~BUSRQ
Wire Wire Line
	9100 4250 9450 4250
Text Label 9450 4150 2    50   ~ 0
~BUSACK
Wire Wire Line
	9100 3550 9650 3550
Text Label 9450 3850 2    50   ~ 0
~RESET
Wire Wire Line
	9100 4150 9450 4150
Wire Wire Line
	8600 4350 8250 4350
$Comp
L power:GND #PWR0101
U 1 1 615D67DF
P 9650 3600
F 0 "#PWR0101" H 9650 3350 50  0001 C CNN
F 1 "GND" H 9655 3427 50  0000 C CNN
F 2 "" H 9650 3600 50  0001 C CNN
F 3 "" H 9650 3600 50  0001 C CNN
	1    9650 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 615D67E5
P 8050 3400
F 0 "#PWR0102" H 8050 3250 50  0001 C CNN
F 1 "+5V" H 8065 3573 50  0000 C CNN
F 2 "" H 8050 3400 50  0001 C CNN
F 3 "" H 8050 3400 50  0001 C CNN
	1    8050 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3450 8050 3400
Wire Wire Line
	9650 3550 9650 3600
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J2
U 1 1 615D67ED
P 8800 3350
F 0 "J2" H 8850 4400 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 8850 4376 50  0001 C CNN
F 2 "jb-footprint:PinSocket_2x20_P2.54mm_Vertical_clockwise" H 8800 3350 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sullins%20PDFs/Female_Headers.100_DS.pdf" H 8800 3350 50  0001 C CNN
F 4 "Female connector, double row, 02x20" H 8800 3350 50  0001 C CNN "Description"
F 5 "S6104-ND" H 8800 3350 50  0001 C CNN "Digi-Key_PN"
F 6 "PPTC202LFBN-RC" H 8800 3350 50  0001 C CNN "MPN"
F 7 "Sullins Connector Solutions" H 8800 3350 50  0001 C CNN "Manufacturer"
	1    8800 3350
	1    0    0    -1  
$EndComp
Text Notes 6300 7350 0    39   ~ 0
Copyright (C) 2021 John Winans\n\nThis documentation describes Open Hardware and is licensed under the CERN OHL v. 1.2.\n\nYou may redistribute and modify this documentation under the terms of the CERN OHL v.1.2. (http://ohwr.org/cernohl). \nThis documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, \nSATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE.  Please see the CERN OHL v.1.2 for applicable conditions\n\nIf you chose to manufacture products based on this design, please notify me (see license section 4.2) via john@winans.org\n
$Comp
L Graphic:Logo_Open_Hardware_Small LOGO?
U 1 1 615F38C9
P 10250 7100
AR Path="/611CFEFE/615F38C9" Ref="LOGO?"  Part="1" 
AR Path="/615F38C9" Ref="LOGO10"  Part="1" 
AR Path="/615C0CED/615F38C9" Ref="LOGO?"  Part="1" 
F 0 "LOGO10" H 10250 7375 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 10250 6875 50  0001 C CNN
F 2 "Symbol:OSHW-Logo_11.4x12mm_SilkScreen" H 10250 7100 50  0001 C CNN
F 3 "" H 10250 7100 50  0001 C CNN
	1    10250 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 6136EF27
P 6750 4550
F 0 "#PWR011" H 6750 4300 50  0001 C CNN
F 1 "GND" H 6755 4377 50  0000 C CNN
F 2 "" H 6750 4550 50  0001 C CNN
F 3 "" H 6750 4550 50  0001 C CNN
	1    6750 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 4500 6750 4550
$Comp
L dk_Interface-I-O-Expanders:MCP23017-E_SP U2
U 1 1 612A8739
P 6650 2900
F 0 "U2" H 7200 3900 60  0000 C CNN
F 1 "MCP23017-E_SP" H 7250 3750 60  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 6850 3100 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en023709" H 6850 3200 60  0001 L CNN
F 4 "MCP23017-E/SP-ND" H 6850 3300 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP23017-E/SP" H 6850 3400 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 6850 3500 60  0001 L CNN "Category"
F 7 "Interface - I/O Expanders" H 6850 3600 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en023709" H 6850 3700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP23017-E-SP/MCP23017-E-SP-ND/894272" H 6850 3800 60  0001 L CNN "DK_Detail_Page"
F 10 "IC I/O EXPANDER I2C 16B 28SDIP" H 6850 3900 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 6850 4000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6850 4100 60  0001 L CNN "Status"
	1    6650 2900
	1    0    0    -1  
$EndComp
Text Label 7900 1100 2    50   ~ 0
~RESET
Text Label 6050 2400 0    50   ~ 0
~RD
Text Label 6050 2500 0    50   ~ 0
~WR
Text Label 6050 2600 0    50   ~ 0
~MREQ
Text Label 6050 2700 0    50   ~ 0
~IORQ
Text Label 6050 2800 0    50   ~ 0
~BUSRQ
Text Label 6050 3000 0    50   ~ 0
~M1
Wire Wire Line
	6050 2900 6350 2900
NoConn ~ 5300 2600
NoConn ~ 5300 2700
NoConn ~ 7150 2600
NoConn ~ 7150 2700
NoConn ~ 9100 3650
NoConn ~ 9100 4050
NoConn ~ 8600 4150
NoConn ~ 8600 4050
NoConn ~ 8600 3950
NoConn ~ 8600 2950
$Comp
L Mechanical:MountingHole H1
U 1 1 6175E6D9
P 7650 5750
F 0 "H1" H 7750 5796 50  0000 L CNN
F 1 "MountingHole" H 7750 5705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965" H 7650 5750 50  0001 C CNN
F 3 "" H 7650 5750 50  0001 C CNN
	1    7650 5750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6176C3D2
P 7650 6000
F 0 "H2" H 7750 6046 50  0000 L CNN
F 1 "MountingHole" H 7750 5955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965" H 7650 6000 50  0001 C CNN
F 3 "" H 7650 6000 50  0001 C CNN
	1    7650 6000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6176C660
P 7650 6250
F 0 "H3" H 7750 6296 50  0000 L CNN
F 1 "MountingHole" H 7750 6205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965" H 7650 6250 50  0001 C CNN
F 3 "" H 7650 6250 50  0001 C CNN
	1    7650 6250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6176C93B
P 7650 6500
F 0 "H4" H 7750 6546 50  0000 L CNN
F 1 "MountingHole" H 7750 6455 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965" H 7650 6500 50  0001 C CNN
F 3 "" H 7650 6500 50  0001 C CNN
	1    7650 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C5
U 1 1 618991DD
P 2550 1050
F 0 "C5" H 2641 1096 50  0000 L CNN
F 1 "10uF" H 2641 1005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2550 1050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDF0000/ABA0000C1059.pdf" H 2550 1050 50  0001 C CNN
F 4 "CAP ALUM 10UF 20% 25V RADIAL" H 2550 1050 50  0001 C CNN "Description"
F 5 "P975-ND" H 2550 1050 50  0001 C CNN "Digi-Key_PN"
F 6 "ECE-A1EKS100" H 2550 1050 50  0001 C CNN "MPN"
	1    2550 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 6189BF9E
P 4700 1050
F 0 "C6" H 4792 1096 50  0000 L CNN
F 1 ".1uF" H 4792 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4700 1050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C315C104M5U5TA7303.pdf" H 4700 1050 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V Z5U RADIAL" H 4700 1050 50  0001 C CNN "Description"
F 5 "399-9859-1-ND‎" H 4700 1050 50  0001 C CNN "Digi-Key_PN"
	1    4700 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 950  4700 950 
Connection ~ 4300 950 
Wire Wire Line
	4700 1150 4300 1150
Connection ~ 4300 1150
$Comp
L Device:C_Small C4
U 1 1 618A66E5
P 2200 1050
F 0 "C4" H 2292 1096 50  0000 L CNN
F 1 ".1uF" H 2292 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2200 1050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C315C104M5U5TA7303.pdf" H 2200 1050 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V Z5U RADIAL" H 2200 1050 50  0001 C CNN "Description"
F 5 "399-9859-1-ND‎" H 2200 1050 50  0001 C CNN "Digi-Key_PN"
	1    2200 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 950  2350 950 
Wire Wire Line
	2550 1150 2350 1150
$Comp
L power:+3.3V #PWR01
U 1 1 618B17EF
P 2350 950
F 0 "#PWR01" H 2350 800 50  0001 C CNN
F 1 "+3.3V" H 2365 1123 50  0000 C CNN
F 2 "" H 2350 950 50  0001 C CNN
F 3 "" H 2350 950 50  0001 C CNN
	1    2350 950 
	1    0    0    -1  
$EndComp
Connection ~ 2350 950 
Wire Wire Line
	2350 950  2550 950 
$Comp
L power:GND #PWR012
U 1 1 618B1B40
P 2350 1150
F 0 "#PWR012" H 2350 900 50  0001 C CNN
F 1 "GND" H 2355 977 50  0000 C CNN
F 2 "" H 2350 1150 50  0001 C CNN
F 3 "" H 2350 1150 50  0001 C CNN
	1    2350 1150
	1    0    0    -1  
$EndComp
Connection ~ 2350 1150
Wire Wire Line
	2350 1150 2200 1150
$Comp
L Device:CP1_Small C7
U 1 1 618B29CE
P 5050 1050
F 0 "C7" H 5141 1096 50  0000 L CNN
F 1 "10uF" H 5141 1005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5050 1050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDF0000/ABA0000C1059.pdf" H 5050 1050 50  0001 C CNN
F 4 "CAP ALUM 10UF 20% 25V RADIAL" H 5050 1050 50  0001 C CNN "Description"
F 5 "P975-ND" H 5050 1050 50  0001 C CNN "Digi-Key_PN"
F 6 "ECE-A1EKS100" H 5050 1050 50  0001 C CNN "MPN"
	1    5050 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 950  5050 950 
Connection ~ 4700 950 
Wire Wire Line
	5050 1150 4700 1150
Connection ~ 4700 1150
Text Label 6050 2900 0    50   ~ 0
~BUSACK
Wire Wire Line
	6350 3000 6050 3000
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J4
U 1 1 619795C3
P 4000 6350
F 0 "J4" H 4050 7375 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 4050 7376 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 4000 6350 50  0001 C CNN
F 3 "https://drawings-pdf.s3.amazonaws.com/11636.pdf" H 4000 6350 50  0001 C CNN
F 4 "Generic connector, double row, 02x20" H 4000 6350 50  0001 C CNN "Description"
F 5 "S2011EC-20-ND" H 4000 6350 50  0001 C CNN "Digi-Key_PN"
	1    4000 6350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 6197F1B3
P 4800 5200
F 0 "J3" V 4718 5012 50  0000 R CNN
F 1 "Conn_01x02" H 4880 5101 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4800 5200 50  0001 C CNN
F 3 "https://media.digikey.com/PDF/Data%20Sheets/Sullins%20PDFs/xRxCzzzSxxN-RC_ST_11635-B.pdf" H 4800 5200 50  0001 C CNN
F 4 "Generic connector, single row, 01x02" H 4800 5200 50  0001 C CNN "Description"
F 5 "S1011EC-02-ND" H 4800 5200 50  0001 C CNN "Digi-Key_PN"
	1    4800 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 5450 4450 5450
Wire Wire Line
	4800 5450 4800 5400
Wire Wire Line
	4300 5550 4450 5550
Wire Wire Line
	4450 5550 4450 5450
Connection ~ 4450 5450
Wire Wire Line
	4450 5450 4800 5450
Wire Wire Line
	4300 5650 4400 5650
Wire Wire Line
	4800 5650 4800 5700
$Comp
L power:GND #PWR0103
U 1 1 619A913A
P 4800 5700
F 0 "#PWR0103" H 4800 5450 50  0001 C CNN
F 1 "GND" H 4805 5527 50  0000 C CNN
F 2 "" H 4800 5700 50  0001 C CNN
F 3 "" H 4800 5700 50  0001 C CNN
	1    4800 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5400 4900 5450
Wire Wire Line
	4900 5450 5500 5450
Wire Wire Line
	5500 5450 5500 5400
$Comp
L power:+5V #PWR0104
U 1 1 619B77CD
P 5500 5400
F 0 "#PWR0104" H 5500 5250 50  0001 C CNN
F 1 "+5V" H 5515 5573 50  0000 C CNN
F 2 "" H 5500 5400 50  0001 C CNN
F 3 "" H 5500 5400 50  0001 C CNN
	1    5500 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0105
U 1 1 619B9BFC
P 3600 5400
F 0 "#PWR0105" H 3600 5250 50  0001 C CNN
F 1 "+3.3V" H 3615 5573 50  0000 C CNN
F 2 "" H 3600 5400 50  0001 C CNN
F 3 "" H 3600 5400 50  0001 C CNN
	1    3600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5400 3600 5450
Wire Wire Line
	3600 5450 3800 5450
Text Label 1600 2900 0    50   ~ 0
SDA_33
Text Label 1650 4000 0    50   ~ 0
SCK_33
Text Label 3400 5650 0    50   ~ 0
SCK_33
Text Label 3400 5550 0    50   ~ 0
SDA_33
Wire Wire Line
	3400 5550 3800 5550
Wire Wire Line
	3800 5650 3400 5650
Wire Wire Line
	4300 6050 4400 6050
Wire Wire Line
	4400 5650 4400 6050
Connection ~ 4400 5650
Wire Wire Line
	4400 5650 4800 5650
Wire Wire Line
	4400 6050 4400 6350
Wire Wire Line
	4400 6350 4300 6350
Connection ~ 4400 6050
Wire Wire Line
	4400 6350 4400 6850
Wire Wire Line
	4400 6850 4300 6850
Connection ~ 4400 6350
Wire Wire Line
	4400 6850 4400 7050
Wire Wire Line
	4400 7050 4300 7050
Connection ~ 4400 6850
Wire Wire Line
	3800 7350 3700 7350
Wire Wire Line
	3700 7350 3700 7450
Wire Wire Line
	3700 7350 3700 6650
Wire Wire Line
	3700 6650 3800 6650
Connection ~ 3700 7350
Wire Wire Line
	3700 6650 3700 5850
Wire Wire Line
	3700 5850 3800 5850
Connection ~ 3700 6650
NoConn ~ 4300 5750
NoConn ~ 4300 5850
NoConn ~ 4300 5950
NoConn ~ 4300 6150
NoConn ~ 4300 6250
NoConn ~ 4300 6450
NoConn ~ 4300 6550
NoConn ~ 4300 6650
NoConn ~ 4300 6750
NoConn ~ 4300 6950
NoConn ~ 4300 7150
NoConn ~ 4300 7250
NoConn ~ 4300 7350
NoConn ~ 3800 7250
NoConn ~ 3800 7150
NoConn ~ 3800 7050
NoConn ~ 3800 6950
NoConn ~ 3800 6850
NoConn ~ 3800 6750
NoConn ~ 3800 6550
NoConn ~ 3800 6450
NoConn ~ 3800 6350
NoConn ~ 3800 6250
NoConn ~ 3800 6150
NoConn ~ 3800 6050
NoConn ~ 3800 5950
NoConn ~ 3800 5750
$Comp
L power:GND #PWR0106
U 1 1 61B148ED
P 3700 7450
F 0 "#PWR0106" H 3700 7200 50  0001 C CNN
F 1 "GND" H 3705 7277 50  0000 C CNN
F 2 "" H 3700 7450 50  0001 C CNN
F 3 "" H 3700 7450 50  0001 C CNN
	1    3700 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4100 4300 4550
Wire Wire Line
	4500 4300 4450 4300
$Comp
L power:+5V #PWR019
U 1 1 61B75093
P 3600 4300
F 0 "#PWR019" H 3600 4150 50  0001 C CNN
F 1 "+5V" H 3615 4473 50  0000 C CNN
F 2 "" H 3600 4300 50  0001 C CNN
F 3 "" H 3600 4300 50  0001 C CNN
	1    3600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4200 4450 4200
Wire Wire Line
	4450 4200 4450 4300
Connection ~ 4450 4300
Wire Wire Line
	4450 4300 4400 4300
$Comp
L Device:R R5
U 1 1 61B86C2C
P 3850 4300
F 0 "R5" V 3750 4250 50  0000 L CNN
F 1 "10K" V 3850 4250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3780 4300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 3850 4300 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 3850 4300 50  0001 C CNN "Manufacturer"
F 5 "RES 10K OHM 5% 1/8W AXIAL" H 3850 4300 50  0001 C CNN "Description"
F 6 "CF18JT10K0CT-ND" H 3850 4300 50  0001 C CNN "Digi-Key_PN"
F 7 "CF18JT10K0" H 3850 4300 50  0001 C CNN "MPN"
	1    3850 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4300 3700 4300
$Comp
L Device:R R6
U 1 1 61B950E8
P 5850 4300
F 0 "R6" V 5750 4250 50  0000 L CNN
F 1 "10K" V 5850 4250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5780 4300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 5850 4300 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 5850 4300 50  0001 C CNN "Manufacturer"
F 5 "RES 10K OHM 5% 1/8W AXIAL" H 5850 4300 50  0001 C CNN "Description"
F 6 "CF18JT10K0CT-ND" H 5850 4300 50  0001 C CNN "Digi-Key_PN"
F 7 "CF18JT10K0" H 5850 4300 50  0001 C CNN "MPN"
	1    5850 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 4300 5700 4300
$Comp
L Device:Q_NPN_EBC Q3
U 1 1 61CDCCC7
P 7150 1300
F 0 "Q3" H 7340 1346 50  0000 L CNN
F 1 "PN2222" H 7340 1255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92L" H 7350 1400 50  0001 C CNN
F 3 "https://my.centralsemi.com/datasheets/PN2221-2222A.PDF" H 7150 1300 50  0001 C CNN
F 4 "NPN transistor" H 7150 1300 50  0001 C CNN "Description"
F 5 "1514-PN2222APBFREE-ND" H 7150 1300 50  0001 C CNN "Digi-Key_PN"
	1    7150 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61CF04DA
P 6650 1300
F 0 "R7" V 6550 1250 50  0000 L CNN
F 1 "1K" V 6650 1250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6580 1300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-cf_cfm.pdf" H 6650 1300 50  0001 C CNN
F 4 "RES 1K OHM 5% 1/8W AXIAL" H 6650 1300 50  0001 C CNN "Description"
F 5 "CF18JT1K00CT-ND" H 6650 1300 50  0001 C CNN "Digi-Key_PN"
F 6 "CF18JT1K00" H 6650 1300 50  0001 C CNN "MPN"
F 7 "Stackpole Electronics Inc" H 6650 1300 50  0001 C CNN "Manufacturer"
	1    6650 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 1300 6800 1300
Wire Wire Line
	6250 2300 6250 1300
Wire Wire Line
	6250 1300 6500 1300
Wire Wire Line
	7250 1100 7900 1100
Wire Wire Line
	7250 1500 7250 1550
$Comp
L power:GND #PWR0107
U 1 1 61D2F05A
P 7250 1550
F 0 "#PWR0107" H 7250 1300 50  0001 C CNN
F 1 "GND" H 7255 1377 50  0000 C CNN
F 2 "" H 7250 1550 50  0001 C CNN
F 3 "" H 7250 1550 50  0001 C CNN
	1    7250 1550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 61E68588
P 9000 5850
F 0 "H5" H 9100 5896 50  0000 L CNN
F 1 "MountingHole" H 9100 5805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965" H 9000 5850 50  0001 C CNN
F 3 "" H 9000 5850 50  0001 C CNN
	1    9000 5850
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 614CC5D6
P 1200 6550
F 0 "#FLG0101" H 1200 6625 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 6723 50  0000 C CNN
F 2 "" H 1200 6550 50  0001 C CNN
F 3 "~" H 1200 6550 50  0001 C CNN
	1    1200 6550
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 614CE686
P 1200 5650
F 0 "#FLG0102" H 1200 5725 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 5823 50  0000 C CNN
F 2 "" H 1200 5650 50  0001 C CNN
F 3 "~" H 1200 5650 50  0001 C CNN
	1    1200 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 614CEEDA
P 1200 6600
F 0 "#PWR0108" H 1200 6350 50  0001 C CNN
F 1 "GND" H 1205 6427 50  0000 C CNN
F 2 "" H 1200 6600 50  0001 C CNN
F 3 "" H 1200 6600 50  0001 C CNN
	1    1200 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6550 1200 6600
Wire Wire Line
	1200 5650 1600 5650
$Comp
L power:+5V #PWR0109
U 1 1 614E3B66
P 1600 5650
F 0 "#PWR0109" H 1600 5500 50  0001 C CNN
F 1 "+5V" H 1615 5823 50  0000 C CNN
F 2 "" H 1600 5650 50  0001 C CNN
F 3 "" H 1600 5650 50  0001 C CNN
	1    1600 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 614F73B2
P 1600 6100
F 0 "#PWR0110" H 1600 5950 50  0001 C CNN
F 1 "+3.3V" H 1615 6273 50  0000 C CNN
F 2 "" H 1600 6100 50  0001 C CNN
F 3 "" H 1600 6100 50  0001 C CNN
	1    1600 6100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 614F8CB7
P 1200 6100
F 0 "#FLG0103" H 1200 6175 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 6273 50  0000 C CNN
F 2 "" H 1200 6100 50  0001 C CNN
F 3 "~" H 1200 6100 50  0001 C CNN
	1    1200 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6100 1600 6100
Wire Wire Line
	3850 950  4200 950 
Wire Wire Line
	6250 4300 6250 4850
Wire Wire Line
	6250 4850 7300 4850
Wire Wire Line
	7300 4850 7300 2500
Wire Wire Line
	7300 2500 7150 2500
Connection ~ 6250 4300
Wire Wire Line
	6250 4300 6000 4300
Wire Wire Line
	4400 4300 4400 4800
Wire Wire Line
	4400 4800 5350 4800
Wire Wire Line
	5350 4800 5350 2500
Wire Wire Line
	5350 2500 5300 2500
Connection ~ 4400 4300
Wire Wire Line
	4400 4300 4000 4300
$Comp
L Device:D D1
U 1 1 618EEB95
P 3100 2650
F 0 "D1" V 3054 2729 50  0000 L CNN
F 1 "1N914" V 3145 2729 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3100 2650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85622/1n914.pdf" H 3100 2650 50  0001 C CNN
F 4 "1N4148FSCT-ND" H 3100 2650 50  0001 C CNN "Digi-Key_PN"
F 5 "1N4148TR" H 3100 2650 50  0001 C CNN "MPN"
F 6 "onsemi" H 3100 2650 50  0001 C CNN "Manufacturer"
F 7 "100V 0.3A Small Signal Fast Switching Diode, DO-35" H 3100 2650 50  0001 C CNN "Description"
	1    3100 2650
	0    1    1    0   
$EndComp
Connection ~ 3100 2900
Wire Wire Line
	3100 2900 3550 2900
Wire Wire Line
	3100 2800 3100 2900
Wire Wire Line
	3100 2500 3100 2450
Wire Wire Line
	3100 2450 2800 2450
Connection ~ 2800 2450
Wire Wire Line
	2800 2450 2800 2500
$Comp
L Device:D D2
U 1 1 6190C4CE
P 3150 3750
F 0 "D2" V 3104 3829 50  0000 L CNN
F 1 "1N914" V 3195 3829 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3150 3750 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85622/1n914.pdf" H 3150 3750 50  0001 C CNN
F 4 "1N4148FSCT-ND" H 3150 3750 50  0001 C CNN "Digi-Key_PN"
F 5 "1N4148TR" H 3150 3750 50  0001 C CNN "MPN"
F 6 "onsemi" H 3150 3750 50  0001 C CNN "Manufacturer"
F 7 "100V 0.3A Small Signal Fast Switching Diode, DO-35" H 3150 3750 50  0001 C CNN "Description"
	1    3150 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 3900 3150 4000
Wire Wire Line
	3150 3600 3150 3550
Wire Wire Line
	3150 3550 2850 3550
Connection ~ 3150 4000
Wire Wire Line
	3150 4000 4500 4000
Connection ~ 2850 3550
Wire Wire Line
	2850 3550 2850 3600
$EndSCHEMATC
