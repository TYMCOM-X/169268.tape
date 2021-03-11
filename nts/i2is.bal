ISIS Programming __  CMT.402

                  ********** CIRCUIT ISIS MESSAGES  **********
          
          - Needle         00  :leng|..invoice number...|
                                    |Dest Host!Orig Node|
                                    |Orig Host!Orig Port|
                                    |----:----!----!TPC.|
                                    |HIQ=8000.!TID.:Size|
                                    |User Name .....
          
          * Data           01  :Data|
             :
          * Data           9D  :Data ......
          
          + Detach         9E  :----|
          * Zap            9F  :----|
          * Set BP         A0  :----|
          * Release BP     A1  :----|
          * Gobbler        A2  :----|
          * Flush Input    A3  :----|
          * Black Ball     A4  :----|
          * Gray Ball      A5  :----|
          * Enter DEM      A6  :----|
          * Leave DEM      A7  :----|
          * Enter Trans    A8  :----|
          * Leave Trans    A9  :----|
          * Green Ball     AA  :----|
          * Red Ball       AB  :----|
          * Yellow Ball    AC  :----|
          * Orange Ball    AD  :----|
          * Break Begin    AE  :----|
          * Hang up        AF  :----|
          * Query Term.    B0  :tpar|
          * Set Terminal   B1  :tpar|valu:----!----:----|
          - Pseudo Need.   B2  :Key.|Local.Key!----:----|
          + Logon Char     B3  :Char|
          - Logon status   B4  :lsta|
          - Logon failed   B5  :lerr|
          - Logon OK       B6  :IIX.|..invoice number...|
                                    |Orig Host!----:----|
          + Accounting     B7  :----|0Emg:..Acct Value..|
          * Super Hang     B8  :----|
          * Set xmit lim   B9  :limt|
          * Break end      BA  :----|
          + Zap Ack        BB  :----|
          * Ent Alt Dev    BC  :----|
          * Lev Alt Dev    BD  :----|
          + Zap W/Reason   BE  :resn|
          * SIIX           BF  :.00.|
          * TIIX           C0  :.00.|
          
          
                Where    tpar : 0 = echo on/off  (1)
                                1 = echo TAB     (1)
                                2 = echo lf w/cr (1)
                                3 = echo cr w/lf (1)
                                4 = cr delay     (1)
                                5 = input baud   (4)
                                6 = output baud  (4)
                                7 = parity       (1)
                                8 = half duplex  (1)
                                9 = param - A    (4)
                                A = param - B    (4)
                                B = param - C    (4)
                                C = X-enable     (1)
                                D = Echo BS      (1)
                                E = Rev X-enable (1)
                                F = param - D    (4)
                               10 = Katakana     (1)
                               11 = Term on brk  (1)
                               12 = Echo - Esc   (1)
                               13 = Q-Mode       (1)
          
          
                         lsta : 0 = Continue
                                1 = Please Log in
                                2 = Error, type username
                                3 = Error, type password
                                4 = username
                                5 = password
          
                         lerr : 0 = ISIS unable to complete request
                                1 = format error
                                2 = bad user name
                                3 = bad mud
                                4 = system unavailable
                                5 = down line load or dial out failure
                                6 = timeout
                                7 = access not permitted
                                8 = out of origination ports
                                9 = try again later
                                A = bad requesting host number
                                B = requesting host not up on node
          
                         resn : 0 = host out of ports
          
           EXAMPLE   :
          
           1. Needle - Type 00
          
              000F  001D  0017  4953  0599  041C  0000  006B
              0000  0000  0000  CC09  4C49  4E43  4F4C  4E31
              8D--
          
           
           2. Data - 
          
              000E  1A8D  8AF2  E5ED  EFF4  E5BA  A0E3  E1EC
              ECA0  E3EF  EEEE  E5E3  F4E5  E48D  8A1B  5936
          ISIS Programming - CMT.402

                ***** NON-CIRCUIT ISIS MESSAGES, RPORT = 0 *****
          - Restart Req.   00  :----|
          + Restart Resp   01  :----|
          - Take over      02  :Sup#|
          + Rpt to SUP     03  :Key.|Half wd 4!Half wd 3|
                                    |Hw2l:----!----:----|
          + Host status    04  :Key.|.Host no.!# of prts|
                                    |Rel Host#!Hsta:HKey|
          + Report Accnt   05  :----|accounting message |
          - Tell host time 06  :----|....:...GMT...:....|
          + Pseudo N Req   07  :Key.|local Key!SIQ=8000.|
                                    |Orig Host!TID.:....|
          + Aux Cir Req    08  :Key.|Local Key!SIQ=8000.|
                                    |Orig Host!Size: User name ....
          - Pseudo N Rej   09  :Key.|Local Key!lerr:----|
          + Host Prt aval  0A  :Key.|.Host no.!# of prts|
                                    |Rel Host#!----:----|
          - Host unaccep   0B  :Key.|.Host no.!Herr:----|
          + Rpt Host cost  0C  :Key.|.Host no.!Host Cost|
                                    |Rel Host#!----:----|
          - No SUP         0D  :----|
          - 1Down Mess     0E  :Key.|Type:Size!Text ...
          + Rpt all Hosts  0F  :----|
          + Ext Host stat  10  :Key.|.Host no.!# of prts|
                                    |Rel Host#!Hsta:HKey|
                                    |I.Q.:PID !----:----|
          
          
                  Where   Hsta : 0 = Host answered
                                 1 = Host down
                                 2 = Host shut (but up)
                                 3 = Host gone
          
                      Host no. : Always a Hex number, convert to radix 10
                                 for the actual network host number.
          
                    # of ports : Always a Hex number, convert to radix 10
                                 for the actual number of ports in decimal.
          
                          I.Q. : Host Intelligent Level
                                 (80 - IIX Capable)
          
                           PID : Product ID for the interface
                                 Value should be 3 for version 1.15 or lower
                                 or 33 for Version 2.0 or higher.
          
                                 Ex.  0001    ASAT
                                      0002    ACOM
                                      0003    XCOM (for Version 1.15)
                                      0004    3270 Host Interface
                                      0005    3270 Terminal Interface
                                      0009    Standalone Tymsat
                                      000B    ELF
          ISIS Programming - CMT.402


                                      0010    ONTYME
                                      0012    RAM
                                      0014    VAL
                                      0015    CONSAT
                                      0033    XCOM (for Version 2.00)
          
                   
          
          
          
          
           EXAMPLE  :
          
           1. Pseudo Needle Request - Type 07
          
              0000  0700  0002  8000 0599  CC--
          
           
           2. Ext Host Stat - Type 10 (Host answered)
          
              0000  100E  0768  000A  0000  0200  8003
          
          
           3. Ext Host Stat - Type 10 (Host shut)
          
              0000  100E  0768  000A  0000  0000  8003
          
          
