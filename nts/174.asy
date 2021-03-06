

CFB NO.:  174                                        DATE:  AUGUST  2, 1989   

REV LEVEL:  3                                DATE CHANGED:  AUGUST 28, 1990   

TYPE:  HARDWARE
HARDWARE:  DIAL ACCESS 296
SUBJECT:DIAL ACCESS 296 STRAPPING FOR ASYNC DIAL-UP AND ASYNC LEASED LINE

===========================================================================

     Dip Switch settings on rear-panel on DialAccess 296 modem.

UP=OFF
DOWN=ON

SWA Functions:					

SWA-1	SWA-2	SWA-3	DTE port Asynchronous Bit Rate
OFF	OFF	OFF	AUTOBAUD		
OFF	OFF	ON	19,200 bps
OFF	ON	OFF	9600 bps                             
OFF	ON 	ON	4800 bps                        
ON	OFF	OFF	2400 bps
ON	OFF	ON	1200 bps
ON	ON	OFF	600  bps
ON	ON	ON	300  bps

SWA-4	SWA-5	Modem Bit Rate
OFF	OFF	9600 bps				
OFF	ON	4800 bps
ON	OFF	4800 bps
ON	ON	4800 bps

SWA-6	SWA-7	Modem Command Set
OFF	OFF	Concord Command set			OFF       OFF
OFF	ON	Hayes AT command set
ON	OFF	V.25 bis command set
ON	ON	Command mode disabled

SWA-8		DTE Mode
OFF		Asynchronous mode			OFF(ASYNC)
ON		Synchronous mode			ON (SYNC)


Dip Switch Band SWB

SWB-1		Control signals				         
OFF		DSR,DCD,CTS are always on;DTR ignored.
ON		DSR,DCD,CTS follow modem status; modem
		disconnects on falling DTR.

SWB-2		Front-panel controls				  
OFF		Enabled
ON		Disabled

SWB-3		2-wire/4-wire Leaded				  
OFF		4-wire lease
ON		2-wire lease

SWB-4		Dial line transmit mode				  
OFF		Programmable, 0 to -12dBm.
ON		Permissive transmit level at -9dBm.

SWB-5		Postive test voltage				  
OFF		No DCE connection on pin 9 of RS-232 connector
ON		Postive test voltage on pin 9

SWB-6		Negative test voltage				  
OFF		No DCE connection on pin 10 of RS-232 connector
ON		Negative test voltage on pin 10.

SWB-7		Data signaling rate select			  
OFF		DTE source, pin 23
ON		DCE source, pin 12

SWB-8		Test indicator/Make Busy on pin 25		  
OFF		If SLM1 is set, DTE signal transitions on pin 25
		control Make Busy.If SLM0 is set, the state of
		pin 25 is ignored.
ON		Test indicator on from modem during LOOP 2 or LOOP 3
		test and /or while modem is transmitting a test pattern.

***************************************************************************

     STRAPPING FOR 9600 BAUD ASYNC DIAL-UP ANSWER MODE (TYMNET SITE)
     ---------------------------------------------------------------

1) Set the switches on the back of the modem to the following settings.

	SWA-2	ON
	SWB-1	ON


2) RESET the modem Via the front panel by pressing the LEASED and
   the LOOP 2 button at the same for at least 2 seconds.
   Connect a 9600 baud terminal to the DTE port to program the soft-
   straps. With the modem powered up press the return key twice. 
   At the  "MODEM >" prompt type RESET. The modem will ask
   "ARE YOU SURE ? [Y OR N]. Type a Y. This will reset the modem
   to the factory default settings if the front panel RESET didn't work. 
   (NOTE) Only REV 5.0 modems will RESET via front panel. To check 
   to modems rev level , at the MODEM> prompt type RSF, the rev level
   will apear on the top line of the RSF screen.


Enter the following commands at the prompt terminating each command with
a carriage return.

   SLCD4
   SPF1
   SBK3
   SMF0
   SAS4	
   STI000
   SCM1	
   SMN2	
   SRP BTTYMNET
   SAVE
   INIT

   Enter the command RSF at the MODEM > prompt. RSF is short for Review
   Setting - Full list. Check your settings.


At the MODEM > prompt enter SRM2. After you enter the carraige return you
will not see any response. Type "SAVE" return, and "INIT" and return.
This will disable sending the Concord banner to the consat.
Type RSF and return and check to make sure the softstraps are set
correctely. SRM0 will give you the echo back.

   You are now finished strapping the modem. Connect the engine's SIO ASYNC
port to the DTE port on the modem. Be sure the baud rate of the SIO port is
set for 9600. Connect the dial-up phone line to the DIAL jack on the back of
the modem and power on the modem if it is not already. Check for DTR on
the front of the modem.

*****************************************************************************

     STRAPPING FOR 9600 BAUD ASYNC LEASED LINE 4-WIRE OR 2-WIRE
     ----------------------------------------------------------

1) Set the switches on the back of the modem to the following settings.

	SWA-2	ON
	SWB-1	ON


2) RESET the modem Via the front panel by pressing the LEASED and
   the LOOP 2 button at the same for at least 2 seconds.
   Connect a 9600 baud terminal to the DTE port to program the soft-
   straps. With the modem powered up press the return key twice. 
   At the  "MODEM >" prompt type RESET. The modem will ask
   "ARE YOU SURE ? [Y OR N]. Type a Y. This will reset the modem
   to the factory default settings if the front panel RESET didn't work. 
   (NOTE) Only REV 5.0 modems will RESET via front panel. To check 
   to modems rev level , at the MODEM> prompt type RSF, the rev level
   will apear on the top line of the RSF screen.


Enter the following commands at the prompt terminating each command with
a carriage return.

   SLCD4
   SPF1
   SBK3
   SMF0
   SAS4	
   STI000
   SXLP000	
   SCM1	
   SMN2	
   SRP BTTYMNET
   SAVE
   INIT

   Enter the command RSF at the MODEM > prompt. RSF is short for Review
   Setting - Full list. Check your settings.


At the MODEM > prompt enter SRM2. After you enter the carraige return you
will not see any response. Type "SAVE" return, and "INIT" and return.
This will disable sending the Concord banner to the consat.
Type RSF and return and check to make sure the softstraps are set
correctely. SRM0 will give you the echo back.

TYMNET SIDE (ANSWER MODEM) :
  Check to see that the LEASED LED is ON and the ORIG LED is OFF, then
press the LOOP2 button for at least 2 seconds to save the front panel
settings.

CUSTOMER SIDE (ORIGINATE MODEM) :
  Check to see that the LEASED and the ORIG LED is ON, then press the
LOOP 2 button for at least 2 seconds to save the front panel settings.


   You are now finished strapping the modem. Connect a modified 6 inch
SIO ASYNC (see note at bottom) port to the DTE port on the modem. 
Be sure the baud rate of the SIO port is set for 9600. Connect the 
LEASED LINE to the LEASED jack on the back of the modem .Check for DTR on
the front of the modem.

*****************************************************************************

   