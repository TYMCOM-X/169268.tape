10 REM **********************************************************************
20 REM *                                                                    *
30 REM *         This program was written for the ease of                   *
40 REM *         keeping track of telco installs.                           *
50 REM *                                                                    *
60 REM *           WRITTEN BY : Read Finein                                 *
70 REM *                                                                    *
80 REM **********************************************************************
100 PRINT
110 PRINT
120 PRINT '    Align the paper to TOP-OF-FORM and hit C/R':
130 INPUT IN FORM "R":CAR$
135 FOR Y=1 TO 2
140 PRINT
150 PRINT
160 PRINT '                   TELCO CIRCUIT INSTALLATION LOG'
170 PRINT '                   ------------------------------'
180 PRINT '        circuit             date       vender    int        comments'
190 PRINT '-----------------------------------------------------------------------------'
200 FOR T=1 TO 28
210 PRINT ':                      :            :         :       :'
220 PRINT '-----------------------------------------------------------------------------'
230 NEXT T
240 PRINT
250 PRINT
260 PRINT
270 NEXT Y
  