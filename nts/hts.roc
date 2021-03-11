

			  TYMNET TRIROCK RELEASE

                        HARDWARE TECHNICAL SERVICES
                         PRODUCT RELEASE DOCUMENT

                                                    DATE:AUGUST 18,1987

UPDATED RELEASE DATE JANUARY 20,1988

PRODUCT NAME: 224 TRISPEED Series II (TRI-ROCK) Rack Mount Modem with
	      MNP error correction Level 4 and below	

MANUFACTURER: CONCORD DATA SYSTEMS

CONCORD DATA SYSTEMS PART NUMBER: MHR23N1DTY (TYMNET)

FCC REGISTRATION NO.: CER8EN-15129-MD-E

COMPLIES WITH PART 68, FCC RULES

RINGER EQUIVALENCE: 0.8B

REQUIRED CONNECTOR: DB9 (Female)

OPERATING TEMPERATURE: 0 - 50 DEGREES C

STORAGE TEMPERATURE: -40 TO 70 DEGREES C

RELATIVE HUMIDITY: 5-95% NONCONDENSING

POWER:   Less than 6 WATTS

MAXIMUM RATING:

         +5Vdc @ 750mA
         +12Vdc @ 100mA
         -12Vdc @ 50 mA 

DATA FORMAT: Bit synchronous or 8-,9-,10-, or 11-bit asynchronous.
             Auto dialing is possible only when 9- or 10-bit characters are
             used (ASCII with or without parity).

DATA RATE:  2400 bps (224/V.22 bis) compatible
            1200 bps (212/V.22) compatible
             300 bps (bell 103) compatilbe

DIGITAL INTERFACE: CCITT V.24/V.28 AND RS-232-C

MODULATION: 2400 bps Quadrature Amplitude Modulation
            1200 bps Differential Phase Shift Keying
             300 bps Frequency Shift Keying
            

OPERATING MODES: 2400 bps synchronous
                 2400 bps asynchronous
                 1200 bps synchronous
                 1200 bps asynchronous
                 0-300 bps isochronous
                 0-300 bps asynchronous

TRANSMITTER TIMING TRACKING RANGE:

		Synchronous +/- 0.01%
		Asynchronous Normal +1% overspeed
		Extended range + 2.3% overspeed
		Slow 2.5% underspeed

IMPEDANCE: 600 OHMS

HOLDING RESISTANCE: LESS THAN 150 OHMS @ 70 mA maximum

TRANSMIT LEVEL:  FCC REGISTERED Programmable (RJ45, 0 to -12dBm) or
                 Permissive (RJ11, -9dBm)

RECEIVE LEVEL: LOW -43 dbm minimum
               HIGH -3 dbm MAXIMUM

RING DETECTOR: FREQUENCY 16-66 Hz.
               TRIP POINT 23 VRMS OR GREATER
               NO TRIP AT 15 VRMS OR LESS       

CABLE REQUIREMENTS: TYMSHARE CABLE, 160110-058 (RS-232-C NO LONGER THAN 50FT)
		    Anolog cable, DB9 Male.

RACK REQUIREMENTS:  Concord Data System RM16 Rev 3, Racal Vadic 1680 or 1681 
with only eight (8) modems recommended in the Racal Vadic rack, using only
Racal Vadic 2082 power supply in RV1680 or the VI2085A power supply in the
1681 Rack.

TELCO LINE TYPE REQUIRED: FULL DUPLEX, 2 wire, loopstart, data quality.

FOR SWITCHED LINES: TELCO SUPPLIED 1MB LINE TERMINATED ON AN RJ45-P or
                    RJ11 Permissive. RJ45 is recommended for Tymnet.

COMPATIBILTY: COMPATIBILITY WITH CCITT V.22 bis RECOMMENDATIONS AND BELL
              212A STANDARDS.
	      MNP level 4 and below.
	
PHYSICAL DESCRIPTION: Length        12.65 in.
                      Width          6.046 in.
                      Weight         3 lbs.




HTS TEST START DATE: January 87

HTS TEST COMPLETE DATE: October 16,1987

TEST SITES: HTS (formerly NTS) office, Redwood City Rotary,Santa Clara Rotary
	    and Los Angeles/Vernon.

FEATURES TESTED:
		 Allows XPC traffic to pass through correctly in the direct
		 mode.
		 Answers POS calls at 300 baud correctly
                 Answers calls correctly @ 3/12/2400 baud.	
		 Originates call correctly using Consat outdial code.
                 Handles ERROR detection and correction  correctly when 
		 talking to another MNP modem.
		 Handles file tranfer correctly with no errors.
		 Busy-out tested on pin 25.
		 		 
                        
CFB NUMBER: To Follow....
TYMNET PART NO: 600142-001

                  >>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<

I.      SPARES:                  Ten (10) percent

II.     SPECIAL TEST EQUIPMENT:  NONE

III.    TRAINING REQUIRED:       STANDARD FE HARDWARE CLASSES

IV.     SPECIAL TOOLS REQUIRED:  NONE

V.      DOCUMENTATION:           SUPPLIED IN BOX AND CFB#....

VI.     SKILL LEVEL:             STANDARD FE HARDWARE CLASSES

VII.    DEPOT INVOLVEMENT:       FORWARD TO MANUFACTURER FOR REPAIR.

VIII.   ADDITIONAL INFORMATION:  This Concord Tri-Rock modem must
	have The Rockwell Chip  Rev J1 (R5310-25) at location
	U45 on modem PC board and Rockwell Chip Rev G1 (R5311-18) at
	location U42 on modem PC board. This stops the problem of raising
	modem signals too fast , causing streaming data.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>NOTE<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

There will be two soft setting for the Concord TriRock modems:

	1) Standard Operation

	2) MNP Operation or (tymnet MNP) mode

This will be included in the CFB to follow.
    