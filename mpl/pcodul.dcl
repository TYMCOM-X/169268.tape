comment
!
! External declarations for the DUL scanning routine.
!
! Dave W. Smith  (Date unknown in '82).
;

require "PCODUL" library;

comment
!
!  This routine maps a PPN (AUN) to a user name.  It keeps a
!  cache to minimize input from the DUL.
;

external string procedure CVUser( integer AUN );
    