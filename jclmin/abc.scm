File 1)	DSK:SECURE.DOC[11020,165226]	created: 1226 02-MAY-87
File 2)	DSK:SECURE.DOC[4,222076]	created: 1406 05-MAR-91

1)1	            Security Implications of Gateway Access Procedures  January 12, 87
1)	            --------------------------------------------------  Stephen White
1)	              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                      
1)	             This document is for Tymnet internal use only.             
1)	   Tymnet External Network Services - OnTyme ENS.ITS or call 703-356-6995
1)	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1)	   Here follows a discussi on of some alternative procedures by which
1)	   Tymnet may be accessed from 'foreign' networks.  Emphasis is given to
1)	   the security offered by Tymnet's advanced implementation of X.121
1)	   addressing.
1)	 
1)	   For the purposes of this discussion a 'foreign' network is any
1)	   network other than Tymnet and includes not only other country's
1)	   networks but also other networks in the United States of America.
1)	   Network security from gateways is increasingly important as Tymnet
1)	   brings up X.75 service with the Bell Operating Companies:  over 160
1)	   such gateways are already planned.  Tracing 'hacker' calls back
1)	   through gateways is time-consuming and often fruitless.  
1)	 
1)	   A host may elect to be open to calls worldwide or to restrict access
1)	   by requiring a username and/or password to be given to Tymnet before
1)	   the call is routed to their host.  Tymnet addressing also allows for
1)	   an address to be priority and/or multi-targeted to a group of hosts.
1)	   The wide range of options available enable a host to tailor its
1)	   access procedures to satisfy its requirements for security and ease
1)	   of access.
1)	 
1)	   Tymnet's security is at its weakest at the x.75 gateways where we
1)	   have to conform to the CCITT standards used by networks worldwide.
1)	   The spirit of the CCITT standards x.121 and x.75 is that, as with the
1)	   telephone, if you know a number you may call it.  For hosts that wish
1)	   this we provide group 19 (see below).  Tymnet is unique in the level
1)	   of security it can provide through enhanced features like those
1)	   outlined below.  In these matters prevention is definitely better
1)	   than cure, we urge careful reading of this document so that
1)	   a full appreciation of the implications of each alternative may be
1)	   gained....do you know that, by default, domestic usernames can
1)	   be used to log in from foreign nets?...read on!
1)2	   OPEN GATEWAY ACCESS - Group 19 
1)	   ------------------------------
1)	   Hosts which wish to be addressable from any foreign network with
1)	   Tymnet connections and with minimal network security applied may
1)	   request (preferably as a written request) to be in group 19.
1)	 
1)	   A host in group 19 is presumed to have security checks performed by
1)	   the host operating system.  Group 19 host addresses are available to
1)	   foreign administrations so a host that does not wish its address to
1)	   be so widely available should request to be red-listed (un-published).
1)	   
1)	   WARNING! Outdial hosts should NEVER be put in group 19 since security
1)	   at the modem is inadequate, if applied at all.  An outdial host in group
1)	   19 may be used by foreign network hackers to place international
1)	   calls - expensive for the host and almost impossible to trace.
1)	 
File 1)	DSK:SECURE.DOC[11020,165226]	created: 1226 02-MAY-87
File 2)	DSK:SECURE.DOC[4,222076]	created: 1406 05-MAR-91

