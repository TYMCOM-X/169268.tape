

CFB NO.:  184                                        DATE:  JUNE 19, 1990     

REV LEVEL:  1                                DATE CHANGED:  JUNE 21, 1990     

TYPE:  HARDWARE
HARDWARE:  PARADYNE 3440-A
SUBJECT:  PARADYNE 3440 SYNC SOFT-STRAP SETTINGS FOR POINT-TO-POINT



                   PARADYNE 3440 BACK CONNECTIONS

   Looking on the back of the Paradyne 34xx modem you will find space for
three modules. The bottom module has two RS-232 female connectors, one marked
ANALYSIS, and one marked DTE/PORT 1, a jack for connecting the Eye pattern
generator to O-scope, one LED, a 5 position switch pack marked S1,
and Leased Line modular connector, marked LL.

	{The next two modules are not currently availlable for this modem}

   Module Two (the middle Module), is the optional DCAA/ACAA unit. This
module has one LED, a two position switch pack marked S6,  modular
jacks marked MODEM, LL, PH-RX, (RX-DIAL-TX), and PH-TX.

   Module three (top module) Mux board.

                      LEASED LINE CONNECTION

Plug the 3002 line (Leased Line) in the second module (bottom module)
marked LL useing the supplied 4-wire modular cable.


           SYNC/SIO TYMNET ENGINE/CUSTOMER  CONNECTION

Plug the Tymnet or Customer SYNC/SIO connection into the bottom module marked
DTE/Port 1.


                        3440 POWER UP

   The modem performs a comprehensive test sequence that verifies operating
functions upon power-on. If a failure is detected, an error message is dis-
played on the Diagnostic Control Panel (DCP)

   The DCP operations are divided into functional areas. The primary
functional areas are Local, Remote, Configure, Scan, and Install.
The Local mode allows complete setup, reconfiguration, and testing of the
local modem. Operation in the Remote mode is essentially the same as it is
in Local mode except it provides the means for the operator of a modem
stapped as Master to access the control panel functions of any of the
remote modems. This function is available without the need for a central-
site ANALYSIS system.

   The DCP keypad consists of eight pushbutton switches which you will use
to access and move through the Diagnostic Control Panel (DCP) Menu.

* Use the UP arrow to move up one level in the menu.
* Use the double UP arrow to exit any part of the menu in which you may
  be operating.
* Use the FUNCTION keys to make selection from the choices presented on the
  second line of the display. (F1, F2, F3, F4)
* The SCROLL keys (left and right arrows) have different functions depending
  upon the operation you are performing within the DCP Menu. Only four
  can be displayed in the second-line  windows above the function keys.
  When there are more than four choices, you must move the windows to display
  the additional choices. The small green LED beneath the arrow lights to
  indicate that there are additional choices off the display and the
  arrow indicates the direction of the window movement.


   SETTING THE SOFT-STRAPS FROM THE DCP (DIAGNOSTIC CONTROL PANEL)

   Power up the 34xx modem. The modem must Pass Self Test. The DCP
should display 19200 LED=PRT01. Press the Up arrow and the Double Up arrow
at the same time to get to the security levels. Select level number four (4).
Below this display should be six options, only four showing associated to
a function key. Use the Right arrow (Scroll key) to get to the last two
options.


THE CUSTOMER IS THE MASTER MODEM OR CONTROL MODEM WHEN USING THE MODEMS
DIAL BACK-UP CONFIGURATION.

A 3400 series reference card should be included with the modem breaking
down the DCP functions and it might be easier to follow.

   Depending which modem you are strapping, Master or Slave, do the
following:

Select  LOCAL, the next selection menu will appear.
PUSH THE RIGHT ARROW until the STRAP mode appears.
Select  STRAP, the next selection will appear.
Select  ACTIV, the next selection will appear.
Select  EDIT,  the next selection will appear.
>>>>This brings you to the Three areas of the modem you need to option<<<<

EDIT FUNCTIONS
MODEM  DMC
F1      F2

Select  MODEM;

The first "S1" modem strap will apear. Enter the softstrap for Master or
Slave. Information on straps at bottom of this CFB they are broken down
in two sections  Modem, and DMC.

Press the appropriate strap selection and the push the F1=NEXT.
When done with all the options press the single UP ARROW to get back to the
edit functions.

Select the DMC and set all the DMC options.When done with all the options,
press UP ARROW to return to the EDIT function menu and then push UP ARROW
again to return to CHOOSE FUNCTIONS and then push F2(SAVE) and push F1(ACTIV).
Push the Double Arrow to return to the Main Display and push F3(CONFIG). Set
the master modem to scan by strapping the Master Drop to IN by selecting Drop
1 MASTER 0001 to In. Then set the Slave to scan by selecting Drop 2 SLAVE 0002
to IN. Then double arrow out to the main menu.

  After the modem has been softstrapped and tested, go to the first DCP
