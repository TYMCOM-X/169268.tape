





                            1.2  End-to-end Control Signals


             ALL other signals are passed through the network circuit,  but are
        serviced (take effect) only at the opposite end of the circuit.





                    1.2.1  Echo-Control Control Signals

             A  class  of signals  is  used to  implement  Echo-control.  These
        permit the echoing of characters from either the terminal-interface, or
        from the host.


           EDEM:  (Entering_Defered_Echo_Mode)  report.   Originates  ONLY from
               the Caller.

           LDEM:  (Leaving_Defered_Echo_Mode) report.  Originates ONLY from the
               Caller.


             Additional signals  are used primarily  for echo control,  but may
        also  be used  for  other functions.   In particular,  they  permit the
        terminal  interface  to  detect the  host  program  state  "waiting for
        input".


           GREEN_BALL:  These are initiated only at Callers (TYMSATS),  and are
               held by the callee (host) until released again to return  to the
               TYMSAT.  The  receipt of  a Green_ball  by the  TYMSAT signifies


        3                      TYMNET Circuit Protocols             CIRCUIT.DOC
        TYMNET Signals                                         February 4, 1986


               that the host is  dismissed, waiting for input.   The Green_ball
               may   be  used   by  the   TYMSAT  to   decide  when   to  leave
               Defered_echo_mode on some terminals, and to decide when  to turn
               other  (half-duplex)  terminals  around.   A  green_ball  may be
               destroyed if a red_ball catches it;  especially if  this happens
               while the green_ball  is resident at  the host, waiting  for the
               appropriate host condition (waiting for input) to occur.

           RED_BALL:  These are used to "cancel" Green_balls.  In particular, a
               red_ball which catches a green_ball causes it to  disappear, and
               the red_ball  then propagates  around the  circuit, immediately.
               These are initiated only at  Callers (TYMSATS).  This  signal is
               sent by the TYMSAT whenever a Red- or Green_ball  is outstanding
               and:

               1.  A character is received from the terminal;  or

               2.  If  an  excessive  amount  of  time  has  passed  since  the
                  Green_ball has been transmitted, and is feared lost;  or

               3.  If an excessive amount  of time has passed since  a Red_ball
                  has been transmitted, and is feared lost.





                    1.2.2  Command- and Information-signals

             An  additional  set  of  signals  is  used  to   transfer  control
        information.


           HANG_CHARACTER:  Causes  the  TYMSAT  port  to  be  hung  up (forced
               disconnect).  Originated ONLY by host.

           TURNAROUND_HANG_CHARACTER:  Causes the TYMSAT port to be hung  if it
               is connected to a  true half-duplex device.  (This  is necessary
               since, if the port is in input mode from an unattended terminal,
               there is  no way  that the  normal HANG  signal can  be serviced
               until the terminal  turns around, and the  port will be  tied up
               for an extended period.)  Originated ONLY by host.

           ENTER_TRANSPARENCY_MODE:  (GLASS_BALL):  Used  for  those  terminals
               which have  character sets which  are translated by  the TYMSAT.
               Originated ONLY by host.

           LEAVE_TRANSPARENCY_MODE:  This  function  is  also  effected  if the
               TYMSAT receives a ZAPPER.

           ENTER_ALTERNATE_OUTPUT_DEVICE_MODE:  Used   to   switch   output  on
               special  devices  or  ports.   Also  enables  the  expansion  of


        4                      TYMNET Circuit Protocols             CIRCUIT.DOC
   