1)	 
1)	A group 19 host is addressable as....(note the zero after the 3106)..
1)	 
1)	3106+0+<host>+<spid>   where:  3106    = Tymnet's Data Network Identification
1)	                                         code (DNIC) allocated to Tymnet by
1)	                                         the U.S. State Department.
1)	                                 0     = 'identifier' digit.
1)	                               <host>  = a 5 digit host number.
1)	                               <spid>  = up to a 4 digit sub-addr (optional).
1)	 
1)	Example: 3106000127  would address host 127, with no sub-host.
1)	 
1)	Advantages                              Related disadvantages
1)	----------                              ---------------------
1)	Easy Access - no password to enter.     Address may become known to
1)	                                        non-legitimate users, 'hackers'.
1)	 
1)	Wide range of sub-hosts addresses.
1)	 
1)	Worldwide access.                       Access cannot be limited from 
1)	                                        particular countries.
1)	 
1)	                                        no priority/multi targetting
1)	                                        capability.
1)3	 
1)	 
1)	ALTERNATIVES TO GROUP 19
1)	------------------------
1)	   To take advantage of Tymnet's security checking capabilities on calls
1)	   from other networks a host needs one of the alternatives to group 19
1)	   for its access procedures.  Using one (or more) of the options below,
1)	   with password protection, a very effective initial screening of calls
1)	   is carried out by the network supervisor.  Note that for a host
1)	   migrating from group 19 it is not necessary to change the host
1)	   number, moreover the X.121 address that is sent to the host may not
1)	   need to be changed.
1)	 
1)	   Suppose host 0127 wishes to be removed from group 19, or set up for
1)	   restricted gateway access:  the options are...
1)	 
1)	OPTION (A) - Using a Network User Number (NUN), protected access
1)	----------------------------------------------------------------
1)	   Enter a request in the "DTE system" for a numeric username (NUN) to form
1)	   the x.121 address.  We recommend that a password and red-listing
1)	   (address un-listed) be requested though these items are optional.
1)	   Addresses in this format are of the form...(note the 9 after the
1)	   DNIC)...
1)	 
1)	3106+9+<host>+<spid>   where:  3106   = Tymnet's DNIC
1)	                                 9    = 'identifier' digit
1)	                              <host>  = a 5 digit hostnumber
1)	                              <spid>  = up to 4 digits of sub-addr (optional).
1)	 
1)	   Example:  For host 127, sub-host 00...
File 1)	DSK:SECURE.DOC[11020,165226]	created: 1226 02-MAY-87
File 2)	DSK:SECURE.DOC[4,222076]	created: 1406 05-MAR-91

1)	             310690012700    (NUN=90012700)
1)	             310690012700    (NUN=90012700)
1)	 
1)	Note:  If a password  is required  then the Tymnet supervisor will prompt
1)	       for the password before the circuit is built to the host.  With the
1)	       address being a username, a password may be added/changed by the host
1)	       at any time, even if no password was originally requested.  Password
1)	       changes take effect in about 20 minutes - considerably quicker than
1)	       removing the host from group 19 and validating an NUN!
1)4	Advantages                              Related disadvantages
1)	----------                              ---------------------
1)	Easy for Tymnet to identify host.       Host identifiable to an outsider.
1)	 
1)	Password protection,  managed by        Caller may have to enter a password.
1)	host on Tymnet.
1)	 
1)	Password may be in Call                 Password in CUD is passed to host.
1)	User Data (CUD).                        CUD limited to 12 characters.
1)	 
1)	Easy for hosts to originate calls.      Easy to guess/search for address -
1)	                                        hence a password is recommended.
1)	 
1)	Multi/Priority targetting.              Sub-host addressing is awkward with
1)	                                        current implementation, a separate
1)	                                        NUN is required for each sub-host.
1)	                                        A version of XCOM code will soon be
1)	                                        available to overcome this limitation.
1)	Note:  For X.25  hosts,  be sure   to  coordinate  the  change of called
1)	       address with the  host. If it is difficult for the host to change
1)	       its software to accept a new called address it may be possible to
1)	       perform address modification at the host interface to overcome this.
1)	 
1)	       Example:  for a version 3.01 X.25 host a patch, (bchen:33)caddr.301,
1)	       may be included which will ALWAYS substitute the called
1)	       address in an IIX call for the address specified in the CLDADR
1)	       statement.  Other patches, capable of more elaborate
1)	       manipulation, may be available, contact HQTECH XCOM group or
1)	       ExNet Tech Spt (ENS.ITS) for information.
1)	 
1)	 
1)	 
1)	OPTION (B) - Using a Random Network User Number with password protection.
1)	-------------------------------------------------------------------------
1)	Request  a random NUN  (from DTE) for  the x.121 address, ask for it
1)	to be red-listed (un-listed) and have a password.
1)	 
1)	Addresses of this format are of form...(note 99 after the DNIC)..
1)	 
1)	3106+9+<####>     where:  3106  = Tymnet's DNIC
1)	                            9   = 'identifier' digits
1)	                          <####> = five to eight (5-8) 'random' digits.
1)	 
1)	Example: For host 127,  31069985326   (NUN=9985326)
1)5	Note:   The restriction that random NUN's should have the NTN
File 1)	DSK:SECURE.DOC[11020,165226]	created: 1226 02-MAY-87
File 2)	DSK:SECURE.DOC[4,222076]	created: 1406 05-MAR-91

