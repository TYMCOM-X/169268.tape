SYS
TTY LC
FTMAGNUM
NOTE 'BEGINNING CKSUM.COM...'
OUTPORT PROC.PDP
SEND OUTPUT TO BOTH
DIR PROCEDURES
CLEAR OUTPORT
SEND OUTPUT TO TERMINAL
MOD PROC.PDP
FI "-No Text"D
N
1LOAD
CKSUM TEXT 1
1,$M
1
EX
OUTPORT CKSUM.PDP
SEND OUTPUT TO BOTH
DO PROC.PDP
CLEAR OUTPORT
SEND OUTPUT TO TERMINAL
NOTE 'CKSUM.COM COMPLETED...'
QUIT
  