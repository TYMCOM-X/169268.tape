


    9600 and 4800 baud Sync mode using a 4-wire or 2-wire Leased Line
    =================================================================

			With Manual Dial Back-up
			========================

1) Turn the modem OFF . Set the Rear panel switches to the following
   settings:
	SWA-2  ON	(9600 baud)
	-or-
	SWA-2 and 3 ON	(4800 baud)

	SWB-3  ON       (2-wire leased line)
	SWB-3  OFF      (four-wire leased line)

	SWB-1  ON  (RS-232 signal follow DCD on connect)
	SWB-4  ON  (OFF if customer is using RJ45 type Jack)

2) Power up the modem.
   RESET the modem via the front panel by pressing the LEASED and
   the LOOP 2 button at the same time for more than 2 seconds.
   Hook a terminal to the RS-232 . Wake up the modem with two
   carriage returns. At the Modem prompt type  RESET. When the modem
   responds with "are you sure?" type "Y" and return. To check the 
   modem for REV 5.0 code type RSF at the MODEM> prompt.

   Enter the following softstraps at the MODEM> prompt:

	 SPB4800  (This sets the port speed to 4800 when SWA 2 and 3 is
		   set for 4800. Once you set this strap you must set your
		   Terminal speed to 4800 baud)

	 SLCD0
	 STI000
	 SXLP000	
	 SAVE
	 INIT

	If a tail circuit is needed both modems will be set to the 
	following setting:

	 SST3  ORIGINATE MODEM
	      (EXTERNAL TIMING CLOCKS ON PINS 15 AND 17 BECOME IDENTICAL
	       TO THE CLOCK ON PIN 24 FROM THE DCE OR DTE THEREFORE PIN 24
	       MUST BE IN THE CABLE FROM DCE OR DTE DEVICE.)

	 SST2 (RECEIVER TIMING OR LOOPBACK TIMING ON THE ANSWER SIDE 
	       MODEM)
	
   If dial back-up is being used enter the phone number into modem memory
   01.	
	 WP1/Wnnnnnnnn
	  RP  (read phone list to verify)


   SLCD0 will ignore DTR and keep the modem from dropping the line.
   STI000 will disable the modem's inactivity timer. If you do not do this
   the modem will drop the line every thirty minutes and retrain.

3) Turn the modem OFF set switch SWA-8 ON, Turn the modem back ON,
   the modem should come up in the SYNC mode. Turn on the LEASED 
   If the modem is the originate modem make sure the ORIG LED is
   ON also, press the LOOP 2 button for at least 2 seconds to save the
   front panel confuguration.

   (NOTE) Check the cable at the modem end for DTR (PIN 20). If this
          pin is not + or - remove the pin from the cable at the modem
          connection.

4) Tymnet will be Answer and the Customer will be Originate.
	
6) To initiate a retrain press the # switch one time only.


