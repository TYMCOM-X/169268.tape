COPY (PCORCORAN)PLPT.LST      , (NETENG)PLPT.LST
R TELECOPY
RUN
(NETENG:38)PLPT.LST
(NETENG:40)PLPT
QUIT
DELETE (NETENG)PLPT.LST
TYPE SNDFIL.LOG
 
    