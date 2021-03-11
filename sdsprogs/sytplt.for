

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                       C
C   AUTHOR : G.P.RAVIKUMAR                            DATE: 21 MAR, '84 C
C                                                                       C
C                                                                       C
C   PROGRAM DESCRIPTION :                                               C
C   -------------------                                                 C
C                                                                       C
C     THIS IS A GENERAL PURPOSE PROGRAM TO PLOT A SET OF NODES AND      C
C   LINES.  THE INPUT TO THE PROGRAM CAN BE  1) SYMBOLIC DATA FILES     C
C   WITH NODE AND LINE INFORMATION, OR  2) CKTS.DMI FILE OBTAINED FROM  C
C   PROFILE DATA BASE.                                                  C
C                                                                       C
C     INFORMATION ON HOW TO CREATE INPUT FILES AND RUN THE PROGRAM  IS  C
C   AVAILABLE IN THE FILE  'SYTPLT.DOC'.                                C
C                                                                       C
C     IF NO X,Y CO-ORDINATES ARE GIVEN ALONG WITH THE NODE NAMES IN THE C
C   INPUT FILE, THEN THE PROGRAM DOES AN AUTOMATIC RANDOM POSITIONING   C
C   OF NODES.  THE USER CAN LATER MOVE ANY NODE AROUND TO MAKE THE PLOT C
C   LOOK BETTER.  ALSO, HE CAN SAVE THE FINAL POSITION OF NODES IN A    C
C   FILE FOR FUTURE USE.                                                C
C                                                                       C
C                                                                       C
C                                                                       C
C   RESTRICTIONS/LIMITATIONS : AT THIS TIME THE PROGRAM CAN PLOT A MAX. C
C                              OF 100 NODES AND 200 LINES; IF MORE      C
C                              NODES AND LINES ARE TO BE PLOTTED, THEN  C
C                              INCREASE THE SIZE OF THE FOLLOWING       C
C                              ARRAYS  -  NODNAM,NODX,NODY,             C
C                                         NUMOUT                        C
C                                         LINN1,LINN2,LINNAM,LINBPS,    C
C                                         LINGRP                        C
C                              HOWEVER, IF THE PAGE SIZE IS NOT BIG     C
C                              ENOUGH,THEN IT IS PROBABLY NOT FEASIBLE  C
C                              TO PLOT MORE THAN 100 NODES & 200 LINES. C
C                                                                       C
C                                                                       C
C   FILES ACCESSED          :  THE FILE  'SYTPLT.CMD' HAS THE NAMES OF  C
C                              ALL FILES ACCESSED BY THE PROGRAM, AND   C
C                              WHICH NEED TO BE LOADED WITH SYTPLT.FOR  C
C                                                                       C
C                                                                       C

