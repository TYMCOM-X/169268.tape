


        SUBROUTINE SCREEN

        CALL TEK(120,1)
        CALL NOBRDR
        CALL AREA2D(0.,0.)
        CALL RESET('ALL')

        RETURN
        END

C                                                               PAGE 1


CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                      C
C  SUBROUTINE INITL  INITIALIZES THE PLOTTER & SETS UP THE PAGE SIZE.  C
C                                                                      C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 

        SUBROUTINE INITL(ITML)



  

C  INITIALIZE THE PLOTTER

        IF (ITML.EQ.'1') GO TO 30

          CALL HP7220
          GO TO 35

 30     CALL TEK(120,1)


C  SET A GRACE MARGIN OF 3 INCHES.  THIS ALLOWS FOR PLOTTING POINTS
C  UPTO 3 INCHES OUTSIDE THE PLOT AREA BEFORE DECLARING POINTS
C  TO BE OUT OF RANGE

 35     CALL GRACE(3.0)


C  SET UP THE PAGE SIZE

        CALL PAGE(16.0,12.5)


        CALL NOBRDR






C                                                               PAGE 2

C  SET THE PHYSICAL ORIGIN

        CALL PHYSOR(0.5,0.5)



        IF (ITML.EQ.'2') CALL SETCLR('BLACK')



        RETURN
        END

        SUBROUTINE DISPLA (SYTNAM,DATE,TIKFLG)

        INTEGER SYTNAM(6),DATE(2),TIKFLG


C  PLOT THE TITLE; ALSO, SET UP THE LENGTHS OF X,Y AXES AND THEIR NAMES


        IF (TIKFLG.EQ.'N') GO TO 80

          CALL TITLE(SYTNAM,30,1H ,-1,1H ,-1,15.,11.)
          GO TO 90

 80     CALL TITLE (SYTNAM,30,1H ,0,1H ,0,15.,11.)



C  PLOT THE DATE

 90     CALL HEIGHT(0.16)
        CALL MESSAG(DATE(1),5,12.0,11.7)
        CALL MESSAG(DATE(2),4,'ABUT','ABUT')
        CALL RESET('HEIGHT')


C  SET UP THE GRAPH TO START PLOTTING NODES AND LINES

        CALL GRAPH(0.,1.,0.,1.)


        RETURN
        END

C                                                               PAGE 3

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                        C
C  SUBROUTINE PLOTND PLOTS THE NODE NODNAM(INOD) AS AN OVAL, WITH ITS    C
C  NAME  DRAWN INSIDE                                                    C
C                                                                        C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


        SUBROUTINE PLOTND(INOD)
        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        INTEGER NUMNOD,NODNAM
        REAL NODX,NODY
        REAL XARAY(100),YARAY(100)
        REAL XPOS,YPOS


C  FIND & STORE X,Y CO-ORDINATES TO PLOT A NODE AS AN OVAL


        DO 10 I=1,100
          XARAY(I)=NODX(INOD)+0.225*COS(I*0.0628)
          YARAY(I)=NODY(INOD)+0.15*SIN(I*0.0628)
 10     CONTINUE


C  PLOT THE NODE

        CALL CURVE(XARAY,YARAY,100,0)


C  DRAW THE NODE NUMBER

        CALL HEIGHT(0.0975)
        XPOS=NODX(INOD)-0.15
        YPOS=NODY(INOD)-0.045
        CALL MESSAG(NODNAM(INOD),4,XPOS,YPOS)
        CALL RESET('HEIGHT')

        RETURN
        END

C                                                               PAGE 4

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                        C
C  SUBROUTINE PLOTLN PLOTS THE LINE CONNECTING THE NODES LINN1(ILIN)     C
C  AND LINN2(ILIN).  IF EITHER OF THE NODES LIES OUTSIDE THE SITE        C
C  (I.E., NODE NOT IN THE NODE LIST), THEN A DOTTED LINE IS DRAWN FROM   C
C  THE OTHER NODE.  IF BOTH THE NODES LIE OUTSIDE THE SITE, THEN         C
C  NO LINE IS DRAWN.                                                     C
C                                                                        C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC



        SUBROUTINE PLOTLN(ILIN,LINFLG,ITML,OUTFLG)

        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY
        COMMON /LINES/ NUMLIN,LINN1(200),LINN2(200),LINNAM(4,200),
     -                 LINBPS(200),LINGRP(200)

        COMMON /OUTSYT/ NUMOUT(100),NODOUT
        REAL AX(2),AY(2),ANG,SLOPE,X1,Y1,X2,Y2,XDIFF,YDIFF


        


        CALL RESET('DASH')

