:          FILE:  CONSAT
:   KERNAL HOST:  2666
:      INITIALS:  TCK
:*************************************************************************

:       Declare target node, slot
        LOCATION(2620,2)

:       Declare configuration
        DECLARE(SIO,2)
        DECLARE(ASYNC,0)

:       Origination host
        ACHOST(500)
 
:       LOG-IN MESSAGE
        LTEXT(ULMSG,TSI SIO-ASYNC TEST)


:       SIO Features
        SPVRNG(0-1)
        UTEXT("02)
        SPVCEX(0-1,AID,TID22,RBP,NOHNG)
        SUTXRG(0-1)
    