C                                                               PAGE 2
C   DICTIONARY OF VARIABLES :                                           C
C   -----------------------                                             C
C                                                                       C
C               NUMNOD       : NUMBER OF NODES TO PLOT                  C
C                                                                       C
C               NODNAM(100)  :     "    NAMES OF ALL NODES              C
C                                                                       C
C               NODX(100)    :     "    'X' CO-ORDINATES OF ALL NODES   C
C                                                                       C
C               NODY(100)    :     "    'Y' CO-ORDINATES OF ALL NODES   C
C                                                                       C
C               NUMLIN       : NUMBER OF LINES TO PLOT                  C
C                                                                       C
C               LINN1(200)   : CONTAINS NODE 1 OF ALL LINES             C
C                                                                       C
C               LINN2(200)   :     "    NODE 2 OF ALL LINES             C
C                                                                       C
C               LINNAM(4,200):     "    NAMES OF ALL LINES              C
C                                                                       C
C               LINBPS(200)  :     "    LINE SPEED FOR ALL LINES        C
C                                                                       C
C               LINGRP(200)  :     "    NO. OF GROUPS FOR ALL LINES     C
C                                                                       C
C               LINFLG       : USER'S CHOICE TO PLOT LINE INFO.         C
C                                                                       C
C               NUMOUT(100)  : FOR EACH NODE IT CONTAINS THE NUMBER OF  C
C                              LINES GOING OUTSIDE THE SITE             C
C                                                                       C
C               NODOUT       : FOR ANY LINE GOING OUTSIDE THE SITE,     C
C                              THIS GIVES THE END NODE OUTSIDE          C
C                                                                       C
C               NODFIL       : USER'S DATA FILE CONTAINING NODES TO BE  C
C                              TO BE PLOTTED (A SYMBOLIC FILE)          C
C                                                                       C
C               LINFIL       : USER'S DATA FILE CONTAINING LINES TO BE  C
C                              PLOTTED (A SYMBOLIC FILE)                C
C                                                                       C
C               DMSFIL       : FILE CREATED FROM PROFILE DATA BASE -    C
C                              NODES AND LINES TO PLOT ARE SELECTED     C
C                              FROM THIS.                               C
C                                                                       C
C               TITLE        : TITLE FOR THE PLOT                       C
C                                                                       C
C               SITEID       : ID # FOR THE SITE TO BE PLOTTED.         C
C                              THIS IS REQUIRED IF NODES & LINES ARE    C
C                              TO BE SELECTED FROM DMSFIL.              C
C                                                                       C
C               IDATE(2)     : DATE  ON THE DAY PLOTTING IS DONE        C
C                                                                       C
C               INPUT        : USER ENTERS A VALUE FOR THIS VARIABLE    C
C                              DEPENDING ON WHERE THE DATA FOR NODES    C
C                              AND LINES ARE                            C
C                                                                       C

C                                                               PAGE 3

C               INOD         : REFERS TO THAT NODE IN NODNAM ARRAY      C
C                              WHICH IS TO BE NEXT PLOTTED              C
C                                                                       C
C               ILIN         : REFERS TO THAT LINE IN LINE ARRAYS       C
C                              WHICH IS TO BE NEXT PLOTTED              C
C                                                                       C
C               IANS         : CONTAINS THE REPLY FROM THE USER FOR     C
C                              QUESTION                                 C
C                                                                       C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC



        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY
        COMMON /LINES/ NUMLIN,LINN1(200),LINN2(200),LINNAM(4,200),
     -                 LINBPS(200),LINGRP(200),N1TYP(200,3),N2TYP(200,3)
     -                ,N2SITE(200)
        COMMON /OUTSYT/ NUMOUT(100),NODOUT
        COMMON /FILE/ NODFIL,LINFIL
        DOUBLE PRECISION NODFIL,LINFIL
        INTEGER TITLE(6),IDATE(2)



C                                                               PAGE 4
C  TERMINAL TYPE?

 1     WRITE(5,2)
 2     FORMAT(/,1X,'TYPE OF TERMINAL YOU ARE ON',
     -         /,1X,'    1. TEKTRONICS    OR',
     -         /,1X,'    2. HP 7220 ?     (ENTER "1" OR "2")    : ',$)
       READ(5,3) ITML
 3     FORMAT(A1)
       IF (ITML.NE.'1'.AND.ITML.NE.'2') GO TO 1




        IF (ITML.EQ.'1') CALL SCREEN
        IF (ITML.EQ.'2') WRITE(5,12)






        WRITE (5,5)
 5      FORMAT (10(/),25X,'SITE PLOTTING SOFTWARE',
     -           2(/),30X,'VERSION 1.0',
     -           2(/),30X,'MARCH, 1984',
     -          10(/),20X,'HIT CARRIAGE RETURN TO CONTINUE....',$)
        READ (5,7) CR
 7      FORMAT (I1)




        IF (ITML.EQ.'1') CALL SCREEN
        IF (ITML.EQ.'2') WRITE (5,12)





        WRITE(5,9)
 9      FORMAT(10(/),15X,'THIS SOFTWARE IS DESIGNED FOR PLOTTING NODES',
     -             /,15X,'AND LINES IN A SITE.  IN ADDITION, IT CAN BE',
     -             /,15X,'USED TO PLOT ANY USER DEFINED SET OF NODES  ',
     -             /,15X,'AND LINES.  FOR DETAILS, READ DOCUMENTATION ',
     -             /,15X,'IN (NETENG)SYTPLT.DOC.',
     -         10(/),15X,'HIT CARRIAGE RETURN TO CONTINUE....',$)

        READ (5,7) CR



        IF (ITML.EQ.'1') CALL SCREEN
        IF (ITML.EQ.'2') WRITE (5,12)
 12     FORMAT (12(/))