In  DDT:

      *:r oring,4
      509C0  037C  037C
      *:r oring,37c+4
      509C0  3832  0D0A  000F  B10E  0000  6575  000F  020D
      509D0  0A0F  A044  000F  044F  4B2C  2DC0  000F  1B5B
      509E0  4E45  544C  494E  4B20  2052  6576  2E20  3138
      509F0  2E33  585D  0D0A  0D0A  4020  0002  000F  2649
      50A00  6C6C  6567  616C  2061  6464  7265  7373  2066
      50A10  6F72  6D61  7420  2774  796D  6E65  7420  270D
      50A20  0A0D  0A40  2006  0107  0000  0700  0002  8000
      50A30  0599  CC11  000E  B30D  000F  020D  0A1E  108E
      50A40  000F  2754  594D  4E45  5420  436F  6E6E  6563
      50A50  7465  640D  0A0D  0A72  656D  6F74  653A  2075
      50A60  7365  7220  6E61  6D65  3A20  0420  000F  B700
      50A70  E800  000C  000F  B700  E700  000A  000F  B700
      50A80  E600  000A  000F  B700  E500  0009  000E  B369
      50A90  000E  B364  000E  B363  000E  B331  000E  B330
      50AA0  000E  B334  000E  B332  000E  B30D  000E  B700
      50AB0  E002  0000  000E  B700  E003  3106  000E  B700
      50AC0  E004  0000  000E  B700  E00B  3106  000E  B700
      50AE0  E00C  0000  000E  B700  E00D  0800  000E  B700
      50AF0  E008  0599  000E  BF00  000E  0480  8180  8300
      50B00  000E  BF00  000E  04C0  9300  0033  000E  BF00
      
      
      
      
      
      *r iring,irsize+4
      50D10  00F8  00F8  000E  BF01  000E  1EC0  821B  0202
      50D20  0003  0204  0005  0107  1508  0009  000C  0000
      50D30  2101  0012  0024  0039  018F  0801  000E  BF1E
      50D40  000E  03C0  8203  BFB4  000E  0304  0B00  040B
      50D50  000E  BFCC  000E  03C0  8400  21C0  000E  BF72
      50D60  000E  03C0  8E00  204E  000E  AC6F  000F  A631
      50D70  000F  B100  0053  7973  000F  B10E  008F  0C35
      50D80  000E  9F72  000F  B100  0161  73BF  000F  B10E
      50D90  0053  6967  000F  AA6E  000F  A73E  7465  6D20
      50DA0  000F  0C35  310D  0A0D  0A20  506C  6561  73BF
      50DB0  000F  0D65  2053  6967  6E20  4F6E  200D  0A3E
      50DC0  000F  BFCE  000F  0CC0  8209  0602  010C  0100
   

    1. Yellow Ball:

            May be emitted by any port to determine when all preceding 
            characters have been flushed from the circuit (by the 
            receipt of the response, Orange_ball). When either end of a 
            circuit detects the arrival of a Yellow_ball, it must 
            respond by returning an Orange_ball.



    2. Orange Ball:

            The response to the receipt of a Yellow_ball. The receipt
            of the Ornage_ball by the originator of the Yellow_ball
            indicates that the Yellow/Orange signal has made a complete
            trip around the circuit, and that any data preceding it (in
            the Yellow_ball or outgoing direction) has been consumed by
            the other end of the circuit.


    3.  Black Ball:

            Replaces the contents of a buffer which has been zapped.
            Indicates an unknown amount of data was lost. If a 
            Black_ball reaches the end of a circuit, and the process 
            at that end does not know how to react, it must return a 
            Gray_ball to inform the other (hopefully, more intelligent)
            end-process of the data-loss.

    
    4.  Gray Ball:
          
            Indicates a Black_ball has been detected at the opposite
            end of the circuit.


    5.  Green Ball:
    
            These are initiated only at Callers(Tymsats), and are held
            by the callee(host) until released again to return to the
            Tymsat.  The receipt of a Green_ball by the Tymsat signifies
            that the host is dismissed, waiting for input. The Green_ball
            may be used by the Tymsat to decide when to leave DEM mode
            on some terminals, and to decide when to turn other (half-duplex)
            terminals around. A Green_ball may be destroyed if a Red_ball 
            catches it; especially if this happens while the Green_ball
            is resident at the host, waiting for the appropriate host
            condition (waiting for input) to occur.


    6.  Red Ball:
    
            These are used to "cancal" Green_balls. 
            In particular, a Red_ball which catches a Green_ball causes it 
            to disappear, and the Red_ball then propagates around the
            circuit, immediately.
            These are initiated only at Callers (Tymsats). This signal
            is sent by the Tymsat whenever a Red- or Green_ball is 
            outstanding and:
            
            1. a character is received from the terminal; or
            2. if an excessive amount of time has passed since the 
               Green_ball has been transmitted, and is feared lost; or
            3. if an excessive amount of time has passed since a 
               Red_ball has been transmitted, and is feared lost.
            
