%   PAYROLL.R171                       PAYR71.PR3      09  %
PROCEDURE PAYROLL.R171
%
Version 13.0 --- December 14, 1990 --- Mark Nichols
  Reports now sort alphabetically by last name within department number.
  Also, negative and zero amounts are no longer printed to the reports.

Version 12.0 --- March 16, 1988 --- Sharon Young
  Report sorts on employee number, instead of sales number.

Version 11.0  3/14/85   J. Coons
Report now lists employees payments by sales number, with no branch, area
or regional divisions.  There is one grand total at the end of the report
and a seperate listing of new ytd payments for those employees whos payment
was altered.  All other options have been removed.

Version 10.0  1/08/85  J. Coons
Modified report to include employee number and remove adv column.

Version 9.0   1/27/84  S. Huang
Modified to pass SPECIAL.BONUS for Telecheck, and PIB, MIB for INSD to
payroll.

Version 8.0  06/25/82  C. Bryant
Modified to 1) count the number of person under each Comm Plan, 2) list
those who earn more than $3000 this month, and 3) list the new total
YTD paid for those whose earnings have been corrected in the DAT file.
Also corrected error in the non-printing of the file whenever a previous
copy of the file was still in the directory.

Version 7.0  06/09/82  C. Bryant
Modified to allow corrections to the payroll figures to be entered into
a dat file and to allow a file of good records to be created and passed
to the Payroll Department.

Version 6.0  02/03/82  L. Foster-Mason
Modified to include separate column in report for overpayments.

Version 5.0  03/09/80  H. Hobart
Modified to include PREV.YR, payments to be made for previous calendar year.

Version 4.0  12/19/79  H. Hobart
Modified to accept input permitting a check to be held, i.e., neither printed
nor included in totals on Payroll Report.

Version 3.0  02/20/79  D. Weaver
Changed for directory independence.

Version 2.0  12/22/78  M. Kelly
Modified for new ISP.

Version 1.0  06/22/78  J. Ano
*
This procedure produces a report for the PAYROLL DEPT.
with BRANCH.NUM, AREA.NUM, REGION.NUM, and final totals.
%
%
RELATIONS ACCESSED:             DATES, ISP, CHARTS
RELATIONS UPDATED:              NONE
INPUT FILES:                    NCS171.DAT
                                JCODE.TBL
OUTPUT FILES:                   NCS171.RPT
%


BEGIN

INCLUDE TEXT "RUN.TIME.TEXT"

FIELDS
  DEPT.NUM              AS '4N',
  DET.COMM              AS '5ZN.NN-',
  LAST.PIB              SAME AS PIB,
  LAST.MIB              SAME AS MIB,
  TOTAL.COMM            SAME AS AMT,
  NEW.YTD.COMM          SAME AS AMT,
  LAST.SP.BONUS         SAME AS SPECIAL.BONUS


SOURCE IN.FILE FROM FIL.DAT
  FREE FORM
  INPUT SALES.NUM,
        EMP.NUM,
        DET.COMM AS '-5ZN.NN'

REPORT PAYROLL.RPT TO FIL.RPT.ANY
  PAGE.TOP @FF
  PAGE.SIZE 60
  HEADING.SIZE   10
  TOP.MARGIN     3
  BOTTOM.MARGIN  3
  PAGE.HEADING
    PRINT
                'RUN DATE: ', TODAY AS DATE 'MM/DD/YY',
    @TAB TO 40, 'COMMISSIONS PAYROLL REPORT',
    @TAB TO 85, 'PAGE:', PAGE.NUM, @CR,
                'RUN TIME: ', RUN.TIME,
    @TAB TO 44, 'FOR MONTH OF ', COMM.DATE AS DATE 'MM/YY',
    @TAB TO 85,  FIL.RPT, @CR, @CR,
    @TAB TO 29, 'SALES',
    @TAB TO 36, 'EMP',
    @TAB TO 50, 'TOTAL', @CR,
                'EMPLOYEE NAME',
    @TAB TO 30, 'NUM',
    @TAB TO 36, 'NUM',
    @TAB TO 47, 'COMMISSION', @CR, @CR

REPORT NEW.YTD.PAID.RPT APPEND TO FIL.RPT.ANY
  PAGE.TOP      @FF
  PAGE.SIZE      60
  HEADING.SIZE    8
  TOP.MARGIN      3
  BOTTOM.MARGIN   3
  PAGE.HEADING
    PRINT
                'RUN DATE; ', TODAY AS DATE 'MM/DD/YY',
    @TAB TO 44, 'COMMISSION SYSTEM',
    @TAB TO 85, 'PAGE:', PAGE.NUM, @CR,
    @TAB TO 40, 'FOR THE MONTH OF ', COMM.DATE AS DATE 'MMM YYYY', @CR, @CR,
    @TAB TO 32, 'SALES',
    @TAB TO 40, 'EMP',
    @TAB TO 50, 'NEW YTD', @CR,
                'EMPLOYEE NAME',
    @TAB TO 33, 'NUM',
    @TAB TO 40, 'NUM',
    @TAB TO 52, 'PAID',
    @TAB TO 60, 'ACTION', @CR

