PROCEDURE NETSTATS.DLY
%
Version 3.0 --- September 27, 1989 --- Sharon Young
  Changed to accomodate larger character and connect fields.

Version 2.0   07/21/86  J.Coons
Added a type statement to show file.name being looked at for ease in
tracking down input errors.

Version 1.0   04/26/85   J. Coons
*
The purpose of this procedure is to accumulate and report monthly network
statistics from the beginning of the current month through the current day.

%

BEGIN                                  %PROCEDURE%

%********************************%
%    TEMPORARY FIELDS            %
%********************************%

FIELDS
    CNT                                AS '2N',
    REPORT.NAME                        AS '13C',
    TOT.SESS                           AS '11ZN',
    TOT.INV.SESS                       AS '9ZN',
    TOT.MIN                            AS '11ZN',
    TOT.INV.MIN                        AS '9ZN',
    TOT.CHARS                          AS '16ZN.',
    TOT.INV.CHARS                      AS '14ZN.',
    TOT.AD                             AS '11ZN',
    TOT.INV.AD                         AS '9ZN',
    FILE.DATE                          AS '6N',
    BILL.MIN                           AS '8ZN',
    BILL.CHARS                         AS '10ZN',
    BILL.SESS                          AS '6ZN',
    BILL.AD                            AS '6ZN',
    INV.MIN                            AS '6ZN',
    INV.CHARS                          AS '8ZN',
    INV.SESS                           AS '5ZN',
    INV.AD                             AS '4ZN',
    CNTL.DAY.1                         AS '5N',
    DETAIL.LINE.80                     AS '80C',
    RPT.DATE                      AS '7C',
    CURR.YR                       AS 'C',
    CURR.MO                       AS '2C',
    CURR.DAY                      AS '2C',
    DESC.FIELD                         AS '40C',
    AMT.FIELD                          AS '10N',
    FILE.NAME                          AS '6C',
    NEW.FILE.NAME                      AS '14C'

%********************************%
%    TEMPORARY RELATIONS         %
%********************************%

RELATION TEMP.HOLD IS
   KEY   FILE.DATE
  DATA   BILL.MIN,
         BILL.CHARS,
         BILL.SESS,
         BILL.AD,
         INV.MIN,
         INV.CHARS,
         INV.SESS,
         INV.AD

%********************************%
%    SOURCE DECLARATIONS         %
%********************************%

SOURCE FILE.NAME.LIST FROM 'DIR.TMP-ANY'
  FIXED FORM
  INPUT
     DETAIL.LINE.80, @CR

SOURCE CURR.FILES FROM NEW.FILE.NAME
  FIXED FORM
  LINE.LENGTH 276
  INPUT
     @TAB TO 50,  FILE.DATE,       @CR,
     @CR, @CR, @CR, @CR, @CR, @CR, @CR, @CR, @CR, @CR,
     @TAB TO 49,  BILL.SESS,       @CR,
     @TAB TO 47,  BILL.MIN,        @CR,
     @TAB TO 45,  BILL.CHARS,      @CR,
     @TAB TO 49,  BILL.AD,         @CR,
     @TAB TO 50,  INV.SESS,        @CR,
     @TAB TO 49,  INV.MIN,         @CR,
     @TAB TO 47,  INV.CHARS,       @CR,
     @TAB TO 51,  INV.AD, @CR


%********************************%
%    REPORT DECLARATIONS         %
%********************************%

