000010 IDENTIFICATION DIVISION.                                         NPA00010
000020 PROGRAM-ID. POPINQ.                                              NPA00020
000030******************************************************************NPA00030
000040*                                                                 NPA00040
000050*   The purpose of this main program is to do all dump for        NPA00050
000060*   the POP Locator. This program calls the POP Locator Module    NPA00060
000070*   POPLOC, and displays the results to the output file.          NPA00070
000080*                                                                 NPA00080
000090******************************************************************NPA00090
000100*                                                                 NPA00100
000110*DATE-COMPILED.                                                   NPA00110
000120                                                                  NPA00120
000130 ENVIRONMENT DIVISION.                                            NPA00130
000140 CONFIGURATION SECTION.                                           NPA00140
000150 INPUT-OUTPUT SECTION.                                            NPA00150
000160 FILE-CONTROL.                                                    NPA00160
000170     SELECT MRCF-MST ASSIGN TO UT-MRCF                            NPA00170
000180*                    RESERVE 10 AREAS                             NPA00180
000190                     ORGANIZATION IS INDEXED                      NPA00190
000200                     ACCESS MODE IS SEQUENTIAL                    NPA00200
000210*                    BLOCK CONTAINS 5950 CHARACTERS               NPA00210
000220                     RECORD KEY IS KEY-FIELDS OF MRCF-RECORD      NPA00220
000230                     FILE STATUS IS MRCF-FILE-STATUS.             NPA00230
000240                                                                  NPA00240
000250     SELECT OUTPUT-FILE ASSIGN TO UT-BATOUT                       NPA00250
000260                        ORGANIZATION IS SEQUENTIAL                NPA00260
000270                        ACCESS IS SEQUENTIAL                      NPA00270
000280                        FILE STATUS IS OUTPUT-FILE-STATUS.        NPA00280
000290                                                                  NPA00290
000300 DATA DIVISION.                                                   NPA00300
000310 FILE SECTION.                                                    NPA00310
000320 FD  MRCF-MST                                                     NPA00320
000330     RECORD CONTAINS 595 CHARACTERS,                              NPA00330
000340     LABEL RECORDS ARE STANDARD.                                  NPA00340
000350 01  MRCF-RECORD.                                                 NPA00350
000360     05  KEY-FIELDS                      PIC X(20).               NPA00360
000370     05  DATA-FIELDS                     PIC X(575).              NPA00370
000380                                                                  NPA00380
000390 FD  OUTPUT-FILE                                                  NPA00390
000400*    RECORDING MODE IS V                                          NPA00400
000410*    RECORD CONTAINS 1 TO 80 CHARACTERS                           NPA00410
000420     LABEL RECORDS STANDARD.                                      NPA00420
000430 01  OUTPUT-RECORD.                                               NPA00430
000440     05  DATA-FIELDS.                                             NPA00440
000450         10  RATE-CENTER-NPA                PIC ZZZ.              NPA00450
000460         10  FILLER1                        PIC X(01).            NPA00460
000470         10  RATE-CENTER-NXX                PIC ZZZ.              NPA00470
000480         10  FILLER2                        PIC X(01).            NPA00480
000490         10  WIRE-CENTER-V-SIGN             PIC X(01).            NPA00490
000500         10  WIRE-CENTER-V                  PIC 99999.99.         NPA00500
000510         10  FILLER3                        PIC X(01).            NPA00510
000520         10  WIRE-CENTER-H-SIGN             PIC X(01).            NPA00520
000530         10  WIRE-CENTER-H                  PIC 99999.99.         NPA00530
000540         10  FILLER4                        PIC X(01).            NPA00540
000550         10  RATE-CENTER-CITY               PIC X(10).            NPA00550
000560         10  FILLER5                        PIC X(01).            NPA00560
000570         10  RATE-CENTER-ST                 PIC X(02).            NPA00570
000580*     End of Record Layout                                        NPA00580
000590*                                                                 NPA00590
000600 WORKING-STORAGE SECTION.                                         NPA00600
000610*                                                                 NPA00610
000620*     Working Storage Variables                                   NPA00620
000630*                                                                 NPA00630
000640                                                                  NPA00640
000650 01  MRCF-FILE-STATUS                    PIC XX.                  NPA00650
000660 01  OUTPUT-FILE-STATUS                  PIC XX.                  NPA00660
000670                                                                  NPA00670
000680 01  RECORD-COUNTS.                                               NPA00680
000690     05  RECORDS-PROCESSED               PIC 9(08) COMP VALUE 0.  NPA00690
000700     05  SUCCESSFULLY-PRICED             PIC 9(08) COMP VALUE 0.  NPA00700
000710                                                                  NPA00710
000720*01  RATF-KEY                            PIC X(20).               NPA00720
000730*01  RATF-RECORD                         PIC X(180).              NPA00730
000740*01  RECORD-KEY                          PIC X(20).               NPA00740
000750                                                                  NPA00750
000760 01  WS-ACTION-CODE                      PIC X(01).               NPA00760
000770     88  CLOSE-FILE                      VALUE "C".               NPA00770
000780     88  FIND-RECORD                     VALUE "F".               NPA00780
000790     88  WRITE-RECORD                    VALUE "W".               NPA00790
000800     88  EOF-REACHED                     VALUE "E".               NPA00800
000810                                                                  NPA00810
000820 01  MRCF-KEY.                                                    NPA00820
000830     COPY RCFUSAKY.                                               NPA00830
000840 01  MRCF-REC.                                                    NPA00840
000850     COPY RCFUSA.                                                 NPA00850
000860                                                                  NPA00860
000870 01  MRCF-REDEFINE-REC  REDEFINES  MRCF-REC.                      NPA00870
000880     02 KEY-FIELDS.                                               NPA00880
000890        05  KEY-CATEGORY                 PIC 9(01).               NPA00890
000900        05  NPA                          PIC 9(03).               NPA00900
000910        05  NXX                          PIC 9(03).               NPA00910
000920        05  KEY-EXTENSION                PIC X(03).               NPA00920
000930        05  ZERO-FILL-10                 PIC 9(10).               NPA00930
000940     02 DATA-FIELDS.                                              NPA00940
000950        05  RATING-AREA                  PIC 9(01).               NPA00950
000960            88 US-MAINLAND-ORIGIN        VALUE 1.                 NPA00960
000970            88 CANADA-ORIGIN             VALUE 2.                 NPA00970
000980            88 MEXICO-ORIGIN             VALUE 3.                 NPA00980
000990            88 ALASKA-ORIGIN             VALUE 4.                 NPA00990
001000            88 HAWAII-ORIGIN             VALUE 5.                 NPA01000
001010            88 OTHER-CARIBBEAN-ORIGIN    VALUE 6.                 NPA01010
001020            88 INFO-DIALIT-ORIGIN        VALUE 7.                 NPA01020
001030            88 US-CARIBBEAN-ORIGIN       VALUE 8.                 NPA01030
001040            88 OVERSEAS-ORIGIN           VALUE 9.                 NPA01040
001050        05  FILLER                       PIC X(572).              NPA01050
001060                                                                  NPA01060
001070 01  WS-DISPLAY-VARIABLES.                                        NPA01070
001080     05  WS-DISP-NBR                     PIC ZZ.                  NPA01080
001090     05  WS-DISP-MILEAGE                 PIC ZZZZ9.999.           NPA01090
001100     05  WS-RC-V                         PIC -99999.99.           NPA01100
001110     05  WS-RC-H                         PIC -99999.99.           NPA01110
001120     05  WS-WC-V                         PIC -99999.99.           NPA01120
001130     05  WS-WC-H                         PIC -99999.99.           NPA01130
001140                                                                  NPA01140
001150*                                                                 NPA01150
001160*     Report Layout Records                                       NPA01160
001170*                                                                 NPA01170
001180 01  WS-POPLOC-ARGS.                                              NPA01180
001190     COPY POPLOCV2.                                               NPA01190
001200                                                                  NPA01200
001210/                                                                 NPA01210
001220 PROCEDURE DIVISION.                                              NPA01220
001230                                                                  NPA01230
001240 A100-MAIN SECTION.                                               NPA01240
001250 A100-START.                                                      NPA01250
001260     DISPLAY "LOADING DOMESTIC NPANXX ...".                       NPA01260
001270     DISPLAY SPACE.                                               NPA01270
001280                                                                  NPA01280
001290      OPEN INPUT MRCF-MST.                                        NPA01290
001300      OPEN OUTPUT OUTPUT-FILE.                                    NPA01300
001310                                                                  NPA01310
001320     PERFORM B100-GET-RECORD.                                     NPA01320
001330*    PERFORM B200-GET-NEXT-RECORD UNTIL EOF-REACHED.              NPA01330
001340     IF CLOSE-FILE                                                NPA01340
001350*        IF FILE-IS-OPEN                                          NPA01350
001360             CLOSE MRCF-MST                                       NPA01360
001370         ELSE                                                     NPA01370
001380             NEXT SENTENCE.                                       NPA01380
001390                                                                  NPA01390
001400     DISPLAY SPACE.                                               NPA01400
001410     DISPLAY "DONE !".                                            NPA01410
001420                                                                  NPA01420
001430 A100-EXIT.                                                       NPA01430
001440     CLOSE MRCF-MST.                                              NPA01440
001450     CLOSE OUTPUT-FILE.                                           NPA01450
001460     STOP RUN.                                                    NPA01460
001470/                                                                 NPA01470
001480 B100-GET-RECORD SECTION.                                         NPA01480
001490 B100-START.                                                      NPA01490
001500     MOVE MRCF-KEY TO KEY-FIELDS OF MRCF-RECORD.                  NPA01500
001510     READ MRCF-MST INTO  MRCF-REC                                 NPA01510
001520*    START MRCF-MST KEY IS NOT LESS THAN KEY-FIELDS OF MRCF-RECORDNPA01520
001530         AT END                                                   NPA01530
001540             MOVE "E" TO WS-ACTION-CODE                           NPA01540
001550             GO TO B200-EXIT.                                     NPA01550
001560     IF MRCF-FILE-STATUS NOT = "00"                               NPA01560
001570         DISPLAY "FILE STATUS ERROR ON UT-MRCF:1 ",               NPA01570
001580                     MRCF-FILE-STATUS                             NPA01580
001590         GO TO B100-EXIT.                                         NPA01590
001600     IF (US-MAINLAND-ORIGIN OR ALASKA-ORIGIN OR HAWAII-ORIGIN     NPA01600
001610         OR US-CARIBBEAN-ORIGIN)                                  NPA01610
001620*    IF CANADA-ORIGIN                                             NPA01620
001630     PERFORM C100-DISPLAY-RESULTS.                                NPA01630
001640     PERFORM B200-GET-NEXT-RECORD UNTIL EOF-REACHED.              NPA01640
001650                                                                  NPA01650
001660 B100-EXIT.                                                       NPA01660
001670     EXIT.                                                        NPA01670
001680                                                                  NPA01680
001690 B200-GET-NEXT-RECORD SECTION.                                    NPA01690
001700 B200-START.                                                      NPA01700
001710     READ MRCF-MST NEXT RECORD                                    NPA01710
001720         AT END                                                   NPA01720
001730             MOVE "E" TO WS-ACTION-CODE                           NPA01730
001740             GO TO B200-EXIT.                                     NPA01740
001750                                                                  NPA01750
001760     IF MRCF-FILE-STATUS NOT = "00"                               NPA01760
001770         DISPLAY "FILE STATUS ERROR ON UT-MRCF:2 ",               NPA01770
001780                     MRCF-FILE-STATUS                             NPA01780
001790         GO TO B200-EXIT.                                         NPA01790
001800     MOVE MRCF-RECORD TO MRCF-REC.                                NPA01800
001810     IF (US-MAINLAND-ORIGIN OR ALASKA-ORIGIN OR HAWAII-ORIGIN     NPA01810
001820         OR US-CARIBBEAN-ORIGIN OR CANADA-ORIGIN)                 NPA01820
001830*    IF CANADA-ORIGIN                                             NPA01830
001840     PERFORM C100-DISPLAY-RESULTS.                                NPA01840
001850                                                                  NPA01850
001860 B200-EXIT.                                                       NPA01860
001870     EXIT.                                                        NPA01870
001880                                                                  NPA01880
001890 C100-DISPLAY-RESULTS SECTION.                                    NPA01890
001900 C100-START.                                                      NPA01900
001910     MOVE "W" TO WS-ACTION-CODE.                                  NPA01910
001920     MOVE ZONE-1-NPA OF DATA-FIELDS OF MRCF-REC                   NPA01920
001930       TO RATE-CENTER-NPA OF OUTPUT-RECORD.                       NPA01930
001940     MOVE ZONE-1-NXX OF DATA-FIELDS OF MRCF-REC                   NPA01940
001950       TO RATE-CENTER-NXX OF OUTPUT-RECORD.                       NPA01950
001960     MOVE RATE-CENTER-CITY OF DATA-FIELDS OF MRCF-REC             NPA01960
001970       TO RATE-CENTER-CITY OF OUTPUT-RECORD.                      NPA01970
001980     MOVE RATE-CENTER-ST OF DATA-FIELDS OF MRCF-REC               NPA01980
001990       TO RATE-CENTER-ST OF OUTPUT-RECORD.                        NPA01990
002000     MOVE WIRE-CENTER-V-SIGN OF DATA-FIELDS OF MRCF-REC           NPA02000
002010       TO WIRE-CENTER-V-SIGN OF OUTPUT-RECORD.                    NPA02010
002020     MOVE WIRE-CENTER-V OF DATA-FIELDS OF MRCF-REC                NPA02020
002030       TO WIRE-CENTER-V OF OUTPUT-RECORD.                         NPA02030
002040     MOVE WIRE-CENTER-H-SIGN OF DATA-FIELDS OF MRCF-REC           NPA02040
002050       TO WIRE-CENTER-H-SIGN OF OUTPUT-RECORD.                    NPA02050
002060     MOVE WIRE-CENTER-H OF DATA-FIELDS OF MRCF-REC                NPA02060
002070       TO WIRE-CENTER-H OF OUTPUT-RECORD.                         NPA02070
002080     MOVE " " TO FILLER1 OF OUTPUT-RECORD,                        NPA02080
002090                 FILLER2 OF OUTPUT-RECORD,                        NPA02090
002100                 FILLER3 OF OUTPUT-RECORD,                        NPA02100
002110                 FILLER4 OF OUTPUT-RECORD,                        NPA02110
002120                 FILLER5 OF OUTPUT-RECORD.                        NPA02120
002130     WRITE OUTPUT-RECORD.                                         NPA02130
002140                                                                  NPA02140
002150 C100-EXIT.                                                       NPA02150
002160     EXIT.                                                        NPA02160
002170                                                                  NPA02170
002180*END PROGRAM POPALL.                                              NPA02180
    