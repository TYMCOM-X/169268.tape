:SPOOL.OUT
:DEFINE A='TTY',B='SMALL',C='FULLCH'
:FIND A,B,C
TYPE SPOOL.FRM
:PAUSE
SPOOL
SPOOL
N
ED GAUCI
LISTINGS
7679
:IF A THEN GO TYPA
:IF B THEN GO SMAPA
LARGE
:GO GOON
::TYPA
TTY
:GO GOON
::SMAPA
SMALL
::GOON
1
:IF C THEN GO FULLC
CENTER
:GO NFULLC
::FULLC
CENTER,FULLCH
::NFULLC
PICK
PLEASE HOLD IN BLDG 'C' (SRA SHELF).
HAVE READY BY 07:00.@SPOOL.FIL
N
Q
    