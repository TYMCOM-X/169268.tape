***********************************************************************
*                                                                     *
*                L88DET.F4  VER.2     J.JOELS    FEB.,19              *
*                                                                     *
*       THIS PROGRAM COLLECTS ACCOUNTING DATA FOR LOCKHEED'S          *
*       HOST 88. IT GATHERS THE DATA FROM THE DAILY NETWORK STATISTICS*
*       FILES IN THE NETSTAT DIRECTORY, ADDS THE NODE AND PORT        *
*       CODE FOR EACH RECORD, AND THEN OUTPUTS THE DATA IN DETAIL     *
*       FORMAT.                                                       *
*                                                                     *
***********************************************************************

        INTEGER SDAY(2),EDAY(2),NUMDAY,IDAY(2),SCR(10),FLENAM(4)
     X  ,DATA(19),USRNAM(5),VALNAM(3),CHAR,NEWNAM(5),OUTFLE(2)
     X  ,DAY1,DAY2,RECNO,TOTREC,DAYNAM(2)

        CALL DBF10

        IFIRST=0
        RECNO=0
        TOTREC=0
        IDET=0

*       ** INPUT COMMAND

75      TYPE 80
80      FORMAT (1X,': ',$)
        ACCEPT 85,ICOM
85      FORMAT (A3)

        IF (ICOM.EQ.'RUN') GO TO 95
        IF (ICOM.EQ.'RES') GO TO 150
        TYPE 87
87      FORMAT (/,1X,'VALID COMMANDS ARE: ',
     X          /,1X,'RUN',
     X          /,1X,'RESTART',/)
        GO TO 75

*       INPUT START AND END DATES

95      TYPE 100
100     FORMAT (1X,'ENTER START DATE AS YYMMDD: ',$)
105     ACCEPT 110,SDAY(1),SDAY(2)
110     FORMAT (I5,I1)
        TYPE 120
120     FORMAT (1X,'ENTER END DATE AS YYMMDD: ',$)
        ACCEPT 110,EDAY(1),EDAY(2)

*       INPUT OUTPUT FILE NAME

        TYPE 130
130     FORMAT (1X,'OUTPUT TO: ',$)
        ACCEPT 140,OUTFLE(1),OUTFLE(2)
140     FORMAT (2A5)

*       ** OPEN CONTROL FILE AND OUTPUT STARTDATE,ENDDATE, AND 
*          OUTPUT FILE NAME.

        OPEN (21,'L88.CTL',OUTPUT)
        WRITE (21,145)SDAY(1),SDAY(2),EDAY(1),EDAY(2),OUTFLE(1),
     XOUTFLE(2),TOTREC,IDET
145     FORMAT (2(I5,I1,1X),2A5,1X,I6,1X,I6)
        CLOSE (21)

*       ** DELETE 'COPY', 'TOTALS' AND 'DELETE' FILES

        CALL RENAME('L88','CPY',0,0,0,ICERR)
        CALL RENAME('L88','DEL',0,0,0,IDERR)
        CALL RENAME('L88','TOT',0,0,0,ITERR)

        GO TO 170

*       ** COMMAND EQ 'RES', OPEN CONTROL FILE AND READ STARTDAY,ENDDAY
*          OUTPUT FILE NAME,NUM. OF RECS PROCESSED, AND NUM. OF RECS
*         PLACED IN DETAIL FILE.

150     OPEN (21,'L88.CTL',INPUT,ERR=600)
        READ (21,145)SDAY(1),SDAY(2),EDAY(1),EDAY(2),OUTFLE(1),OUTFLE(2)
     X,TOTREC,IDET
        CLOSE (21)
        IFIRST=1

*       DETERMINE # OF DAYS TO PROCESS

170     ENCODE (5,201,LL)SDAY(1)
        DECODE (5,202,LL)(SCR(I),I=1,5)
        DAY1=(SCR(5)*10)+SDAY(2)
        ENCODE (5,201,LL)EDAY(1)
        DECODE (5,202,LL)(SCR(I),I=1,5)
        DAY2=(SCR(5)*10)+EDAY(2)

        NUMDAY=DAY2-DAY1+1

        IDAY(1)=SDAY(1)
        IDAY(2)=SDAY(2)-1

