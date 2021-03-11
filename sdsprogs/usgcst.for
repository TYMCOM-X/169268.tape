************************************************************************
*                                                                      *
*  PROGRAM : USGCST                                                    *
*                                                                      *
*  AUTHOR : G.P.RAVIKUMAR                          DATE : 18-AUG-82    *
*                                                                      *
*                                                                      *
*       THIS PROGRAM CALCULATES A CUSTOMER'S USAGE COSTS UNDER THE     *
*  NEW TYMNET TARIFF EFFECTIVE JULY 1, 1982.  IT ALSO INCORPORATES THE *
*  THE TARIFF CHANGE RESULTING IN A NEW KILOCHARACTER RATE SCHEDULE    *
*  EFFECTIVE FROM SEPTEMBER 1, 1982.                                   *
*                                                                      *
*       THE PROGRAM ACCEPTS INPUT FROM THE USER ABOUT THE CUSTOMER'S   *
*  TRAFFIC PATTERN, AND THEN PRINTS OUT THE CHARGES AS THEY WOULD      *
*  APPEAR ON THE CUSTOMER'S INVOICE.                                   *
*                                                                      *
*                                                                      *
*                                                                      *
*  DICTIONARY OF VARIABLES:                                            *
*  -----------------------                                             *
*                                                                      *
*       AMOUNT(16)      :  THIS ARRAY CONTAINS THE CUSTOMER'S USAGE    *
*                          CHARGE FOR EACH PRODUCT DESCRIPTION         *
*                                                                      *
*       AKCH            :  ADDITIONAL KILOCHARACTERS/MONTH             *
*                           FROM NON-PUBLIC ACCESSES LIKE PAP,DTI,     *
*                           SYNC POLLED TMLS. ETC                      *
*                                                                      *
*       CODE(16)        :  THIS ARRAY HAS THE CODE FOR EACH PRODUCT    *
*                           DESCRIPTION                                *
*                                                                      *
*       FWAT            :  PERCENT OF PUBLIC ACCESS HOURS ON WATS      *
*                                                                      *
*       FHD             :  % OF PUB.ACCESS HRS FROM HIGH DENSITY CITIES*
*                                                                      *
*       FMD             :                 "         MEDIUM   "         *
*                                                                      *
*       FLD             :                 "         LOW      "         *
*                                                                      *
*                                                                      *
*       FOPH            :  % OF PUB.ACCESS HOURS IN THE OFF-PEAK PERIOD*
*                                                                      *
*       FOPAK           :  % OF ADDITIONAL KILOCHARS IN     "
*                                                                      *
*       HOURS(1)        :  LEVEL 1 CONNECT HOURS DURING PEAK PERIOD    *
*                                                                      *
*            (2)        :  LEVEL 2              "                      *
*                                                                      *
*            (3)        :  LEVEL 3              "                      *
*                                                                      *
*            (4)        :  LEVEL 4              "                      *
*                                                                      *
*            (5)        :  PEAK MEDIUM DENSITY HOURS                   *
*                                                                      *
*            (6)        :  PEAK  LOW   DENSITY HOURS                   *
*                                                                      *
*            (7)        :  PEAK  WATS HOURS                            *


