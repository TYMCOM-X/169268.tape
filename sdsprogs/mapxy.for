C                                                                     C
C                             VERSION 1.0                             C
C                                                                     C
C                                MAPXY.FOR                            C
C                                                                     C
C     GERARD PUOPLO                                   MARCH 12, 1981  C
C                                                                     C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

        SUBROUTINE MAPXY(PLTMAT,ILAST)
   
      COMMON /NODES/ NUMNOD, NODNUM(1000), NODNAM(1000), NODTYP(1000),
     -               NODLON(1000), NODLAT(1000), NODX(1000), NODY(1000)
        DOUBLE PRECISION NODNAM
      INTEGER NUMNOD, NODNUM, NODTYP
      REAL    NODLON, NODLAT, NODX, NODY
   
      COMMON /LINES/ NUMLIN, LINN1(2000), LINN2(2000), LINTYP(2000),
     -               LINBPS(2000), LINGRP(2000), LINNAM(4,2000)
      INTEGER NUMLIN, LINN1, LINN2, LINTYP, LINGRP, LINNAM
      REAL    LINBPS
   
      INTEGER IY, IX, PLTMAT(21,59), NODE, XPERMU(1000), YPERMU(1000),
     -        NX, NY, LSTNX, LSTNY, XCNT, YCNT, XBUF(1000),
     -        YBUF(1000), XCNT2, YCNT2,IPOIN(1000)
      REAL    MINX, MAXX, MINY, MAXY, X, Y, XINC, YINC, XVEC(1000),
     -        YVEC(1000),FCTBID(1000)
      LOGICAL FIRST
      DATA    FIRST/.TRUE./
   
        IF (ILAST.EQ.1) GOTO 100

      DO 1  N=1,NUMNOD
         IF (FIRST) XVEC(N) = NODLON(N)
         IF (.NOT.FIRST) XVEC(N) = NODX(N)
         XPERMU(N) = N
         IF (FIRST) YVEC(N) = NODLAT(N)
         IF (.NOT.FIRST) YVEC(N) = NODY(N)
         YPERMU(N) = N
        TYPE 33,XVEC(N),YVEC(N)
33      FORMAT(1X,F10.5,1X,F10.5)
    1    CONTINUE
   
      FIRST = .FALSE.
   
        CALL QSORT(XVEC,XPERMU,NUMNOD)
        CALL QSORT(YVEC,YPERMU,NUMNOD)
        DO 34 N=1,NUMNOD
        TYPE 33,XVEC(N),YVEC(N)
34      CONTINUE

   
      NX = XPERMU(1)
      NY = YPERMU(1)
      X = 1.0
      Y = 1.0
      NODX(NX) = X
      NODY(NY) = Y
      XCNT = 1
      YCNT = 1
      XBUF(1) = NX
      YBUF(1) = NY
        TYPE 35,NX,NY
35      FORMAT(1X,I4,1X,I4)
   
      DO 6  N=2,NUMNOD
                                          
         LSTNX = NX
         LSTNY = NY
         NX = XPERMU(N)
         NY = YPERMU(N)
          
         IF (XVEC(NX).NE.XVEC(LSTNX)) GOTO 2
            XCNT = XCNT + 1
            XBUF(XCNT) = NX
            G      !)"YRd*?  !H_i%d+        y?gS?  
