        SUBROUTINE GETFIL (NODFIL,LINFIL,LINPLT)

        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NODE(200,2),NODV(200),NODH(200),
     -                 NODLNG(200),NODLAT(200),NUMNOD
        REAL NODLNG,NODLAT


        COMMON /LINES/ LINN1(800,2),LN1LNG(800),LN1LAT(800),
     -                 LINN2(800,2),LN2LNG(800),LN2LAT(800),NUMLIN
        REAL LN1LNG,LN1LAT,LN2LNG,LN2LAT

        DIMENSION NODFIL(4),LINFIL(4)





C  READ THE NODES FROM NODFIL


        OPEN (UNIT=21,DEVICE='DSK',FILE=NODFIL,ACCESS='SEQIN')
        I = 1
 100    READ (21,105,END=160,ERR=150) (NODE(I,K),K=1,2),NODV(I),NODH(I)
 105    FORMAT (2A5,1X,I5,1X,I5)

        I = I + 1
        GO TO 100


 150    WRITE (5,155) I
 155    FORMAT (/,1X,'ERROR WHILE READING NODE FILE AT LINE ',I4)
        STOP



 160    NUMNOD = I - 1
        CLOSE (UNIT=21)



        WRITE (5,170) NUMNOD
 170    FORMAT (/,1X,'READ ',I4,' NODES')






        IF (LINPLT.EQ.'N') GO TO 300


C  READ LINES FROM LINFIL


        OPEN (UNIT=21,DEVICE='DSK',FILE=LINFIL,ACCESS='SEQIN')
        I = 1
 200    READ (21,205,END=260,ERR=250) (LINN1(I,K),K=1,2),(LINN2(I,K),
     -                                                    K=1,2)
 205    FORMAT (2A5,1X,2A5)

        I = I + 1
        GO TO 200



 250    WRITE (5,255) I
 255    FORMAT (/,1X,'ERROR WHILE READING LINE FILE AT LINE ',I4)
        STOP



 260    NUMLIN = I - 1
        CLOSE (UNIT=21)



        WRITE (5,265) NUMLIN
 265    FORMAT (/,1X,'READ ',I4,' LINES')





 300    RETURN
        END

        SUBROUTINE PUTFIL (NODFIL,LINFIL)


        IMPLICIT INTEGER (A-Z)

        COMMON /NODES/ NODE(200,2),NODV(200),NODH(200),
     -                 NODLNG(200),NODLAT(200),NUMNOD
        REAL NODLNG,NODLAT


        COMMON /LINES/ LINN1(800,2),LN1LNG(800),LN1LAT(800),
     -                 LINN2(800,2),LN2LNG(800),LN2LAT(800),NUMLIN
        REAL LN1LNG,LN1LAT,LN2LNG,LN2LAT


        DIMENSION NODFIL(4),LINFIL(4)





        RETURN
        END
