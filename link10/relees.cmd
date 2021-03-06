:LOGFILE RELESE.LOG
; RELESE.CMD
;
;  A COMMAND FILE TO EXECUTE THE CP-11 SOFTWARE RELEASE PROCEDURE 
;
;  INVOCATION:
;
;	.PCOM RELESE.CMD
;
;
:TIME 120
DAY
;
; DELETE ALL FILES FROM (OLD11). (ALL FILES EXCEPT ONE SO THAT "DELETE"
; DOESN'T ASK QUESTION)
;
GFD OLD11
DELETE *.*,-OLDNIB.NIB
;
DIR /TEMPS
;
; MOVE ALL *.MAC, *.IMG, AND *.BND FILES FROM (CURR11) TO (OLD11)
;
COPY (CURR11)*.MAC+*.IMG+*.BND,SAME
;
; 
GFD CURR11
;
; DELETE ALL OLD FILESTHAT NEED TO BE REPLACED
;
DELETE *.IMG,*.BND,*.OBJ,*.NBJ,*.MAP
  
; COPY ALL *.MAC AND *.CMD FILES FROM (NEW11) TO (CURR11)
;  (IF A FILE WITH THE SAME NAME ALREADY EXIST, IT WILL BE SUPERSEDED)
; COMPILE THE LSI-11 VERSIONS
;
COPY (NEW11)*.MAC+*.CMD,SAME
R(TOOLS11)MACN11
MACOBJ@
;
;  
; GET A DIRECTORY LISTING OF ALL *.MAC FILES IN CHRONOLOGICAL ORDER
DIR *.MAC/EVERYTHING
;
;
; DELETE EVERYTHING FROM (NEW11)
;
GFD NEW11
DELETE *.MAC,*.OBJ,*.NBJ,*.IMG,*.BND,*.MAP,*.BAK,*.VUE,*.NEW,*.OLD,*.BK#
DIR
;
; ***  THEN COPY (CURR11)*.OBJ TO (NEW11)	***
;
COPY (CURR11)*.OBJ,SAME
;
;
; *** NOW USES MACNBJ.CMD IN (CURR11) TO REASSEMBLE FOR NON-EIS MACHINES ***
GFD CURR11
R(TOOLS11)MACN11
MACNBJ@
;
; REASSEMBLE ALL CONFIGURATION AND ROUTING FILES
;
R(TOOLS11)MACN11
ALLCFG@
;
; *** REMEMBER TO RUN ALLLNK.CMD SOON
;

 