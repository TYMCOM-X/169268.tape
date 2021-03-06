external record!class SYM (
	integer	SYSID;		comment unique monitor serial number;
	string	MONID;		comment monitor version name;
	string	SOURCE;		comment source file for symbols;
	r!p(a!c)LINK;		comment link to next MonSym block;
	boolean	HaveSym;	comment we have a valid symbol table;
	integer STP;		comment absolute memory symbol table pointer;
	integer array SymTab );	comment symbol table;
external r!p(SYM) CraSym;	comment pointer to current symbols;
external procedure GetSymbols (integer SYSID);
comment
Scan the list of symbol tables which we have already read in and if
one matches the monitor name given, return a pointer to it.  If no
match is found, an attempt is made to find a FILDDT or MONITOR file
containing the proper symbols in (SYS) or (M33) and the symbols are
read in to a record, the record is linked on the list and returned
as the value of the function.
;
external string procedure cvSym (integer VAL);
comment	convert value to best symbol and offset as per current symbol table;
external integer procedure cvVal( string SYMSTR );
comment	evaluate symbol, string may include module name followed by colon;
  