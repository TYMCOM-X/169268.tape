@RUTGERS-GET
Output LOGIN.TMP
Set Blank
Creaux :102
Wait 10
Force LOGIN Username(RUTGERS):  Password:  
Wait 10
Force REFUSE ADVICE
Wait 2
Force REFUSE LINKS
Wait 2
Force REFUSE SYSTEM
Wait 2
Force TERM IDEAL
Wait 2
Force COPY Input file: TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force LOGOUT
Time
Quit


@ARC1-GET
Output LOGIN.TMP
Set Blank
Creaux :212
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-1):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC1-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :212
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-1):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


@ARC2-GET
Output LOGIN.TMP
Set Blank
Creaux :216
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-2):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC2-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :216
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-2):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


@ARC3-GET
Output LOGIN.TMP
Set Blank
Creaux :236
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-3):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC3-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :236
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-3):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


@ARC4-GET
Output LOGIN.TMP
Set Blank
Creaux :148
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-4):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC4-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :148
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-4):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


@ARC5-GET
Output LOGIN.TMP
Set Blank
Creaux :895
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-5):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC5-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :895
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-5):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


@ARC6-GET
Output LOGIN.TMP
Set Blank
Creaux :896
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-6):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC6-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :896
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-6):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


@ARC7-GET
Output LOGIN.TMP
Set Blank
Creaux :897
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-7):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force WIDTH 0
Wait 2
Force FORMFEED
Wait 2
Force COPY Input file:  TTY:
Output Output file: 
Force
Time 90
Output LOGOUT.TMP
Force KK
Time
Quit

@ARC7-SEND
Set LF
Set Blank
Output AUXIO.TMP
Creaux :897
Wait 4
Force 
Force
Wait 4
Force LOGIN Username(OFFICE-7):  Password:  Account: 
Wait 10
Force REFUSE LINKS
Wait 2
Force COPY TTY:Output file: 
Force
Input Input file: 
Force 
Time 90
Force KK
Time
Quit


 