*       ** OPEN NODE-PORT DATA BASE

        CALL DBOPEN ('(MSGACCT)NODPRT')

*       *************** PROCESS EACH DAY ***************

        DO 500 I=1,NUMDAY

*       BUILD THE INPUT AND OUTPUT FILE NAMES
201     FORMAT (I5)
202     FORMAT (5I1)
203     FORMAT (I1)
205     FORMAT (9H(NETSTAT),6I1,4H.DMS)
206     FORMAT (6I1,4H.L88)

        IDAY(2)=IDAY(2)+1
        IF (IDAY(2).LE.9) GO TO 250
        IDAY(2)=0
        IDAY(1)=IDAY(1)+1
250     ENCODE (5,201,LL)IDAY(1)
        DECODE (5,202,LL)(SCR(J),J=1,5)
        ENCODE (1,203,LL)IDAY(2)
        DECODE (1,203,LL) SCR(6)
        ENCODE (19,205,FLENAM)(SCR(J),J=1,6)
        ENCODE (10,206,DAYNAM)(SCR(J),J=1,6)

*       ** OUTPUT DAY PROCESSING

        TYPE 252,(SCR(IL),IL=1,6)
252     FORMAT (/,1X,'PROCESSING ',6I1)

*       ** UPDATE CONTROL FILE INDICATING NEW FILE TO START WITH
*          IF PROGRAM IS INTERRUPTED.

        OPEN (3,'L88.CTL',OUTPUT,ERR=600)
        WRITE (3,255)(SCR(IL),IL=1,6),EDAY(1),EDAY(2),OUTFLE(1),
     XOUTFLE(2),TOTREC,IDET
255     FORMAT (6I1,1X I5,I1,1X,2A5,1X,I6,1X,I6)
        CLOSE(3)

*       OPEN THE CURRENT FILES

        CALL DBOPEN('NOCLOSE',FLENAM)
        OPEN (22,DAYNAM,OUTPUT,ERR=610)
 
*       FIND ALL REC FOR TERMINATING HOST =88

        CALL DBSET(2)
        CALL DBFIND('TERMHOST','EQ',88)
        CALL DBNREC(RECNO)
        TOTREC=TOTREC+RECNO

*       ***PROCESS EACH RECORD***

300     CALL DBGREC($400)
        DO 310 J=1,19
        CALL DBVAL(J,DATA(J))
310     CONTINUE

*       ** IGNORE AUXILLIARY CIRCUITS

        IF (DATA(4).EQ.0) GO TO 300

*       ** IF ORIGNODE EQ 1170 OR 1020 JUST TOTAL 'TOTMIN' FIELD

        IF (DATA(2).NE.1170.AND.DATA(2).NE.1020) GO TO 320
        ISUM=ISUM+DATA(16)
        GO TO 300

*       READ USERNAM INTO ARRAY

320     CALL DBVAL('USRNAM',USRNAM)

*       ** IF 2ND CHARACTER OF USERNAME IS LT 1 OR GT 9 , GO TO 
*          NEXT RECORD.

        CALL RTC(ICHAR,USRNAM,2)
        IF (ICHAR.LT.'1'.OR.ICHAR.GT.'9') GO TO 300

*       SET HOSTPORT TO 0
        IHP=0

*       SEARCH FOR ';' AND BLANK OUT PROJECT CODE IN USRNAM

        DO 355 JJ=1,5
        NEWNAM(JJ)='     '
355     CONTINUE

        DO 360 II=1,25
        CALL RTC(CHAR,USRNAM,II)
        CALL STC (CHAR,NEWNAM,II)
        IF (CHAR.EQ.';') GO TO 362
360     CONTINUE

*       ** GET THE NODE AND PORT CODE

362     CALL DBSET(1)
        CALL DBFIND ('NODNUM','EQ',DATA(2),'AND','PRTNUM','EQ',DATA(3))
        CALL DBGREC($365)
        CALL DBVAL ('NODCOD',INCODE,'PRTCOD',IPCODE)
        GO TO 370

