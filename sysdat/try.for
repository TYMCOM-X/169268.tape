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
          STOP
          END


  