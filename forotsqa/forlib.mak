.EDIT 1022XX
.NAME ES
.MODULE FOROTS
.INSERT INIT%,BEFORE
        MOVEI   T1,CHN.TB(P4)
        HRROM   T1,136
.ENDI
.INSERT GMEM2C,REPLACE:1,<AOS T3,.JBREL>
	HLRE    T3,136
        AOJE    T3,GMEM2D
        SKIPA
        JRST    GMEM2A
        HRLI    T3,GMEM2A
        MOVE    T2,T1
        JFCL
        JFCL
        JFCL
        PUSHJ   P,-1(T3)
GMEM2D: AOS     T3,.JBREL
.ENDI
.ENDE
;=215371
  