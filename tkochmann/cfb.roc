



CFB NO.:                                            DATE:JANUARY 18,1988

REV LEVEL:  0                               DATE CHANGED:JANUARY 18,1988

TYPE: HARDWARE, RACK MOUNT THREE SPEED MODEM CARD FOR USE IN THE
      CONCORD DATA SYSTEMS RM-16 MODEM RACK AND THE RACAL-VADIC
      1680 AND 1681 MODEM RACKS.	

HARDWARE: CONCORD SERIES II TRI-ROCK , THREE SPEED (300,1200,2400 BAUD),
          RACK MOUNT MODEM, WITH "MNP ERROR CORRECTION" FOR TYMNET PUBLIC
	  NETWORK IN-DIAL AND OUT-DIAL ROTARY USE.

SUBJECT: OPTION SWITCH SETTINGS FOR ORIGINATE AND ANSWER MODE

THIS CFB DESCRIBES THE STRAPPING FOR THE CONCORD TRI-ROCK MODEM 
(PUBLIC NET), IN A STANDARD 2 WIRE , ASYNCHRONOUS, IN-DIAL AND OUT-DIAL
CONFIGURATION USING 2400,1200 AND 300 BAUD OR JUST 1200 AND 300 BAUD.

***************************************************************************

GENERAL :

THIS CONCORD MODEM IS CALLED "TRI-ROCK" BECAUSE OF THE TWO 64 PIN
ROCKWELL MODEM CHIPS LOCATED AT U-54 AND U-42 ON THE PC BOARD. THE MODEM 
PC BOARD ALSO HAS  "TRIROCK COMP SIDE"  ECHED IN THE BOARD AT THE TOP
CORNER ABOVE THE EDGE CONNECTOR.

MNP (MICROCOM NETWORKING PROTOCOL) IS ANOTHER MEANS OF TRANSMITTING ERROR
FREE DATA OVER A TELEPHONE LINE. THERE IS SEVERAL LEVELS OF MNP. THE
TRIROCK MODEM USES LEVEL "4" AND BELOW. THE LEVEL EACH MODEM HAS IS
DETERMINED BY THE LINK LEVEL NEGOTIATION BETWEEN THE MODEM AT THE BEGINNING
OF A SESSION.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NOTE<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

THERE ARE TWO VERSIONS OF THE TRI-ROCK MODEM. ONE IS FOR " TYMNET " PUBLIC
NETWORK USE AND THE OTHER IS FOR " DIALOG " PRIVIATE NETWORK USE. THERE
ARE TWO PART NUMBERS. ONE FOR TYMNET AND THE OTHER FOR DIALOG . YOU CAN
USE THE TYMNET VERSION FOR DIALOG AND YOU CAN NOT USE THE DIALOG
VERSION FOR TYMNET.  PLEASE READ THE DISCRIPTION OF THE TYMNET VERSION
AND DIALOG VERSION BELOW.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

	**TYMNET  TRI-ROCK MODEM DESCRIPTION AND PART NUMBER**
	  --------------------------------------------------

TYMNET TRIROCK PART NUMBER: 600142-001
---------------------------
FIRMWARE REV NUMBER: REV 2.24 (TYMNET)
--------------------
MANUFACTURERS PART NUMBER: MHR23NIDTY
-------------------------

TRI-ROCK MODEM DESCRIPTION AND DIFFERENCES:

RACK MOUNT TRI-ROCK SERIES II MODEM USED FOR TYMNET:

TYMNET'S VERSION OF THE TRI-ROCK HAS CHIPS ADDED TO THE BOARD AT
LOCATIONS U-19, U-10, U-35, U-40, U-16, U-44 AND HAS " TRIROCK REV
2.24 " ON THE CHIP AT LOCATION U-11. THIS PROM HAS CODE IN IT FOR 
OUT-DIAL USE AND SPECIAL MNP CONFIGURATION USE. TYMNET'S VERSION OF
THE TRI-ROCK EXECUTES A  "SOFT INIT"  AFTER EACH SESSION READING THE
SOFT STRAPS INTO THE MODEMS MEMORY . THIS IS TO RESET THE MODEM BACK 
TO DIRECT MODE AFTER A  "MNP"  CALL IS DISCONNECTED. ALSO , DSR IS
RAISED ON THE FIRST RING OF A CALL SO THE CONSAT SLOT CAN SEE THIS
MODEM IS IN USE AND NOT AVALIABLE FOR OUT-DIAL USE.

