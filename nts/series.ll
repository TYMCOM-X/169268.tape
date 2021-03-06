

CFB NO.:                                             DATE: 

REV LEVEL:                                   DATE CHANGED:   

TYPE:  HARDWARE
HARDWARE:  MEMOTECH/CONCORD SERIES II MODEM
SUBJECT:   ASYNC LEASE LINE CONFIGURATION FOR THE SERIES II MODEM
========================================================================

		INTERNAL SWITCH FUNCTIONS 
		=========================

SW1 switch is a 8 posotion switch pack located on the Top PCBD at
location U-34 , just behind front panel.
--------------------------------------------------------------------------
DTE PORT BIT RATE	1    2    3    4    5    6    7    8
--------------------------------------------------------------------------

Autobaud		Off  Off  Off
300			 On  Off  Off
600			Off   On  Off
1200			 On   On  Off
2400			Off  Off   On
4800			 On  Off   On
9600			Off   On   On
DIRECT SYNCHRONOUS	 On   On   On

--------------------------------------------------------------------------
COMMAND MODE		1    2    3    4    5    6    7    8
--------------------------------------------------------------------------
Disable				       On
Enable				      Off
--------------------------------------------------------------------------
CONTROL SIGNALS		1    2    3    4    5    6    7    8   
--------------------------------------------------------------------------
DSR,DCD,CTS follow
modem;hang-up on falling DTR		    On
DSR,DCD,CTS allways On;
DTR ignored				    Off
--------------------------------------------------------------------------
FRONT PANEL SWITCHES	1    2    3    4    5    6    7    8
--------------------------------------------------------------------------
Disabled					 On
Enabled						 Off
--------------------------------------------------------------------------
WRITE PROTECT		1    2    3    4    5    6    7    8
--------------------------------------------------------------------------
Enabled						     On
Disabled					     Off
--------------------------------------------------------------------------
COMMAND SET		1    2    3    4    5    6    7    8
--------------------------------------------------------------------------
AT							   On
Series II						  Off
--------------------------------------------------------------------------
--------------------------------------------------------------------------


SW1 and SW2 ; two four position switch packs, are all OFF.

		BOTTOM PCBD SERIES II MODEM
		---------------------------

   SW4 LEASED LINE TRANSMITT LEVEL ADJUST FOR 2-WR/4-WR LEASED LINES
	SWITCH SETTING			TRANSMITT LEVEL
--------------------------------------------------------------------------
	All OFF				-16 db (factory setting)
	1    ON				-14 db
	2    ON				-12 db
	3    ON				-10 db
	4    ON				 -8 db
	5    ON				 -6 db
	6    ON				 -4 db
	7    ON				 -2 db
	8    ON				 -0 db

========================================================================	



SW3 ;If installed, is a 8 position switch pack used to set the transmitt
level on the dial line.



Reset the modem via the front panel by pushing the ERR and the TP at the
same time for at least 2 seconds.


=========================================================================

The Series II Memotec/Concord modem will be used for a point-to-
point 4-wire leased line in the Async MNP mode. The Tymnet side
will be the Answer modem and the customer will be the Originate
side. This configuration will only be good for Bourns .

=====================================================================

Take the top off the modem and set the following switches:
SW1 is loacated at position U-34 on top board.
	SW1-3	ON  (2400 bps)
	SW1-5   ON  (DSR,DCD,CTS follow modem;hang-up on falling DTR)
SW4 is located on the bottom board left side , set the following switch:
	SW4-8	ON  (X-mitt level on leased -0dbm)
-----------------------------------------------------------------------
*NOTE*
For the Tymnet site you will need to disable the command mode after all
the straps are set using SW1-4  ON. This is so the modem will not report
for outdial use.

Put the top back on the modem and set the rear panel switch marked
4W/2W to the 4W position.

>>>USE TERMITE NOT PROCOMM<<<
Power up the modem and hook a terminal to the RS-232 (DTE) port .
Set the terminal speed to 2400 bps.

Type Return and you should get the CDS> prompt. At this time you 
want to type RESET. The modem wil resopnd with are you sure? ,
type "Y" and return.

At the CDS> prompt you want to enter the following commands each
command terminated with a carriage return.

	SLCD0 (CUSTOMER SITE ONLY)
	STI0
	SMF0
	SPF1
	SMD3
	SMB2400
	SPB2400
	SPD5
	SBK3
	SAVE
	INIT

At the CDS> prompt, type RSF <cr> and check to see the straps you
have entered are on the list.
These are the basic commands for the modem to operate in a dial-up
modem the next commands will be for the leased mode and the response
mode.


For the Customer site enter the following terminating each command with 
a carriage return:
	SLOSAVEINIT<CR>     (set Originate mode leased)

The next command is for the TYMNET site modem only, this will turn
off the response from the modem. You will see nothing after the SRM2 
is entered so enter it carefully.
Enter the following terminating each command with a carriage return:
	SRM2
	SAVE
	INIT
The save and init will not be seen.
(To get back to the response mode type SRM0 and return.)

For the Tymnet site enter the following terminating each command with 
a carriage return:
	SLASAVEINIT<CR>	(set answer mode leased)


YOU MUST MODIFY THE CABLE FOR THE TYMNET SIDE OR THE PORT WILL HANG.

1) USING A SIX INCH STREIGHT THROUGH CABLE DO THE FOLLOWING:

			FEMALE SIDE		MALE SIDE
			-----------		--------

TO TYMNET ENGINE ASYNC PORT<-------5|------->5 TO MODEM PORT
			     \-----6|
			      \----8|

PINS 5,6 AND 8 ARE TIED TOGETHER GOING TO THE TYMNET ENGINE, PIN
5 IS SENT THROUGH TO PIN 5 ON THE MODEM. REMOVE PINS 6 AND 8
ON THE MODEM SIDE OF THE CABLE.



The modem(s) are ready for the instal. Hook up the RS-232 cable to the
DTE port and the four-wire leased line to the  Lease jack in the rear
panel of the modem.

On the front panel you will notice the data light flashing durning
training mode. When the DATA LED is solid ,the PROT and the SYN LED
will also be solid. The SQ LED will be solid after the handshake.
The SYN LED means the modems are in the MNP mode. The modems are
still Async but the link between them is in the MNP mode.

DTR must be present at the Tymnet side of the circuit in order for the
leased line to come up and answered. Make sure DTR is showing on the
front of the modem when the Async cable is attached. The customer
end is strapped to come up without DTR being present, this is so 
the customer can switch from one application to another without
droping the leased line.


Any problems call :
August Cattaneo/NTS
408-922-7466

 