C  SAVE THE END NODES OF THE LINE IN N1 AND N2

        N1=LINN1(ILIN)
        N2=LINN2(ILIN)

        ICHK1=0
        ICHK2=0
        NODOUT=0



C  FIND THE INDEX FOR NODE N1 IN NODNAM ARRAY; IF NOT FOUND, SET NODOUT
C  TO N1

        DO 10 I=1,NUMNOD
          IF(N1.NE.NODNAM(I)) GO TO 10
          I1=I
          GO TO 15
 10     CONTINUE


C  NOW NODE N1 IS NOT IN THIS SITE

        ICHK1=1
        NODOUT=N1

C                                                               PAGE 5

C  FIND THE INDEX FOR NODE N2 IN NODNAM ARRAY; IF NOT FOUND, SET NODOUT
C  TO N2

 15     DO 20 I=1,NUMNOD
          IF(N2.NE.NODNAM(I)) GO TO 20
          I2=I
          GO TO 25
 20     CONTINUE


C  NOW NODE N2 IS NOT IN THIS SITE

        ICHK2=1
        NODOUT=N2





CCCCCC
C  IF (ICHK1=0 AND ICHK2=0) THEN BOTH THE END NODES OF THIS LINE ARE
C  IN THE SAME SITE; GO AHEAD TO DRAW THIS LINE.
C  IF (ICHK1=1 AND ICHK2=0) THEN NODE N1 IS NOT IN THIS SITE; PLOT A
C  DOTTED LINE FROM NODE N2 .
C  IF (ICHK1=0 AND ICHK2=1) THEN NODE N2 IS NOT IN THIS SITE; PLOT A
C  DOTTED LINE FROM NODE N1.
C  IF (ICHK1=1 AND ICHK2=1) THEN NEITHER OF THE NODES IS IN THIS SITE;
C  JUST RETURN WITHOUT DRAWING ANY LINE.
CCCCCC


 25     IF (ICHK1.EQ.0.AND.ICHK2.EQ.0) GO TO 90

        IF (ICHK1.EQ.1.AND.ICHK2.EQ.1) GO TO 150



C  NOW ONE OF THE END NODES IS OUTSIDE THE PLOT; CALL SUBROUTINE 'DASH'
C  TO DRAW DOTTED LINE.

        CALL DASH

        IF (ICHK1.EQ.0) L=I1
        IF (ICHK1.EQ.1) L=I2

C                                                               PAGE 6


