0010?	#TEXT
  0020?	
  0030?	VAR1=LINE 6 START 63 FOR 12		;USER NAME
   0035?	
  0040?	VAR2=LINE 6 START 90 SKIP BLANK FOR 13	;ACT SYSTEM
  0045?	
  0050?	VAR3=LINE 6 START 59 SKIP BLANK FOR 3	;DISTRICT
0055?	
  0060?	VAR4=LINE 6 START 53 SKIP BLANK FOR 5	;CUST. NUMBER
 0065?	
  0070?	VAR5=LINE 6 START 124 FOR 1		;S OR N
 0075?	
  0080?	VAR6=LINE 6 START 115 SKIP BLANK FOR 8	;DATE
   0085?	
  0090?	VAR7=LINE 6 START 104 SKIP BLANK FOR 10	;CURRENCY
   0095?	
  0100?	
  0110?		;FIRST DISTRICT
 0120?	VAR10=IF VAR10 [VAR10]+IFNO VAR10 [VAR3]
  0130?		;LAST DISTRICT
                                                    0140?	VAR11=IF VAR3 [VAR3]+IFNO VAR3 [VAR11]
    0150?		;FIRST CUSTOMER
 0160?	VAR12=IF VAR12 [VAR12]+IFNO VAR12 [VAR4+IF VAR4 ["-"]+VAR5]
   0170?		;LAST CUSTOMER
  0180?	VAR13=IF VAR4 [VAR4+"-"+VAR5]+IFNO VAR4 [VAR13]
0190?		;FIRST USER NAME
0200?	VAR14=IF VAR14 [VAR14]+IFNO VAR14 [VAR1]
  0210?		;LAST USER NAME
 0220?	VAR15=IF VAR1 [VAR1]+IFNO VAR1 [VAR15]
    0230?		;DATE
 0240?	VAR16=IF VAR16 [VAR16]+IFNO VAR16 [VAR6]
  0250?		;ACCT. SYS
 0260?	VAR17=IF VAR17 [VAR17]+IFNO VAR17 [VAR2]
  0270?	
  0280?	#PAGE
  0290?	KEEP VAR10,VAR11,VAR12,VAR13,VAR14,VAR15,VAR16,VAR17
0300?	
  0310?	#INDEX
 0320?	
            0330?	HEADING " CUST.      USER     CUR LOC"
    0340?	
  0350?	ITEM 1 SIZE 7 VAR4+IF VAR4 ["-"]+VAR5 RIGHT CHANGE CLEAR ITEM 3;
   0360?		CHANGE CLEAR ITEM 2 SUPRESS UNCHANGED
    0370?	" "
    0380?	ITEM 2 SIZE 12 VAR1 CHANGE CLEAR ITEM 3 SUPRESS UNCHANGED
0390?	" "
    0400?	ITEM 3 SIZE 4 VAR7 SUPRESS UNCHANGED
 0410?	" "
    0420?	ITEM 4 SIZE 4 LOC
0430?	
  0440?	#FICHE
 0450?	
  0460?	GROUP CHARACTERS 4 LINES 2 FRAMES 3
  0470?		TLINE 1 SIZE 12 VAR16 DELETE BLANK CENTER
0480?		TLINE 2 SIZE 12 VAR17 DELETE BLANK CENTER
0490?	
  0500?	GROUP LINES 1 FRAMES 2
0510?		TLINE 1 SIZE 8 " DETAIL"
  0520?	
            0530?	GROUP FRAMES 5
   0540?		TLINE 1 SIZE 20 "DISTRICT "+VAR10+IFDIF VAR10 VAR11;
    0550?		[" TO "+VAR11] CENTER
0560?	
  0570?	GROUP FRAMES 2 LINES 2 IFEQ VAR12 VAR13 [LINES 1]
   0580?		TLINE 1 SIZE 8 VAR12+" " RIGHT
 0590?		TLINE 2 SIZE 8 VAR13+" " RIGHT
 0600?	
  0610?	GROUP FRAMES 3 LINES 2 IFEQ VAR12+VAR14 VAR13+VAR15 [LINES 1]
 0620?		TLINE 1 SIZE 12 VAR14
0630?		TLINE 2 SIZE 12 VAR15
0640?	
  0650?	GROUP FRAMES 1 LINES 2 CHARACTERS 3
  0660?		TLINE 1 SIZE 3 FICHEN RIGHT
    0670?	
  0680?	#END
   