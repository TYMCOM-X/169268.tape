TTYIO .SIM %TTYIO  ;TTY IO routines
PSWUPD.MAC %PAM    ;Send (SYS)DRWSPR.EPO oper password file
PSWUPD.REL %PAM    ;Send (SYS)DRWSPR.EPO oper password file
JOB001.MAC %JOB001 ;Update Password/Node file this system (WF AC WC)
JOB001.REL %JOB001 ;Update Password/Node file this system (WF AC WC)
TTYIO .REL %TTYIO  ;TTY IO routines
RDNACC.MAC %PAM    ;Read Network Accounting
JOB001.CMD %JOB001 ;Update Password/Node file this system (WF AC WC)
JOB001.HGH %JOB001 ;Update Password/Node file this system (WF AC WC)
JOB001.LOW %JOB001 ;Update Password/Node file this system (WF AC WC)
UFDUPD.MAC %TRUCTL ;Update UFD routine
NDMUPD.MAC %PAM    ;Send (TYMNET)NODES.MAP file
JOB002.CMD %JOB002 ;TRU Control Job (OP WF WC SY JL ST) [DET]
JOB002.MAC %JOB002 ;TRU Control Job (OP WF WC SY JL ST) [DET]
JOB002.REL %JOB002 ;TRU Control Job (OP WF WC SY JL ST) [DET]
NDMUPD.REL %PAM    ;Send (TYMNET)NODES.MAP file
UFDUPD.REL %TRUCTL ;Update UFD routine
JB1N90.MAC %JOB001 ;Update PSW/NODE file on  [non-90] (WF AC WC)
JB1N90.CMD %JOB001 ;Update PSW/NODE file on  [non-90] (WF AC WC)
JB1N90.REL %JOB001 ;Update PSW/NODE file on  [non-90] (WF AC WC)
JOB002.HGH %JOB002 ;TRU Control Job (OP WF WC SY JL ST) [DET]
JOB002.LOW %JOB002 ;TRU Control Job (OP WF WC SY JL ST) [DET]
TRUCTL.SIM %TRUCTL ;TRU Control Program, Main Source Module
TRUCTL.INF %TRUCTL ;TRU Control Program Documentation
TRUCTL.FIL %TRUCTL ;TRU Control Program [File list]
TRUCTL.CMD %TRUCTL ;TRU Control Program
MAKJOB.SIM %MAKJOB ;Setup (PJ)JOBS.DAT system map and jobs
MAKJOB.CMD %MAKJOB ;Setup (PJ)JOBS.DAT system map and jobs
PJTYM .RNO %PAM    ;Documentation source for TYMNET (PJ)PAM
JOB003.CMD %JOB003 ;Copy SPOOL accounting records
JOB003.MAC %JOB003 ;Copy SPOOL accounting records
MAKJOB.REL %MAKJOB ;Setup (PJ)JOBS.DAT system map and jobs
JOB003.REL %JOB003 ;Copy SPOOL accounting records
TRUCTL.REL %TRUCTL ;TRU Control Program, Main module
JOB1TT.CMD %JOB001 ;Update PSW/NODE file this system [TTY] (WF AC WC)
COPNET.MAC %PAM    ;Copy Net Acctg from the SUP (AC WF)
RDERR .SIM %RDERR  ;Read Error File
RDERR .CMD %RDERR  ;Read Error File
JB1O90.MAC %JOB001 ;Update PSW/NODE file on  [on-90] (WF AC WC)
JB1O90.CMD %JOB001 ;Update PSW/NODE file on  [on-90] (WF AC WC)
JB1O90.REL %JOB001 ;Update PSW/NODE file on  [on-90] (WF AC WC)
JOB190.HGH %JOB001 ;Update PSW/NODE file on  [on-90] (WF AC WC)
JOB190.LOW %JOB001 ;Update PSW/NODE file on  [on-90] (WF AC WC)
JOB003.DBG %JOB003 ;Copy SPOOL accounting records [TTY]
SPOOL .TAP %TAPCHG ;Create SPOOL acctg rec for printed on other systems
JOB003.HGH %JOB003 ;Copy SPOOL accounting records
JOB003.LOW %JOB003 ;Copy SPOOL accounting records
JOB004.CMD %JOB004 ;Update REMCNT for SPOOL
JOB004.MAC %JOB004 ;Update REMCNT for SPOOL
PAM   .REL %PAM    ;PAM [DET] Main program (WC OP SY ST JL AC WF)
JOB004.REL %JOB004 ;Update REMCNT for SPOOL
PAMTTY.MAC %PAM    ;PAM [not DET] Main program (WC OP SY ST JL AC WF)
PAMTTY.REL %PAM    ;PAM [not DET] Main program (WC OP SY ST JL AC WF)
PAM   .HGH %PAM    ;PAM [DET] Main program (WC OP SY ST JL AC WF)
PAM   .MAC %PAM    ;PAM [DET] Main program (WC OP SY ST JL AC WF)
JOB004.DBG %JOB004 ;Update REMCNT for SPOOL [TTY]
JOB004.HGH %JOB004 ;Update REMCNT for SPOOL
JOB004.LOW %JOB004 ;Update REMCNT for SPOOL
PAM   .LOW %PAM    ;PAM [DET] Main program (WC OP SY ST JL AC WF)
GETULC.MAC %TRUCTL ;Read OPER password file to GET User's LiCense
SETPSC.MAC %SETPSC ;Set COPY PASSWORD FILE flag
PJNET .RNO %PAM    ;Documentation source for NETWORK (PJ)PAM
JOB005.MAC %JOB005 ;Copy Net Acctg from the SUP [ACCTG SYS] (SY AC)
JOB005.CMD %JOB005 ;Copy Net Acctg from the SUP [ACCTG SYS] (SY AC)
GETULC.REL %TRUCTL ;Read OPER password file to GET User's LiCense
JOB005.REL %JOB005 ;Copy Net Acctg from the SUP [ACCTG SYS] (SY AC)
SETPSC.REL %SETPSC ;Set COPY PASSWORD FILE flag
JOB005.OLD %JOB005 ;Copy Net Acctg from the SUP [ACCTG SYS] (SY AC)
UFD   .COM %DMS    ;DMS comment file.
UPDPAD.MAC %PAM    ;Update ADDR/NODE files (WF) installed in SPOOL
JOB006.MAC %JOB006 ;Tape Library [Acct system only] (SY AC)
JOB006.CMD %JOB006 ;Tape Library [Acct system only] (SY AC)
JB1N33.MAC %JOB001 ;Update PSW/NODE file on  [non-33] (WF AC WC)
JB1N33.CMD %JOB001 ;Update PSW/NODE file on  [non-33] (WF AC WC)
JOB006.REL %JOB006 ;Tape Library [Acct system only] (SY AC)
UPDPAD.REL %PAM    ;Update ADDR/NODE files (WF) installed in SPOOL
JB1N33.REL %JOB001 ;Update PSW/NODE file on  [non-33] (WF AC WC)
TAPCHG.MAC %TAPCHG ;Create SPOOL acctg rec for printed on other systems
JB1N33.HGH %JOB001 ;Update PSW/NODE file on  [non-33] (WF AC WC)
JB1N33.LOW %JOB001 ;Update PSW/NODE file on  [non-33] (WF AC WC)
JOB006.HGH %JOB006 ;Tape Library [Acct system only] (SY AC)
JOB006.LOW %JOB006 ;Tape Library [Acct system only] (SY AC)
TRAUFD.MAC %TRUCTL ;Transfer TRUs from 1 UFD to another
RDUFD .MAC %TRUCTL ;RDUFD - Update UFD routine
HASH  .MAC %TRUCTL ;LUD hash routine, called by SIMPL programs
SETNOD.MAC %SETNOD ;Set COPY NODE FILE flag (WF)
JOB007.CMD %JOB007 ;Update PERP's Schedule
JOB007.MAC %JOB007 ;Update PERP's Schedule
JB1O33.MAC %JOB001 ;Update PSW/NODE file on  [on-33] (WF AC WC)
JB1O33.CMD %JOB001 ;Update PSW/NODE file on  [on-33] (WF AC WC)
CUP   .MAC %PAM    ;CLASS,GROUP table update (AC WF)
JOB007.REL %JOB007 ;Update PERP's Schedule
HASH  .REL %TRUCTL ;LUD hash routine, called by SIMPL programs
TRAUFD.REL %TRUCTL ;Transfer TRUs from 1 UFD to another
RDUFD .REL %TRUCTL ;RDUFD - Update UFD routine
SETNOD.REL %SETNOD ;Set COPY NODE FILE flag (WF)
JB2TTY.CMD %JOB002 ;TRU Control Job (OP WF WC SY JL ST) [TTY]
RDACT .SIM %RDACT  ;Read Accounting File
RDACT .CMD %RDACT  ;Read Accounting File
RDACT .REL %RDACT  ;Read Accounting File
RDNERR.SIM %RDNERR ;Read Net Acctg ERROR file (COLLECTR)NETACC.DAT
JOBN05.MAC %JOB005 ;Copy Net Acctg from the SUP [NOT ACCTG] (SY AC)
JOB007.HGH %JOB007 ;Update PERP's Schedule
JOB007.LOW %JOB007 ;Update PERP's Schedule
JB1O33.DBG %JOB001 ;Update PSW/NODE file on  [on-33] (WF AC WC)
JB1O33.REL %JOB001 ;Update PSW/NODE file on  [on-33] (WF AC WC)
JB1O33.HGH %JOB001 ;Update PSW/NODE file on  [on-33] (WF AC WC)
JB1O33.LOW %JOB001 ;Update PSW/NODE file on  [on-33] (WF AC WC)
RDACT .HGH %RDACT  ;Read Accounting File
  