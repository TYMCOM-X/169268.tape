	SUBROUTINE STATUS(PLAYS,DNUM)
	IMPLICIT INTEGER (A-Z)
	DOUBLE PRECISION PLAYER(6)
	DIMENSION NATION(45),TERR(6,42)
	DIMENSION C(42),AMOUNT(6),NHOLD(6)
	COMMON /PLAYER/PLAYER
	COMMON /NATION/NATION/C/C/AMOUNT/AMOUNT/TERR/TERR/NHOLD/NHOLD
	TYPE 10,PLAYS,PLAYER(PLAYS)
10	FORMAT(//1X,'Status on player #',I2,': ',A10)
	IF (NHOLD(PLAYS).GT.0) TYPE 20,NHOLD(PLAYS)
20	FORMAT(1X,'You have ',I1,' cards in your hand')
	CALL CNTARM(PLAYS,DNUM)
	TYPE 30,(TERR(PLAYS,Y),C(INDEX(TERR(PLAYS,Y))),
	1Y=1,AMOUNT(PLAYS))
30	FORMAT(5(1X,A5,I4,2X))
	TYPE 60,AMOUNT(PLAYS)
60	FORMAT(1X,'Total of',I3,' countries')
	RETURN
	END
 