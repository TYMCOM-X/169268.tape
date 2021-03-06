
comment
    absolute addresses in crash file
;
define	DdtSym = '036;		comment EDDT symbol table ptr setup by ONCE;
define	JobSym = '116;		comment Where to find symbols in monitor files;
define	JobVer = '137;		comment Pointer to CONFIG;
define	!CNCPU = '41;		comment CPU type code index into CONFIG;
define	Key620 = '150;		comment Key620 location;
define	Key = '633751506262; 	comment Key620 healthy value;

comment
    table offsets in crash file
;
define	cnf.CRSDB  = -2;	comment xwd CRSDB,NUMTAB;
define	crs.PISTS  = '0;	comment CONI  PI,  (RDPI)	ILS3;
define	crs.APRSTS = '1;	comment CONI  APR, (RDAPR)    ILS3;
define	crs.PAGDTI = '2;	comment DATAI PAG, (RDUBR)    ILS3;
define	crs.PAGCNI = '3;	comment CONI  PAG, (RDEBR)    ILS3;
define	crs.AIDSTS = '4;	comment BLKI  APR, (APRID)    .LS.;
define	crs.APRDTI = '5;	comment DATAI APR,     	IL.3;
define	crs.CRSHAC = '14;	comment xwd EPT,CRSHAC;
define	crs.SAV30  = '15;	comment value of 30 saved here;
define	crs.STOPCN = '16;	comment count of times we tried to crash;
define	crs.STOPPC = '17;	comment real PC of first STOPCD we hit;

comment
    some special bit values
;
define
    STAUTO	= !bit(17),
    STSUPR	= !bit(19),
    STSHUT	= !bit(18),
    STRLB	= !bit(20);

comment
    date and time definitions
;
define	GMT = '20;	comment GMT time zone;
define	Local = -1;	comment Time zone code for user's local time zone;
define	DECForm = 0;	comment DEC formated date flag;
define	DaysPast = '400000; comment Days past 1/1/64 date format flag;

comment
    define cpu type values KI, KL, KS and F3
;
define cpu!! = 0;
forlc cpu! = (KI,KL,KS,F3) 
    doc { redefine cpu!! = cpu!! + 1; define cpu! = cpu!!; } endc
	
comment
    miscelaneous
;
require 100 polling!interval;
external string procedure cvDate( integer DECD );
external string procedure cvTime( integer SECS );
external string procedure cvZone( integer Z );
external string procedure cvDayTime( integer D,T,Z(Local) );
   