*                                                                  PAGE 2
*                                                                      *
*            (8)        :  OFF-PEAK PUB.ACCESS HOURS                   *
*                                                                      *
*            (9)        :     "     MEDIUM DENSITY HOURS               *
*                                                                      *
*            (10)       :     "     LOW    DENSITY HOURS               *
*                                                                      *
*            (11)       :     "     WATS HOURS                         *
*                                                                      *
*       KCHARS(1)       :  LEVEL 1 KILOCHARACTERS IN PEAK PERIOD       *
*                                                                      *
*             (2)       :  LEVEL 2              "                      *
*                                                                      *
*             (3)       :  LEVEL 3              "                      *
*                                                                      *
*             (4)       :  LEVEL 4              "                      *
*                                                                      *
*             (5)       :  OFF-PEAK KILOCHARACTERS                     *
*                                                                      *
*       KCPH            :  AVG. KILOCHARACTERS/HOUR ON PUB.ACCESS PORTS*
*                                                                      *
*       PKKCH           :  PEAK KILOCHARACTERS                         *
*                                                                      *
*       PKHRS           :  PEAK PUBLIC ACCESS HOURS                    *
*                                                                      *
*       PRCENT          :  SUM OF PERCENTAGES FWAT,FHD,FMD,FLD         *
*                                                                      *
*       PRODUC(5,16)    :  CONTAINS THE DIFFERENT PRODUCT DESCRIPTIONS *
*                                                                      *
*       RATE(16)        :  CONTAINS TYMNET TARIFF FOR EACH PROD. DESC. *
*                                                                      *
*       SUM             :  SUM OF OFF-PEAK AMOUNTS                     *
*                                                                      *
*       TOTAL           :  TOTAL CHARGE FOR THE CUSTOMER'S USAGE       *
*       THRS            :  TOTAL HOURS/MONTH ON PUBLIC PORTS           *
*                                                                      *
*                                                                      *
************************************************************************






        IMPLICIT REAL (A-Z)
        DIMENSION RATE(16),AMOUNT(16),HOURS(11),KCHARS(4)
        INTEGER CODE(16),PRODUC(5,16),I,J
        DATA RATE /4.25,3.25,2.50,2.00,2.00,5.00,18.75,1.50,
     -             0.50,1.25,13.00,0.05,0.03,0.02,0.01,0.005/

        DATA CODE /1300,1301,1302,1303,1305,1306,1310,1311,
     -             1312,1313,1319,1335,1336,1337,1338,1339/
        DATA (PRODUC(I,1),I=1,5)/'PEAK CONN LEV 1          '/
        DATA (PRODUC(I,2),I=1,5)/'PEAK CONN LEV 2          '/
        DATA (PRODUC(I,3),I=1,5)/'PEAK CONN LEV 3          '/
        DATA (PRODUC(I,4),I=1,5)/'PEAK CONN LEV 4          '/
        DATA (PRODUC(I,5),I=1,5)/'PEAK MD CONN SURCHG      '/


