	DO 20 I=1,10
	TYPE 10,I	!Output message to TTY:
10	FORMAT(' Creating FOR',I2,'.DAT')
	WRITE(I,10)I	!Output same message to DSK:
20	CLOSE(UNIT=I)
	END
   