C  INITIALIZATION


 10     MOVFLG = ' '
        TIKFLG = ' '


C  PROMPT FOR THE TITLE TO PLOT



        IF (ITML.EQ.'2') WRITE(5,11)
 11     FORMAT(8(/))
        WRITE(5,15)
 15     FORMAT(2(/),1X,'ENTER TITLE FOR THE PLOT                   : ',
     -          $)
        READ(5,20) TITLE
 20     FORMAT(6A5)





C  FIND OUT HOW THE USER WANTS TO INPUT NODE AND LINE INFORMATION

 30     WRITE(5,35)
 35     FORMAT(/,1X,'NODES AND LINES TO PLOT - ',
     -         /,1X,'    1. DO YOU HAVE FILES WITH THIS INFO  OR',
     -        //,1X,'    2. DO YOU WANT TO SELECT A SITE FROM',
     -         /,1X,'       TOPOLOGY DATA BASE?',
     -         /,1X,'         (ENTER "1" OR "2")                : ',$)

        READ(5,40) INPUT
 40     FORMAT(A1)








        IF (INPUT.EQ.'1') GO TO 50
        IF (INPUT.NE.'2') GO TO 30

        WRITE (5,44)
 44     FORMAT(/,1X,'ENTER THE SITE ID #                        : ',$)

        READ (5,45) SITEID
 45     FORMAT(5G)


        TYPE 46,SITEID
 46     FORMAT(/,1X,'SITE ID ENTERED = ',I4)

        GO TO 60




C  GET THE FILE NAME FOR NODE NUMBERS

 50     WRITE(5,51)
 51     FORMAT(/,1X,'ENTER THE FILE NAME FOR NODES              : ',$)
        READ(5,52) NODFIL
 52     FORMAT(A10)

        OPEN (UNIT=21,DEVICE='DSK',FILE=NODFIL,ACCESS='SEQIN',ERR=53)
        CLOSE(UNIT=21)
        GO TO 55

 53     WRITE(5,54)
 54     FORMAT(/,1X,'FILE NOT PRESENT')
        GO TO 50




C  GET THE FILE NAME FOR LINES

 55     WRITE(5,56)
 56     FORMAT(/,1X,'ENTER THE FILE NAME FOR LINES              : ',$)
        READ(5,57) LINFIL
 57     FORMAT(A10)

        OPEN (UNIT=21,DEVICE='DSK',FILE=LINFIL,ACCESS='SEQIN',ERR=58)
        CLOSE(UNIT=21)
        GO TO 60

 58     WRITE (5,54)
        GO TO 55





C  ASK IF LINES GOING OUT OF SITE ARE TO BE PLOTTED


 60     WRITE (5,65)
 65     FORMAT(/,1X,'DO YOU WANT LINES GOING OUT OF SITE ',
     -         /,1X,'TO BE PLOTTED    (YES OR NO)               : ',$)

        READ(5,70) OUTFLG
 70     FORMAT (A1)

        IF (OUTFLG.NE.'Y'.AND.OUTFLG.NE.'N') GO TO 60




C  ASK IF LINE INFORMATION NEEDS TO BE PLOTTED


 80     WRITE(5,85)
 85     FORMAT(/,1X,'DO YOU WANT LINE INFO.TO BE PLOTTED?'
     -         /,1X,'          (YES OR NO)                      : ',$)

        READ(5,90) LINFLG
 90     FORMAT(A1)

        IF (LINFLG.NE.'Y'.AND.LINFLG.NE.'N') GO TO 80







 95     WRITE(5,96)
 96     FORMAT(/,1X,'DO YOU WANT THIS PLOT WITH ',
     -         /,1X,'TICKS ON X,Y AXES ?   (YES OR NO)          : ',$)

        READ(5,97) TIKFLG
 97     FORMAT(A1)


        IF (TIKFLG.NE.'Y'.AND.TIKFLG.NE.'N') GO TO 95




        IF (INPUT.EQ.'1') CALL GETFIL
        IF (INPUT.EQ.'2') CALL GETDMS (SITEID,OUTFLG)