Ball Logic
----------

      These are all types of messages that are going on in the network
without you seeing them.

1. Yellow ball
    in the process of logging off, you type EXIT on the terminal.
The host sends along a Yellow Ball, the host at the terminal(TYMSAT)
will send back an Orange Ball to the host (node).
(ie. the host sends the message to the Tymcom to send the Yellow Ball )

2. Orange Ball
   is used to find out if something has been received by the other end.
This is a response to the Yellow Ball.

3. Green Ball
   There are seven usages to this ball:
       1. HDX
       2. changing terminal char.

              



   These are special flags.

4. Red Ball
    a response to the Green Ball

5. Black Ball
    -- data lost in the direction
      If a Tymsat receives a Black Ball, it means that data is lost 
      coming towards it. (ie. in the case of ZAP)

6. Grey Ball
    -- data lost in the opposite direction
      If the host was sending too much info., the node will send a
      Grey Ball to the host and Black ball the other way.

7.  DEM
    deferred echo mode
    -  type a terminal, the Tymsat would echo back.
    For control character, the Tymsat would pass thru to the host.
   The host will send back leave DEM (8)
   Either end can send the Enter DEM & Leave DEM

8. Transparency
    Enter -  Leave Transparency Mode
  not too often in Async. mode
  EBCDIC-ASCII Translation
  -- no node will transmit without translation
  translation occurs in terminal interface or Host interface slots.

9. Glass Ball Mode
  --> very similar to Transparency
  --> used with Protocols, Bisync.
  we send the whole record thru the network.
  Full Protocol Control is given to the Host.

10. Gobbler (only eats in one direction)
 All of the above follows the data like a character.
 The gobbler eats up data in a node & sends data the other way.
 Gobbler doesn't have to wait for the data, it moves pretty fast.
 Actually, it works per channel.
 ---> The data is lost with legal condition (esc. key)

11. Zapper
 --> tears down the circuit,erases the permuter table.
   When buffer space is needed, the one that consumes most of the memory 
space will get zapped first.