window and select SCAN on the Master modem. Select Update. An alarm
will sound until the Master modem has checked all the options at both
ends. When the Alarm  goes out the Master modem should indicate
Drop OK on the DCP  LED.

	Paradyne Model# 3440 Network Diagnostics Modem Strapping.
	--------------------------------------------------------

Modem A: "Master"
-----------------

	Modem					   DMC
	-----					   ---

S1: Tx Level (dBm):	-00			S1: DMC Address: 	0001

S2: TX Clock Source:	Int			S2: Mastr/Slave:	Mastr

S3: Lease Energy Det:	-26			S3: Ext Control A:	Dis-L

S4: Train On Data:	Disab			S4: Ext Control B:	Dis-L

S5: Rx Remote DL:	Enab			S5: Ext Alarm A:	Disab

S6: CT140 Remote DL:	Enab			S6: Ext Alarm B:	Disab

S7: Bilateral DL:	Enab			S7: HotSb:		Disab

S8: Bilateral AL:	Enab			S8: HotSb State:	Prim

S9: 2 Sec LSD Hold:	Enab			S9: Audible Alarm:	Pulse

S10: LSD Clamps Rxc:	Enab			S10: Ctl Ch VF CRC:	Disab

S11: RTS Control:	FrcOn			S11: Ctl Ch DTE CRC:	Disab

S12: CTS Control:	Norml			S12: Prim Cntrl Chan:	1200

S13: LSD Control:	FrcOn			S13: Cntrl Channel:	Enab

S14: DTR Control:	FrcOn			S14: Sec Carrier:	Const

S15: DSR-Tst/Dcaa:	Norml			S15: SRTS/SCTS In-Ms:	100

S16: DTE Pin 18:	Disab			S16: SRTS/SCTS Out-Ms:	100

S17: DTE Pin 23:	Disab			S17: Line Config:	Pt-Pt

S18: Carrier Select:	Const

S19: Const Car Del(ms):  0

S20: AL Latch SQ:	Disab

S21: VF Loop Enab:	Enab

S22: VF Loop Gain(dB):	12

S23: Antistreaming:	Disab

S29: MDM Application:	V.29

S30: RP Remote Addr:	00

S32: Tx Rate Select:	9600

S33: CT111 Fallbk Rt:	7200

S34: Tx Preemphasis:	Disab

S35: Retrain Enable?:	Yes

S38: Carrier Freq:	1800


Modem B: "Slave"
----------------

	Modem					   DMC
	-----					   ---

S1: Tx Level (dBm):	-00			S1: DMC Address: 	0002

S2: TX Clock Source:	Rxc			S2: Mastr/Slave:	Slave

S3: Lease Energy Det:	-26			S3: Ext Control A:	Dis-L

S4: Train On Data:	Disab			S4: Ext Control B:	Dis-L

S5: Rx Remote DL:	Enab			S5: Ext Alarm A:	Disab

S6: CT140 Remote DL:	Enab			S6: Ext Alarm B:	Disab

S7: Bilateral DL:	Enab			S7: HotSb:		Disab

S8: Bilateral AL:	Enab			S8: HotSb State:	Prim

S9: 2 Sec LSD Hold:	Enab			S9: Audible Alarm:	Pulse

S10: LSD Clamps Rxc:	Enab			S10: Ctl Ch VF CRC:	Disab

S11: RTS Control:	FrcOn			S11: Ctl Ch DTE CRC:	Disab

S12: CTS Control:	Norml			S12: Prim Cntrl Chan:	1200

S13: LSD Control:	FrcOn			S13: Cntrl Channel:	Enab

S14: DTR Control:	FrcOn			S14: Sec Carrier:	Const

S15: DSR-Tst/Dcaa:	Norml			S15: SRTS/SCTS In-Ms:	100

S16: DTE Pin 18:	Disab			S16: SRTS/SCTS Out-Ms:	100

S17: DTE Pin 23:	Disab			S17: Line Config:	Pt-Pt

S18: Carrier Select:	Const

S19: Const Car Del(ms):	0

S20: AL Latch SQ:	Disab

S21: VF Loop Enab:	Enab

S22: VF Loop Gain(dB):	12

S23: Antistreaming:	Disab

S29: MDM Application:	V.29

S30: RP Remote Addr:	00

S32: Tx Rate Select:	9600

S33: CT111 Fallbk Rt:	7200

S34: Tx Preemphasis:	Disab

S35: Retrain Enable?:	Yes

S36: RP 20 ms Pad:	Na

S37: RP Remote Train:	Na

S38: Carrier Freq:	1800

S40: Central Rate:	Disab
  