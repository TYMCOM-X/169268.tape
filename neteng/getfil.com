R TELECOPY
RUN
(NETENG:40)PLPT.OUT
(NETENG:38)COST.LST
QUIT
COPY (NETENG)COST.LST, (PCORCORAN)COST.LST      
DELETE (NETENG)COST.LST
TYPE GETFIL.LOG
 