365     INCODE=99
        IPCODE=99

370     CALL DBSET(2)
        WRITE (22,380)DATA(1),DATA(17),DATA(9),DATA(10),DATA(4)
     X,DATA(6),DATA(2),INCODE,DATA(3),IPCODE,DATA(16),DATA(11),DATA(13)
     X,DATA(7),IHP,(NEWNAM(L),L=1,5)
380     FORMAT(I7,I2,I6,I4,I2,I3,I4,I2,I3,I2,I6,I7,I7,2I5,5A5)
*       ** INCREMENT DETAIL FILE COUNTER

        IDET=IDET+1


        GO TO 300

400     CALL DBCLOSE
        CLOSE(22)

*       ** WRITE OUT 'COPY' COMMAND TO COPY FILE

        OPEN (3,'L88.CPY',RANDOUT,ERR=620)
        ISIZE=SIZE(3)
        ISIZE=ISIZE+1
        IF (IFIRST.NE.0) GO TO 385
        WRITE (3#ISIZE,382)(DAYNAM(IL),IL=1,2),(OUTFLE(IL),IL=1,2)
382     FORMAT (2A5,',',2A5)
        IFIRST=1
        GO TO 387

385     WRITE (3#ISIZE,386)(OUTFLE(IL),IL=1,2),(DAYNAM(IL),IL=1,2),
     X(OUTFLE(IL),IL=1,2)
386     FORMAT (2A5,'+',2A5,'=',2A5)
387     CLOSE(3)


*       ** WRITE OUT DELETE COMMAND TO DELETE FILE

        OPEN (3,'L88.DEL',RANDOUT,ERR=630)
        ISIZE=SIZE(3)
        ISIZE=ISIZE+1
        WRITE (3#ISIZE,390)(DAYNAM(IL),IL=1,2)
390     FORMAT (2A5)
        CLOSE(3)

*       ** OPEN 'L88.TOT' AND WRITE OUT TOTAL MINUTES FOR NODE 1170
*          AND 1020

        OPEN (3,'L88.TOT',RANDOUT,ERR=640)
        ISIZE=SIZE(3)
        ISIZE=ISIZE+1
        WRITE (3#ISIZE,410)(SCR(IL),IL=1,6),ISUM
410     FORMAT (6I1,9X,I10)
        CLOSE (3)

        ISUM=0


500     CONTINUE

        CLOSE (22)

*       ** OPEN 'L88.TOT' AND SUM TOTAL MINUTES FOR ALL DAYS. WRITE
*          THIS TOTAL OUT.

        OPEN (3,'L88.TOT',RANDIO,ERR=640)
        ISIZE=SIZE(3)
        LPOS=ISIZE+1
        IPOS=1
        ITOT=0

505     READ (3#IPOS,510,END=520)ISUM
510     FORMAT (15X,I10)
        ITOT=ITOT+ISUM
        IPOS=IPOS+27
        GO TO 505

520     WRITE (3#LPOS,525)ITOT
525     FORMAT (/,'TOTAL: ',8X,I10)
        CLOSE (3)

        TYPE 550,TOTREC,IDET
550     FORMAT(//,1X,'TOTAL SESSIONS PROCESSED= ',I10,
     X       /,1X,'TOTAL RECORDS IN DETAIL FILE= ',I10,//)
        GO TO 700

*       FILE ERRORS
600     TYPE 605
605     FORMAT(1X,'UNABLE TO OPEN FILE: L88.CTL')
        GO TO 700

610     TYPE 615,(DAYNAM(IL),IL=1,2)
615     FORMAT (1X,'UNABLE TO OPEN; ',2A5)
        GO TO 700

620     TYPE 625
625     FORMAT (/,1X,'UNABLE TO OPEN: L88.CPY')
        GO TO 700

630     TYPE 635
635     FORMAT (/,1X,'UNABLE TO OPEN: L88.DEL')
        GO TO 700

640     TYPE 645
645     FORMAT (/,1X,'UNABLE TO OPEN: L88.TOT')
        GO TO 700



700     CALL DBEND



        CALL EXITPE
        END
 