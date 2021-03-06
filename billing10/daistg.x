PROCEDURE DAILY.STG.UPD.X              % DAISGX.PR2    SU8U8P.ME2  04

Version 4.0 -- December 1, 1986 -- Mark Nichols
  Padded out length of checksum record to make the file fixed length.

Version 3.0   Last Update   7804.11   W.E. Mozet

Version 2.0   Last Update   7712.20   W.E. Mozet
  Added code to type CHECKSUM values if CHECKSUMS don't match

   VERSION 1.0 - DECEMBER 30TH. 1976 - ANVER MEGHJI

   Combines and creates one record for each UUN/PROJECT CODE
   combination for a day - to load to CAIS

%

BEGIN

FIELDS

      TRAN.TYP             AS 'N',
      IN.FIL               SAME AS IN.FNAM,
      OUT.FIL              SAME AS OUT.FNAM,
      CHKSUM               AS '11Z',
      CHKSUM.TOTAL         AS '11Z',
      REC.CNT              AS '7Z',
%     FIRST.ST.REC         AS '7Z',    %
%     LAST.ST.REC          AS '7Z',    %
      FIL.DATE             AS DATE 'MMDD',  
      FIL.DATE.L           SAME AS FIL.DATE,
      HOST.L               SAME AS HOST,
      BILLING.HOST         SAME AS HOST


SOURCE FILE.CTL FROM 'DAILY.CTL'
  FIXED FORM
  INPUT REC.TYPE,

CONDITIONAL ON REC.TYPE

   BEGIN % 2 - %

   1: @TAB TO 3, HOST, @TAB TO 7, BILLING.HOST, @CR
   2: @TAB TO 3, IN.FIL, @TAB TO 14, OUT.FIL, @TAB TO 16, FIL.DATE, @CR
   3: @CR
   4: @CR

   END % 2 - %

%
SOURCE CNTRL.FIL FROM 'STOREC.CTL'
  FREE FORM
  INPUT FIRST.ST.REC, LAST.ST.REC

%

SOURCE DAILYX.STORAGE.INP FROM IN.FNAM
  FIXED FORM
  INPUT TRAN.TYP,

CONDITIONAL ON TRAN.TYP

   BEGIN % 2 - %

   1: GAN, UUN, HOST, TRAN.DATE, STG.CHARS, PROJ.CODE
   9: CHKSUM

   END % 2 - %

%
REPORT CNTRL.STOREC TO 'STOREC.CTL'
  PAGE.SIZE 0
%

REPORT PSFILE TO OUT.FNAM
  PAGE.SIZE 0

  FORMAT RUN.DATE.TIME
    @TAB 3,
    TODAY AS DATE 'MM/DD/YY',
    @TAB 2,
    (TIME/3600) AS '2Z', ":",
    ((TIME-TIME/3600*3600)/60) AS '2N', @CR

TYPE "Beginning DAILY STORAGE UPDATE.....Version 4.0", RUN.DATE.TIME

MOVE DEFAULT TO CHKSUM.TOTAL, REC.TYPE, HOST, BILLING.HOST, IN.FIL,
                OUT.FIL, FIL.DATE, CHKSUM

FOR EACH FILE.CTL

   BEGIN % 2 - %

   CONDITIONAL ON REC.TYPE
      BEGIN % 3 - %

      1: IF HOST = 0 AND BILLING.HOST = 0 THEN

         BEGIN % 4 - %
         TYPE @CR,'PRIMARY ACTG NOT RUN - RUN RAWACT FIRST',@CR
         ABORT
         END % 4 - %

       ELSE

         MOVE HOST TO HOST.L

      2: BEGIN % 4 - %
         MOVE IN.FIL TO IN.FNAM
         MOVE OUT.FIL TO OUT.FNAM
         MOVE FIL.DATE TO FIL.DATE.L
         END % 4 - %

      3: NOTHING

      4: NOTHING

      END % 3 - %

   END % 2 - %

TYPE @CR, "Processing DAILY STORAGE file ", IN.FNAM, @CR

SELECT SRC.FNAMS VIA KEY THEN

   BEGIN % 2 - %
   TYPE @CR,@CR,IN.FNAM,' ALREADY PROCESSED',@CR
   ABORT
   END % 2 - %


%
FOR EACH CNTRL.FIL
  MOVE LAST.ST.REC TO LAST.ST.REC OF DAILY.STG.UPD.X

MOVE (LAST.ST.REC + 1) TO FIRST.ST.REC

%

DELETE FROM DAILY.STORAGE ALL

WRITE REPORT PSFILE

   BEGIN % 2 - %
%
MOVE 2 TO TRAN.TYP
PRINT TO PSFILE
     TRAN.TYP, FIL.DATE.L, HOST.L, @CR

%

      BEGIN % 3 - %
      FOR EACH DAILYX.STORAGE.INP
   
      CONDITIONAL ON TRAN.TYP
   
         BEGIN % 4 - %
   
         1: SELECT DAILY.STORAGE VIA KEY THEN
   
            BEGIN % 5 - %
            ADD STG.CHARS OF DAILYX.STORAGE.INP TO STG.CHARS, CHKSUM.TOTAL
            ALTER DAILY.STORAGE
            END % 5 - %
   
          ELSE
   
            BEGIN % 5 - %
            ADD STG.CHARS OF DAILYX.STORAGE.INP TO CHKSUM.TOTAL
            INSERT INTO DAILY.STORAGE
            END % 5 - %
   
         9: IF CHKSUM # CHKSUM.TOTAL THEN
   
            BEGIN % 5 - %
            TYPE @CR,'***** CHECKSUM CONFLICT ON INPUT FILE *****',@CR
            TYPE @CR, "CALCULATED CHECKSUM = ", CHKSUM.TOTAL,
                 @CR, "REC.TYPE 9 CHECKSUM = ", CHKSUM, @CR, @CR
            ABORT
            END % 5 - %
   
          ELSE
   
            NOTHING
   
         END % 4 - %
   
      END % 3 - %

   MOVE 1 TO TRAN.TYP

   FOR EACH DAILY.STORAGE

      BEGIN % 3 - %

      ADD 1 TO REC.CNT
      PRINT TO PSFILE
           TRAN.TYP, GAN, UUN, HOST, TRAN.DATE, STG.CHARS, PROJ.CODE, @CR

      END % 3 - %

   MOVE 9 TO TRAN.TYP

%  LET LAST.ST.REC = FIRST.ST.REC + (REC.CNT - 1)  %

   PRINT TO PSFILE
        TRAN.TYP, CHKSUM.TOTAL, 32 * ' ', @CR %FIRST.ST.REC, LAST.ST.REC, @CR%

   END % 2 - %

INSERT INTO SRC.FNAMS

TYPE @CR,REC.CNT,' RECORDS PROCESSED',@CR

TYPE @CR, "End DAILY STORAGE UPDATE", RUN.DATE.TIME

END % 1 - %
    