*                                                                 PAGE 3
        DATA (PRODUC(I,6),I=1,5)/'PEAK LD CONN SURCHG      '/
        DATA (PRODUC(I,7),I=1,5)/'PEAK WATS CONN SURCHG    '/
        DATA (PRODUC(I,8),I=1,5)/'OFF-PEAK CONN            '/
        DATA (PRODUC(I,9),I=1,5)/'OFF-PEAK MD CONN SURCHG  '/
        DATA (PRODUC(I,10),I=1,5)/'OFF-PEAK LD CONN SURCHG  '/
        DATA (PRODUC(I,11),I=1,5)/'OFF-PEAK WATS CONN SURCHG'/
        DATA (PRODUC(I,12),I=1,5)/'PEAK CHARACTER IO LEV 1  '/
        DATA (PRODUC(I,13),I=1,5)/'PEAK CHARACTER IO LEV 2  '/
        DATA (PRODUC(I,14),I=1,5)/'PEAK CHARACTER IO LEV 3  '/
        DATA (PRODUC(I,15),I=1,5)/'PEAK CHARACTER IO LEV 4  '/
        DATA (PRODUC(I,16),I=1,5)/'OFF-PEAK CHARACTER IO    '/





        TYPE 5
 5      FORMAT(1H1,////,20X,'**** WELCOME TO USGCST ****',
     -         ///,1X,'THIS PROGRAM WILL CALCULATE A CUSTOMER''S USAGE',
     -              ' COST UNDER THE  TYMNET  TARIFF',
     -         /,1X,'EFFECTIVE SEP 1,1982, GIVEN NINE INPUTS ',
     -              'DESCRIBING A CUSTOMER''S TRAFFIC ',
     -         /,1X,'PATTERN.  YOU WILL BE PROMPTED FOR ALL INPUTS.  ',
     -              'AFTER ENTERING EACH NUMBER',
     -         /,1X,'HIT CARRIAGE RETURN.',/////)



 10     TYPE 20
 20     FORMAT(/,1X,'ENTER TOTAL HOURS PER MONTH ON PUBLIC PORTS ',
     -           24X,': ',$)
        ACCEPT 30,THRS
 30     FORMAT(G10)



        TYPE 40
 40     FORMAT(/,1X,'ENTER THE PERCENT OF PUBLIC ACCESS HOURS IN THE',
     -              ' OFF-PEAK PERIOD ',4X,': ',$)
        ACCEPT 50,FOPH
 50     FORMAT(G6)



        TYPE 60
 60     FORMAT(/,1X,'ENTER THE AVERAGE KILOCHARACTERS PER HOUR ON ',
     -              'PUBLIC ACCESS PORTS ',3X,': ',$)
        ACCEPT 70,KCPH
 70     FORMAT(G10)



 75     TYPE 80
 80     FORMAT(/,1X,'ENTER THE PERCENT OF PUBLIC ACCESS HOURS ON ',
     -              'WATS ',19X,': ',$)
        ACCEPT 90,FWAT
 90     FORMAT(G6)


*                                                                  PAGE 4
        TYPE 100
 100    FORMAT(/,1X,'ENTER THE PERCENT OF PUBLIC ACCESS HOURS FROM ',
     -              'LOW DENSITY CITIES ',3X,': ',$)
        ACCEPT 110,FLD
 110    FORMAT(G6)


        TYPE 120
 120    FORMAT(/,1X,'ENTER THE PERCENT OF PUBLIC ACCESS HOURS FROM ',
     -              'MEDIUM DENSITY CITIES : ',$)
        ACCEPT 130,FMD
 130    FORMAT(G6)



        TYPE 140
 140    FORMAT(/,1X,'ENTER THE PERCENT OF PUBLIC ACCESS HOURS FROM ',
     -              'HIGH DENSITY CITIES ',2X,': ',$)
        ACCEPT 150,FHD
 150    FORMAT(G6)


C  FIND THE TOTAL OF PERCENTAGES FHD,FMD,FLD,& FWAT

        PRCENT = FWAT + FLD + FMD + FHD


        IF (PRCENT.GE.99.5.AND.PRCENT.LE.100.5) GO TO 160

        TYPE 155,PRCENT
 155    FORMAT(//,1X,'****SUM OF PERCENTAGES OF WATS,LD,MD AND HD',
     -               ' IS',F6.2,';',
     -          /,1X,'    IT SHOULD BE 100.  TRY AGAIN ****',///)
        GO TO 75



 160    TYPE 165
 165    FORMAT(/,1X,'ENTER THE ADDITIONAL KILOCHARACTERS IN ONE ',
     -         /,1X,'MONTH FROM PAP''S, DTI''S, SYNC POLLED ',
     -              'TERMINALS ETC  ',16X,': ',$)
        ACCEPT 170,AKCH
 170    FORMAT(G10)


        FOPAK = 0.0
        IF (AKCH.EQ.0.0) GO TO 250




        TYPE 180
 180    FORMAT(/,1X,'ENTER THE PERCENT OF THESE ADDITIONAL',
     -         /,1X,'KILOCHARACTERS THAT WILL BE IN THE ',
     -              'OFF-PEAK PERIOD  ',16X,': ',$)
        ACCEPT 190,FOPAK
 190    FORMAT(G6)

*                                                                  PAGE 5






C  FIND PEAK PUBLIC ACCESS HOURS

 250    PKHRS = (1.0-(FOPH/100.0))*THRS



C  BREAK OUT PKHRS INTO ITS LEVELS

        HOURS(1)=0.0
        HOURS(2)=0.0
        HOURS(3)=0.0
        HOURS(4)=0.0


        IF (PKHRS.LE.1000.0) GO TO 310
        IF (PKHRS.LE.2000.0) GO TO 320
        IF (PKHRS.LE.5000.0) GO TO 330


        HOURS(1)=1000.0
        HOURS(2)=1000.0
        HOURS(3)=3000.0
        HOURS(4)=(PKHRS-5000.0)
        GO TO 400


 310    HOURS(1)=PKHRS
        GO TO 400


 320    HOURS(1)=1000.0
        HOURS(2)=(PKHRS-1000.0)
        GO TO 400


 330    HOURS(1)=1000.0
        HOURS(2)=1000.0
        HOURS(3)=(PKHRS-2000.0)





C  FIND PEAK MD HOURS

 400    HOURS(5) = PKHRS * (FMD/100.0)


C  FIND PEAK LD HOURS

        HOURS(6) = PKHRS * (FLD/100.0)

*                                                                    PAGE 6


C  FIND PEAK WATS HOURS

        HOURS(7) = PKHRS * (FWAT/100.0)




C  FIND OFF-PEAK PUBLIC ACCESS HOURS

        HOURS(8) = THRS * (FOPH/100.0)


C  FIND OFF-PEAK MD HOURS

        HOURS(9) = HOURS(8) * (FMD/100.0)


C  FIND OFF-PEAK LD HOURS

        HOURS(10) = HOURS(8) * (FLD/100.0)


C  FIND OFF-PEAK WATS HOURS

        HOURS(11) = HOURS(8) * (FWAT/100.0)






C  FIND PEAK KILOCHARACTERS

        PKKCH = (PKHRS*KCPH) + AKCH*(1.0-(FOPAK/100.0))


C  BREAK OUT PKKCH INTO ITS LEVELS


        KCHARS(1)=0.0
        KCHARS(2)=0.0
        KCHARS(3)=0.0
        KCHARS(4)=0.0


        IF (PKKCH.LE.50000.0) GO TO 510
        IF (PKKCH.LE.100000.0) GO TO 520
        IF (PKKCH.LE.200000.0) GO TO 530

        KCHARS(1)=50000.0
        KCHARS(2)=50000.0
        KCHARS(3)=100000.0
        KCHARS(4)=(PKKCH-200000.0)
        GO TO 550


*                                                                  PAGE 7

 510    KCHARS(1)=PKKCH
        GO TO 550


 520    KCHARS(1)=50000.0
        KCHARS(2)=(PKKCH-50000.0)
        GO TO 550


 530    KCHARS(1)=50000.0
        KCHARS(2)=50000.0
        KCHARS(3)=(PKKCH-100000.0)


C  FIND OFF-PEAK KILOCHARACTERS

 550    KCHARS(5) = (HOURS(8)*KCPH) + (AKCH*(FOPAK/100.0))







C  PRINT OUT THE REPORT

 600    TYPE 610
 610    FORMAT(1H1,/////,1X,'PROD CODE',3X,'PRODUCT DESCRIPTION',
     -         10X,'PRICE',10X,'USAGE',11X,'AMOUNT',
     -         /,1X,'---- ----',3X,'------- -----------',
     -          10X,'-----',10X,'-----',11X,'------'//)



        TOTAL = 0.0



        DO 650 I=1,11
          AMOUNT(I) = RATE(I) * HOURS(I)
          TOTAL = TOTAL + AMOUNT(I)
          TYPE 620,CODE(I),PRODUC(1,I),PRODUC(2,I),PRODUC(3,I),
     -             PRODUC(4,I),PRODUC(5,I),RATE(I),HOURS(I),AMOUNT(I)
 650    CONTINUE

 620    FORMAT(/,3X,I4,6X,5A5,2X,F5.2,'/HR',3X,F10.2,' HRS',2X,F12.2)







*                                                                    PAGE 8
        DO 700 I=12,16
          AMOUNT(I) = RATE(I) * KCHARS(I-11)
          TOTAL = TOTAL + AMOUNT(I)
          TYPE 680,CODE(I),PRODUC(1,I),PRODUC(2,I),PRODUC(3,I),
     -             PRODUC(4,I),PRODUC(5,I),RATE(I),KCHARS(I-11),
     -             AMOUNT(I)
 700    CONTINUE

 680    FORMAT(/,3X,I4,6X,5A5,1X,F5.3,'/KCH',1X,F12.2,' KCHRS',F12.2)





C  PRINT OUT THE TOTAL USAGE CHARGES

        TYPE 750,TOTAL
 750    FORMAT(///,13X,'TOTAL USAGE CHARGES',34X,'$',F12.2)



C  CHECK IF THE USER COULD SAVE MONEY USING LEISURE TYME

        SUM = AMOUNT(8) + AMOUNT(9) + AMOUNT(10) + AMOUNT(16)


        IF (SUM.LT.5000.0) GO TO 800

C  OTHERWISE PRINT A MESSAGE

        TYPE 770
 770    FORMAT(////,10X,'NOTICE : CUSTOMER CAN SAVE $ BY SWITCHING',
     -          /,10X, '         TO LEISURE TYME BILLING.')





 800    TYPE 820
 820    FORMAT(1H1,///)


 830    TYPE 840
 840    FORMAT(//,1X,'DO YOU WANT TO RUN ANOTHER ESTIMATE?',
     -               /,1X,'          (Y OR N)                  : ',$)
        ACCEPT 850,IANS
 850    FORMAT(A1)


        TYPE 860
 860    FORMAT(/////)


        IF (IANS.EQ.'Y') GO TO 10
        IF (IANS.NE.'N') GO TO 830

        STOP
        END
  