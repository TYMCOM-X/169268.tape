20 GOTO 180
80 PRINT "DEPARTMENT OF MANAGEMENT, W.M.U."
90 PRINT
100 PRINT "     THE OBJECTIVE OF THIS GAME IS TO PLACE 5 MARKS"
120 PRINT"IN A STRAIGHT LINE (EITHER HORIZONTAL, VERTICAL, OR DIAGONAL)"
130 PRINT"ON A 9 X 9 BOARD, PLAYING AGAINST THE COMPUTER. ENTER YOUR"
140 PRINT"MOVE AS 2 NUMBERS; THE POSITIONS ACROSS AND THEN DOWN"
150 PRINT"FROM THE UPPER LEFT HAND CORNER OF THE BOARD. THE COMPUTER"
160 PRINT"WILL THEN TELL YOU ITS MOVE, AND PRINT THE BOARD. 'Y' IS YOU;"
170 PRINT"'C' IS THE COMPUTER. GOOD LUCK."
180 DIM A(27,27),P(20)
181 DIM Q(20)
190 LET L9=200
200 FOR J=1 TO 27
210 FOR K=1 TO 27
220 LET A(J,K)=3
230 NEXT K
240 NEXT J
250 LET S=0
260 FOR J=10 TO 18
270 FOR K=10 TO 18
280 LET A(J,K)=0
290 NEXT K
300 NEXT J
305 GOSUB 4290
310 IF S=1 THEN 2360
320 LET S=1
330 GOSUB 4010
340 GOSUB 4220
400 LET A(J1,K1)=2
410 LET D2=2
420 LET L3=0
430 LET D4=0
440 LET L2=81
450 GOSUB 910
460 LET D5=D4
470 IF D4>79 THEN 8100
480 LET D2=1
490 LET L2=65
500 LET D4=0
510 GOSUB 910
520 LET D6=D4
530 IF D5>31 THEN 550
540 IF D6<31 THEN 840
550 IF L3>0 THEN 2020
560 IF D5<65 THEN 590
570 LET D2=2
580 GOTO 620
590 LET D2=1
600 LET L2=55
610 IF D6<55 THEN 650
620 GOSUB 910
630 IF L3=3 THEN 2080
640 GOTO 2100
650 IF D5<55 THEN 730
660 LET D2=2
670 GOSUB 910
680 LET L2=31
690 LET L9=55
700 GOSUB 910
710 FOR H=0 TO L3-2
712 FOR I=H+1 TO L3-1
714 IF P(H)=P(I) THEN 725
716 NEXT I
718 NEXT H
720 GOTO 2080
725 P(0)=P(H)
727 GOTO 2060
730 LET L2=31
740 GOSUB 910
750 IF L3<2 THEN 770
760 FOR H=0 TO L3-2
761 FOR I=H+1 TO L3-1
762 IF P(H)=P(I) THEN 766
763 NEXT I
764 NEXT H
765 GOTO 770
766 P(0)=P(H)
767 GOTO 2060
770 LET L3=0
780 LET D2=2
790 GOSUB 910
800 IF L3=0 THEN 850
810 IF L3=1 THEN 2060
820 FOR H=0 TO L3-2
822 FOR I=H+1 TO L3-1
824 IF P(H)=P(I) THEN 835
826 NEXT I
828 NEXT H
830 GOTO 2100
835 P(0)=P(H)
837 GOTO 2060
840 LET D2=2
850 LET L2=D5-5
860 LET L3=0
870 GOSUB 910
880 IF L3>0 THEN 2100
890 GOTO 8000
910 FOR J=1 TO 9
920 GOSUB 1680
930 FOR K=1 TO 10
940 GOSUB 1190
950 NEXT K
960 NEXT J
970 FOR K=1TO 9
980 GOSUB 1680
990 FOR J=1 TO 10
1000 GOSUB 1190
1010 NEXT J
1020 NEXT K
1030 FOR L=4 TO -4 STEP -1
1040 GOSUB 1680
1050 FOR J=1 TO 10
1060 LET K=J+L
1070 GOSUB 1190
1080 NEXT J
1090 NEXT L
1100 FOR L=5 TO 14
1110 GOSUB 1680
1120 FOR K=1 TO 10
1130 LET J=L-K
1140 GOSUB 1190
1150 NEXT K
1160 NEXT L
1170 LET L9=200
1180 RETURN
1190 LET B=A(J+9,K+9)
1200 IF B=0 THEN 1530
1210 IF B=D2 THEN 1420
1220 IF V1=0 THEN 1250
1230 IF C1=66 THEN 1250
1240 LET C1=C1-10
1250 LET S9=0
1260 LET V1=0
1270 IF C1<=C2 THEN 1290
1280 LET C2=C1
1290 IF C5>=5 THEN 1320
1300 GOSUB 1680
1310 RETURN
1320 LET C5=0
1330 IF C2<=D4 THEN 1350
1340 LET D4=C2
1350 IF C2<L2 THEN 1310
1360 IF C2>L9 THEN 1310
1370 IF L1=0 THEN 1310
1380 LET P(L3)=Q(L1-1)
1390 LET L3=L3+1
1400 LET L1=L1-1
1410 GOTO 1370
1420 IF V1=1 THEN 1470
1430 LET V1=1
1440 IF S9=0 THEN 1470
1450 GOSUB 1830
1460 LET S9=0
1470 LET C6=C7+C6+1
1480 LET C7=0
1490 LET C5=C5+1
1500 IF C6>5 THEN 1310
1510 LET C1=C1+20
1520 GOTO 1310
1530 IF V1=1 THEN 1560
1540 LET S9=10*J+K
1550 GOTO 1580
1560 GOSUB 1830
1570 LET V1=0
1580 LET C5=C5+1
1590 IF C1<=0 THEN 1610
1600 LET C7=C7+1
1610 IF C1<=C2 THEN 1650
1620 LET C2=C1
1630 LET C1=C1-4
1640 GOTO 1310
1650 IF C1>=0 THEN 1630
1660 LET C1=0
1670 GOTO 1310
1680 LET L1=0
1690 LET C1=-10
1700 LET C2=0
1710 LET C5=0
1720 LET C6=0
1730 LET C7=0
1740 RETURN
1830 IF C1<65 THEN 1890
1840 IF L1=0 THEN 1890
1850 IF L1=1 THEN 1940
1860 LET Q(0)=Q(1)
1870 LET L1=L1-1
1880 GOTO 1850
1890 IF S9=0 THEN 1920
1900 LET Q(L1)=S9
1910 GOTO 1930
1920 LET Q(L1)=10*J+K
1930 LET L1=L1+1
1940 RETURN
1950 LET J=INT(P(0)/10)+9
1960 LET K=P(0)-10*(J-9)+9
1970 LET A(J,K)=1
1980 GOSUB 4600
1982 PRINT M1$;
1985 GOSUB 4460
1987 PRINT M$;
1990 RETURN
2020 GOSUB 1950
2030 GOTO 8200
2060 GOSUB 1950
2065 PRINT M$;
2070 GOTO 330
2080 LET P(0)=P(1)
2090 GOTO 2060
2100 LET L9=INT(L3*RND(X))
2110 LET P(0)=P(L9)
2120 GOTO 2060
2360 LET A(14,14)=1
2362 J2=5
2364 K2=5
2365 M9$="C"
2366 GOSUB 4220
2380 LET S=0
2385 PRINT M$;
2390 GOTO 330
4010 INPUT J1,K1
4015 M9$="Y"
4020 IF J1=0 THEN 8900
4030 IF K1=0 THEN 8900
4040 IF J1 > 9 THEN 4070
4050 IF K1 > 9 THEN 4070
4060 GOTO 4130
4070 PRINT CHR$(7);
4090 PRINT M1$;
4100 GOSUB 4460
4110 PRINT M$;
4120 GOTO 4010
4130 J2=J1
4140 K2=K1
4150 J1=J1+9
4160 K1=K1+9
4170 IF A(J1,K1) = 0 THEN 4210
4180 GOTO 4070
4210 RETURN
4220 PRINT C$+STR$(1+2*K2)+D$+STR$(4*J2)+"C"+M9$;
4230 PRINT M1$;
4235 RETURN
4240 GOSUB 4460
4250 PRINT M$;
4260 GOTO 4010
4290 C$=CHR$(27)+"&"+CHR$(97)
4300 D$=CHR$(114)
4310 H$=CHR$(27)+"H"+CHR$(27)+"J"
4320 M$=C$+"10"+D$+"55C"
4330 M1$=C$+"10"+D$+"57C"
4333 M3$=C$+"15"+D$+"57C"
4334 M4$=C$+"19"+D$+"50C"
4335 M5$=C$+"21"+D$+"50C"
4336 M6$=C$+"23"+D$+"1C"
4350 A$=   "  -------------------------------------"
4360 B$=    " :   :   :   :   :   :   :   :   :   :"
4362 PRINT H$
4364 PRINT M6$+"GOMOKU: ENTER ACROSS THEN DOWN .. E.G. 5,4";
4366 PRINT CHR$(27)+"H"
4370 PRINT "    1   2   3   4   5   6   7   8   9"
4380 PRINT A$
4390 FOR M9=1 TO 9
4400 PRINT STR$(M9)+B$
4410 PRINT A$
4420 NEXT M9
4425 PRINT C$+"14"+D$+"52CCOMPUTER'S MOVE";
4430 PRINT C$+"9"+D$+"52CYOUR MOVE";
4440 PRINT M$;
4450 RETURN
4460 PRINT "        ";
4490 RETURN
4500 GOTO 9000
4600 J2=J-9
4610 K2=K-9
4612 M9$="C"
4615 PRINT M3$;J2;",";K2;
4620 GOSUB 4220
4630 RETURN
8000 PRINT M4$+"**** DRAW ****";
8010 GOTO 8500
8100 PRINT M4$+"YOU WIN";
8110 GOTO 8500
8200 PRINT M4$;
8210 PRINT M4$+CHR$(7)+"!!!!! COMPUTER WINS !!!!!"+CHR$(7);
8220 GOTO 8500
8500 PRINT M5$+"PLAY AGAIN?";
8505 PRINT C$+"22"+D$+"50C(Y OR N)";
8510 INPUT R$
8520 IF R$ <> "Y" THEN 8900
8530 GOTO 260
8900 PRINT H$
9000 END
   