      SUBROUTINE QQSYSM(IBASE,IDEV,IDIR)
      DIMENSION IDIR(3)
      IBASE=19
C                                     IBASE=1ST UNIT#-1
      IDEV=4HDSK 
C                                     IDEV=DEVICE FOR MAP FILES
      IDIR(1)="1 
      IDIR(2)="4
      IDIR(3)=0
C                                    IDIR=DIRECTORY FOR MAP FILES
      RETURN
      END