C  DO RANDOM POSITIONING FOR NODES WITH NO X,Y CO-ORDINATES

C105    DO 120 I=1,NUMNOD
C         IF (NODX(I).NE.0.AND.NODY(I).NE.0) GO TO 120
C         CALL AUTO(NODX(I),NODY(I))
C120    CONTINUE


 105    CALL AUTO

C                                                               PAGE 5

C  GET TODAY'S DATE

        CALL DATE(IDATE)





C  CALL THE ROUTINES TO INITIALIZE THE PLOTTER,SET UP PAGE SIZE,
C  WRITE THE TITLE, AND SET UP THE GRAPH.

        CALL INITL(ITML)
 200    CALL DISPLA(TITLE,IDATE,TIKFLG)




CCCCCC
C  DRAW NODES
CCCCCC

        IF (ITML.EQ.'2') CALL SETCLR('BLUE')

        DO 300 I=1,NUMNOD
          INOD=I
          CALL PLOTND(INOD)
 300    CONTINUE





C  INITIALIZE THE NUMOUT COUNTER; NUMOUT(I) GIVES THE NUMBER OF LINES
C  GOING FROM NODE(I) TO OUTSIDE THE SITE.

        DO 350 I=1,NUMNOD
          NUMOUT(I)=0
 350    CONTINUE




CCCCCC
C  DRAW LINES
CCCCCC

        IF (ITML.EQ.'2') CALL SETCLR('RED')

        DO 400 J=1,NUMLIN
          ILIN=J
          CALL PLOTLN(ILIN,LINFLG,ITML)
 400    CONTINUE



CCCCCC
C  PLOT INFORMATION ON NO.OF NODES AND LINES
CCCCCC


        IF (ITML.EQ.'2') CALL SETCLR('BLACK')

        CALL PLTINF(NUMNOD,NUMLIN)


C                                                               PAGE 6

C  CALL ROUTINE TO END PLOT

        CALL ENDPLT



        IF (MOVFLG.EQ.'N'.AND.TIKFLG.EQ.'N') GO TO 530
        IF (MOVFLG.EQ.'N') GO TO 526



CCCCCC
C  NOW THAT THE NODES AND LINES ARE PLOTTED, CHECK IF THE USER WANTS TO
C  MOVE ANY NODES; IF HE DOES, GO AHEAD AND PROMPT FOR THE NODE NUMBER.
CCCCCC


 500    WRITE(5,510)
 510    FORMAT(/,1X,'DO YOU WANT TO MOVE ANY NODES?',
     -         /,1X,'      (YES OR NO)                          : ',$)
        READ(5,520) MOVFLG
 520    FORMAT(A1)

        IF(MOVFLG.EQ.'Y') GO TO 525
        IF(MOVFLG.NE.'N') GO TO 500
        IF (TIKFLG.EQ.'Y') GO TO 530
        GO TO 526




C  CALL ROUTINE TO MOVE NODES AND THEN GO BACK TO PLOT

 525    CALL MOVE

 526    IF (MOVFLG.EQ.'N'.AND.TIKFLG.EQ.'N') GO TO 530

 521    WRITE(5,96)

        READ(5,528) TIKFLG
 528    FORMAT(A1)

        IF (TIKFLG.NE.'Y'.AND.TIKFLG.NE.'N') GO TO 521

        IF (TIKFLG.EQ.'N') ENDFLG = 1

        IF (MOVFLG.EQ.'N'.AND.TIKFLG.EQ.'Y') GO TO 530

        GO TO 200







