

        ORG 700
START   EQ .
BUFFER  EQ 0DFA

        LHI 0,6         DEV ADDR
        LHI 1,0         START READ ADDR
        LHI 2,-1        READ REG - START DUMMY
        LHI 3,-35A      100 BYTES
CLEAR   LIS 4,0
        STB 4,BUFFER,3
        AIS 3,1
        JLBS CLEAR+2
        LHI 3,-35A

        OCR 0,1         DEV ADR/PROM ADDR
READ    RDR 0,2         READ ONE BYTE
        STB 2,BUFFER,3
        AIS 3,1
        JLBS READ       READ 100 BYTES
        JBS .
        END

   