*************************************************************************

	**DIALOG TRI-ROCK MODEM PART NUMBER AND DESCRIPTION**
	  -------------------------------------------------

(DIALOG TRIROCK) TYMNET PART NUMBER: 600147-001
-----------------------------------
FIRMWARE REV NUMBER: 2.06  (CONCORD TRI-ROCK)
-------------------
MANUFACTURERS PART NUMBER: 09-10106-201
------------------------

TRI-ROCK MODEM DESCRIPTION AND DIFFERENCES:

RACK MOUNT TRI-ROCK SERIES II MODEM USED FOR DIALOG:

DIALOG HAS THE BASIC STOCK CONCORD DATA SYSTEMS TRI-ROCK MODEM WITH 
THE EXCEPTION OF THE DB-9 CONNECTOR FOR THE TELCO LINE CONNECTION AND
TWO EXTRA MEMORY CHIPS ADDED AT LOCATIONS U-28,U-21,U-28 AND U-41. THE DIALOG
TRI-ROCK MODEM WILL HAVE " TRIROCK REV 2.06 " ON THE FIRMWARE CHIP LOCATED 
AT POSITION U-11 AND U-21. DIALOG'S TRI-ROCK MODEM MUST BE OPTIONED USING A
TERMINAL AND SETTING SOME DIP SWITCHES .

**************************************************************************

	TYMNET'S  TRI-ROCK MODEM  DEFAULT SOFT-STRAP SETTING
				  =======	

	BLK: 256		SPF: 1
	RLB: 1			SRD: 1
	SBA: 1			SRG: 001
	SBK: 5			SRI: 0
	SCC: 0			SRM: 0
	SCP: 1			SSD: 1
	SE: 001			SST: 0
	SLCA:0			STA: 005
	SLCB: 1			STB: 007
	SLCC: 1			STC: 050
	SLCD: 4			STD: 000
	SLCF: 1			STE: 025
	SMB: 2400		STI: 000
	SMD: 0			STP: 002
	SMF: 0			STR: 000
	SPB: AUTO		STW: 002
	SPD: 5			STX: 0
	SPE: 0
		
	
**************************************************************************

	              TRI-ROCK SET-UP COMMANDS
                          (SOFT STRAP MENU)

FUNCTIONAL GROUP	FUNCTION			COMMAND
----------------	--------			-------

COMMAND MODE		SET BREAK RESPONSE		SBK n
			SET CHARACTER CASE		SCC n
			SET EXIT CODE CHARACTER		SE  n
							SE/<string>
			SET RESPONSE TO LONG SPACE	SRD n
			SET RESPONSE MODE		SRM n
			SET RMS MODE PASSWORD		SRP<string>
			SET USE OF LONG SPACE		SSD n
			SET WAIT TIME BEFORE DISCONNECT 
			AFTER CARRIER LOSS		STB n
			SET WAIT TIME FOR CARIER BEFORE
			DISCONNECT			STC n
			SET TIME TO DISCONNECT AFTER LOSS
			OF  DTR				STD n
			SET EXIT CODE GUARD TIME 	STE n
			SET INACITIVITY TIME		STI n
			SET USER MESSAGE		SUM<string>

COMMUNICATIONS		SET MNP CLASS IV BLOCK SIZE	BLK n
			SET AUTOMATIC ANSWER		SAA
			SET MANUAL ANSWER		SAM
			CALL PROGRESS TONE MONITORING	SCP n
			SET ADAPTIVE DIALING		SDA
			SET PULSE DIALING		SDP
			SET TONE DIALING		SDT
			SET MODEM BIT RATE		SMB n
			SET MODEM DATA MODE		SMD n
			SET MODEM FLOW CONTROL		SMF n
			SET RING NUMBER			SRG n
			SET RING INDICATER		SRI n
			SET SYNC EXTERNAL TIMING	SST n
			SET 'A' SUBCOMMAND CYLCLES	STA n
			SET','SUBCMD PAUSE TIME		STP n
			SET 'W' SUBCOMMAND CYLCLES	STW n