C  FIND X,Y CO-ORDINATES FOR A LINE WITH ONE OF ITS NODES OUTSIDE THE 
C  PLOT

        IFLAG=0
        AX(1)=NODX(L)
        AY(1)=NODY(L)

        IF (AX(1).LE.7.5.AND.AY(1).LE.5.5) QUAD=1
        IF (AX(1).GT.7.5.AND.AY(1).LE.5.5) QUAD=2
        IF (AX(1).GT.7.5.AND.AY(1).GT.5.5) QUAD=3
        IF (AX(1).LE.7.5.AND.AY(1).GT.5.5) QUAD=4


        IF (QUAD.NE.1) GO TO 40

          XDIFF = AX(1)
          YDIFF = AY(1)

          IF (XDIFF.GT.YDIFF) GO TO 35
            AX(2) = -0.2
            IFLAG = 1
            GO TO 80

 35       AY(2) = -0.1
          IFLAG = 3
          GO TO 85




 40     IF (QUAD.NE.2) GO TO 50

          XDIFF = 15.0 - AX(1)
          YDIFF = AY(1)

          IF (XDIFF.GT.YDIFF) GO TO 45
            AX(2) = 15.2
            IFLAG = 2
            GO TO 80

 45       AY(2) = -0.1
          IFLAG = 3
          GO TO 85





 50     IF (QUAD.NE.3) GO TO 60

          XDIFF = 15.0 - AX(1)
          YDIFF = 11.0 - AY(1)

          IF (XDIFF.GT.YDIFF) GO TO 55
            AX(2) = 15.2
            IFLAG = 2
            GO TO 80

 55       AY(2) = 11.1
          IFLAG = 4
          GO TO 85





 60     IF (QUAD.NE.4) GO TO 70

          XDIFF = AX(1)
          YDIFF = 11.0 - AY(1)

          IF (XDIFF.GT.YDIFF) GO TO 65
            AX(2) = -0.2
            IFLAG = 1
            GO TO 80

 65       AY(2) = 11.1
          IFLAG = 4
          GO TO 85




 70     WRITE (5,75)
 75     FORMAT (//,1X,'SOMETHING WRONG IN PLOTLN SUBROUTINE'//)
        STOP




 80       IDELTA=NUMOUT(L)/2
          AY(2) = AY(1) + ((-1)**NUMOUT(L)) * (IDELTA+1) * 0.3
          IF (NUMOUT(L).EQ.0) AY(2)=AY(1)
          NUMOUT(L) = NUMOUT(L) + 1
          GO TO 100

 85       IDELTA = NUMOUT(L)/2
          AX(2) = AX(1) + ((-1)**NUMOUT(L)) * (IDELTA+1) * 0.3
          IF (IFLAG.NE.4.AND.NUMOUT(L).EQ.0) AX(2)=AX(1)
          NUMOUT(L) = NUMOUT(L) + 1
          GO TO 100

 





C  THESE ARE X,Y CO-ORDINATES FOR A LINE WITH BOTH NODES WITHIN THE PLOT

 90     AX(1)=NODX(I1)
        AX(2)=NODX(I2)
        AY(1)=NODY(I1)
        AY(2)=NODY(I2)

C                                                               PAGE 7





C  ADJUST THE X,Y CO-ORDINATES SO THAT LINES ARE DRAWN FROM THE 
C  CIRCUMFERENCE OF THE OVALS(NODES) INSTEAD OF THEIR CENTER.

 100    IF (AX(1).EQ.AX(2)) GO TO 120
        SLOPE=(AY(2)-AY(1))/(AX(2)-AX(1))
        ANG=ATAN(SLOPE)
        IF (AX(1).LT.AX(2)) GO TO 130
        ANG=ANG+3.14
        GO TO 130
 120    IF (AY(1).LE.AY(2)) GO TO 125
        ANG=1.57+3.14
        GO TO 130
 125    ANG=1.57
 130    X1=AX(1)+0.225*COS(ANG)
        Y1=AY(1)+0.15*SIN(ANG)
        X2=AX(2)+0.225*COS(ANG+3.14)
        Y2=AY(2)+0.15*SIN(ANG+3.14)

        
C  DRAW THE LINE

        CALL STRTPT(X1,Y1)
        CALL CONNPT(X2,Y2)

        CALL RESET('DASH')

C  CHECK IF LINE INFO. IS TO BE PLOTTED

        IF (LINFLG.EQ.'N') GO TO 140

C  CALL ROUTINE 'LININF' TO PLOT LINE INFORMATION 

        CALL HEIGHT (0.0975)
        CALL LININF(ILIN,AX,AY,IFLAG)
        CALL RESET ('HEIGHT')


 140    IF (OUTFLG.EQ.'N') GO TO 150
        CALL OUTNOD(AX,AY,IFLAG)

 150    RETURN
        END

C                                                               PAGE 8


CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                        C
C  SUBROUTINE LININF PLOTS THE LINE INFORMATION FOR THE LINE CONNECTING  C
C  THE NODES LINN1(ILIN) AND LINN2(ILIN).  ARGUMENTS X AND Y SENT FROM   C
C  ROUTINE PLOTLN ARE THE ARRAYS CONTAINING ADJUSTED X,Y CO-ORDINATES    C
C  FOR THESE TWO NODES.                                                  C
C                                                                        C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC



        SUBROUTINE LININF(ILIN,X,Y,IFLAG)

        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY
        COMMON /LINES/ NUMLIN,LINN1(200),LINN2(200),LINNAM(4,200),
     -                 LINBPS(200),LINGRP(200)
        COMMON /OUTSYT/ NUMOUT(100),NODOUT
        REAL DIST,X(2),Y(2),ANG,XX,YY







        TMPNAM = LINNAM(1,ILIN)
        NAME = '  '


        DO 10 J=1,2
          INDEX = J
          CALL RTC (ICHAR,TMPNAM,INDEX)
          CALL STC (ICHAR,NAME,INDEX)
 10     CONTINUE



        LENGTH = 2
        INC = 5

        IF (NAME.EQ.'HW'.OR.NAME.EQ.'MS') GO TO 25
          NAME = ' '
          LENGTH = 1





C                                                               PAGE 9

C  FIND THE LENGTH OF THE LINE CONNECTING NODES N1 AND N2

 25     DIST = SQRT((X(2)-X(1))**2 + (Y(2)-Y(1))**2)



C  CHECK IF THE LINE INFO. CAN BE WRITTEN ALONG THIS LINE

        IF (DIST.LT.(LENGTH+INC)*0.105) GO TO 90



C  FIND X,Y CO-ORDINATES TO BEGIN WRITING LINE INFORMATION; SINCE THE
C  INFO. IS WRITTEN ALONG A LINE, THE SLOPE OF THE LINE IS 
C  FIRST FOUND.

        IF (X(1).EQ.X(2)) GO TO 30
        ANG=ATAN((Y(2)-Y(1))/(X(2)-X(1)))
        IF (X(1).LT.X(2)) GO TO 40
        GO TO 50

 30     ANG=1.57
        IF (Y(1).GT.Y(2)) GO TO 50
 40     XX= X(1)+((DIST-((LENGTH+INC)*0.105))/2.)*COS(ANG)-0.04*SIN(ANG)
        YY= Y(1)+((DIST-((LENGTH+INC)*0.105))/2.)*SIN(ANG)+0.04*COS(ANG)
        GO TO 60

 50     XX= X(1)-((DIST+((LENGTH+INC)*0.105))/2.)*COS(ANG)-0.04*SIN(ANG)
        YY= Y(1)-((DIST+((LENGTH+INC)*0.105))/2.)*SIN(ANG)+0.04*COS(ANG)

 60     ANG=ANG*(180./3.14)
        CALL ANGLE(ANG)



C  WRITE THE LINE INFO. ALONG THE LINE


        CALL MESSAG (NAME,LENGTH,XX,YY)

        IF (NAME.EQ.'MS') GO TO 90

        CALL MESSAG(' ',1,'ABUT','ABUT')

        IF (LINBPS(ILIN).EQ.'9600 ') BPS = '9.6'
        IF (LINBPS(ILIN).EQ.'4800 ') BPS = '4.8'
        IF (LINBPS(ILIN).EQ.'56KB ') BPS = '56 '

        CALL MESSAG(BPS,3,'ABUT','ABUT')






 90     RETURN
        END

C                                                               PAGE 10
C  THIS SUBROUTINE PLOTS THE NODE NUMBER FOR LINES GOING OUT OF SITE


        SUBROUTINE OUTNOD(X,Y,IFLAG)

        IMPLICIT INTEGER (A-Z)


        COMMON /OUTSYT/NUMOUT(100),NODOUT
        REAL X(2),Y(2)



        CALL HEIGHT(0.0975)
        CALL ANGLE(35.)
        IF (IFLAG.EQ.1) CALL MESSAG(NODOUT,4,-0.3,Y(2)-0.2)
        IF (IFLAG.EQ.2) CALL MESSAG(NODOUT,4,15.1,Y(2))
        IF (IFLAG.EQ.3) CALL MESSAG(NODOUT,4,X(2)-0.2,-0.3)
        IF (IFLAG.EQ.4) CALL MESSAG(NODOUT,4,X(2),11.04)
        CALL RESET('ANGLE')
        CALL RESET('HEIGHT')


        RETURN
        END


CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                       C
C  SUBROUTINE PLTINF WRITES THE NUMBER OF NODES AND LINES PLOTTED.      C
C                                                                       C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

        SUBROUTINE PLTINF(NUMNOD,NUMLIN)
        INTEGER NUMNOD,NUMLIN
        CALL HEIGHT(0.18)
        CALL MESSAG('NO.OF NODES : ',14,11.5,1.5)
        CALL INTNO(NUMNOD,'ABUT','ABUT')
        CALL MESSAG('NO.OF LINES : ',14,11.5,1.0)
        CALL INTNO(NUMLIN,'ABUT','ABUT')
        CALL RESET('HEIGHT')
        RETURN
        END

C                                                               PAGE 11


CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                      C
C  SUBROUTINE ENDPLT ENDS THE CURRENT PLOT                             C
C                                                                      C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


        SUBROUTINE ENDPLT


C  FRAME THE PLOT

        CALL FRAME


C  END THE PLOT

        CALL ENDGR(0)

        CALL ENDPL(0)

        RETURN
        END

C                                                               PAGE 12

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                       C
C  SUBROUTINE DONPLT TERMINATES THE PLOTTING                            C
C                                                                       C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

        SUBROUTINE DONPLT


C       CALL DONEPL


        RETURN
        END

    