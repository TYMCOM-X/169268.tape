

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                        C
C  SUBROUTINE GETDMS GETS THE NODE AND LINE INFORMATION FROM THE         C
C  "CKTS.DMI" FILE UNDER (NETSTAT:28). THIS FILE IS TELECOPIED FROM      C
C  (NETDB:56) EVERY DAY BY A PERP JOB IN (NETSTAT:56).                   C
C                                                                        C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


        SUBROUTINE GETDMS (SITEID,OUTFLG)

        IMPLICIT INTEGER (A-Z)
        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY
        COMMON /LINES/ NUMLIN,LINN1(200),LINN2(200),LINNAM(4,200),
     -                 LINBPS(200),LINGRP(200),N1TYP(200,3),N2TYP(200,3)
     -                ,N2SITE(200)
        DIMENSION DMSFIL(4)
        DIMENSION ND1TYP(3),ND2TYP(3),CCT(4)



        DMSFIL(1) = '(NETS'
        DMSFIL(2) = 'TAT)C'
        DMSFIL(3) = 'KTS.D'
        DMSFIL(4) = 'MI   '



        OPEN(UNIT=21,DEVICE='DSK',FILE=DMSFIL,ACCESS='SEQIN')



        NUMNOD = 0
        NUMLIN = 0
        LINCTR = 1
        FLAG   = 0

        DO 5 I=1,100
          NODX(I) = 0.0
          NODY(I) = 0.0
 5      CONTINUE




 10     READ (21,20,END=100,ERR=90) ND1,ND1TYP,ID1,ND2,ND2TYP,ID2,
     -                              CCT,BAUD
 20     FORMAT (2X,A4,1X,3A5,41X,I4,15X,A4,1X,3A5,41X,I4,13X,4A5,1X,A5)



        IF (ID1.NE.SITEID.AND.FLAG.EQ.1) GO TO 100

        IF (ID1.NE.SITEID) GO TO 40

        IF (ID2.NE.SITEID.AND.OUTFLG.EQ.'N') GO TO 40

        FLAG = 1

          NUMLIN = NUMLIN + 1

          LINN1(NUMLIN) = ND1
          LINN2(NUMLIN) = ND2
          N2SITE (NUMLIN)   = ID2
          LINBPS(NUMLIN)= BAUD


          DO 25 J=1,NUMNOD
            IF (ND1.EQ.NODNAM(J)) GO TO 26
 25       CONTINUE


          NUMNOD = NUMNOD + 1
          NODNAM(NUMNOD) = ND1


 26       IF (ID2.NE.SITEID) GO TO 28

          DO 27 J=1,NUMNOD
            IF (ND2.EQ.NODNAM(J)) GO TO 28
 27       CONTINUE


          NUMNOD = NUMNOD + 1
          NODNAM(NUMNOD) = ND2


 28       DO 30 J=1,3
            N1TYP(NUMLIN,J) = ND1TYP(J)
            N2TYP(NUMLIN,J) = ND2TYP(J)
 30       CONTINUE



          DO 35 J=1,4
            LINNAM(J,NUMLIN) = CCT(J)
 35       CONTINUE


 40     LINCTR = LINCTR + 1

        GO TO 10




 90     TYPE 95
 95     FORMAT (' ERROR DURING INPUT',/)
        STOP




 100    LINCTR = LINCTR - 1

        TYPE 110, LINCTR
 110    FORMAT (1X,'READ ',I5,' LINES FROM INPUT FILE',//)




C       DO 130 I=1,NUMLIN
C         TYPE 120, LINN1(I),(N1TYP(I,J),J=1,3),
C    -              LINN2(I),(N2TYP(I,J),J=1,3),N2SITE(I),
C    -              (LINNAM(J,I),J=1,4),LINBPS(I)
C120      FORMAT (1X,A4,1X,3A5,3X,A4,1X,3A5,3X,I4,3X,4A5,2X,A5)
C130    CONTINUE




C       DO 150 J=1,NUMNOD
C         TYPE 140,NODNAM(J)
C140      FORMAT (1X,A4)
C150    CONTINUE


        CLOSE (UNIT=21)
        RETURN
        END

C                                                               PAGE 2


CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                        C
C                                                                        C
C  SUBROUTINE SAVDMS SAVES THE TOPOLOGY OBTAINED FROM 'DMSFIL' IN TWO    C
C  FILES - THE FIRST FILE WILL HAVE THE DIFFERENT NODES PLOTTED WITH     C
C  THEIR X,Y CO-ORDINATES FROM THE FINAL PLOT; THE SECOND FILE WILL HAVE C
C  ALL THE LINE INFORMATION.                                             C
C                                                                        C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


        SUBROUTINE SAVDMS

        IMPLICIT INTEGER (A-Z)
        COMMON /NODES/ NUMNOD,NODNAM(100),NODX(100),NODY(100)
        REAL NODX,NODY
        COMMON /LINES/ NUMLIN,LINN1(200),LINN2(200),LINNAM(4,200),
     -                 LINBPS(200),LINGRP(200),N1TYP(200,3),
     -                 N2TYP(200,3),N2SITE(200)
        DOUBLE PRECISION IFILE,JFILE




 5      WRITE (5,10)
 10     FORMAT(/,1X,'ENTER FILE NAME FOR NODES                  : ',$)

        READ(5,15) IFILE
 15     FORMAT(A10)


        WRITE (5,20)
 20     FORMAT(/,1X,'ENTER FILE NAME FOR LINES                  : ',$)

        READ (5,15) JFILE



        OPEN(UNIT=21,DEVICE='DSK',FILE=IFILE,ACCESS='SEQOUT')

        DO 40 I=1,NUMNOD
          WRITE(21,35) NODNAM(I),NODX(I),NODY(I)
 35       FORMAT (A4,1X,F5.2,1X,F5.2)
 40     CONTINUE

        CLOSE(UNIT=21)



        OPEN(UNIT=21,DEVICE='DSK',FILE=JFILE,ACCESS='SEQOUT')

C       DO 60 I=1,NUMLIN
C         WRITE(21,50) LINN1(I),(N1TYP(I,J),J=1,3),
C    -                 LINN2(I),(N2TYP(I,J),J=1,3),
C    -                 N2SITE(I),(LINNAM(J,I),J=1,4),LINBPS(I)
C50       FORMAT(2X,A4,1X,3A5,3X,A4,1X,3A5,1X,I4,2X,4A5,1X,A5)
C
C60     CONTINUE



        DO 60 I=1,NUMLIN
          WRITE(21,50) LINN1(I),LINN2(I),(LINNAM(J,I),J=1,4),
     -                 LINBPS(I)
 50       FORMAT (A4,1X,A4,1X,4A5,1X,A5)
 60     CONTINUE


        CLOSE(UNIT=21)





        RETURN
        END
    