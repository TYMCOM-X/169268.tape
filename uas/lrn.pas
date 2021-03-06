PROGRAM LRN

TYPE
  BTREEPT               = ^BTREE;
  BTREE                 = RECORD
    REC                 : STRING[20];
    L,R                 : BTREEPT;
  end;

  BTFREC                = RECORD
    REC                 : STRING[20];
    L,R                 : BOOLEAN;
  end;

VAR
  ROOT                  :BTREEPT;
  MODE                  :CHAR;

FUNCTION F_EXISTS(NAME: STRING[20]):BOOLEAN;
VAR FIL :FILE;
BEGIN;
ASSIGN(FIL, NAME);
{$I-}
RESET(FIL);
{$I+}
FILE_EXISTS :=(IORESULT=0);
END;

BEGIN;
WRITE('Please enter the name of the file you would like to load (or cr). ');
READLN(FNAME);
END;
UNTIL F_EXISTS(FNAME) OR (LENGTH(FNAME)=0)

IF LEAF(ROOT) THEN
  MODE := 'L'   {Learn}
ELSE
  MODE := 'P';  {Pose question}

REPEAT
  BEGIN;
  CASE MODE OF
  'P':
    BEGIN;
    POSE_QUESTION(ROOT, ANSWER)
    TRAVERSE(ROOT, ANSWER);
    IF LEAF(ROOT) THEN
      MODE := 'L'
    ELSE
      MODE := 'P';
    END;

  'L':
    BEGIN;
    PRMPT_Q_OR_O(Q_OR_O);       {New decision question or object(leaf)}
    IF Q_OR_O='Q' THEN
      BEGIN;
      GET_Q(ROOT);              {Get new question and point to it with root}
      MODE := 'P';
      END;
    GET_O(ROOT);
    MODE := 'P'
    END;
  
  'A':                          {Ascend}
    BEGIN;
    IF PARENT <> ROOT THEN
      ROOT := PARENT
    ELSE
      WRITELN('Cant ascend.  Already at top.');
    MODE := 'P';
    END;

  'Q':
    BEGIN;
    WRITELN('Thank you for playing.');
    END;
  end;
  END;
UNTIL MODE='Q'
WRITELN('Play again? ');
READLN(PA);
UNTIL (PA='N');
WRITELN('Save game? ');
READLN(SG);
IF SG='Y' THEN
  BEGIN;
  WRITE('Please enter filename.  ');
  READLN(FNAME);
  IF F_EXIST(FNAME) THEN
    BEGIN;
    WRITE('File exists.  Ok to erase.');
    READLN(OK);
    END
  IF OK='Y' THEN
    WRITE_BTFILE(FNAME, MASTER_ROOT);
  END;
END;
    