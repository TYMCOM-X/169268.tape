OPEN VARAW (DBTARIFF)LATA.
INIT 1 VACONF.VH.
INIT 2 VACONF.VHO.
FI ALL.
SORT KEY CITY.
DPL START.
        DEFINE INTEGER CNODE CPNA CNNX CV CH NNODE NNPA NNNX.
        DEFINE TEXT 10 CCITY NCITY.

        LET CNODE EQ 0.
        LET FIRST EQ 0.

NEXTREC:       DBSET 1.
                GETREC ENDNODE.
                LET NNPA EQ NPA NNNX EQ NXX NCITY EQ CITY.
                IF FIRST NE 0 THEN CHECK.
                LET CCITY = NCITY.
                LET CNPA = NNPA.
                LET CNNX = NNNX.
                LET FIRST EQ 1.
                GOTO NEXTREC.

CHECK:          IF NCITY EQ CCITY THEN NEXTREC.

GETVH:          DBSET 2.
                FI NPA EQ CNPA NNX EQ CNNX.
                GETREC NOVH.
                PRINT CCITY V H FORMAT A10 5X I4 1X I4 END.
                LET CCITY = NCITY.
                LET CNPA = NNPA.
                LET CNNX = NNNX.
                GOTO NEXTREC.

NOVH:           PRINT ON 2  CCITY FORMAT / 'WARNING! UNABLE TO LOCATE V & H ' &
                        ' FOR NODE: ' A10 END.
                LET CCITY = NCITY.
                LET CNPA = NNPA.
                LET CNNX = NNNX.
                GOT NEXTREC.

ENDNODE:        DPL END.
QUIT.
   