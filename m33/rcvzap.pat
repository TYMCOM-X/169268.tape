 "\RCVZAP.PAT 16-Nov-87 Patch to zero the output bits on a zap.\
 "\Use RCVZAP.RUN to patch a running P035/C monitor.  /JMS\
SCNSER:
PAT/AOS NZAPIN
PAT+1/SETZM LDBOUT(U)
PAT+2/JRST RCVZAP+1
RCVZAP/JRST PAT
PAT+3/PAT:
PATSIZ/PAT
COMMON:
PATMAP[Q+200000000000
CONFIG+2T/"/05-1 /

     