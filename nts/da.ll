


ASYNC 4-WIRE LEASED LINE CONFIGURATION DIALACCESS 296 (GREY BOX ONLY)
---------------------------------------------------------------------
	            Rev level 4.0 and below
		    =======================

Set the following switches on the DIALACCESS 296 modem before you power
the modem ON.

		TYMNET			CUSTOMER
		------			--------
		SWA#2 ON		SWA#2 ON
		SWB#1 ON		SWB#1 ON

		
BOTH DIALACCESS 296 AND THE 296 TRELLIS MODEMS WILL HAVE THE SAME SOFT
STRAPS LISTED BELOW.


   After setting the dip switches connect a 9600 baud terminal to the
DTE port to program the softstraps. With the modem powered up press the
return key twice. At the CDS> prompt type RESET <cr>. The modem will ask
you "ARE YOU SURE ? [Y or N]" type YES<cr>.
  At the CDS> prompt enter the following softstraps terminating each
command with a <cr>.


		TYMNET			CUSTOMER
		------			--------
		SLCD4			SLCD4
		SBK3			SBK3
		SPF1			SPF1
		SMF0			SMF0
		SMD3			SMD3
		SXLP0			SXLP0
		STI0			STI0
		SDL2			SDL1
					SAVE
		SAVE			INIT
		INIT			

		
FOR THE TYMNET SITE YOU WILL SET THE RESPONSE MODE TO OFF TO DO
THIS YOU ENTER AT THE CDS> PROMPT SRM2<cr>. YOU WILL NOT SEE ANY
ECHO AFTER YOU TYPE THIS COMMAND. YOU WILL THEN TYPE SAVE<cr>,
INIT<cr>. REMEMBER YOU WILL NOT SEE YOUR ECHO . TO CHECK YOUR
SRM STRAP TYPE RSF<cr> AND CHECK THE LIST.

SRM WILL REMAIN  ON AT THE CUSTOMER SITE. (SRM0)


Tymnet SIO cable will need to be modified at the Tymnet side to the
following pin out:

To Tymnet Engine SIO<---- 5|
		          6|----->5 modem port
		          8|	

	Pins 5,6 and 8 are tied together going to the Tymnet Engine, pin
	5 is sent throught to pin 5 on the modem. Remove pins 6 and 8
        on the modem side of the cable.

 