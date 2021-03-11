
************************************************************************
*                                                                      *
*                         SUBROUTINE:  SEARCH                          *
*                                                                      *
*       THIS SUBROUTINE IMPLEMENTS THE BINARY SEARCH. GIVEN AN         *
*       INTEGER ARRAY IA IN ASCENDING ORDER, IT LOOKS FOR A            *
*       PARTICULAR VALUE AND RETURNS THE INDEX OF THE FOUND            *
*       ELEMENT. IF SEARCH IS UNSUCCESSFUL, THE RETURNED INDEX         *
*       IS N+1 WHERE N IS THE NUMBER OF ELEMENTS IN IA.                *
*                                                                      *
*       THE CALLING SEQUENCE IS :                                      *
*               CALL SEARCH(IA,IVAL,N,IND)                             *
*       WHERE THE REQUIRED INPUTS ARE :                                *
*               IA   = ARRAY TO BE SEARCHED                            *
*               IVAL = VALUE OF THE SEARCHED ELEMENT                   *
*               N    = NUMBER OF ELEMENTS IN ARRAY IA                  *
*       AND THE RETURNED OUTPUT IS :                                   *
*               IND  = INDEX OF THE FOUND ELEMENT                      *
*                                                                      *
************************************************************************

        SUBROUTINE SEARCH(IA,IVAL,N,IND)

        DIMENSION IA(1)

        I=1
        J=N
 10     K=(J+I)/2
        IF (IVAL.EQ.IA(K).OR.I.GT.J) GO TO 20
        IF (IVAL.GT.IA(K)) GO TO 15
        J=K-1
        GO TO 10
 15     I=K+1
        GO TO 10

 20     IF (I.GT.J) GO TO 30
        IND=K
        RETURN

 30     IND=N+1
        RETURN

        END

