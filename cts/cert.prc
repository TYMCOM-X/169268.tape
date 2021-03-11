
        UTILIZING THE TESTING PROGRAM                            March 16, 1987






                          4 -  UTILIZING THE TESTING PROGRAM


        Now that you  have your terminal/software configured  appropriatly, you
        are ready to log into the CMT Testing Program:

        1)  At "please log in:", type:    (^R)  followed by logon to your CMT
            test slot.

            >A list of valid terminal types will appear.  (Note: If test slot
             is set-up for 1 terminal type, this list will not appear and the 
             next step is not necessary.)

        2)  Choose your terminal type by entering the corresponding #, and 
            press ENTER.

            >A welcome banner appears with a list of destinations.  (Note: If
             test slot is set-up for 1 terminal type, this list will not appear
             and the next step is not necessary.)

        3)  When screen appears, position cursor in front of desired destina-
            tion and press ENTER. 

            >MDC Logon Screen appears.

        4)  Logon to test system:         LOGON HQQA006/CMTI (or)
                                          LOGON HQQA007/ORACLE

            !!only one person can be logged into each username!! If you get
              hung or dropped during a session, it will take approximately
              20 minutes for your session to time itself out and allow you to
              log back in with that username.
         
              The passwords (CMTI) (ORACLE) will frequently expire and the
              system will ask you to input a new password.  Simply retype
              (CMTI) or (ORACLE) so as not to change them.

        5)  Logon in progress messages will appear.  Your cursor will come to 
            rest after (***).  Press ENTER here, to go to next screen.

            >ISPF/PDF PRIMARY OPTION MENU appears.

        6)  Select option #6, for 'Key Sequence' test and 'Editing' test.

            >"ENTER TSO COMAND:" message appears.

        7)  Enter:  TDEV <ENTER>
                    ----
            >"V6  ENTER NEXT TASK CODE:" message appears.

                                           7
        UTILIZING THE TESTING PROGRAM                            March 16, 1987



        8)  Enter:  SIGNON HQ1       or         SIGNON HQ2
                    ----------                  ----------
            >"IDMS XXXXXXXX V6 ENTER PASSWORD" message appears.

        9)  Enter:  TEST1 for HQ1 signon   or   TEST2 for HQ2 signon
                    -----                       -----
            >"IDMS XXXXXXXX V6 DICTNAME HAS BEEN SET" message.
            >"V6  ENTER NEXT TASK CODE:"

        10) Enter:  HQS
                    ---
            >!!HQQA TERMINAL TEST SYSTEM MAIN MENU!!









































                                           8
        KEY SEQUENCE TEST SCREEN                                 March 16, 1987






                             5 -  KEY SEQUENCE TEST SCREEN

        1)  Choose option #1, from HQQA Terminal Test System Main Menu.
                          --
            You will see the "KEY SEQUENCE TEST" screen.  This screen consists
            of 24 (PF KEY) options, 2 (PA KEY) options, and a test option for 
            (ENTER).  [PA3 will be tested elsewhere (sec 7.3)]

        2)  Refer to PUB doc for new terminal development or see (TECHREF:56)
            CMTERM.ERS and turn to the terminal section that applies to the 
            type of terminal you are emulating.  (It may be possible that your
            terminal type is not represented in this manual at this time.  
            At this point, you may call Q.A. for the necessary information.)

            Refer to the 'function' key assignments, within your terminal's
            section of this manual.  This will provide you with the sequences
            you will need to test.  The checklist, section 10, should also be 
            filled out during this test.

            As you test each (PF) and (PA) key, you will see a notation of
            confirmation appear under the "Enter Clear Screen Seq." msg.
            Note also, that the counter after the key sequence increases by
            '01'.  You may hear a 'beep' noise, after entering a key sequence.
            This is indication that the sequence was an 'invalid' sequence.

        3)  Clear Screen Sequence will return you to "HQQA TERMINAL TEST SYSTEM
            MAIN MENU", as well as provide you with a means to test the CLEAR 
            KEY SEQUENCE.  See page 12 for instructions on how to back-out of
            this menu, or go on to the following section for "EDIT FUNCTION
            TEST SCREEN".




















                                           9
        EDIT FUNCTION TEST SCREEN                                March 16, 1987






                            6 -  EDIT FUNCTION TEST SCREEN

        1)  Choose option #2, from HQQA Terminal Test System Main Menu.
                          --
            You will see the "EDIT FUNCTION TEST" screen.  

        2)  Refer to terminal PUB document or (TECHREF:56)CMTERM.ERS and turn 
            to the terminal section that applies to the type of terminal you 
            are emulating.  (It may be possible that your terminal type is not
            represented in this manual at this time.  At this point, you may 
            call Q.A. for the necessary information.)

            Refer to the 'edit' key assignments, within your terminal's section
            of this manual.  This will provide you with the sequences you will
            need to test.  The checklist, section 11, should also be filled out
            during this test.
              
        3)  You are now ready to test your edit functions.  Make certain that:

               1) the 'numeric' field does not accept 'alpha' characters
               2) the 'non-display' field does not display. (This field is the
                  second of three fields, indicated by an arrow, just below the
                  middle of the screen.)
               3) no 'scroll' on last line

            Go ahead and test the CURSEL feature (it has to do with the Light-
            Pen Detector, that some terminals provide).  You need to test this 
            command to make sure it doesn't hamper your session.

            Don't Test the "KILL" function here; it terminates your session!  
            Wait until you are at the end of your session to do this.

            Test all sequences for the following functions, here.
            CURSOR UP, BACKSPACE, ETC.

        4)  You may also test the Status Line sequences here. . .

             Your Status Line chart looks something like this:

             [A]       1   CR\
             [A]       2   CR \     puts the status line on a designated
                       .       \    line (should write over top of any
                       .        \   print that appears on that line)
                       .        /
             [A]      23   CR  /
             [A]      24   CR /
             [A]       D   CR \     puts status line on its default line
             [A]       d   CR /
             [A]       U   CR -     puts status line in the upper right corner

                                          10
        EDIT FUNCTION TEST SCREEN                                March 16, 1987


             [A]       E   CR -     will erase status line from screen

        5)  Clear Screen Sequence will return you to "HQQA TERMINAL TEST SYSTEM
            MAIN MENU". 


















































                                          11
        EDIT FUNCTION TEST SCREEN                                March 16, 1987










        At this point, if you need to backout of the test facility, before
        completing your test, use this procedure:
        -----------------------------------------------------------------------

        1)  Clear Screen Sequence will, now, back you out of 'TERMINAL TEST
            MENU'.

        1a) "V6  ENTER NEXT TASK CODE:" message . . . Type "BYE" <ENTER>
                                                             ---
        1b) "ENTER TSO COMMAND:" message . . . Enter Function 3 sequence
                                                     ----------
            >You are back at the ISPF/PDF PRIMARY OPTION MENU

        1c) Enter 'X' to Terminate ISPF Session.
                   -
        1c) You now see a message READY, with your cursor positioned below it.
           
            >ENTER logoff (You will see QCM Job Statistics printed and then you
                   ------  will find yourself back at the MDC LOGON Screen)

        1d) Now is when you need to test your "KILL" function.  This will drop
            you back to the "please log in" prompt.





        See the following section, for instructions on how to check the 
        optimizer, printer, and the "PA3" key.

















                                          12
        PERFORM UTILITY FUNCTIONS                                March 16, 1987






                            7 -  PERFORM UTILITY FUNCTIONS


        See previous  page (steps  1-1b) for backing-out  of the  HQQA TERMINAL
        TEST MENU, and returning to the PRIMARY OPTION MENU.


        From  the  "PRIMARY  OPTION  MENU", we  can  now  check  the optimizer,
        printer, and "PA3" key.







                              7.1  To Check the Optimizer

        1)  Type F1 function key or sequence at the Primary Option Menu.  This 
            takes you to the TUTORIAL "Table of Contents".

        1a) Hit <CR>, to see "topics" presented within this tutorial.  After
            selecting 1 or 2, you will begin paging thru these two topics by 
            by hitting <ENTER> :
         
                        1 - Display formats
                        2 - Commands & PF keys

            As you page thru, notice how the screen cleans itself up and re-
            writes itself.  Make a note, if the screen does not redisplay 
            appropriately.

        1b) Type 'END' and Enter fucntion to get back to the PRIMARY OPTION 
            MENU.






                           7.2  To Test the Printer Function

        1)  You will need your printer address. . .From PRIMARY OPTION MENU,
            type Z.4 <CR>.  At next screen, give the command WHO.  Your 
            terminal ID is displayed in the upper right-hand corner. You will 
            need to replace "D" with "P" and increase that number by 1, to 
            reflect you printer port address.

            i.e. - D5026100 - Terminal ID, will convert to: 

                                          13
        PERFORM UTILITY FUNCTIONS                                March 16, 1987


                   P5026101 - Printer ID

            Type END to go back to PRIMARY OPTION MENU.

        2)  From PRIMARY OPTION MENU, type option #3, for UTILITIES.

        3)  Now, choose option #6 for 'HARDCOPY'

        4)  Put option 'L' at the OPTION prompt, then tab once.

        4a) "DATA SET NAME" is requesting a test file to be printed.  You will
            have two files to test, the first being:

               'HQQA000.MEMO.TEXT(PFKEY)'  {include the aprostophes} - hit tab
               --------------------------                              -------

        4b) Tab down to DATA SET PASSWORD and erase to end-of-line to clear any
            hidden passwords.  Now, tab down to LOCAL PRINTER ID and input the
            correct ID, which you established from step 1.  Now hit return.

            You will see 'request queued' messages and your cursor will rest
            after '***'.  WAIT for your print queue to begin printing.  Once 
            the file is printed, enter <CR>.  At DATA SET NAME option, type 
            your second file name.  (This file will be a little longer.):

               'HQQA000.MEMO.TEXT(QAS)'
               ------------------------

        4c) If your printout does not occur within a reasonable amount of time,
            go back to the OPTION prompt and type 'END'.  At the PRIMARY OPTION
            MENU, type option #6.  At your next prompt, type:

                         ==> Delete DSPRINT.REQUEST.*

            This will clear the print queue.  Its possible that another user
            ordered a printout, but left his terminal before allowing the
            print to occur, thus backing-up all other print requests in the
            queue.  (Each printout must occur in the order it was requested, so
            until someone clears his que, you will be unable to receive yours.)
           
            Hit <CR> after '***', then END plus erase to end-of-line to get
            back to PRIMARY OPTION MENU.












                                          14
        PERFORM UTILITY FUNCTIONS                                March 16, 1987


                                 7.3  To Test PA3 Key

        1)  Start from PRIMARY OPTION MENU.  Perform clear screen sequence.
            Now, your PA3 sequence should bring the screen back.






                 7.4  Exiting the System From the PRIMARY OPTION MENU

        1)  Type option 'X'.

        2)  At "READY" prompt, type LOGOFF.
                                    ------
        3)  JOB STATISTICS will appear on your screen and then you will be back
            at your MDC LOGON SCREEN.

            Perform your 'KILL' sequence here.


































                                          15
        PROCEDURE FOR TESTING BLOCK MODE EMULATION               March 16, 1987






                    8 -  PROCEDURE FOR TESTING BLOCK MODE EMULATION

        1)  At network logon, type:
            > MVSHI;;n<CR>    (MVSHI is a logon to a demo s/w application 
                               program which gives us the ability to 
                               demonstrate most of the 3270 functions)

                     n = 2 for Tymshare 470 terminal
                     n = 3 for IBM 3101 terminal

        2)  If the terminal type selected is an IBM 3101, the 3270 host
            interface will request "SET TO BLOCK MODE AND HIT PF1 KEY",
            however, for the PERKIN ELMER and TYMSHARE 470, the setting of
            block mode and hitting the PF1 must be handled by the emulation
            package.

        3)  For the IBM 3101 emulation package, set to BLOCK MODE and hit the
            PF1 key.  The VTAM banner should appear.  At this point, enter the
            TSO logon:     <<Same as emulation logon; see chapter 4, step #4>>

        4)  If you have any problems during login, abort by typing a plus sign
            (+) <CR>, in response to any prompt.  If a problem occurs which is 
            NOT network or application related, it must be reported to the 
            Third Party Vendor.
                   
        5)  If the emulation has printer support (only applicable for the
            Tymshare 470 and Perkin Elmer), this feature can be tested by
            connecting an ASCII Printer to the PC printer port and the 3270
            host interface must be configured for the terminal to be 
            associated with a printer.  Log into the 3270 host interface with
            the following logon string, at the ""please log in" prompt:

                   MVSHI;;nS<CR>

                          n = terminal type
                           S= (uppercase) After the host recognizes the "S",
                              the printer associated with the terminal can be
                              accessed.












                                          16
        CERTIFICATION OF FILE TRANSFER                           March 16, 1987






                          9 -  CERTIFICATION OF FILE TRANSFER


        Complete testing of a File Transfer software package takes a  couple of
        weeks to do correctly.  The following steps should be followed:

        1.  If host software is involved, it must be loaded on a host you can
            target.

        2.  A CMT slot with the terminal type(s) emulated must be set-up to 
            target this host.

        3.  Each terminal emulation must be verified as compatible with our 
            network.

        4.  File transfer should be done with a short file containing all the 
            keyboard characters, to make sure all characters are uploaded and
            downloaded correctly.

        5.  Different size files should be transferred up and down and checked
            to be sure no characters are lost.

        6.  Transfer up and down with various size files should be timed once 
            you have the transfers working successfully.

        7.  If the package will transfer binary files, as well as, ASCII files,
            steps 5 and 6 should be repeated for binary files.

        8.  Once you are satisfield with your results, please send us a copy
            of the software, so we can run through it for further verification.

        9.  Don't forget to document any peculiarities you find while running
            your test.  This includes such things as differences from standard
            CMTERM.ERS documentation, availability of function keys, etc.  You
            should also include some instructions on how to access the network
            and the setup you used.

        10. You may access a 'sample' file-transfer certifiction document
            under:  (TECHREF:56)FTRANS.CRT .  You'll want to copy this file to
            your own directory and fill in the required information.
           
            Follow standard announcement procedures, outlined in section
            (page 3), of this manual.

            





                                          17
        CHECK LIST #1                                            March 16, 1987






                                  10 -  CHECK LIST #1


        This is  where you will  indicate the sequences  you used and  make any
        applicable comments:

                        Sequence           Does it
        Function          Used              Work?            Comments
        ===================================================================

        ENTER:      ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

        *******************************************************************

        PF1:        ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

        *******************************************************************

        PF2:        ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

        *******************************************************************

        PF3:        ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

        *******************************************************************

        PF4:        ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

                    ________________    YES___ NO___   ____________________

        *******************************************************************

                                          18
        CHECK LIST #1                                            March 16, 1987



        PF5:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF6:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF7:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF8:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF9:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF10:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF11:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________


                                          19
        CHECK LIST #1                                            March 16, 1987


                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF12:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF13:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF14:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF15:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF16:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF17:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF18:       ________________    YES___ NO___   _____________________

                                          20
        CHECK LIST #1                                            March 16, 1987



                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF19:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF20:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF21:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF22:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF23:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PF24:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________


                                          21
        CHECK LIST #1                                            March 16, 1987


        ********************************************************************

        PA1:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PA2:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        PA3:        ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        CLEAR:      ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************





















                                          22
        CHECK LIST #2                                            March 16, 1987






                                  11 -  CHECK LIST #2


        Test the following Function Keys and list what sequences were used.
         
                        Sequence           Does it
        Function          Used              Work?            Comments
        ====================================================================

        DELETE  
        CHARACTER:  ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        FIELD TAB:  ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        BACK TAB:   ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        HOME 
        CURSOR:     ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        NEW LINE:   ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________


                                          23
        CHECK LIST #2                                            March 16, 1987


        ********************************************************************

        INSERT
        MODE:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        ERASE TO
        END OF      
        FIELD:      ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        CURSOR
        LEFT:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        CURSOR 
        RIGHT:      ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        CURSOR 
        DOWN:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        CURSOR
        UP:         ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________


                                          24
        CHECK LIST #2                                            March 16, 1987


                    ________________    YES___ NO___   _____________________

        ********************************************************************

        RESET:      ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        REDISPLAY:  ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        CURSOR
        SELECT:     ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________
                   
                    ________________    YES___ NO___   _____________________

        ********************************************************************

        STATUS
        LINE:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        KILL:       ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

                    ________________    YES___ NO___   _____________________

        ********************************************************************

        STATLN                          YES___ NO___   _____________________

        ********************************************************************

        OPTIMIZER                       YES___ NO___   _____________________

                                          25
        CHECK LIST #2                                            March 16, 1987



        ********************************************************************

        PRINTER                         YES___ NO___   _____________________

        ********************************************************************

        FILE TRANSFER                   YES___ NO___   _____________________

        ********************************************************************

        SYS/REQ KEY (NEW OPTION W/ V 4.00) - TESTING NOT AVAILABLE YET

        ********************************************************************








































                                          26
        SAMPLE CERTIFICATION LETTER                              March 16, 1987






                           12 -  SAMPLE CERTIFICATION LETTER

                 After the certification process is finished, a complete
                 description of the test and results is written and
                 distributed to Tymnet personnel.

                 Following, is an example for SMARTYM, a software
                 product developed for McDonnell Douglas Applied
                 Communications Systems Company.

                 You will find some 'blank' certification letters for a 
                 software product and for a terminal emulations under:
                 (TECHREF:56)SOFTWR.CRT  - s/w certifiation letter
                             TRMDEV.CRT  - terminal development certifi-
                                           cation letter
                             FTRANS.CRT  - s/w with file transfer certification

                 You'll want to copy one of these forms to your directory, fill
                 it in, and send it to (*** CERT).  This list of recipients 
                 will include the appropriate Marketing Support and QA 
                 personnel.


         
         
                                     HQ QUALITY ASSURANCE
         
                                     THIRD PARTY SOFTWARE
                                     CERTIFICATION LETTER
        ***********************************************************************
        *                                                                     *
        * The following product has recently completed testing and has met or *
        * exceeded Tymnet's minimum qualification requirements.  It is,       *
        * therefore, considered to be compatible with our network.  Any       *
        * restrictions or qualification noted while testing this product on   *
        * the Tymnet network will be listed below.  This product has been     *
        * certified for the configuration(s) listed below.                    *
        *                                                                     *
        ***********************************************************************
         
        I.   Specified Third Party Software Certification
         
                                                    X.PC     ASYNC-TO-3270
        ------------------------------------------------+----------------------
                                                   (Y/N)| File  Terminal  Print
        Micro-Computer  Software (Ver.)  Company        |Trans. Emulation
        ------------------------------------------------+----------------------
        IBM PC XT  Smartym 3270  (1.1A) Persoft Inc.  Y     N    SMARTYM*    Y
                                        2740 Ski Lane

                                          27
        SAMPLE CERTIFICATION LETTER                              March 16, 1987


                                        Madison, WI 53791

        * This emulation  is  based  on  VT100,  but  it  has  its  own  Async-
        to-3270 definition.




        II.  Third Party Software Configuration


        The  following  is  not  a  substitute  for  Smartym 3270 User's Manual
        or the CMTERM.ERS documemtation needed when accessing the Async-to-3270
        interface.
         
        SOFTWARE CONFIGURATION SETTINGS
         
           COM LINE (1/2)                           1
           BAUD RATE                         1200/2400/4800
           BITS/CHARACTERS-PARITY                  8N
           STOP BITS (1/2)                          1
           CURSOR TYPE (B/U)                        B
           DISCONNECT ON EXIT                      Y/N*


        * This  option is  not available when  running X.PC.    Disconnect will
        always  oc cur on exit to DOS.




        III. Steps for Accessing TYMNET using SMARTYM 3270


        1. From DOS, the user enter any of the following three commands.

             a.  The command "setup" will take the user to a menu with the 
                 option to enter the above configuration,  option "P",  or the 
                 option to program software function keys, option "S".  The 
                 configuration must be set up the first time Smartym is used.
         
             b.  The command "xpc" will load the software necessary when 
                 connecting to Tymnet  through X.PC.   If X.PC is desired, this
                 command must be entered before the next command.
         
             c.  The command "st3270" will take you to the communication screen
                 and should be the last one given from the DOS prompt.
         
        2.   Once you are at the communication screen, type the command
             necessary to autodial your modem,  or use your telephone as
             required.  If  you  are hardwired to the network, this step is 
             not necessary.
         

                                          28
        SAMPLE CERTIFICATION LETTER                              March 16, 1987


        3.   Once you begin receiving characters, you may login using one of
             the following methods.
         
             a.  Type an "a" for your terminal identifier, and you will then
                 receive "Please  log  in:."  At this point you may log into 
                 the Async-to-3270 Service, or the X.PC Network Interface. If 
                 you log into the X.PC Network Interface, you will receive
                 another login screen called the X.PC Login Screen.   Consult 
                 your Tymnet Representative for all  of  these logins.
         
             b.  You may use your Softkeys to perform the above login.  Consult
                 the Smartym 3270 manual for information on programming these 
                 keys.  (NOTE:  The  Softkeys  may not be used to login once
                 you have reached the X.PC Login Screen.)




        IV.  Restrictions and Qualifications


        A timeout by the host when using X.PC may result in an incorrect screen
        being displayed.    This screen  will indicate that the circuit  to the
        X.PC Interface has been dropped,  but if any key is typed,  the correct
        screen will appear.


        This driver will forward  information typed at the keyboard  only  when
        a  car riage  return or another control  character is typed.    This is
        only true if you  have local echo, and it  may result in a  screen that
        looks incorrect.   If this should happen, do a redisplay  function, and
        the screen will be corrected.


        A softkey may not be used to login at the X.PC Login Screen.



















                                          29
        SAMPLE PUB FILE                                          March 16, 1987






                                 13 -  SAMPLE PUB FILE

        This PUB file is located under (TECHREF:56)PUB.FRM.  You will want to
        copy this file to your personal directory.  Using 'edit' mode, enter 
        your PUB file and give the SEARCH command.  Tell the editor to search
        for <.
            -

        At every "<", you will need to erase the instructions and insert the
        specified text.  Continue using the search command throughout the rest
        of the PUB file, inserting text at each "<".  For the 'function key 
        stroke' chart, fill in the appropriate keys.

        Once the file is created, please copy it to (QACMT:33), along with the
        new macro file.  Please notify QA when these files are completed.






         .LIBRARY STDDFS.PUB
         .SECTION(|<terminal type here>|)
         .SS(|Input Inhibited|)
         
              When the input inhibited/keyboard locked condition is present, 
         data <may/may not> be entered.  Anything typed while keyboard is 
         locked <is/is not> transmitted.
         .SS(High Intensity Display)
         
              The <enter terminal type> <does/does not> support highlighting.
         .SS(Printer Support)
         
              The <enter terminal type> <does/does not> support transparent
         print.
         .SS(Local Functions)
         .begin box
         <Use this section to inform the user of any keys on the keyboard that
         act locally and must not be used.  THIS SECTION IS OPTIONAL.>
         .end
         .SS(Keys Disabled)
         .begin box
         <Use this section to inform the user of any keys on the keyboard which
         are disabled when this terminal type is selected.  THIS SECTION IS
         OPTIONAL.>
         .end
         .SS(Default Function Key Assignments)
         
              The table following is a listing of the default key assignments

                                          30
        SAMPLE PUB FILE                                          March 16, 1987


         for the various 3270 functions that are emulated by the ASYNC-TO-3270
         Interface.
         
              In the function key table, the following conventions are used.
         .begin BOX
         
              1)   A character surrounded by brackets indicates that the CTRL
         key should be held down while pressing the key in brackets. For
         example, [R] means hold down the CTRL key and press R.
         
              2)   The various functions are invoked by 1, 2 or 3 key
         sequences.  The sequence for each  function is read across in  the
         table.  For example,  CURLEF (cursor left key) is  invoked by
         the 3 key sequence: Press "ESC" followed by typing "[" followed by
         typing "D".
              <change the above sequences to correspond with an example
               from this terninal type>
               3)   Where more  than one entry exists  in the table for  a
         given function, the  user may  choose any  one of  them.  For example,
         INSMOD function can be invoked by pressing "INS CHAR", or by pressing
         "ESC"  followed by typing "I", or by pressing "ESC" followed by
         typing "i".
               <change the above sequences to correspond with an example
               from this terninal type>
         .end
         .next page
         .begin BOX
         
         
                FUNCTION        FIRST                SECOND    THIRD
                NAME             KEY                  KEY       KEY
                =======================================================
                FCNCLR
                -------------------------------------------------------
                FCNENT
                -------------------------------------------------------
                KILL
                -------------------------------------------------------
                NEWLIN
                -------------------------------------------------------
                DELCHA
                -------------------------------------------------------
                FLDTAB
                -------------------------------------------------------
                EEOF
                -------------------------------------------------------
                CURSEL
                -------------------------------------------------------
                CURLEFT
                -------------------------------------------------------
                CURRIGHT
                -------------------------------------------------------
                CURDOWN

                                          31
        SAMPLE PUB FILE                                          March 16, 1987


                -------------------------------------------------------
                CURUP
                -------------------------------------------------------
                BACKTAB
                -------------------------------------------------------
         .next page
                ------------------------------------------------------
                INSMOD
                -------------------------------------------------------
                REDSPY
                -------------------------------------------------------
                HOME
                -------------------------------------------------------
                RESET
                -------------------------------------------------------
                FCNF1
                -------------------------------------------------------
                FCNF2
                -------------------------------------------------------
                FCNF3
                -------------------------------------------------------
                FCNF4
                -------------------------------------------------------
                FCNF5
                -------------------------------------------------------
                FCNF6
                -------------------------------------------------------
                FCNF7
                -------------------------------------------------------
                FCNF8
                -------------------------------------------------------
                FCNF9
                -------------------------------------------------------
                FCNF10
                -------------------------------------------------------
                FCNF11
                -------------------------------------------------------
                FCNF12
                -------------------------------------------------------
         .next page
                -------------------------------------------------------
                FCNF13
                -------------------------------------------------------
                FCNF14
                -------------------------------------------------------
                FCNF15
                -------------------------------------------------------
                FCNF16
                -------------------------------------------------------
                FCNF17
                -------------------------------------------------------
                FCNF18
                -------------------------------------------------------

                                          32
        SAMPLE PUB FILE                                          March 16, 1987


                FCNF19
                -------------------------------------------------------
                FCNF20
                -------------------------------------------------------
                FCNF21
                -------------------------------------------------------
                FCNF22
                -------------------------------------------------------
                FCNF23
                -------------------------------------------------------
                FCNF24
                -------------------------------------------------------
                PA1
                -------------------------------------------------------
                PA2
                -------------------------------------------------------
                PA3
                -------------------------------------------------------
         .next page
                -------------------------------------------------------
                STATLN                                1          CR
                                                      2          CR
                                                      .
                                                      .
                                                      .
                                                      23         CR
                                                      24         CR
                                                      D          CR
                                                      d          CR
                                                      E          CR
                                                      e          CR
                                                      U          CR
                                                      u          CR
                =======================================================
         .end
         .next page
         .SS(<enter the terminal type> Set-up)
         
             <Enter a description of the set-up here>
         














                                          33
 a@\Õ