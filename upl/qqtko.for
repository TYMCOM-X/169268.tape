      SUBROUTINE QQTKO(IB7)
      COMMON/QQTKOM/KXY(10),IMODE,INBUF,LBUF
      DIMENSION IBUF(72)
      IB=IB7
C     CALL TOUTPT(IB)
      INBUF=INBUF+1
      IBUF(INBUF)=IB
      IF(IB.NE.31) RETURN
C     CALL TSEND
      WRITE(5,2001) (IBUF(JJ),JJ=1,INBUF)
 2001 FORMAT(1H ,80R1)
      INBUF=0
      RETURN
      ENTRY QQTKI(IB7)
      IB=64
      READ(5,100,END=30,ERR=30) IB
 100  FORMAT(1A1)
 30   CONTINUE
      IB7=IB
      RETURN
      END
 