2  !A+]BnDh  
J^  !SG2"$	  
L}  !-GK
4(  
[m  !>aF(  /^  !<XG9`  R_  !vHq>mH?  xs     q6x?  "^  !?i]Id)      !#?YRd??  !+?i%d?       !8?]%d?   1  !{?a
d3?  !v6GvN   k  !qS
mK?   H  	W?_h    
<  	>G4w(9    _  !>]$h  
MA  !?G&V?  
S1   Xq>mX6  "'     q6x*  "Y  !?i]Id?      !#YRd)?  !*?i%d*       !6?]%d,   1  !U?a
d??  !=?aye`       !y?S:N4(  
(	  !fY&jT  
C+  !B?G2"$  
L|  !(aV24    -  "?q>md@  }/   pCq>l[I  &     q6x?  "V  !?KK;Z       !?i]Id(      !"?YRd??  !(i%d?       !1]%d?   1  !4W\Hr`      !W#CT1447A         19851028     19991231
   FCT1446A         19851028     19991231
   FCT1448A         19851030     19991231
   FCT1005A         19851030     19991231
   FCT1012A         19851031     19991231
   FCT1018A         19851104     19991231
   FCT1020A         19851104     19991231
   FCT1442A         19851106     19991231
   FCT1450A         19851106     19991231
   X2503707         19851108     19991231
   X2503681         19851108     19991231
   FCT1127A         19851127     19991231
   FCT1291A         19851127     19991231
   FCT1330A         19851127     19991231
   FCT1021A         19851203     19991231
   FCT1449A         19851203     19991231
   FCT1253A         19851205     19991231
   FCI12293A        19851205     19991231
   FCT1039A         19851205     19991231
   FCI12115A        19851209     19991231
   FCI12116A        19851209     19991231
   FCI12117A        19851209     19991231
   FCI12118A        19851209     19991231
   FCI12119A        19851209     19991231
   FCI12120A        19851209     19991231
   FCI12121A        19851209     19991231
   FCI12122A        19851209     19991231
   FCI12123A        19851209     19991231
   FCI12124A        19851209     19991231
   FCI12125A        19851209     19991231
   FCI12126A        19851209     19991231
   FCI12127A        19851209     19991231
   FCI12128A        19851209     19991231
   FCI12129A        19851209     19991231
   FCI12130A        19851209     19991231
   FCI12131A        19851209     19991231
   FCI12132A        19851209     19991231
   FCI12133A        19851209     19991231
   FCI12134A        19851209     19991231
   FCI12135A        19851209     19991231
   FCI12136A        19851209     19991231
   FCI12137A        19851209     19991231
   FCI12138A        19851209     19991231
   FCI12139A        19851209     19991231
   FCI12140A        19851209    8
  
                 IF (IX.LT.IFIX(X)) GOTO 30
                 NODX(N) = IX + 0.5
                 NODY(N) = IY + 0.5
                 PLTMAT(IY,IX) = PLTMAT(IY,IX) + 1
                 PLTMAT(IY,59) = PLTMAT(IY,59) + 1
                 PLTMAT(21,IX) = PLTMAT(21,IX) + 1
                 GOTO 50
   30            CONTINUE
   
   40         CONTINUE
   
   50         CONTINUE
  
   60      CONTINUE
        GOTO 999

C
C       THIS PART OF CODE HAS BEEN ADDED TO FIND SOME
C       HOLES AT THE END OF THE POSITIONNEMENT 
C

100     DO 140 IY=1,20
        DO 130 IX=1,58
        IF (PLTMAT(IY,IX).LE.1) GOTO 130

        DO 120 J=IY-1,IY+1
        IF (J.LT.1.OR.J.GT.20) GOTO 120
        DO 110 I=IX-1,IX+1
        IF (I.LT.1.OR.I.GT.58) GOTO 110

        IF (PLTMAT(J,I).NE.0) GOTO 110
        DO 105 N=1,NUMNOD

        IF (NODX(N).NE.IX+0.5.OR.NODY(N).NE.IY+0.5) GOTO 105
        NODX(N)=I+0.5
        NODY(N)=J+0.5
        PLTMAT(IY,IX)=PLTMAT(IY,IX)-1
        PLTMAT(J,I)=1

        IF (PLTMAT(IY,IX).EQ.1) GOTO 130
        GOTO 110

105     CONTINUE

110     CONTINUE

120     CONTINUE

130     CONTINUE

140     CONTINUE

  
  999 RETURN
      END
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C                                                                     C
C                             VERSION 1.0                             C
C                                                                     C
C                                PLT1.FOR                             C
C                                                                     C
C     GERARD PUOPLO                                   MARCH 12, 1981  C
C                                                                     C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      SUBROUTINE PLT1(PLTMAT)
   
      COMMON /NODES/ NUMNOD, NODNUM(1000), NODNAM(1000), NODTYP(1000),
     -               NODLON(1000), NODLAT(1000), NODX(1000), NODY(1000)
        DOUBLE PRECISION NODNAM
      INTEGER NUMNOD, NODNUM, NODTYP
      REAL    NODLON, NODLAT, NODX, NODY
   
      COMMON /LINES/ NUMLIN, LINN1(2000), LINN2(2000), LINTYP(2000),
     -               LINBPS(2000), LINGRP(2000), LINNAM(4,2000)
      INTEGER NUMLIN, LINN1, LINN2, LINTYP, LINGRP, LINNAM
      REAL    LINBPS
   
      INTEGER IY, IX, PLTMAT(21,59)
      REAL    X, Y
   

C     INITIALIZE PLOT.
        CALL TEK(120,1)
        CALL PAGE(16.0,12.0)
        CALL NOBRDR
        CALL PHYSOR(0.5,0.5)
        CALL TITLE('    $',100,'    $',100,'    $',100,12.0,9.0)
        CALL XAXANG(90.0)
        CALL YAXANG(0.0)
        CALL FRAME
        CALL GRAF(0.0,1.0,60.0,0.0,1.0,22.0)
C       CALL DOT
        CALL GRID(1,1)
C       CALL RESET('DOT')
   
C     PLOT THE NODE POSITIONS.
        DO 20  IY=1,21
           DO 10  IX=1,59
              IF (PLTMAT(IY,IX).EQ.0) GOTO 10
              X = IX + 0.3
              Y = IY + 0.8
              CALL HEIGHT(.10)
              CALL ANGLE(-90.0)
              CALL RLINT(PLTMAT(IY,IX),X,Y)
              CALL RESET('HEIGHT')
              CALL RESET('ANGLE')
   10         CONTINUE
   20      CONTINUE
    
      CALL ENDPL(0)
     
      RETURN
      END
