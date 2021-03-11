      SUBROUTINE BEGIN
      TRANS=0.
      CALL TTYFOR
      CALL NOCRLF
      IPASS=-1
      CALL AUXSET(14,IPASS,IERROR)
C                  FETCH LINESPEED IN IPASS
C                       2 - 30 CPS
C                       5 - 120 CPS
C                       OTHER - ERROR
      IF(IERROR.NE.0) GO TO 100
      IF(IPASS.EQ.2) TRANS=30.
      IF(IPASS.EQ.5) TRANS=120.
      IF(TRANS.EQ.0.) GO TO 100
      CALL NOID
      CALL DEVICE(TRANS,0.,1)
      RETURN
 100  TYPE 99
 99   FORMAT(' ERROR IN AUXSET - CONTACT YOUR TYMSHARE REPRESENTATIVE')
      STOP
      END
    