CONTROL SIGNAL		SET RTS (CA) LEAD		SLCA n
			SET CTS (CB) LEAD		SLCB n
			SET DSR (CC) LEAD		SLCC n
			SET DTR (CD) LEAD		SLCD n
			SET DCD (CF) LEAD		SLCF n
			SET TIME UPON RECEIPT OF 
			RTS TO RAISE CTS		STR n

DTE PORT		SET BAUD RATE ADJUST		SBA n
			SET PORT BIT RATE		SPB n
			SET PORT DATA AND PARITY
			FORMAT				SPD n
			SET PORT ECHO			SPE n
			SET PORT FLOW CONTROL		SPF n
			SET PASSWORD PROMPT		SPP<string>
			SET USER PASSWORD 		SUP<string>

TESTING			SET RESPONSE TO REMOTE LB	RLB n
			SET WATCHDOG TIMER		STX n

**********************************************************************

			BERG STRAP POSITIONS		

S2 SHOULD BE IN THE "A" POSITION TO ENABLE REMOTE BUSY OUT ON PIN 25.
THIS STRAP IS LOACATED NEXT TO THE RS-232 CONNECTOR.

S11 SHOULD BE IN THE POSITION "B" FOR PROGRAMMABLE MODE. THE MODEM WILL
READ THE VALUE OF THE PROGRAM RESITOR ON THE  TELCO 97A CARD.
S11 IS LOCATED AT THE BOTTOM OF THE CARD JUST TO THE LEFT OF THE
DB-9 CONNECTOR.

**********************************************************************

                   TRI-ROCK DIP SWITCH FUNCTIONS

DIP SWITCH #	FUNCTION			TYMNET SWITCH SETTING
------------	--------			----------------------
SW1-1		RATE CONTROL VIA DTE				OFF	

ON		ENABLE DTE CNTRL,PIN 23
		HIGH-1200 bps
		LOW -2400 bps

OFF		DISABLE DTE CNTRL,PIN 23		

---------------------------------------------------------------------

SW1-2 SW1-3	DTE CONTROL OF PIN 11			OFF	OFF

OFF	OFF	PIN 11 IS IGNORED
ON 	OFF	PIN 11 SELECTS ORG or ANS MODE		
			HIGH-ANSWER
			LOW -ORIGINATE			
OFF	ON	PIN 11 SELECTS ASYNC or SYNC MODE
			HIGH- SYNC
			LOW -ASYNC 
ON	ON	PIN 11 IS IGNORED.
	
--------------------------------------------------------------------

SW1-4 SW1-5	DTE CONTROL OF PIN 24			OFF	OFF

OFF	OFF	PIN 24 IS IGNORED
ON	OFF	PIN 24 TIMING SOURCE FOR SYNC MODE	
			HIGH-MODEM INTERNAL TIMING
			LOW -MODEM EXTERNAL TIMING
OFF	ON	PIN 24 SEL ASYNC or SYNC OPERATION
			HIGH-SYNC
			LOW- ASYNC
ON	ON	PIN 24 IS IGNORED

----------------------------------------------------------------------

SW1-6		NOT USED					OFF
SW1-7		NOT USED					OFF
SW1-8		NOT USED					OFF

----------------------------------------------------------------------

SW2-1	SW2-2	SW2-3	FUNCTION		OFF	OFF	OFF
-----   -----   -----   --------

OFF	OFF	OFF	MODEM AUTOMATICALLY ADAPTS RATE TO REMOTE MODEM
OFF	OFF	ON	2400bps
OFF	ON	OFF	1200bps
OFF	ON	ON	2400bps, FALLBACK TO 1200bps
ON	OFF	OFF	300bps
ON	OFF	OFF	2400bps, FALLBACK TO 300bps
ON	ON	OFF	1200bps, FALLBACK TO 300bps
ON	ON	ON	MODEM AUTOMATICALLY ADAPTS  RATE TO REMOTE MODEM

-------------------------------------------------------------------------

SW2-4			NOT USED				OFF

