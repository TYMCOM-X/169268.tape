external record!class Spec (
    string	Name;		comment Crash file name;
    integer	IDate;		comment Integer crash date;
    integer	ITime;		comment Integer crash time;
    integer	IName;		comment Sixbit crash file name;
    string	Info;		comment Crash info: system number, etc..;
    string	Anal;		comment Anal.Short;
    r!p(Spec)	Link );
external r!p(Spec)
    SpecHdr,			comment Head of Spec list;
    CraSpec,			comment Pointer to current crash Spec;
    SpecPtr;			comment .DCL Temp Spec pointer;
external integer
    SpecCnt;			comment .DCL Number of Spec records;
external procedure DBLoad;
comment
    call to load Spec data base from file Crash.Dat
;
  