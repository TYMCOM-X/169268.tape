

CFB NO.:  156                                        DATE:  JANUARY  8, 1988  

REV LEVEL:  3                                DATE CHANGED:  MARCH 24, 1988    

TYPE:  HARDWARE
HARDWARE:  CONCORD 296
SUBJECT:  CONCORD 296 DIAL-UP ASYNC MODEM STRAPPING.


	CONCORD 296 V.32 MODEM STRAPPING GUIDE

   The Concord 296 modem is capable of communication either asynchronously
or synchronously over Leased or Dial-up phone lines. There are three types
of Concord modems which you may find in the field, to identify the Concord
296 look for "296 Trellis" on the front panel.


STRAPPING FOR ASYNC DIAL-UP ANSWER MODE

   At the back of the modem you will find 8 postion dip switch located
to the right of the power switch. Up is OFF and Down is ON for this switch.
The switch is labeled A and should be set as follows:


	SWA-1   OFF	Positions 1 & 2 set the DTE port baud
        SWA-2   ON 	rate to 9600bps
        SWA-3   OFF	2 wire Dial-up
     	SWA-4 	OFF	Command Mode enabled
	SWA-5	ON	DCD, DSR, & CTS follow modem, Hang-up on falling DTR
	SWA-6	OFF	Enables Front Panel Switches
	SWA-7	OFF	Write Protect Disabled
	SWA-8	OFF	Enables Concord Data CMD Set

   A four position switch labled B which is to the left of the DTE connector
is set as follows:

        SWB-1   OFF	Disables positive test voltage on pin 9 of the DTE
			connector.
	SWB-2 	OFF	Disables negative test voltage on pin 10 of the DTE
			connector.
	SWB-3	OFF	Data signaling rate selector, DTE is source.
	SWB-4	OFF	DTE can busy modem with a +5 volts on pin 25.


   A two position switch labled C selects 2 or 4 wire line and the type
of termination. Set position 1 for 2 wire dial-up and position 2 for the
type of data jack installed on the line.


   After setting the dip switches connect a 9600 baud terminal to the DTE
port to program the software straps. With the modem powered up press the
return key on your terminal. You should have the see the "CDS >" prompt
displayed on your terminal. Type RESET and the modem will ask "ARE YOU
SURE ? [Y OR N]. Type a Y to this prompt. This will reset the modem to the
factory default settings.

   Now enter the command RSF at the CDS > prompt. RSF is short for Review
Setting - Full list. The following display should appear on your screen:


        CONCORD DATA SYSTEMS 296 -  REV 1.00



        BLK :256        SLCD:1          SRM :0
        RLB :1          SLCF:1          SRT :0
        SAS :0          SLT :1          SSD :1
        SBA :0          SMB :9600       SST :0
        SBK :0          SMC :0          STA :005
        SBL :0          SMD :2          STB :007
        SCC :0          SMF :1          STC :060
        SCM :0          SMP :0          STD :000
        SCP :1          SMT :0          STE :025
        SDL :0          SPB :9600       STH :1
        SDM :1          SPD :5          STI :030
        SE  :001        SPE :0          STR :000
        SFP :0          SPF :0          STW :004
        SLCA:0          SRD :1          STX :000
        SLCB:1          SRG :002        SXD :010
        SLCC:1          SRI :0          SXL :004
CDS >

   After the full display you should have another CDS > prompt. Enter the
following commands at the prompt terminating each command with a carriage
return.

   SMF0
   SLT0
   SPF1	
   STI0
   SRP MDCTYMNET
   SRM2  -------> only if you are connecting the modem to a Tymnet engine.
   SAVE

   The SMF0 command disables modem flow control because the Tymnet equipment
provides flow control. The SLT0 command disables lead testing. The SPF1
command sets DTE flow control to unilateral allowing XON/XOFF characters
to be sent through to the host.

*** If this option is NOT set any XON/XOFF sent to the modem from the DTE is
NOT passed to the remote end/host.

The STI0 command sets disables the inactivity timer. The SRP command sets
the remote configuration password to an uppercase MDCTYMNET. The SRM2 command
disables modem connecting messages at the beginning of a session from being
sent to the Consat port. After you have entered the SRM2 command you will
not see the CDS> prompt anymore. Type the SAVE command and the configuration
will be saved.

   After making these changes enter another RSF comand to verify the
changes were made. The display should now look like the following:

        CONCORD DATA SYSTEMS 296 -  REV 1.00



        BLK :256        SLCD:1          SRM :2
        RLB :1          SLCF:1          SRT :0
        SAS :0          SLT :0          SSD :1
        SBA :0          SMB :9600       SST :0
        SBK :0          SMC :0          STA :005
        SBL :0          SMD :2          STB :007
        SCC :0          SMF :0          STC :060
        SCM :0          SMP :0          STD :000
        SCP :1          SMT :0          STE :025
        SDL :0          SPB :9600       STH :1
        SDM :1          SPD :5          STI :000
        SE  :001        SPE :0          STR :000
        SFP :0          SPF :1          STW :004
        SLCA:0          SRD :1          STX :000
        SLCB:1          SRG :002        SXD :010
        SLCC:1          SRI :0          SXL :004
CDS >

   You are now finished strapping the modem. Connect the engine's SIO ASYNC
port to the DTE port on the modem. Be sure the baud rate of the SIO port is
set for 9600. Connect the dial-up phone line to the DIAL jack on the back of
the modem and power on the modem if it is not already.

   One last option to be set after all modem parameters are set is to disable
the command mode for the modem. This is set by setting SWA-4 to ON. This stops
the modem from entering the command mode if the host were to send 3 control A
in a row. If you are connecting the modem to a PC for outdialing DO NOT enable
this switch.

   If you you would like to use a 296 mode to test the other 296 modems you
are installing perform the following.

   At the CDS > prompt enter WP/1 XXX XXXX Where XXX XXXX is the pilot number
you want to call. This command programs the first dialer memory location.
Then enter D/1 followed by a return. The modem will dial the number in
dialer memory location 1. To check if the a number is programmed into location
1 enter the command RP.

   Or you can enter D XXX XXXX where XXX XXXX is the number you want to call.

   If a ? is typed at the CDS > prompt then a list of all the commands will be
displayed on your terminal.