C  CHECK IF THE USER WANTS THIS TOPOLOGY TO BE SAVED


 530    IF (INPUT.EQ.'2') GO TO 534

 531    WRITE(5,532)
 532    FORMAT (/,1X,'DO YOU WANT NODES WITH NEW CO-ORDINATES TO BE',
     -         //,1X,'    0) NOT SAVED',
     -          /,1X,'    1) SAVED IN NODE INPUT FILE',
     -          /,1X,'    2) SAVED IN A NEW FILE ? ',
     -         //,1X,'       (ENTER "0", "1"  OR  "2")           : ',$)

        READ(5,533) ICHOIC
 533    FORMAT(I1)


        IF (ICHOIC.NE.0.AND.ICHOIC.NE.1.AND.ICHOIC.NE.2) GO TO 531


        IF (ICHOIC.EQ.1.OR.ICHOIC.EQ.2) CALL SAVFIL(ICHOIC)
        GO TO 595




 534    WRITE(5,535)
 535    FORMAT(/,1X,'DO YOU WANT TO SAVE THIS TOPOLOGY? ',
     -         /,1X,'      (YES OR NO)                          : ',$)

 540    READ(5,545) ICHOIC
 545    FORMAT(A1)


        IF (ICHOIC.EQ.'N') GO TO 595
        IF (ICHOIC.NE.'Y'.AND.ICHOIC.NE.'N') GO TO 534


        CALL SAVDMS 

C                                                               PAGE 7


C  CHECK IF THE USER WANTS A PLOT FOR ANOTHER SITE

 595    WRITE(5,600)
 600    FORMAT(/,1X,'DO YOU WANT A PLOT FOR ANOTHER SITE ?',
     -         /,1X,'      (YES OR NO)                          : ',$)
        READ(5,605) IANS
 605    FORMAT(A1)

        IF (IANS.NE.'Y'.AND.IANS.NE.'N') GO TO 595
        IF (IANS.EQ.'N') GO TO 620
        IF (ITML.EQ.'1') CALL SCREEN
        GO TO 10



C  CALL ROUTINE TO TERMINATE PLOTTING

 620    CALL DONPLT


        STOP
        END

C                                                               PAGE 8




CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                      C
C  ROUTINE AUTO RANDOMLY POSITIONS THE NODES WITH NO X,Y CO-ORDINATES  C
C                                                                      C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

        SUBROUTINE AUTO

        IMPLICIT INTEGER(A-Z)
        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY





        DO 5 I=1,NUMNOD
          NODX(I) = 7.5+4.*COS(6.283*(FLOAT(1-I)/NUMNOD)+1.571)
          NODY(I) = 5.5+4.*SIN(6.283*(FLOAT(1-I)/NUMNOD)+1.571)
 5      CONTINUE







C       X=RAN(1.0) * 15.0
C       Y=RAN(1.5) * 11.0


        RETURN
        END

C                                                               PAGE 9


CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                      C
C  ROUTINE MOVE ACCEPTS NEW CO-ORDINATES FOR NODES FROM THE USER TO    C
C  MOVE THEM                                                           C
C                                                                      C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

        SUBROUTINE MOVE

        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY



C  PROMPT FOR THE NODE NAME TO BE MOVED

 20     WRITE(5,30)
 30     FORMAT(/,1X,'ENODE NAME   (CR TO END INPUT)        : ',$)
        READ(5,40) NODE
 40     FORMAT(A4)


        IF (NODE.EQ.' ') GO TO 100


C  CHECK IF THIS NODE IS IN THE NODE LIST

        DO 50 I=1,NUMNOD
          IF(NODE.NE.NODNAM(I)) GO TO 50
          ITAG=I
          GO TO 70
 50     CONTINUE


        WRITE(5,60)
 60     FORMAT(/,1X,'THIS NODE IS NOT IN THE LIST; MAKE SURE',
     -         /,1X,'BLANKS IN NODE NAME ARE ALSO ENTERED.')
        GO TO 20



 70     WRITE(5,80) NODX(ITAG),NODY(ITAG)
 80     FORMAT(/,1X,'OLD X,Y CO-ORDINATES                       : ',
     -              F5.2,1X,F5.2,
     -         /,1X,'ENTER NEW CO-ORDINATES                     : ',$)

        READ(5,90) NODX(ITAG),NODY(ITAG)
 90     FORMAT(5G)

        GO TO 20


 100    RETURN
        END
/ ú