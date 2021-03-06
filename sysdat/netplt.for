        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NODE(400,2),NODV(400),NODH(400),
     -                 NODLNG(400),NODLAT(400),NUMNOD

        REAL NODLNG,NODLAT


        COMMON /LINES/ LINN1(2500,2),LN1LNG(2500),LN1LAT(2500),
     -                 LINN2(2500,2),LN2LNG(2500),LN2LAT(2500),NUMLIN,
     -                 LINBW(2500)

        COMMON /OPTION/ USMAP

        REAL LN1LNG,LN1LAT,LN2LNG,LN2LAT


        DIMENSION NODFIL(4),LINFIL(4),TITLE(6)
        REAL XLONG,YLAT







C  GET THE TERMINAL TYPE

 50     WRITE (5,55)
 55     FORMAT (/,1X,'TYPE OF TERMINAL YOU ARE ON',
     -          /,1X,'     1. TEKTRONICS    OR',
     -          /,1X,'     2. HP 7220 ?     (ENTER "1" OR "2")   : ',$)

        READ (5,60) ITML
 60     FORMAT (A1)

        IF (ITML.NE.'1'.AND.ITML.NE.'2') GO TO 50



C  FIND OUT IF A US MAP IS TO BE SUPERIMPOSED ON THE PLOT

 61     WRITE (5,62)
 62     FORMAT (/,1X,'DO YOU WANT A US MAP SUPERPOSED ON THE PLOT ', 
     +          /,1X,'(THIS OPTION CURRENTLY DOES NOT WORK ON THE',
     +          /,1X,'HEWLETT PACKARD PLOTTER, SO BETTER SAY YES ',
     +          /,1X,'IF YOU ARE ON THAT PLOTTER OTHERWISE THE   ',
     +          /,1X,'PROGRAM WILL CRASH) ? ',20X,': ',$)        

        READ (5,63) USMAP
 63     FORMAT(A1)
        type 56,usmap
 56     format(' value of variable usmap:',a1)

        IF (USMAP.NE.'Y'.AND.USMAP.NE.'N') GO TO 61






C  FIND OUT IF LINES ARE TO BE PLOTTED

 70     WRITE (5,75)
 75     FORMAT (/,1X,'DO YOU WANT TO PLOT LINES ?',
     -          /,1X,'    (YES OR NO)                            : ',$)

        READ (5,76) LINPLT
 76     FORMAT (A1)

        IF (LINPLT.NE.'Y'.AND.LINPLT.NE.'N') GO TO 70

        IF (LINPLT.EQ.'N') GO TO 80






C  FIND OUT IF LINE BANDWIDTH IS TO BE PLOTTED

 77     WRITE (5,78) 
 78     FORMAT (/,1X,'DO YOU WANT LINE BANDWIDTH TO BE PLOTTED?  : ',$)

        READ (5,79) BWFLG
 79     FORMAT (A1)

        IF (BWFLG.NE.'Y'.AND.BWFLG.NE.'N') GO TO 77
        






C  GET THE TITLE FOR THE PLOT

 80     WRITE (5,85)
 85     FORMAT(/,1X,'ENTER TITLE FOR THE PLOT                   : ',$)
        READ (5,86) TITLE
 86     FORMAT (6A5)






C  GET THE FILE NAME FOR NODES

 100    WRITE (5,101)
 101    FORMAT (/,1X,'ENTER THE FILE NAME FOR NODES              : ',$)
        READ (5,102) NODFIL
 102    FORMAT (4A5)


         OPEN (UNIT=21,DEVICE='DSK',FILE=NODFIL,ACCESS='SEQIN',ERR=103)
         CLOSE (UNIT=21)
        GO TO 105


 103    WRITE (5,104)
 104    FORMAT (/,1X,'FILE NOT PRESENT')
        GO TO 100






 105    IF (LINPLT.EQ.'N') GO TO 120


C  GET THE FILE NAME FOR LINES


 106    WRITE (5,107)
 107    FORMAT (/,1X,'ENTER THE FILE NAME FOR LINES              : ',$)
        READ (5,108) LINFIL
 108    FORMAT (4A5)


         OPEN (UNIT=21,DEVICE='DSK',FILE=LINFIL,ACCESS='SEQIN',ERR=109)
         CLOSE (UNIT=21)
        GO TO 120


 109    WRITE (5,110)
 110    FORMAT (/,1X,'FILE NOT PRESENT')
        GO TO 106














C  READ FROM INPUT FILES


 120    CALL GETFIL (NODFIL,LINFIL,LINPLT)





C  COMPUTE LONGITUDE, LATTITUDE FROM V,H CO-ORDINATES


        DO 150 I=1,NUMNOD

          IVERT = NODV(I)
          IHORZ = NODH(I)


          CALL CNVRT4 (IVERT,IHORZ,XLONG,YLAT)


          NODLNG(I) = -XLONG
          NODLAT(I) =  YLAT

 150    CONTINUE



        IF (LINPLT.EQ.'N') GO TO 200



C  GET LONGITUDE, LATTITUDE FOR EACH END OF ALL LINES

        DO 180 I=1,NUMLIN

          DO 160 J=1,NUMNOD
            IF (LINN1(I,1).NE.NODE(J,1).OR.LINN1(I,2).NE.NODE(J,2))
     -                                                        GO TO 160
               LN1LNG(I) = NODLNG(J)
               LN1LAT(I) = NODLAT(J)
               GO TO 165
 160      CONTINUE

C         WRITE (5,161) (LINN1(I,K),K=1,2),(LINN2(I,K),K=1,2)
 161      FORMAT (/,1X,'NODE1 FOR THE LINE "',2A5,'-',2A5,' NOT IN',
     -                 ' THE NODE LIST')




 165      DO 170 J=1,NUMNOD
            IF (LINN2(I,1).NE.NODE(J,1).OR.LINN2(I,2).NE.NODE(J,2))
     -                                                       GO TO 170
               LN2LNG(I) = NODLNG(J)
               LN2LAT(I) = NODLAT(J)
               GO TO 180
 170      CONTINUE

C         WRITE (5,171) (LINN1(I,K),K=1,2),(LINN2(I,K),K=1,2)
 171      FORMAT (/,1X,'NODE2 FOR THE LINE "',2A5,'-',2A5,' NOT IN',
     -                 ' THE NODE LIST')


 180    CONTINUE








C  INITIALIZE THE PLOTTER


 200    CALL INITL (ITML,TITLE)




C  PLOT NODES AND LINES

        CALL MARKER (9) 
        CALL PLOT (ITML,LINPLT,BWFLG)










C       CALL MOVE

C       CALL PUTFIL





        STOP
        END


    