-------------------------------------------------------------------------

SW2-5		ESCAPE TO COMMAND MODE				OFF

ON		ENABLES EXT TO COMMAND FROM DATA MODE WITHOUT
		DISCONNECTION OF THE CALL IN PROGRESS
OFF		DISABLES EXIT TO COMMAND MODE

------------------------------------------------------------------------

SW2-6		ENABLE LOOP 3 DURING BUSY OUT			OFF

ON		RACK L3/ALB INITIATES A LOOP 3 TEST
		AND PLACES THE MODEM OFF-HOOK
OFF		RACK L3/ALB SWITCH PLACES THE OFF-HOOK.

------------------------------------------------------------------------

SW2-7	SW2-8 	DTE CONTROL OF PINS 18 AND 25		ON	OFF

OFF	OFF	LOW TO HIGH ON PIN 25 PLACES MODEM OFF-HOOK		
ON 	OFF	LOW TO HIGH ON PIN 25 INITIATES LOOP 3 AND OFF-HOOK
OFF	ON	LOW TO HIGH ON PIN 25 PLACES THE MODEM OFF-HOOK
ON	ON	LOW TO HIGH ON PIN 25 INITIATES LOOP 3 AND OFF-HOOK

-----------------------------------------------------------------------

SW3-1		LOOP 2 TEST CONTROL				OFF

ON		MODEM WILL NOT RESPOND TO A LOOP 2 REQUEST 
		FROM THE REMOTE MODEM.
OFF		MODEM RESPONDS TO A LOOP 2 TEST REQUEST FROM 
		THE REMOTE MODEM

-----------------------------------------------------------------------

SW3-2		TEST WATCHDOG TIMER CONTROL			OFF

ON		DISABLES FIVE MINUTE TEST WATCHDOG TIMER
OFF		ENABLES FIVE MINUTE TEST WATCHDOG TIMER.

-----------------------------------------------------------------------

SW3-3		DTE CONTROL OF PINS 18 AND 21			OFF

ON		LOW TO HIGH ON PIN 18 INITIATES LOOP 3 TEST.
		LOW TO HIGH ON PIN 21 INITIATES LOOP 2 TEST.
OFF		MODEM INGORES PINS 18 AND 21

-----------------------------------------------------------------------

SW3-4		MI/MIC SIGNALING				OFF

ON		ENABLES MI/MIC SIGNALING
OFF		DISABLES MI/MIC SIGNALING

-----------------------------------------------------------------------

SW3-5		AUTO ANSWER					OFF

ON		DISABLES AUTO ANSWER
OFF		ENABLES AUTO ANSWER

-----------------------------------------------------------------------

SW3-6		LONG SPACE DISCONNECT				OFF

ON		ENABLES MODEM TO SEND AND RESPOND TO A LONG 
		SPACE ON DISCONNECT.
OFF		DISABLES LONG SPACE DISCONNECT FUNCTION.

-----------------------------------------------------------------------

SW3-7		NOT USED					OFF
SW3-8		NOT USED					OFF

-----------------------------------------------------------------------

SW4-1	SW4-2	SW4-3	MODEM TO DTE DATA RATE	      OFF  OFF  OFF

OFF	OFF	OFF	ADAPTS TO SPEED OF DTE USING "AT" CODE
ON	OFF	OFF	300 bps (ASYNC ONLY)
OFF	ON	OFF	600 bps (ASYNC ONLY)
ON	ON	OFF	1200 bps (SYNC or ASYNC)
OFF	OFF	ON	2400 bps (SYNC or ASYNC)
ON	OFF	ON	4800 bps (ASYNC ONLY)
OFF	ON	ON	9600 bps (ASYNC ONLY)
ON	ON	ON	DIRECT SYNC

----------------------------------------------------------------------

SW4-4		COMMAND MODE CONTROL				OFF

ON		DISABLES ACCESS TO COMMAND MODE
OFF		ENABLES ACCESS TO COMMAND MODE

----------------------------------------------------------------------

SW4-5		DSR,DCD,CTS,AND DTR SIGNAL CONTROL		OFF

