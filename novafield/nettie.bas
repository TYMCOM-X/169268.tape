1 LET A=0
10 PRINT "HI NETTIE...DO YOU WANT TO PLAY A GAME ?  YES OR NO"
20 INPUT M$
30 IF M$="YES" THEN 40         
35 PRINT "OK GROUCHY...CALL ME WHEN YOUR FEELING BETTER"
37 GOTO 200
40 PRINT "OK..GOOD   LET'S PLAY HOW TO USE EDITOR"
43 PRINT
45 PRINT "I'LL ASK THE QUESTIONS..AND YOU ANSWER THEM"
47 PRINT
55 PRINT "FIRST QUESTION IS ...IF I WANT TO GO TO THE LINE"
57 PRINT " "
60 PRINT "NETTIE WEARS JAMIES TO WORK"
62 PRINT
65 PRINT "WHAT WORD SHOULD I PUT IN QUOTATION MARKS FOLLOWED BY A /"
68 INPUT N$
70 IF N$="NETTIE" THEN 80
75 PRINT
77 PRINT "NO DUMMY TRY AGAIN"
78 PRINT
79 GOTO 55
80 PRINT "VERY GOOD  NETTIE          LETS GO TO THE NEXT QUESTION"
90 PRINT
100 PRINT "NOW THAT I AM AT THE LINE...NETTIE WEARS JAMIES TO WORK"
110 PRINT
120 PRINT "HOW DO I FIND OUT WHAT LINE NUMBER THAT IS???"
130 INPUT P$
140 IF P$=".=" THEN 170
147 LET A=A+1
150 IF A>1 THEN 155
152 PRINT "NOPE THATS NOT IT...TRY AGAIN..OK  NETTIE"
153 PRINT
154 GOTO 100
155 PRINT "ANOTHER WRONG ANSWER NETTIE YOUR NOT THINKING...TRY AGAIN"
157 GOTO 100
160 
170 PRINT "EXCELLENT...YOUR SMOKING NOW..HERE'S THE NEXT QUESTION.."
173 PRINT
175 PRINT "NOW THAT I KNOW THE LINE NUMBER..(LETS ASSUME LINE #27)"
177 PRINT
179 PRINT "WHAT DO I DO NEXT IF I WANT TO CHANGE THAT LINE"
180 INPUT Z$
185 IF Z$="27ED" THEN 190
187 PRINT "IF I ONLY HAD A BRAIN #*#...TRY AGAIN NETTIE"
189 GOTO 175
190  PRINT "ANOTHER RIGHT ANSWER NETTIE...YOU HAVE WON THE GAME"
195 PRINT
197 PRINT "CALL ME AGAIN WHEN YOU FORGET..BYE..?"
200 END
  