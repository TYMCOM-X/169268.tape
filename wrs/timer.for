      DIMENSION DAY(2),X(1),ITYME(4)
      INTEGER TYME,TEMPTM,RUNTYM
      CALL DATE(DAY)
      CALL TIME(X)
      DECODE(5,5,X(1))ITYME
   5  FORMAT(2I1,1X,2I1)
      TYME = ITYME(1)*1000 + ITYME(2)*100 + ITYME(3)*10 + ITYME(4)
      DO 1000 ICNT=1,10
      WRITE(5,55)
  55  FORMAT(' ',/)
1000  CONTINUE
      WRITE(5,56)TYME,DAY
  56  FORMAT(' ','BEGINNING 20 MINUTE WAIT AT ',I4,2X,2A5,//)
      ITYME(3) = ITYME(3) + 2
      IF( ITYME(3) .LT. 6 ) GO TO 10
      ITYME(2) = ITYME(2) + 1
      ITYME(3) = 0
  10  RUNTYM = ITYME(1)*1000 + ITYME(2)*100 + ITYME(3)*10 + ITYME(4)
  30  IF( TYME .GE. RUNTYM ) GO TO 40
      CALL TIME(X)
      DECODE(5,5,X(1))ITYME
      TYME = ITYME(1)*1000 + ITYME(2)*100 + ITYME(3)*10 + ITYME(4)
      GO TO 30
  40  WRITE(5,20)TYME,DAY
  20  FORMAT(' ','EXITING WAIT AT ',I4,2X,2A5)
      STOP 
      END
 