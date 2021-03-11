;
;     This control  file applies  Software  House's PA1050  patches  to
;DEC's Autopatched PA1050 (PAT.MAC) using Autopatch utilities and  then
;loads PA1050.  The  following logical names  are assumed: PAT:,  DIS:,
;BAK:,  INS:,  and  ASL:  (see   the  Autopatch  documentation  for   a
;description of these logical names).
;
;     Three files  should  be restored  from  the 1022  tape:  Software
;House's baseline file  (PA1050.MBS which is  DEC's original .MAC  file
;before Software  House's  changes),  Software  House's  modified  file
;(PA1050.MAC), and the comparison file (PA1050.COR which was  generated
;using COMPAR).  These should be restored to PAT:.
;
;     The basic procedure  for patching  is in three  steps:
;
;     A) Use the COMPAR program to compare PA1050.MBS vs.   DIS:PAT.MAC
;	 (the Autopatched PAT) to produce a PAT.APC comparison file.
;
;     B) Use the MERGE program to combine the PAT.APC file just created
;	 with the  PA1050.COR comparison  file  provided on  the  tape.
;	 This produces the PAT.COR comparision file.
;
;     C) Use  the  UPDATE  program  to make  the  sources  changes  (in
;	 PAT.COR) to the baseline file (PA1050.MBS) to produce the  new
;	 source file (PAT.MAC).
;
;
;                 +--------------+    .------.    +--------------+
;                 | DIS:PAT.MAC  |-->( COMPAR )<--|PAT:PA1050.MBS|
;                 +--------------+    "------"    +--------------+
;                                        |               |
;                                        V               |
;  +--------------+    .-----.    +--------------+       |
;  |PAT:PA1050.COR|-->( MERGE )<--| PAT:PAT.APC  |       |
;  +--------------+    "-----"    +--------------+       |
;                         |                              |
;                         V                              |
;                  +--------------+    .------.          |
;                  | PAT:PAT.COR  |-->( UPDATE )<--------+
;                  +--------------+    "------"
;                                         |
;                                         V
;                                  +--------------+
;                                  | PAT:PAT.MAC  |
;                                  +--------------+
;
;
;
;     The following files  are needed from  the 1022 distribution  tape
;(restore to PAT:)
;	PA1050.MAC		;source with 1022 changes
;	PA1050.COR		;comparsion of 1022 changes
;	PA1050.MBS		;source before 1022 changes
;
; Already Autopatched files:
;	DIS:PAT.MAC
;
@ENABLE
;
;  Define logical names for patching
@DEFINE DSK: DSK:,PAT:
@PEP
*
*STATUS UTIL		;Shouldn't be both KL and KS
*EXIT
@DEFINE DSK: DSK:,ASL:
;
;  Connect to PAT: for doing work
@CONN PAT:
;
;  Step A
@RUN ASL:COMPAR
*PAT:PAT.APC=PAT:PA1050.MBS,DIS:PAT.MAC
;*PAT:PA1050.COR=PAT:PA1050.MBS,PAT:PA1050.MAC/NAME:"SH"/NUMBER
*/EXIT
;
;  Step B
@RUN ASL:MERGE
*PAT:PAT.COR=PAT:PAT.APC,PAT:PA1050.COR
*/EXIT
;
;  Step C
@RUN ASL:UPDATE
*PAT:PAT.MAC=PAT:PA1050.MBS,PAT:PAT.COR
*/EXIT
;
;  Compile the new updated PAT.MAC
@RUN ASL:MACRO
*PAT=PAT.MAC
;
;  Build PA1050
@RUN ASL:LINK
*PAT/GO
@START
@SAVE PAT
@GET PAT
@START
*MAKEPF^[G^[
;
;  Install PA1050
@COPY INS:PA1050.EXE BAK:PA1050.EXE
@RENAME PAT:PA1050.EXE INS:PA1050.EXE
%ERR::
@LOGOUT
    