REPORT CURR.RPT TO REPORT.NAME
  PAGE.TOP         @FF
  PAGE.SIZE         60
  TOP.MARGIN         3
  BOTTOM.MARGIN      3
  HEADING.SIZE       1

  PAGE.HEADING
    PRINT
                     'DATE',
    @TAB TO 9,       'MINUTES',
    @TAB TO 20,      'CHARACTERS',
    @TAB TO 33,      'SESS',
    @TAB TO 42,      'AD',
    @TAB TO 47,      'INV.MIN',
    @TAB TO 55,      'INV.CHARS',
    @TAB TO 65,      'INV.SESS',
    @TAB TO 74,      'INV.AD',
    @CR

  REPORT.FOOTING
    PRINT            @SKIP 2,
    @TAB TO 18,      'TOTALS',
    @CR,
    @TAB TO 18,      'SESSIONS',
    @TAB TO 35,      TOT.SESS,
    @TAB TO 70,      TOT.INV.SESS,
    @CR,
    @TAB TO 18,      'MINUTES',
    @TAB TO 35,      TOT.MIN,
    @TAB TO 70,      TOT.INV.MIN,
    @CR,
    @TAB TO 18,      'CHARACTERS',
    @TAB TO 30,      TOT.CHARS,
    @TAB TO 65,      TOT.INV.CHARS,
    @CR,
    @TAB TO 18,      'DISCONNECTS',
    @TAB TO 35,      TOT.AD,
    @TAB TO 70,      TOT.INV.AD,
    @CR

%********************************%
%      FORMAT STATEMENTS         %
%********************************%

FORMAT DETAIL.LINE
                   FILE.DATE,
  @TAB 1,          BILL.MIN,
  @TAB 2,          BILL.CHARS,
  @TAB 1,          BILL.SESS,
  @TAB 1,          BILL.AD,
  @TAB 1,          INV.MIN,
  @TAB 1,          INV.CHARS,
           
  @TAB 3,          INV.SESS,
  @TAB 2,          INV.AD,
                   @CR
%********************************%
%         INITIALIZATION         %
%********************************%

MOVE DEFAULT TO CNT,
                TOT.SESS,
                TOT.INV.SESS,
                TOT.INV.MIN,
                TOT.CHARS,
                TOT.AD,
                TOT.INV.AD,
                TOT.MIN,
                TOT.INV.CHARS

TYPE @CR, 'PLEASE ENTER THE REPORT END DATE (ie; yymm.dd) : '
ACCEPT RPT.DATE

LET CURR.YR = SUBSTR(RPT.DATE,2,1)
LET CURR.MO = SUBSTR(RPT.DATE,3,2)
LET CURR.DAY = SUBSTR(RPT.DATE,6,2)
LET REPORT.NAME = ('SZ' + (RPT.DATE AS '7C') + '-ANY')


%The terminal list is edited to delete the heading in dir.tmp and%
%to ascertain from the current date if the data file should be   %
%considered as input to this procedure.                          %

FOR EACH FILE.NAME.LIST
  BEGIN %File Name List%
  MOVE DEFAULT TO NEW.FILE.NAME
  ADD 1 TO CNT
  IF CNT LE 5 THEN  %Skip the heading%
    NOTHING
  ELSE
    BEGIN %Identify files%
    LET FILE.NAME = SUBSTR(DETAIL.LINE.80,1,6)
    IF SUBSTR(FILE.NAME,2,1) = CURR.YR AS 'C' THEN
      IF SUBSTR(FILE.NAME,3,2) = CURR.MO AS '2C' THEN
        IF SUBSTR(FILE.NAME,5,2) AS '2N' GT 0 AND LE CURR.DAY AS '2N' THEN
          BEGIN %File name is good%
          LET NEW.FILE.NAME = FILE.NAME + '.CTL'
          TYPE @CR, 'PROCESSING --> ', NEW.FILE.NAME, @CR
          FOR EACH CURR.FILES
            BEGIN
            INSERT INTO TEMP.HOLD
            END
          END   %File name is good%
        ELSE NOTHING
      ELSE NOTHING
    ELSE NOTHING
    END %Identify files%
  END %File Name List%

FOR EACH TEMP.HOLD WRITE REPORT CURR.RPT
  BEGIN %Report%
  ADD BILL.MIN TO TOT.MIN
  ADD BILL.CHARS TO TOT.CHARS
  ADD BILL.SESS TO TOT.SESS
  ADD BILL.AD TO TOT.AD
  ADD INV.MIN TO TOT.INV.MIN
  ADD INV.CHARS TO TOT.INV.CHARS
  ADD INV.SESS TO TOT.INV.SESS
  ADD INV.AD TO TOT.INV.AD
  PRINT TO CURR.RPT DETAIL.LINE
  END

TYPE @CR, 'THE REPORT ', REPORT.NAME, ' IS READY!', @CR
END                                    %PROCEDURE%
    