**********************************************************************
*                                                                     *
*       PROLIS.FOR    VER. 1.0    J.JOELS         OCTOBER, 1979       *
*                                                                     *
*       THIS PROGRAM CREATES A 'SNAPSHOT' FOR USE IN THE PAR PROGRAM. *
*       THE SNAPSHOT IS A LISTING OF (ACCG1)PORTS.DMS DATA BASE ON    *
*       THE LAST DAY OF THE DATE RANGE OVER WHICH PAR IS TO BE RUN.   *
*       THE SNAPSHOT PROVIDES THE NODE AND PORT CODES, PHONE NUMBER   *
*       AND THE MODEM TYPE.                                           *
*                                                                     *
**************************************************************************

        CALL DBF10

        INTEGER TYPE(20,2),IPHONE(6),IDATE,LISFLE(2),MONTBL(12),SCR(6),
     X          L(2)

        MAXTYP=20
