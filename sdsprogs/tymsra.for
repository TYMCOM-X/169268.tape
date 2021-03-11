CCCCC
C                                 TYMSRA
      SUBROUTINE TYMSRA(N, VEC, PERMU)
C     REMARKS :
C       THIS ROUTINE SORTS REALS IN ASCENDING ORDER. PERMU(I) = J
C       MEANS VALUE NOW IN POSITION I IN VEC CAME FROM POSITION
C       J .
CCCCC
      REAL    VEC(1000), VBUFF
      INTEGER PERMU(1000), PBUFF, N, MN, II, IC, J
CCCCC
      I = 1
   10 IF(I .GT. N) GOTO 20
        PERMU(I) = I
        I = I + 1
        GOTO 10
   20 CONTINUE
CCCCC
CCCCC
      IF(N .GT. 2) GOTO 30
        IF( N .LE. 1) GOTO 999
        IF( VEC(1) .LE. VEC(2)) GOTO 999
          VBUFF = VEC(1)
          VEC(1) = VEC(2)
          VEC(2) = VBUFF
          PERMU(1) = 2
          PERMU(2) = 1
          GOTO 999
   30 CONTINUE
CCCCC
CCCCC
      II = N/2
   40 IF(II .LT. 2) GOTO 70
        IC = II
        VBUFF = VEC(IC)
        PBUFF = PERMU(IC)
        J = IC + IC
   50   IF(J .GT. N) GOTO 60
          IF(J .LT. N .AND. VEC(J+1) .GT. VEC(J)) J=J+1
          IF(VEC(J) .LE. VBUFF) GOTO 60
            PERMU(IC) = PERMU(J)
            VEC(IC) = VEC(J)
            IC = J
            J = J + 1
            GOTO 50
   60   VEC(IC) = VBUFF
        PERMU(IC) = PBUFF
        II = II - 1
        GOTO 40
   70 CONTINUE
CCCCC
CCCCC
      MN = N
   80 IF(MN .LT. 2)GOTO 110
        IC = 1
        VBUFF = VEC(IC)
        PBUFF = PERMU(IC)
        J = IC + IC
   90   IF(J .GT. MN) GOTO 100
          IF(J .LT. MN .AND. VEC(J+1) .GT. VEC(J)) J=J+1
          IF(VEC(J) .LE. VBUFF) GOTO 100
            PERMU(IC) = PERMU(J)
            VEC(IC) = VEC(J)
            IC = J
            J = J + J
            GOTO 90
  100   VEC(IC) = VBUFF
        PERMU(IC) = PBUFF
        VBUFF = VEC(1)
        VEC(1) = VEC(MN)
        VEC(MN) = VBUFF
        PBUFF = PERMU(1)
        PERMU(1) = PERMU(MN)
        PERMU(MN) = PBUFF
        MN = MN - 1
        GOTO 80
  110 CONTINUE
CCCCC
CCCCC
C                                 EXIT
  999 RETURN
CCCCC
      END