FORMAT DETAIL.LINE
                             TRIM(EMP.LAST.NAME), ', ', EMP.FIRST.NAME,
    @TAB TO 28,              SALES.NUM,
    @TAB 2,                  EMP.NUM,
    @TAB 1,                  DET.COMM,
    @CR, @CR

FORMAT TOTAL.LINE
   @CR, 'TOTAL OF ALL PAYMENTS = $ ', TOTAL.COMM, @CR

FORMAT NEW.YTD.PAID.LINE
   @CR,    TRIM(EMP.LAST.NAME), ', ', TRIM (EMP.FIRST.NAME),
   @TAB TO 31, SALES.NUM,
   @TAB TO 41, EMP.NUM,
   @TAB TO 50, NEW.YTD.COMM,
   @TAB TO 65, '-'*15,
   @CR, @CR,   '-'*80,
   @CR


RELATION TEMP.IN IS
  KEY  DEPT.NUM,
       EMP.LAST.NAME,
       SALES.NUM
  DATA EMP.NUM,
       EMP.FIRST.NAME,
       DET.COMM

RELATION TEMP.HOLD IS
  KEY  DEPT.NUM,
       EMP.LAST.NAME,
       SALES.NUM
  DATA EMP.NUM,
       EMP.FIRST.NAME,
       DET.COMM

RELATION TEMP.ISP IS
  KEY  SALES.NUM,
       EMP.NUM
  DATA EMP.FIRST.NAME,
       EMP.LAST.NAME,
       COMM.PLAN


LET PROCEDURE.NAME = 'PAYROLL.R171'
LET VERS.NUM = 12.0
LET PROC.NUM = '171'

RUN BEGIN.PROCEDURE (PROCEDURE.NAME, VERS.NUM, PROC.NUM)
  ACCEPTING (USR.NAM, PREFIX, FIL.DAT, FIL.DAT.ANY, FIL.FMT,
  FIL.FMT.ANY, FIL.RPT, FIL.RPT.ANY, FIL.TMP, FIL.TMP.ANY)

FOR EACH ISP
  IF ACT.CODE = 'A'
    THEN
      IF EMP.NUM < 899999
        THEN INSERT INTO TEMP.ISP
        ELSE NOTHING
    ELSE NOTHING

FOR EACH IN.FILE
  SELECT TEMP.IN VIA KEY
    THEN TYPE @CR, 'SALES.NUM, ', SALES.NUM, 'IS DUPLICATE', @CR
    ELSE
      SELECT TEMP.ISP VIA KEY
        THEN
          BEGIN
          LET DEPT.NUM = SUBSTR(SALES.NUM AS '6C', 1, 4) AS '4N'
          INSERT INTO TEMP.IN
          INSERT INTO TEMP.HOLD
          END
        ELSE TYPE @CR, 'SALES # ', SALES.NUM, ' NOT IN TEMP.ISP'

FOR EACH DATES
  FOR EACH CHARTS WHERE COMM.DATE = COMM.DATE OF DATES
    IF EMP.NUM < 89999
      THEN
        BEGIN
        LET DET.COMM = PD.THIS.MONTH
        LET DEPT.NUM = SUBSTR(SALES.NUM AS '6C', 1, 4) AS '4N'
        SELECT TEMP.ISP VIA KEY
          THEN
            SELECT TEMP.IN VIA KEY
              THEN NOTHING
              ELSE INSERT INTO TEMP.IN
          ELSE TYPE @CR, 'SALES NUM, ', SALES.NUM, ' NOT IN TEMP.ISP!', @CR
        END
      ELSE NOTHING

FOR EACH DATES WRITE REPORT PAYROLL.RPT
  BEGIN
  FOR EACH TEMP.IN
    IF DET.COMM > 0
      THEN
        BEGIN
        PRINT TO PAYROLL.RPT DETAIL.LINE
        ADD DET.COMM TO TOTAL.COMM
        END
      ELSE NOTHING
  PRINT TO PAYROLL.RPT TOTAL.LINE
  END

FOR EACH DATES WRITE REPORT NEW.YTD.PAID.RPT
  FOR EACH TEMP.HOLD
    BEGIN
    SELECT CHARTS VIA KEY
      THEN
        IF COMM.DATE OF CHARTS = COMM.DATE OF DATES
          THEN LET NEW.YTD.COMM = COMM.PD.PRIOR + DET.COMM
          ELSE NOTHING
      ELSE NOTHING
    PRINT TO NEW.YTD.PAID.RPT NEW.YTD.PAID.LINE
    END

LET FILE.1 = FIL.RPT.ANY
MOVE DEFAULT TO FILE.2,
                FILE.3,
                FILE.4,
                FILE.5

RUN END.PROCEDURE (PROCEDURE.NAME, FILE.1, FILE.2, FILE.3, FILE.4, FILE.5)

END
  