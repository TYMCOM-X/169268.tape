forward external string  procedure ASZSTR( integer byte!spec );
forward external integer procedure BYPOK(  integer byte!spec );
forward external string  procedure CONSTR( integer byte!spec, count );
forward external integer procedure CMPSTR( string first, second );
forward external string  procedure DYNSTR( integer byte!spec, count );
forward external	 procedure STRACH( integer concat, character!to!add );
forward external	 procedure STRADD( integer concat; string to!add );
forward external string  procedure STRCLS( reference integer concat );
forward external integer procedure STRLEN( integer concat );
forward external integer procedure STROPN( integer buffer!size );
forward external string  procedure STRPEK( integer concat );
forward external integer procedure STRSTF( integer byte!spec; string str;
						boolean nonull(false) );
forward external integer procedure SUBEQU( string target, source );
forward external string  procedure UPDSTR( integer byte!spec, updated!bpt );

 