ON		EIA SIGNALS ALWAYS ON, DTR IS IGNORED
OFF		EIA SIGNALS CONTROLLED BY MODEM ACCORDING
		TO CCITT V.22bis RECCOMMENDATION. MODEM
		DISCONNECTS ON HIGH TO LOW TRANSITION OF DTR.

---------------------------------------------------------------------

SW4-6		NOT USED					OFF

---------------------------------------------------------------------

SW4-7		NONVOLATILE MEMORY PROTECT			OFF

ON		PARAMETERS IN NONVOLATILE MEMORY CANNOT BE CHANGED
OFF		PARAMETERS IN NONBOLATILE MEMORY CAN BE CHANGED.

---------------------------------------------------------------------

SW4-8		COMMAND MODE SELECTION				OFF

ON		MODEM USED  "AT" COMMAND SET.
OFF		MODEM USES SERIES II COMMAND SET.

---------------------------------------------------------------------

SW5-1	SW5-2	SW5-3	ASYNC DATA FORMAT	      OFF  OFF  OFF

OFF	OFF	OFF	8 DATA BITS, NO PARITY
ON	OFF	OFF	8 DATA BITS, ODD PARITY
OFF	ON	OFF	8 DATA BITS, EVEN PARITY
ON	ON	OFF	7 DATA BITS, NO PARITY
ON	OFF	ON	7 DATA BITS, MARK PARITY
ON	OFF	ON	7 DATA BITS, SPACE PARITY
OFF	ON	ON	7 DATA BITS, ODD PARITY
ON	ON	ON	7 DATA BITS, EVEN PARITY

----------------------------------------------------------------------

SW5-4	SW5-5	SW5-6	DATA TRANSMISSION MODE	     OFF  OFF   OFF

OFF	OFF	OFF	BUFFERED DATA TRANSMIT MODE
ON	OFF	OFF	DIRECT DATA TRANSMIT MODE
OFF	ON	OFF	AUTOMATIC PROTECTED DATA TRANSMIT MODE
ON	ON	OFF	PROTECTED ONLY DATA TRANSMIT MODE
OFF	OFF	ON	NOT USED
ON	OFF	ON	NOT USED
OFF	ON	ON	NOT USED
ON	ON	ON	NOT USED

-----------------------------------------------------------------------

SW5-7	SW5-8	SYNC OPERATION TIMING SOURCE		OFF	OFF

OFF	OFF	INTERNAL TRANSMITTER TIMING
ON	OFF	EXTERNAL TRANSMITTER TIMING
OFF	ON	LOOPBACK TRANSMITTER TIMING
ON	ON	NOT USED.

------------------------------------------------------------------------

SW6-1		POSITIVE TEST VOLTAGE, PIN 9			OFF

ON		ENABLES POSITIVE TEST VOLTAGE ON DTE PORT PIN 9
OFF		DISABLE POSITIVE TEST VOLTAGE ON DTE PORT PIN 9

------------------------------------------------------------------------

SW6-2		NEGATIVE TEST VOLTAGE , PIN 10			OFF

ON		ENABLES NEGATIVE TEST VOLTAGE ON DTE PORT PIN 10
OFF		DISABLES NEGATIVE TEST VOLTAGE ON DTE PORT PIN 10

------------------------------------------------------------------------

SW6-3		NOT USED					OFF
SW6-4		NOT USET					OFF

-----------------------------------------------------------------------

INSTALLATION:

CHECK TO MAKE SURE ALL THE DIP SWITCHES ARE SET CORRECTELY. VERIFY
THE MODEM YOU ARE INSTALLING IS THE TYMNET VERSION TRI-ROCK (THE
FIRMWARE  CHIP SHOULD HAVE "TRIROCK REV 2.24" ON IT AT LOACTION U-11).
INSTALL THE MODEM(S) AND CONNECT THE ASYNC AND VF CABLE(S).

IF THIS IS AN ISIS CONSAT SLOT WITH OUTDIAL CODE, YOU WILL NEED TO HALT 
AND RESTART THE SLOT SO THE NEW MODEMS WILL REPORT UP FOR OUTDIAL USE.
USING THE MODEM RACK CHECK THAT EACH PORT HAS DTR BY SELECTING EACH
CHANNEL AND CHECKING THE LED'S . A FLASHING CHANNEL LED INDICATES THE
MODEM WILL NEED TO BE RESET . IN THIS CASE YOU WILL RESET THE TRI-ROCK
MODEM USING A ASYNC TERMINAL CONNECTED TO THE RS-232 PORT OF THE MODEM.