1)	        start with "99" is no longer enforced as some Tymnet
1)	        interfaces require the first 2 characters of the username used
1)	        to build the circuit as a means of sub-addressing. THERE IS NO
1)	        TECHNICAL DIFFERENCE BETWEEN OPTIONS (a) AND (b).
1)	Note:   If sub-host addressing is required then specify in the request
1)	        to DTE exactly  what the last 1-4 digits is to be for every
1)	        sub-host.
1)	 
1)	Advantages and disadvantages of option (b)
1)	------------------------------------------
1)	   Same as for option (a) except that with the host number no longer in
1)	   the address, problem diagnosis may be slowed:  the price for being
1)	   cryptic.
1)	 
1)	OPTION (C) - The 'user friendly' approach. - enhanced access
1)	------------------------------------------------------------
1)	   From a foreign network, users are able to enter a called address of
1)	   "31069" to direct their call to Tymnet.  The Tymnet supervisor
1)	   prompts them to "please log in:  "  just as on Tymnet.  If a class 1,
1)	   2, 4 or 24 username is entered, the supervisor will allow the call to
1)	   be completed.  By default ALL 'domestic' usernames have class 4
1)	   access and may be used to log in from other networks.
1)	 
1)	   If you wish to control which usernames may be used from foreign
1)	   networks, give 'domestic' usernames only class 35 access and
1)	   'foreign' usernames only class 1 access.  A class 1 username MUST
1)	   originate from an X.75 gateway host whereas a class 35 username is
1)	   EXCLUDED from gateway access.  This provides good security, standard
1)	   'log in' procedures and user friendly network responses.
1)	Advantages                              Related disadvantages
1)	----------                              --------------------- 
1)	Easy for async/3270 hosts that          More difficult for host 
1)	need to 'key-off' usernames for         to originate calls.
1)	sub-host/application routing.
1)	                                        An X.25 Host recieves a call request
1)	                                        with "31069" as the called address.
1)	                                        This may be rejected by the host
1)	                                        software, so it may be necessary
1)	                                        to modify the called address at the
1)	                                        host interface before sending it to 
1)	                                        the host.
1)	User friendly network responses.
1)6	Advantages                              Related disadvantages
1)	----------                              ---------------------
1)	Username/password combination is
1)	difficult to 'crack'.  Tymnet host
1)	is able to change password for user.
1)	 
1)	Log in procedures are very similar
1)	for both domestic and foreign users.
1)	 
1)	 
1)	CONCLUSION
1)	----------
File 1)	DSK:SECURE.DOC[11020,165226]	created: 1226 02-MAY-87
File 2)	DSK:SECURE.DOC[4,222076]	created: 1406 05-MAR-91

1)	   A requirement for 'external network' access is by no means synonymous
1)	   with a host needing to be in group 19, with all the attendant
1)	   security implications.  Choosing one of the alternative options, or a
1)	   combination of (c) with (a) or (b), can offer effective protection
1)	   and other benefits.
1)	 
1)	   If you have questions regarding gateway access or the content of this
1)	   document, please contact External Network Services by calling
1)	   (703)356-6995 or OnTyme ENS.ITS.
1)	 
****
2)1	SOURCE: (MISDOC:38)SECURE.DOC
2)	LAST UPDATE: 01/15/91
2)	                        COMMISSIONS SECURITY FILE UPLOAD
2)	          *****THIS PROCEDURE TO BE RUN THE 15TH DAY OF THE MONTH*****
2)	DIR:EDPROD:30
2)	     1. SET STATUS
2)	     2. R COM;SECURE.COM
2)	ON A PC WITH TYMCOMM AND A NETWORK CONNECTION:
2)	     1. LOG ON TO SYSTEM 30.  (ANY VALID USER NAME)
2)	     2. SET STATUS
2)	     3. GFD NETCOMM
2)	     4. R COPYPC;TOPC CIDS.DMP C:CIDS.DMP /R
2)	     5. LOG OFF WHEN FILE TRANSFER IN STEP 4 IS DONE.
2)	     6. LOG ON TO DIALCOM;98
2)	     7. FT -U -X CIDS.DMP
2)	     WHEN DIALCOM FILE TRANSFER PROGRAM PROMPTS YOU TO BEGIN UPLOAD,
2)	     PRESS ALT-X TO BEGIN XMODEM UPLOAD.  TYMCOMM WILL PROMPT YOU FOR
2)	     FILE TO UPLOAD; ENTER C:CIDS.DMP.
2)	     8. SEND DIALCOM MESSAGE TO JACKM TO NOTIFY THAT FILE HAS BEEN
2)	        TRANSFERRED.
2)	     LOG OFF WHEN FILE UPLOAD IS FINISHED.
**************
   