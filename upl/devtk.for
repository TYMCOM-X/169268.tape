      SUBROUTINE DEVICE(X,Y,I)
      DATA IFIRST/0/
      IF(IFIRST.NE.0.OR.I.EQ.999.OR.I.EQ.1) GO TO 10
      CALL QQTK(14.,11.,0)
      IFIRST=1
 10   IF(I.EQ.999) CALL QQTK(0.,0.,-3)
      CALL QQTK(X,Y,I)
      IF(I.EQ.-3) IFIRST=0
      RETURN
      END
 