TO OPTION OR RESET THE TRI-ROCK MODEM USE THIS PROCEDURE :

	1) CONNECT A ASYNC TERMINAL TO THE RS-232 PORT OF THE TRI-ROCK
	   MODEM AND SET YOUR  ASYNC TERMINAL SPEED TO 300,1200 OR 2400 BAUD
	   8 AND NONE(BIT FORMAT).
	   (IF POSSIBLE SET YOUR TERMINAL SPEED TO 2400 BAUD)
	
	2) PRESS " RETURN " TWICE TO WAKE UP THE MODEM.

	3) AT THE  "CDS>"  PROMPT TYPE  "RESET"  THE MODEM WILL TELL YOU
	   "ARE YOU SURE ? [ Y OR N ]" (THIS READS ALL THE TYMNET
	   DEFAULT SOFT STRAPS INTO THE MODEM MEMORY).

	4) TYPE  "Y" AND " RETURN ". (THIS WILL READ ALL THE TYMNET
	   DEFAULT SOFT-STRAPS INTO THE MODEM MEMORY.)

	5) PRESS " RETURN " TWICE. YOU SHOULD GET THE  "CDS>"  PROMPT.

	6) M N P  ERROR CORRECTION SETUP.
	 **NOTE** ONLY SET THE "SMD7"(MNP MODE) IF THE PROJECT
	   CALLS FOR IT. TO HARD STRAP AUTO MNP TURN SWITCH SW5-5 (ON).
	   SET THE HARD STRAP !!!!!!!!!
	   ****IN MOST CASES YOU CAN SKIP THIS STEP AND GO TO STEP  8 .

	*  AT THE "CDS>" PROMPT TYPE "SMD 7" AND "RETURN"
	*  AT THE "CDS>" PROMPT TYEP "SRP MDCTYMNET" AND "RETURN"
	*  AT THE "CDS>" PROMPT TYPE "SAVE" AND "RETURN"
	*  AT THE "CDS>" PROMPT TYPE "INIT" AND "RETURN"

	7) HIT  "RETURN" TWICE TO WAKE UP THE MODEM AGAIN.

        8) TYPE "RSF" AND RETURN, THIS WILL READ OUT ALL THE SOFT STRAPS

	9) TYPE "RSF" AND RETURN, THIS WILL READ OUT ALL THE SOFT STRAPS
	   IN THE TRI-ROCK MODEM.  CHECK THE SOFT-OPTIONS AGAINST THE
	   SOFT-OPTIONS AT THE TOP OF THIS CFB. 
	    
	>>>NOTE<<< THE SMD PARAMETER WILL SHOW "0" NOT "7" THIS IS
	NORMAL.THE MODEM WILL CHANGE THIS VALUE IF A MNP CALL IS VALID.

	10) TYPE  "E" FOR EXIT , MODEM WILL TELL YOU "BYE".
	
	11) HOOK YOUR ENGINE ASYNC CABLE BACK UP TO THE MODEM.

	12) IF THERE IS STILL ANY PROBLEMS WITH THE MODEM RETURN
	    IT FOR REPAIR.

	13) TEST THE TRI-ROCK MODEM AT THE DIFFERENT SPEEDS AND IF
	    THERE IS OUTDIAL TEST IT TOO.

**************************************************************************

IF THE TRIROCK IS TO BE USED FOR A LOW SPEED ROTARY (300 AND 1200 BAUD)
YOU WILL NEED TO SET THE MODEM UP TO ANSWER AT 1200 AND 300 ONLY .
DO THE FOLLOWING:

	1) TURN  SW2-1 AND SW2-2 TO "ON". 1200bps ,fallback to 300bps.

ANY QUESTIONS PLEASE CALL OR ONTYME:
AUGUST CATTANEO (408) 922-7466 , NTS
QSATS.A/CATTANEO

     