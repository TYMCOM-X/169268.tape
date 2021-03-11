
                           ISIS SLOT PROGRAMMING

           COURSE :  ISIS PROGRAMMING               DATE:
           COURSE NUMBER :  TTE.442                 WEEK:  1  OF  2

***********************************************************************
       DAY             SUBJECT           LESSON PLAN NO.        TIME
                                         EXERCISE PLAN NO.
***********************************************************************

     MONDAY       ISIS OVERVIEW              LP111.442          2.5
                  COMMUNICATIONS PROCESSES   LP112.442          2.5
                  OVERVIEW OF ISIS SOFTWARE  LP113.442          1.0

     TUESDAY      ISIS EXTERNAL COMM.        LP121.442          1.0
                  ISIS INTERNAL COMM.        LP122.442          1.0
                  CIRCUIT BUILDING           LP123.442           .5
                  MESSAGE FORMATS            LP124.442           .5
                  MESSAGE TYPES              LP125.442          1.0
	          CIRCUIT BUILDING MESSAGES  LP126.442          1.0
                  TERMINAL PARAMETER MESSAGE LP127.442          1.0

     WEDNESDAY    SLOT CONTROL INFO. MESSAGE LP131.442           .5
                  NAD ASSEMBLY LANGUAGE      LP132.442          2.0
                  NAD ASSEMBLY DIRECTIVES    LP133.442          2.0
                  MACRO FACILITY             LP134.442          1.0
                  LAB EXERCISE NO. 1         LE135.442          1.5

     THURSDAY     LIBRARY PACKAGES           LP141.442          4.5
                  ISIS DDT                   LP142.442          2.0
                  NAD DEBUGGER               LP143.442          1.0

     FRIDAY       SLOT FILES                 LP151.442          1.0
                  GOOD GUY LIST AND OTHER    LP152.442          1.0
                  LIBRARY PACKAGES           LP153.442          2.0
                  LAB  1  (FINISH)                        ALL AFTERNOON



_______________________________________________________________________

       COURSE :  ISIS PROGRAMMING               DATE ::
       COURSE NUMBER :  TTE.442                 WEEK :  2 OF 2

***********************************************************************
      DAY             SUBJECT         LESSON PLAN NO.          TIME
                                      EXERCISE PLAN NO.    
************************************************************************

     MONDAY         QUIZ & REVIEW            LP211.442          2.0
                    SYSTEM SVC'S             LP212.442          1.0
                    I/O CONTROL SVC'S        LP213.442          1.0
                    SYNC. INPUT CONTROL SVC  LP214.442          1.5
                    SYNC. OUTPUT CONTROL SVC LP215.442          1.5
                    LAB 2 (SYNC.)            LE216.442          1.0

     TUESDAY        ASYNC. SUPERVISORY CALLS LP221.442          1.5
                    FRONT CONSOLE OF ENGINE  LP223.442          1.0
                    LAB 2 (FINISH)                         ALL AFTERNOON

     WEDNESDAY      LAB 3 (ASYNC.)           LE231.442          1.0
                    DDT SUPERVISORY CALLS    LP232.442          1.5
                    LAB.                                  ALL AFTERNOON

     THURSDAY       SIO                      LP241.442          3.5
                    SIO SUPERVISORY CALLS    LP242.442          2.0
                    LAB.                                        2.5

     FRIDAY         LAB. REVIEW              LP251.442          1.5
                    REVIEW & SUMMARY         LP252.442          1.0
                    FINAL EXAM.              LP253.442          2.0
                    REVIEW THE FINAL EXAM.   LP254.442          1.0

   Course  :  ISIS Programming                  Date  :
   Lesson  : Course Intro. & ISIS Overview      Course No. TTE.442
   Week  :  1   Day  :  1  Period  :  1         Lesson No.  LP111.442

______________________________________________________________________________________


  OBJECTIVES :
        1. TO PROVIDE AN OVERALL VIEW OF THE COURSE CONTENT AND FLOW
           OF MATERIALS.
        2. TO GIVE AN OVERVIEW OF ISIS
              2.1 KERNEL
              2.2 DISPATCHER
              2.3 SLOTS & PROCESSES
              2.4 ORING & IRING
              2.5 SEGMENT E
              2.6 SEGMENT F

   MATERIALS REQUIRED
        1. ISIS-II REFERENCE MANUAL
        2. HANDOUT - CLASS CONTENT AND SCHEDULE  _____HANOUT.442












    COURSE NO.  TTE.442        LESSON NO.  LP111.442      PAGE NO.

 REFERENCES      SLIDE #       LESSON PLAN


-------------------------------------------------------------------------------------------
 ISIS-II         SL.1          I. INTRODUCTION TO ISIS-II
                                  A. ISIS-INTERNALLY SWITCHED INTERFACE SYSTEM
                                     - IS NOT REALLY AND OPERATING SYSTEM,
                                     BUT A SET OF RULES AS TO HOW INTERFACES
                                     ARE TO BE CONSTRUCTED AND HOW THEY ARE
                                     TO COMMUNICATE WITH EACH OTHER WITH A
                                     LITTLE CODE TO HANDLE INTERRUPTS.
                                  B. THE CONCEPT OF THE ISIS DESIGN IS TO
                                     ALLOW THE MACHINE TO BE DIVIDED INTO
                                     PARTITIONS, CALLED 'SLOTS'.
                                     THIS WOULD PROVIDE THE CAPACITY OF
                                     MAKING EACH OF THE VARIOUS NETWORK 
                                     INTERFACES A SEPARATE MODULE THAT COULS
                                     BE DEVELOPED, DEBUGGED AND DEPLOYED
                                     ON NETWORK NODES WHILE PROTECTING
                                     THESE NODES FROM POSSIBLE FAULTS
                                     IN THE INTERFACE.
                                  C. ISIS TREATS THE TYMNET NODE CODE AS
                                     JUST ANOTHER INTERFACE. THE TYMNET 
                                     NODE CODE HAS SPECIAL PROPERTIES ONLY
                                     WHEN EXECUTING IN SLOT 0.
                                     THESE INCLUDE THE ROUTING AND MONITORING
                                     FUNCTIONS RELATING TO THE TYMNET SUPE.
                                     * IF TYMNET INTERFACE IS EXECUTED IN
                                     OTHER SLOT, IT PERFORMS THE FUNCTION
                                     OF A GATEWAY TO TYMNET.
                               II. KERNAL PROCESS
                                     THE KERNEL, ALSO KNOWN AS SLOT FF 
                                     (IMPORTANT  TO KNOW FOR DEBUGGING)
                                     IS THE CONTROL CENTER OF THE ISIS
                                     OPERATING ENVIRONMENT.
                                     1. SCHEDULES CPU TIME FOR ALL PROCESSES.
                                     2. UPDATES SEG. F - WHICH IS 
                                        PHYSICALLY LOCATED IN THE KERNEL
                                        AREA OF MEMORY,,THAT IS SET UP    
                                        IN THE MAC SEGMENTATION REGISTERS.
                                        SEG. F IS A COMMON READ-ONLY DATA
                                        AREA FOR ALL SLOTS.
                                     3. PROCESSES SVC CALLS.
                                     4. HANDLES ALL HARDWARE INTERRUPTS 
                                        (THESE HAVE TOP PRIORITY WITHIN THE 
                                         MACHINE)
                                          A. KERNEL DOES NOT BUFFER ANY
                                             DATA,IT SIMPLY RUNS THE PROCESS
                                             AND TRANSFERS DATA TO THE SLOT.
                                          B. TRANSLATES PHYSICAL I/O 
                                             DEVICES INTO LOGICAL UNITS
                                             SEEN BY THE SLOTS.
                                III. DISPATCHER
                                     1. ACTS  AS A SWITCHING CENTER (COMM.
                                        CENTER) OF ISIS, ROUTING MESSAGES
                                        AND DATA FROM ORIGINATING SLOT 
                                        TO THE DESTINATION SLOT.
                                     2. DOES THE WORK OF SCHEDULING AND 
                                        PROCESSING DATA GOING BETWEEN SLOTS.
                                     3. DOES NOT HAVE ANY KNOWLEDGE
                                        OF THE STRANGE PROPERTIES OF 
                                        SPECIFIC INTERFACES.
                                        - EACH SLOT (INTERFACE) MUST 
                                        FOLLOW A SET OF PROTOCOLS WHICH 
                                        IT USES TO TALK TO THE DISPATCHER.
                                        ( MIGHT NEED TO TRANSLATE REQUESTS
                                        AND MESSAGES TO THE STANDARD FORMAT)
                                     4. CHECKS THE DATA FLOW TO MAKE SURE
                                        THAT, IS THE INTERFACE IS IN ERROR,
                                        IT DAMAGES ONLY ITS DATA.
                                      5. RUNS EVERY TIME A TRUE BACKGROUND
                                        JOB RUNS, AND SETS UP BACKGROUND 
                                        JOB FOR ITS NEXT USE IN THE MACHINE.
                                     6. HAS ACCESS TO ALL MEMORY
                                     7. USES SEG.E OF EACH SLOT FOR DETERMINING
                                        THE SLOT'S CONFIGURATION.
                                        IT USES SEG. TO MAINTAIN RECORDS OF
                                        ONGOING EVENTS.
                                IV.  SLOTS & PROCESSES
                                     A. SLOT - A COLLECTION OF RESOURCES
                                        ALLOCATED TO A SINGLE ENTITY, 
                                        IT INCLUDES THE PARTICULAR
                                        PROCESS OR SET OF PROCESSES 
                                        CAPABLE OF USING THOSE RESOURCES.
                                     B. MEMORY
                                        1. EACH SLOT IS ALLOCATED ITS
                                        OWN MEMORY IN THE MACHINE.
                                        2. 3 -4 K IS ABOUT THE SMALLEST
                                        A SLOT RUNS IN.
                                        (WHATEVER THE KERNEL AND DISPATCHER
                                        DO NOT USE, IT IS AVAILABLE TO
                                        THE SLOTS.)
                                        3. MAX. NO. OF SLOTS IS 64 IN AN
                                        ISIS MACHINE.
                                        4. WHEN A SLOT IS RUNNING, IT HAS
                                        A SET OF 16 SEGMENTATION REGISTERS
                                        DEDICATED TO IT.
                                        5. SEG.14 (SEG. E) IS THE SLOT'S CTA,
                                        CONTAINING THE DESCRIPTORS NECESSARY
                                        TO DESCRIBE THE SLOT'S RUNNING 
                                        CONFIGURATION, SUCH AS POINTERS
                                        TO VARIABLES, MEMORY LAYOUT,ETC.
                                     C. PROCESSES
                                        ISIS DIVIDES JOBS INTO PROCESSES.
                                        THESE PROCESSES ARE, FOR THE PURPOSE
                                        OF SCHEDULING, INDEPENDENT JOBS.
                                        THEY ARE BROKEN DOWN INTO A HEIRARCHY
                                        OF LEVELS, OF WHICH THE SLOT IS 
                                        NOT REQUIRED TO RUN ALL.
                                        THE THREE PROCESSES ARE:-
                                        BACKGROUND, FOREGROUND AND DDT.
                                        C.1 FOREGROUND__ 
                                           1. SCHEDULED TO EXECUTE EVERY
                                            25 MILLISECONDS.
                                           2. TIME IS ALLOCATED IN CLOCK TICKS,
                                            1 TICK = 1/600 SEC (FASTC).
                                            THE MINIMUM TIME IS 2 TICKS, AND
                                            FOR EVERY 3 LOGICAL UNITS, YOU
                                            GET 1 ADDITIONAL TICK OF
                                            EXECUTION TIME.
                                        NOTE: THE ENTIRE MACHINE, THERE IS
                                            ONLY 16 CLOCK TICKS AVAILABLE,
                                            THE KERNEL TAKES 1, SO 15 ARE LEFT
                                            FOR THE REMAINING SLOTS.
                                        C.2 BACKGROUND__BOTTOM LEVEL
                                            1. ALLOCATED 50 MILLISECONDS
                                            OF CPU TIME, BUT IS SCHEDULED
                                            ON AN EXECUTION CHAIN,ROUND ROBIN,
                                            AFTER EXECUTION THEY GO TO THE 
                                            END OF THE LIST.
                                            2. THIS IS THE WORKHORSE OF THE
                                            MACHINE.
                                            3. THESE TIMESLICES CAN BE
                                            INTERRUPTED BY FOREGROUND PROCESS.
                                            NOTE:  IN A WELL BALANCED MACHINE,
                                            BACKGROUND JOBS WILL GET 100 

                                            SHOTS AT THE CPU AND EXECUTE
                                            ONLY 8 MS.
                                            4. A JOB CAN DISMISS AT ANY TIME
                                            DURING ITS TIMESLICE__A NEW 
                                            TIME SLICE IS THEN CREATED FOR
                                            THE NEXT JOB.
                                       C.3  DDT__
                                            CAN BE LOGGED INTO THRU. THE NETWORK
                                            TO CONTROL, MODIFY, DEBUG AND
                                            RELOAD A SLOT.
                                            1. GETS SOME ALLOCATION OF
                                            CPU TIME AS A BACKGROUND JOB.
                                            IT IS GIVEN 50 MS, BUT WILL
                                            ONLY USE SO MUCH TIME AS IT NEEDS
                                            TO EXECUTE.
                                            2. GOES ON THE RUN LIST RIGHT
                                            ALONG WITH BACKGROUND JOBS,
                                            IT HAS HIGHER PRIORITY.
                                       
                                       SLOT PROCESS RULES:
                                           1. KERNEL WILL STEP IN WHEN IT 
                                            GETS AN INTERRUPT, TAKING THE
                                            CPU TIME IT NEEDS TO PROCESS 
                                            THE INTERRUPT, THEN IT WILL 
                                            GIVE THE CPU BACK TO THE PROCESS
                                            THAT HAS BEEN INTERRUPTED.
                                            THE KERNEL WILL TAKE AS MUCH 
                                            TIME AS NEEDED TO PROCESS 
                                            AN INTERRUPT.
                                           2. IF THE SLOT IS RUNNING ONLY
                                            ONE PROCESS, IT CAN ONLY BE
                                            BACKGROUND OR DDT.
                                           3. A FOREGROUND PROCESS CANNOT RUN IN
                                            EITHER A BACKGROUND OR DDT
                                            PROCESS RUNNING ALSO.
   

                                    V. ORING & IRING
                                       - BECAUSE OF THE CONCURRENT NATURE
                                       OF OPERATION, THE TRAFFICS (OR
                                       DATA TRANSFERRING) TO AND FROM
                                       THE DISPATCHER ARE SEPARATE.
                                       - THEREFORE,2 RING BUFFERS ARE USED,
                                       ONE IS FILLED BY THE DISPATCHER AND
                                       THE OTHER IS EMPTIED BY THE DISPATCHER
                                       - INPUT TO A SLOT IS PLACED IN THE 
                                       SLOT'S "IRING" BY THE DISPATCHER,
                                       AND OUTPUT IS REMOVED FROM A SLOT'S
                                       "ORING".
                                       1. EACH RING CONTAINS:
                                           A STRING OF MESSAGES WHICH IS
                                          STARTED OF WITH THE RING DESCRIPTOR
                                          - EACH RING DESCRIPTOR HAS
                                          NFMI - HALFWORD ---> NEST FILL
                                                 MESSAGE INDEX,
                                                 THIS IS A POINTER TO THE
                                                 NEST BYTE TO BE FILLED.
                                          CEI  - HALFWORD ---> CURRENT
                                                 EMPTY INDEX,
                                                 THIS IS A POINTER TO THE
                                                 LAST LOCATION JUST READ
                                            (IE. THE NEST MESSAGE TO 
                                                 BE EMPTIED)
                                          BY CONVENTION, RING BUFFERS GO TO
                                                 SEGMENT 2.
                                      2.  THE SIZE OF THE RINGS ARE DEFINED
                                          WHEN WE CREATE THE SLOTS; NO CERTAIN
                                          SPECIFIED SIZES AND THEY WRAP UP
                                          ( IE. GO TO THE BEGINNING AGAIN)
                                      3.  IRING
                                          3.1 CONTAINS MESSAGE YOU RECEIVE
                                          FROM DISPATCHER
                                          3.2 NFMI - WHERE THE NEXT MESSAGE
                                          IS TO BE PLACED. 
                                          THIS IS USED & UPDATED BY DISPATCHER
                                          3.3 CEI  - WHERE TO GET THE NEXT 
                                          MESSAGE.
                                          THIS IS USED & UPDATED BY SLOT(USER)
                                          3.4 PROCEDURE FOR THE SLOT(USER):
                                              3.4.1 READ DATA FROM RING
                                                    AND UPDATE CEI
                                                    (READING STARTS FROM CEI 
                                                    TO NFMI-1)
                                              3.4.2 CHECK NFMI AND CEI FOR
                                                    DIFFERENT VALUES
                                              3.4.3 CONTINUE READING UNTIL
                                                    CEI = NFMI
                                                    ( NO MORE DATA IN THE RING)
                                            
                                      4.  ORING
                                          - IT'S THE ONLY WAY TO SEND OUTPUT.
                                          4.1  CONTAINS MESSAGE YOU SEND TO
                                          THE DISPATCHER
                                          4.2  NFMI - WHERE THE NEXT MESSAGE
                                          IS TO BE PLACED.
                                          SLOT(USER) HANDLES AND UPDATES IT
                                          4.3  CEI  - WHERE TO GET THE NEXT
                                          MESSAGE.
                                          DISPATCHER HANDLES AND UPDATES IT.
                                          4.4  PROCEDURES:-
                                               4.4.1 WRITE TO ORING WITH 
                                               DATA AND THEN UPDATE NFMI
                                               4.4.2 START AT CURRENT NFMI,
                                               PLACE AT THE END OF MESSAGE.
                                               4.4.3 UPDATE NFMI BY
                                               NFMI = NFMI + MSG. LENGTH
                                               4.4.4 DISPATCHER CHECKS IF
                                               NFMI = CEI, IF SO, NO MORE
                                               DATA TO FETCH FROM THIS SLOT.
                                    NOTE;
                                        1. RING HANDLING:
                                           WRAP AROUND
                                               WHEN YOU REACH BOTTOM OF RING,
                                               YOU MUST HANDLE WRAP AROUND
                                               -BECAUSE-
                                               MESSAGES ARE OF VARIABLE 
                                               LENGTHS (MESSAGES OF THE SAME
                                               TYPE CAN HAVE DIFFERENT LENGTHS)
                                               -THEREFORE-
                                               ALL MESSAGES MUST BEGIN ON
                                               FULL WORK BOUNDARIES
                                        2. MUST RESERVE ENOUGH SPACE IN ORING
                                           THAT CAN HANDLE ENOUGH DATA TO 
                                           OUTPUT IN A SINGLE BACKGROUND JOB.
                                           USUALLY, RINGS ARE ASSIGNED TO
                                           BE 512D OR 200 IN HEX.

                                        3. ISIS SLOTS RUN UNDER THE MAC
                                           THE KERNEL WILL MAINTAIN THE MAC 
                                           SET UP.
                                           THE USE OF MAC IS THAT IT WILL
                                           3.1 ASSIGN PHYSICAL ADDRESSES
                                           TO LOGICAL ADDRESSES.
                                           3.2 PROTECT AREAS IN CORE MEMORY.

                                   VI.  SEGMENT E
                                        A. CONTROL TABLE AREA FOR THE SLOT
                                           1. TELLS OTHER PROCESSES WHERE 
                                           THINGS ARE LOCATED IN THE SLOT.
                                           2. PHYSICAL LOCATION OF THIS
                                           SEGMENT AT THE LOWEST LOCATION
                                           OF THE CORE, FOLLOWED BY
                                           SEG. 0,1,2.....F
                                        B. FORMAT
                                           1. FIRST WORD - ARE THE CONTROL
                                           BITS FOR THE SLOT AND ARE USED 
                                           BY THE DISPATCHER
                                           2. BY SETTING CERTAIN BITS IN THE
                                           CNTRL WORD, YOU CAN ALLOW OR 
                                           DISALLOW CERTAIN COMMUNICATIONS
                                           MESSAGES TO BE SENT TO YOUR SLOT.
 
                                      NOTE
                                      ----
                                           ISIS CONVENTIONS
                                           1. EACH SLOT MUST HAVE ITS OWN
                                           SET OF 16 SEG.REG.
                                           2. THE KERNEL MAINTAINS THE SEG.REG.
                                           3. SEG. 0 -- USED FOR VARIABLES
                                              SEG. 1 -- USED FOR CODING
                                              SEG. 2-D -- BUFFERS,RING AREA
                                              SEG. E -- CTA
                                              SEG. F -- COMMON MEMORY TO
                                                        BE SHARED BY ALL 
                                                        SLOTS AS READ-ONLY
                                                        ACCESS (NOT USABLE
                                                        BY PROGRAMMER)
                                   VII.  SEGMENT F
                                           - SYSTEM VARIABLES USED BY ALL SLOTS
                                           A. SEG. F IS SET UP BY THE MAC WHEN
                                              THE MACHINE IS LOADED AND NEVER
                                              CHANGES.
                                           B. SEG. F IS PHYSICALLY LOCATED
                                              WITHIN THE KERNEL AREA OF M
                                              MEMORY
                                           C. ALL SLOTS HAVE READ-ONLY ACCESS
                                              TO SEG. F
                            ISIS SLOT PROGRAMMING
                                     LESSON PLAN

   COURSE :  ISIS PROGRAMMING                     DATE :
   LESSON :  COMMUNICATIONS PROCESS               COURSE NO. : TTE.442
   WEEK  :  1   DAY  :  1   PERIOD  :  2          LESSON NO. : LP112.442

   OBJECTIVES :
                1. TO PROVIDE A THOROUGH UNDERSTANDING OF THE ISIS
                 COMMUNICATIONS PROCESSES, BOTH EXTERNAL AND INTERNAL.
                2. TO FAMILIARIZE THE STUDENTS WITH TYPES OF MESSAGES THAT
                 FLOW BETWEEN ISIS SLOTS.
                3. TO DISCUSS ON ISIS MEMORY MANAGEMENT 
                4. TO DISCUSS ON ISIS SLOT'S HOST MANAGEMENT

   MATERIALS REQUIRED:
                1. ISIS-II REFERENCE MANUAL
                2. HANDOUT - HANDOUTS PACKAGE NO. 1 























         COURSE NO.  TTE.442          LESSON NO.  LP112.442     PAGE NO.

  REFERENCES         SLIDE #          I. COMMUNICATION PROCESSES
                                        - ALL I/O COMM. IS DONE THROUGH 
                                          THE KERNEL
                                        - ALL COMM. BETWEEN SLOTS IS
                                          THROUGH THE DISPATCHER
                                        - ALL COMM. IS DONE OVER CIRCUITS-
                                          EVERY CIRCUIT IS GIVEN A RELATIVE
                                          PORT #
                                        - IF A CIRCUIT IS BUILT FROM SOME-
                                          WHERE OUTSIDE THE MACHINE,IT
                                          MUST COME THROUGH SLOT 0
                                      A.  INTERNAL COMM. PROCESS
                                          THIS IS MAINLY THE COMM. BETWEEN
                                          THE DISPATCHER AND THE SLOTS.
                                          1. TWO INTERFACES TALK TO EACH 
                                          OTHER THROUGH THE DISPATCHER. THERE
                                          IS NO REQUIREMENT THAT THE 
                                          ORIGINATOR AND THE RECEIVER OF 
                                          A DATA STREAM BE SYNCHRONOUS,
                                          SO SOME MECHANISM IS NECESSARY
                                          TO APPLY BACKPRESSURE
                                          OVER A CIRCUIT.
                                          NOTE: IT IS NOT DESIRAVLE TO 
                                          BACK PRESSURE THE SOURCE
                                          INTERFACE ITSELF, BUT RATHER TO 
                                          BACK-PRESSURE THE SOURCE PORT 
                                          2.  SLOT 0 INTERFACE HAS THE SET
                                          OF FUNCTIONS RELATING TO INTER-
                                          NODE COMM., CIRCUIT ROUTING,
                                          AND DIAGNOSTIC INCO.
                                          3.  EACH INTERFACE, INCLUDING 
                                          SLOT 0, HAS A SET OF PERMUTER 
                                          TABLES, WHICH TELL THE DISPATCHER
                                          WHICH PORT OF ONE INTERFACE IS 
                                          CONNECTED TO WHAT PORT OF ANOTHER.
                                          4.  THE DISPATCHER HANDLES ALL 
                                          INTER-SLOT COMM. BY TRACKING ALL
                                          PORT ASSIGNMENTS IN PERMUTER
                                          TABLES OF SLOT #0 AND ACTUALLY
                                          PULLING DATA FROM OUTPUT 
                                          BUFFERS AND PLACING IT IN THE 
                                          DESTINATION PORT BUFFERS.
                                          5.  THE INTERNAL FORMAT OF DATA
                                          BEING TRANSMITTED MUST BE UNIFORM
                                          FOR ALL INTERFACES.
                                      B.  EXTERNAL COMMUNICATIONS
                                          1. AND INTERFACE MAY NEED SOME SORT
                                          OF HARDWARE DRIVER (PRINTER,
                                          DISC, ETC.)
                                          2. 4 TYPES OF COMM. CLASSES FOR
                                          DRIVERS:- ASYNC,SYNC,AND SIO
                                          CHANNELS.
                                          3. AN INTERFACE WHICH CORRUPTS 
                                          ITS BUFFER HANDLING HURTS ONLY 
                                          ITSELF, NOT THE HARDWARE, OR THE
                                          OTHER INTERFACES WHICH IT IS
                                          SHARING THE HARDWARE WITH.
                                          4. THEREFORE,EACH INTERFACE IS 
                                          CONSTRAINED TO REQUEST ACTUAL DATA
                                          TRANSFERS FROM THE DRIVERS,
                                          THROUGH THE KERNEL.

                                          IMAGINARY TABLES OF CONNECTION
                                          ( RESIDE IN THE KERNEL )
                                                       SYNC.
                                                  ________________
                                                  |SLOT|LU | PHY |
                                                  | NO.|   |LINE |
                                                  ----------------
                                                  |   0 0  |  0  |
                                                  |   0 1  |  1  |
                                                  |   1 1  |  3  |
                                                  |        |     |
                                                  |        |     |
                                                  |        |     |
	                                                  |        |     |
                                                  ________________


                                                       ASYNC.
                                                  ________________
                                                  |SLOT|LU | GR  |
                                                  | NO.|   |     |
                                                  ________________
                                                  |   0 0  |  0  |
                                                  |   0 1  |  1  |
                                                  |   0 2  |  2  |
                                                  |        |     |
                                                  |        |     |
                                                  |        |     |
                                                  |        |     |
                                                  ________________

                                          NOTE:  IN THE ASYNC. CASE,
                                                 A LOGICAL UNIT IS 
                                                 PHYSICALLY ASSIGNED TO
                                                 1 GROUP OF 16 PORTS.


                                       
                                  
                                     C.  ROUTING AND CIRCUITS
                                         1. FIRST SIGN OF A CIRCUIT IS THE 
                                         NEEDLE IN THE INPUT, MAY BE
                                         FOLLOWED BY MESSAGES FOR THAT PORT
                                         2. CIRCUITS ARE CONSTRUCTED BY
                                         THE SLOT 0 SUPE, AND THE PORTS 
                                         ARE ASSIGNED EXTERNAL TO THE 
                                         INTERFACE.
                                         SO, THE INTERFACE MUST SEND
                                         THE APPROPRIATE FORM OF 
                                         PSEUDO-NEEDLE REQUEST.
                                         3. SLOT 0 EITHER REJECTS IT, OR 
                                         RETURNS A PSEUDO-NEEDLE,CAUSING
                                         A CIRCUIT TO BE CONSTRUCTED
                                         THROUGH ISIS, CONNECTING
                                         NODE CODE AND THE INTERFACE.
                                         4. ALL THE LOGON INCORMATION
                                         WOULD NOW TRAVEL TO THE SUPE.,
                                         5. THERE ARE 2 TYPES OF CIRCUITS:
                                            5.1 NORMAL CIRCUIT
                                            A NORMAL CIRCUIT IS NORMALLY
                                            ORIGINATED AT AN EXTERNAL ENTRY
                                            TO THE NETWORK (REQUIRING A
                                            PASSWORD)
                                            (IN ISIS MANUAL,FULL DISCUSSION
                                            ON LOGON PROCEDURE)
                                            5.2  AUX. CIRCUIT
                                            AN AUX. CIRCUIT IS WITH NO
                                            PASSWORD, AND NO REQUIREMENT
                                            TO SPECIFY THE DEEST. HOST.
                                            IT IS USED FOR WELL-DEFINED USAGE,
                                            SUCH AS A CIRCUIT ORIGINATING
                                            AT THAT HOST.

                                  D. ISIS CONTROL TABLE
                                     - IN SEGMENT 14 ( SEG. E )
                                        1. THERE ARE FIXED LOCATIONS FOR 
                                        FOR CONSTANTS, AND TEMP STORAGE
                                        FOR DISPATCHER.
                                        2. ALL THE INFO. IN CTA ARE FIXED 
                                        AT ASSEMBLY TIME
                                        3. THE FIRST WORD (16 BITS) ARE
                                        CALLED 'CONTROL BITS' TO ALLOW
                                        CERTAIN CONDITIONS TO TAKE PLACE
                                        4. THIS SEGMENT IS PROTECTED
                                        DURING RUNNING
                                        5. EVERY SLOT CAN FIND THIS TABLE
                                        AT A FIXED LOCATION IN THE SLOT'S
                                        ABSOLUTE MEMORY.
                                     D.1  MEMORY MANAGEMENT
                                        1. IN THE CTA, THERE IS A TABLE 
                                        TERMED 'AREAS' DEFINING THE USER'S
                                        MEMORY LAYOUT
                                        THIS AREA CORRESPONDS TO AN INTEGRAL
                                        NUMBER OF MAC SEGMENTS, RATHER THAN 1
                                        2. THE USER CAN SPECIFY THE PROTEC-
                                        TION TO APPLY TO EACH SEGMENT AT
                                        LOAD TIME
                                        3. DEFINING MULTIPLE AREAS OF 
                                        EXECUTABLE CODE
                                        4. SEG. E GOES UNCONDITIONALLY
                                        INTO THE BEGINNING OF THE
                                        USER'S PHYSICAL ADDRESS AREA
                                        5. WHEN THE SLOT IS NOT RUNNING
                                        DDT CAN WRITE INTO SEG. E
                                        
                                     D.2  HOST MANAGEMENT
                                        - SLOTS MANAGE THE HOSTS
                                        1. FIRST MESSAGE TO SEND IS 04(HEX)
                                        TO REPORT THE STATUS OF HOST SO AS
                                        TO GIVE THE HOST NUMBERS AND THE 
                                        NUMBER OF PORTS TO APPLY TO THAT 
                                        HOST.
                                        2. THE DISPATCHER IS RESPONSIBLE 
                                        TO VERIFY THAT RH# IS LESS THAN HOSTN,
                                        ELSE IT WILL CAUSE TO CRASH THE SLOT
                                        3. IN T2,
                                        MAX. NO. OF HOSTS = 64
                                        (BUT KERNEL HOST TAKES 1)
                                        MAX. NO. OF PORTS = 256
                                        IF WHEN REQUESTED BY SLOTS, THESE
                                        NUMBERS ARE EXCEEDED,0B MESSAGE
                                        IS ISSUED BACK TO THE REQUESTING
                                        SLOT, INDICATING ERROR
                                        4. WHEN A CIRCUIT IS BUILT TO A HOST,
                                        IT IS TIED TO THAT SLOT
                                        SO, IT IS THE RESPONSIBILITY OF 
                                        THE SLOT TO REPORT THE STATUS OF
                                        THE HOST. FOR EXAMPLE, WHEN
                                        A HOST GOES DOWN, THE SLOT MUST
                                        MANAGE TO DROP CIRCUITS(M.TYPE 10)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  EXTERNAL COMMUNICATIONS           Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  1         Lesson No.  LP121.442

_______________________________________________________________________________

   OBJECTIVES : 
              1. TO REVIEW THE DISCUSSION OF ISIS EXTERNAL COMM.
              2. TO DISCUSS THE TYPES OF HARDWARE INTERFACES FOR EXTERNAL
                 COMM.

   MATERIALS REQUIRED:
                 ISIS-II REFERENCE MANUAL

























         COURSE NO.  TTE.442       LESSON NO.  LP121.442     PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              ISIS EXTERNAL COMMUNICATONS
              - FOR EACH LOGICAL INTERFACE, THERE MAY BE HARDWARE DRIVERS
                CONNECTED TO THEM
              - EXAMPLES OF THESE DRIVERS ARE:
                ASYNC.,SYNC.,SIO., OR SOME SORT OF SPECIAL I/O DEVICE
                DRIVER (PRINTER,DISC, ETC.)
              - ISIS SUPPORTS DRIVERS FOR ALL THESE DEVICES
              - EACH INTERFACE HAS TO REQUEST ACTUALD DATA TRANSFERS FROM
                THE DRIVERS, THROUGH THE KERNEL

                   1. ASYNCHRONOUS
                THIS IS ALSO KNOWN AS "START/STOP" COMM., AND IS USUALLY
                USED FOR RELATIVELY LOW-SPEED APPLICATIONS (LESS THAN 9600
                BAUD). EACH CHARACTER WITH A START BIT AND ONE OR TWO STOP
                BITS IF ASCII IS USED.

                CHARACTERS ARE SENT OUT ONE AT A TIME, AT ANY TIME. THE
                RECEIVING DEVICE LOOKS FOR A START BIT (0), BECAUSE THE LINE
                IS HELD HIGH DURING ITS IDLE PERIODS. WHEN IT DETECTS A 
                START BIT, IT STARTS SYNCHRONIZING ITSELF TO THE LINE SPEED,
                COUNTS THE INCOMING BITS OF DATA AND STORES THEM, AND THEN
                STRIPS OFF THE STOP BITS. THE STOP BITS SET THE LINE BACK
                TO ITS HIGH, IDLE STATE.

                EQUIPMENT FOR ASYNCHRONOUS COMMUNICATION IS CHEAP, SINCE NO
                COMMON CLOCK IS REQUIRED. IT IS MAINLY USED FOR TERMINAL-TO
                -TERMINAL OR TERMINAL-TO-COMPUTER COMMUNICATIONS.


                   2. SYNCHRONOUS
                THIS TYPE OF COMMUNICATION USES A COMMON CLOCK SIGNAL, TO
                WHICH BOTH SENDING AND RECEIVING DEVICES ARE SYNCHRONIZED.
                THIS CLOCK IS ONE OF THE CONTROL LINES IN MOST HARDWARE
                INTERFACE SPECIFICATIONS. IT ALSO USES SPECIAL CHARACTERS
                TO MAINTAIN SUNCHRONIZATION BETWEEN THE TWO DEVICES WHEN
                THE LINE IS IDLE. THERE IS ANOTHER SPECIAL CHARACTER TO 
                SIGNAL THE END OF THE DATA. AFTER THE TRANSMISSION IS OVER,
                SYNCHRONIZATION CHARACTERS ARE SENT OUT AGAIN UNTIL THERE
                IS ANOTHER TRANSMISSION.

                FOR LONG MESSAGES, SYNCHRONOUS COMMUNICATION CONSIDERABLY
                REDUCES THE NUMBER OF BITS THAT ARE SENT, SINCE THERE ARE ONLY
                TWO SPECIAL CHARACTERS FOR EACH MESSAGE, RATHER THAN START
                AND STOP BITS FOR EACH CHARACTER. IT REQUIRES MORE COMPLEX
                AND EXPENSIVE MODEMS AND IS USUALLY USED FOR COMPUTER-TO-
                COMPUTER LINKS, AS IN TYMNET NETWORK.


                   3. SIO (SERIALLY INPUT OUTPUT)
                THIS IS A BOARD THAT PROVIDES CONTROL OF HIGH SPEED SYNC.
                AND ASYNC. LINES.  THE SIO CONTROLLER BOARD CAN CONTROL
                UP TO 16 ASYNC. LINES AT THE MAX. SPEED OF 480,000 BPS.
                IN SYNC. MODE, THE CONTROLLER BOARD SUPPORTS EITHER THE 
                BIT STUFFING(SDLC/HDLC) PROTOCOLOR BYTE SYNC.(E.G. BSC)
                PROTOCOL.
                EACH MOTHER BOARD CAN CONNECT TO UP TO 8 DAUGHTER BOARDS.
                THERE ARE CURRENTLY 4 TYPES OF DAUGHTER BOARDS APPLICABLE
                TO THE SIO BOARDS.
                3.1 V.24 ASYNC.
                   - HANDLES 2 LINES USING THE V.24/RS232 STANDARD INTERFACE
                   AT SPEED UP TO 9600 BAUD.
                3.2 OPTICALLY COUPLED
                   - FOR HARDWIRED CONNECTIONS BETWEEN MACHINES WITHIN A
                   FEW HUNDRED FEET OF EACH OTHER AT SPEEDS UP TO 
                   162,500 BPS.
                3.3 V.24 SYNC.
                   - HANDLES 2 LINES USING THE V.24/RS232 STANDARD INTERFACE
                   AT SPEEDS UP TO 20,000 BPS.
                3.4 V.35 SYNC.
                   - HANDLES 2 LINES USING THE V.35 STANDARD INTERFACE AT
                   SPEEDS UP TO 160,000 BPS.

                   NOTE:
                   ----
                   PER MOTHER BOARD:
                   1. NO MORE THAN 1  56KB LINE(UNLESS ONLY 1 D.BD)
                   2. IF THERE IS 1 56KB LINE,THEN NO MORE THAN 4 OCL LINES
                   3. IS NO 56KB LINES INSTALLED, NO MORE THAN 16 OCL LINES.
                   ( 8 DAUGHTER BOARDS)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  ISIS Internal Communications      Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  2         Lesson No.  LP122.442

_______________________________________________________________________________

    OBJECTIVES ;
              1. TO REVIEW THE DISCUSSION OF ISIS INTERNAL COMM.
              2. TO FAMILIARIZE STUDENTS WITH ISIS INTERNAL FLOW OF DATA
                 AND MESSAGES.

    MATERIALS REQUIRED:
              ISIS REFERENCE MANUAL





































         COURSE NO. TTE.442            LESSON NO. LP122.442  PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              INTERNAL PROCESS COMMUNICATIONS
              1. COMMUNICATIONS BETWEEN SLOTS ARE DONE THRU THE DISPATCHER
              BY MEANS OF IRING AND ORING
              2. THERE IS NO CONSTRAINT ON THE SIZE OF THE BUFFERS.
              THE DISPATCHER TRIES TO MOVE DATA FROM THE SOURCE PROCESS
              TO THE DESTINATION, BUT SOMETIMES IS UNABLE TO. AS A CONSE-
              QUENCE, THE DISPATCHER WOULD TRY TO BACKPRESSURE THE 
              SOURCE PORT INSTEAD.
              3. WHEN A SLOT REQUESTS A CIRCUIT TO ANOTHER HOST, THE 
              DISPATCHER GETS INFO. FROM SLOT 0 AS TO WHETHER THE CIRCUIT IS
              AN INTERNAL OR EXTERNAL CONNECTION. IF IT IS INTERNAL, THE 
              DISPATCHER WILL SET UP THE COMM. PATH.
              4. THE INTERNAL FORMAT OF DATA BEING TRANSMITTED MUST BE 
              UNIFORM. EACH MESSAGE HAS A HEADER CONTAINING PORT NUMBET AND
              MESSAGE TYPE.(THE MESSAGE TYPE HELPS DETERMINE SIZE OF MESSAGE
              SO AS TO AVOID PROCESSING EACH BYTE)
              5. CIRCUITS MAY BE
                5.1 TOTALLY INTERNAL
                5.2 ORIGINATING EXTERNALLY AND TERMINATING INTERNALLY
                5.3 ORIGINATING INTERNALLY AND TERMINATING EXTERNALLY
                5.4 CIRCUIT MAY ALSO JUST "PASS THRU" ISIS,LETTING THE SUPE
                HANDLE AS MUCH OF THE ROUTING AS POSSIBLE.
              6. EACH SLOT MAY REQUIRE A HARDWARE DRIVER ( ALL OF THESE DRIVERS
              ARE CONTROLLED BY THE KERNEL TO ADD SECURITY AND TO ELIMINATE
              THE NEED FOR SPECIALIZED KNOWLEDGE OF EACH HARDWARE DRIVER
              A SLOT USES. )
              7. SVC'S ARE THE MEANS FOR COMMUNICATING WITH THE KERNEL.
                 ( SUPERVISORY CALLS )

              - IRING AND ORING
                1. RING STRUCTURE
                   2 HALFWORDS FOR NFMI AND CEI
                   ( THIS IS THE HEADER FOR EACH MESSAGE )
                2. EACH MESSAGE MUST START ON A WORD BOUNDARY
                   - INSURES ITS HEADER REFERENCED W/O CONSIDRATION OF
                   RING FOLDING.
                3. MESSAGE TYPES HAVE THE FUNCTIONS:
                   3.1 CONTROL OF CIRCUITS'
                   3.2 DATA ON CIRCUITS
                   3.3 INTRA ISIS CONTROL
                4. RINGS ARE INDEPENDENT OF EACH OTHER
                5. IRING CONTAINS THE MESSAGE YOU RECEIVE FROM THE DISPATCHER,
                   AND ORING CONTAINS THE MESSAGE YOU SEND TO THE DISPATCHER.

              - INTRA ISIS COMMUNICATIONS
                   RPORT = 0
                   1. SOME MESSAGES CAN BE ENABLED/DISABLED IN CTA
                   2. THERE CAN BE 2 HOSTS OR MORE ON ONE SLOT,
                      WHEN A SLOT DOES 2 DIF. FUNCTIONS OR APPLICATIONS
                     (T2 - 256 CIRCUITS ON SLOT,
                      T1 - 64 CIRCUITS ON SLOT)
                   3. HOST # ARE IN DECIMAL
                   4. RH# WOULD BE 0 FOR T1 BECAUSE YOU CANNOT HAVE MORE THAN
                      1 HOST PER SLOT.
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  ISIS Internal Communications      Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  2         Lesson No.  LP122.442

_______________________________________________________________________________

    OBJECTIVES ;
              1. TO REVIEW THE DISCUSSION OF ISIS INTERNAL COMM.
              2. TO FAMILIARIZE STUDENTS WITH ISIS INTERNAL FLOW OF DATA
                 AND MESSAGES.

    MATERIALS REQUIRED:
              ISIS REFERENCE MANUAL





































         COURSE NO. TTE.442            LESSON NO. LP122.442  PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              INTERNAL PROCESS COMMUNICATIONS
              1. COMMUNICATIONS BETWEEN SLOTS ARE DONE THRU THE DISPATCHER
              BY MEANS OF IRING AND ORING
              2. THERE IS NO CONSTRAINT ON THE SIZE OF THE BUFFERS.
              THE DISPATCHER TRIES TO MOVE DATA FROM THE SOURCE PROCESS
              TO THE DESTINATION, BUT SOMETIMES IS UNABLE TO. AS A CONSE-
              QUENCE, THE DISPATCHER WOULD TRY TO BACKPRESSURE THE 
              SOURCE PORT INSTEAD.
              3. WHEN A SLOT REQUESTS A CIRCUIT TO ANOTHER HOST, THE 
              DISPATCHER GETS INFO. FROM SLOT 0 AS TO WHETHER THE CIRCUIT IS
              AN INTERNAL OR EXTERNAL CONNECTION. IF IT IS INTERNAL, THE 
              DISPATCHER WILL SET UP THE COMM. PATH.
              4. THE INTERNAL FORMAT OF DATA BEING TRANSMITTED MUST BE 
              UNIFORM. EACH MESSAGE HAS A HEADER CONTAINING PORT NUMBET AND
              MESSAGE TYPE.(THE MESSAGE TYPE HELPS DETERMINE SIZE OF MESSAGE
              SO AS TO AVOID PROCESSING EACH BYTE)
              5. CIRCUITS MAY BE
                5.1 TOTALLY INTERNAL
                5.2 ORIGINATING EXTERNALLY AND TERMINATING INTERNALLY
                5.3 ORIGINATING INTERNALLY AND TERMINATING EXTERNALLY
                5.4 CIRCUIT MAY ALSO JUST "PASS THRU" ISIS,LETTING THE SUPE
                HANDLE AS MUCH OF THE ROUTING AS POSSIBLE.
              6. EACH SLOT MAY REQUIRE A HARDWARE DRIVER ( ALL OF THESE DRIVERS
              ARE CONTROLLED BY THE KERNEL TO ADD SECURITY AND TO ELIMINATE
              THE NEED FOR SPECIALIZED KNOWLEDGE OF EACH HARDWARE DRIVER
              A SLOT USES. )
              7. SVC'S ARE THE MEANS FOR COMMUNICATING WITH THE KERNEL.
                 ( SUPERVISORY CALLS )

              - IRING AND ORING
                1. RING STRUCTURE
                   2 HALFWORDS FOR NFMI AND CEI
                   ( THIS IS THE HEADER FOR EACH MESSAGE )
                2. EACH MESSAGE MUST START ON A WORD BOUNDARY
                   - INSURES ITS HEADER REFERENCED W/O CONSIDRATION OF
                   RING FOLDING.
                3. MESSAGE TYPES HAVE THE FUNCTIONS:
                   3.1 CONTROL OF CIRCUITS'
                   3.2 DATA ON CIRCUITS
                   3.3 INTRA ISIS CONTROL
                4. RINGS ARE INDEPENDENT OF EACH OTHER
                5. IRING CONTAINS THE MESSAGE YOU RECEIVE FROM THE DISPATCHER,
                   AND ORING CONTAINS THE MESSAGE YOU SEND TO THE DISPATCHER.

              - INTRA ISIS COMMUNICATIONS
                   RPORT = 0
                   1. SOME MESSAGES CAN BE ENABLED/DISABLED IN CTA
                   2. THERE CAN BE 2 HOSTS OR MORE ON ONE SLOT,
                      WHEN A SLOT DOES 2 DIF. FUNCTIONS OR APPLICATIONS
                     (T2 - 256 CIRCUITS ON SLOT,
                      T1 - 64 CIRCUITS ON SLOT)
                   3. HOST # ARE IN DECIMAL
                   4. RH# WOULD BE 0 FOR T1 BECAUSE YOU CANNOT HAVE MORE THAN
                      1 HOST PER SLOT.
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Circuit Building                  Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  3         Lesson No.  LP123.442

_______________________________________________________________________________

   OBJECTIVES:
              TO FAMILIARIZE STUDENTS WITH THE PROCESS OF CIRCUIT 
              BUILDING IN ISIS.

   MATERIALS REQUIRED:
              ISIS-II REFERENCE MANUAL







































         COURSE NO.  TTE.442    LESSON NO.  LP123.442    PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              - THER ARE 2 TYPES OF CIRCUITS
                1. NORMAL CIRCUIT
                   SPECIFY USERNAME:OPTIONAL HOST #;PASSWORD
                2. AUX. CIRCUIT
                   REQUIRES NO PASSWORD, BUT THE MACHINE MUST HAVE AUX. 
                   CIRCUIT CAPABILITY

              - REQUEST TO ISIS SYSTEM TO BUILD A CIRCUIT: M.TYPE 07
                   THE SEQUENCES NECESSARY ARE:
                   1. YOU SEND M.TYPE 07
                   2. YOU RECEIVE     B2 (SUCCESS)
                                  OR  09 (FAILURE)
                   3. YOU SEND B3 (LOGON CHAR. STREAM APPROPRIATE TO 
                                   TYPE OF LOGON)
                   4. YOU RECEIVE B4 (RESPONSE)
                               OR B5 (FAILURE)
                   5. YOU RECEIVE B6 (SUCCESS)

              - ANY MESSAGES THAT COME INTO YOUR IRING THAT HAVE AN RPORT
                VALUE THAT IS THE SAME AS THE 00 NEEDLE RPORT VALUE WILL BE
                MESSAGES THAT PERTAIN TO THAT TERMINAL OR SLOT

              - CIRCUIT BUILDING
                ===> FROM THE SLOT TO DISPATCHER,
                     THRU THE NETWORK TO THE SUPE,
                     THRU THE NETWORK   TILL
                             IT REACHES THE TERMINATING END

              NOTE: CIRCUIT MUST TERMINATE AT A HOST.
                            ----
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Message Formats                  Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  4         Lesson No.  LP124.442

_______________________________________________________________________________

  OBJECTIVES:
              TO FAMILIARIZE THE STUDENTS WITH ISIS INTRA-NODE
              MESSAGE FORMAT AND ITS VARIATIONS

  MATERIALS REQUIRED:
              ISIS-II REFERENCE MANUAL






































         COURSE NO.  TTE.442     LESSON NO. LP124.442     PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              GENERAL FORMAT OF ISIS MESSAGE:-
                FOR EACH MESSAGE, THERE WILL BE A MESSAGE HEADER WITH THE 
              FOLLOWING FORMAT:
              ______________________________________________________
             |  RPORT | M. |     ADDITIONAL STRING DEPENDENT ON M.TYPE
             |        |TYPE|     
             |______________________________________________________

              RPORT (HALFWORD) :- RELATIVE PORT# FOR THIS PROCESS
                                  (THE PORT ASSIGNED TO THE CIRCUIT...
                                   USEFUL FOR SLOT TO BE ABLE TO TRACK A 
                                   PARTICULAR CIRCUIT)
                                  RPORT = 0 FOR INTRA-NODE COMM.
              M.TYPE( 1 BYTE ) :- MESSAGE TYPE
                               :- THE ADDITIONAL STRING WILL HAVE VARIABLE
                                  LENGTHS DEPENDENT ON THE TYPE OF THE 
                                  MESSAGE
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Message Types                     Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  5         Lesson No.  LP125.442

_______________________________________________________________________________

   OBJECTIVES :
              TO FAMILIARIZE STUDENTS WITH DIFFERENT TYPES OF ISIS
              MESSAGES.
              MAIN EMPHASIS IS ON :-
                   1. MESSAGES TO BRING UP A HOST IN A SLOT
                   2. HOW TO SEND SOME MESSAGES TO THE DISPATCHER,
                      IS. ZAP COMMAND,ETC.

    MATERIALS REQUIRED :
              ISIS-II REFERENCE MANUAL
              HANDOUT(ISIS-MESSAGE FORMATS,A SUMMARY)




























         COURSE NO.  TTE.442      LESSON NO. LP125.442    PAGE NO.

  REFERENCES  LESSON PLAN

_______________________________________________________________________________

              THERE ARE BASICALLY 2 TYPES OF MESSAGES:
              1. NON INTRA-ISIS MESSAGES
                 (IE. RPORT > 0 )
                 1.1  00    _____    ORIGINATES IN SLOT 0
                        ----->  NEEDLE
                        THIS IS WHEN THE DISPATCHER REQUESTS A NEW CIRCUIT
                        INTO THIS SLOT. THIS HAPPENS WHEN SOMEONE LOGS
                        INTO YOUR SLOT
                 1.2  01 - 9D  DATA TEXT STRING WITH VARIABLE LENGTHS
                 1.3  9E  ___ DETACH ( WHEN THE DISPATCHER RECEIVES 
                        AN ORANGE BALL , WILL ZAP)
                 1.4  9F  ___ DISCONNECT ( ZAP CIRCUIT )
                 1.5  A0  ___ TELLS THE DISPATCHER NOT TO ACCEPT ANY MORE
                              DATA FOR THIS CIRCUIT
                 1.6  A1  ___ RELEASE BACKPRESSURE
                 1.7  A2  ___ SENDS THE GOBBLER DOWN THE CIRCUIT, ANY DATA
                              IN THE CIRCUIT GETS EATEN
                 1.8  A3  ___ THROW AWAYB ALL THE DATA FROM THIS RPORT
                 1.9  A4  ___ DATA LOST COMING IN TO YOU (BLACK BALL)
                 1.10 A5  ___ DATA LOST (YOU SEND)
                              TYPICALLY BECAUSE SOMEBODY DIDN'T OBEY 
                              BACKPRESSURE
                              (USUALLY DATA GETS LOST IN THE BUFFER NOT IN RING)
                 1.11 A6  ___ DEM --> DEFFERED ECHOE MODE
                              NORMALLY, WHEN TYPING ON A TERMINAL(A FULL 
                              DUPLES) TELLS TO ECHOE ALL THE DATA FOLLOWING
                 1.12 A7  ___ LEAVE 'DEM'
                        |
                        |
                        |
                 1.13 AE  ___ 'BREAK' BEGINS
                              ---> SOMEBODY TYPES IN A BREAK KEY
                 1.14 AF  ___ HANG UP ON THIS PORT (MODEM)
                 1.15 B0  ___ 4 CHARS. QUERRY
                 1.16 B1  ___ 5 CHARS. MESSAGE, SETTING THE TERMINAL
                              (TERMINAL PARAMETER MESSAGES)
                        EX.      N     LENGTH
                            B1   7     1      ----> ASKING ABOUT PARITY OF
                                                    LENGTH 1
                 1.17 B2  ___ PSEUDO-NEEDLE (FROM SLOT 0)
                              A CIRCUIT IS BUILT TO SLOT 0
                 1.18 B3  ___ NORMAL LOGON CHARACTER (TO SLOT 0)
                              IF HIGHER BIT IS NOT SET,SUPE WILL IGNORE
                 1.19 B4  ___ NORMAL LOGON STATUS (FROM SLOT 0)
                 1.20 BC AND BD  ___ CONTROLLING THE PRINTERS
                 1.21 BE  ___ ZAP WITH A REASON : SENT BY SLOT
                          (REASON NOW IS '0', WHICH MEANS 
                            HOST IS OUT OF PORTS)
                 1.22 BF  ___ SIIX INFO. TRANSMISSION
                 NOTE :- ALL OF THESE ARE SPECIFICALLY FOR CERTAIN CIRCUITS
                         INDICATED BY RPORT
           2.  INTRA-ISIS MESSAGES
               RPORT = 0
                EACH MESSAGE HAS A HEADER WITH THE FORMAT
                ----------------------------------------------------------
               |     0  |SUB |  ADDITIONAL STRING DEPENDENT ON THE SUBTYPE
               |        |TYPE|
                ----------------------------------------------------------
                
                  2.1 02 ___ MESSAGE COMING IN TO YOU, ABOUT TAKE-OVER
                  2.2 03 ___ SENDS MESSAGE TO THE LOGGER
                  2.3 04 ___ REPORT HOST STATUS
                             THERE ARE ONLY 4 VALID STATUS
                             H.KEY IS USED IN CASE OF MULTIPLE NODES REPORTING 
                             SAME HOST
                  2.4 06 ___ TELLS HOST TIME (CONES FROM SUPE)
                             (GMT)
                  2.5 0B ___ HOST IS UNACCEPTED
                             ERR2
                             ---> HOST NO. SECURITY, SOME OTHER NODE HAS IT
                  2.6 0D ___ NO SUPE AT THE TIME, TAKE-DOWN
                  2.7 0E ___ '1-DOWN MESSAGE'
                             MESSAGE TO BE PRINTED OUT
                  2.8 0F ___ SLOT 0 TO DISPATCHER, DISPATCHER RESPONDS THIS.
                        





                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  : Circuit Building Messages          Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  6         Lesson No.  LP126.442

_______________________________________________________________________________

   OBJECTIVES:
              TO FAMILIARIZE STUDENTS WITH THE MESSAGES TO BUILD A CIRCUIT
            AND TO DIFFERENTIATE THESE FROM THE TERMINAL PARAMETER MESSAGES

   MATERIALS REQUIRED:
              ISIS-II REFERENCE MANUAL


























         COURSE NO.  TTE.442    LESSON NO. LP126.442    PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              TO BUILD A NORMAL CIRCUIT FROM THE SLOT
              1. REQUEST FOR PSEUDO-NEEDLE ( TO SLOT 0)
               00 00    07    00    00 01    00 00    -- --    07
               RPORT  S.TYPE KEY   LOCAL KEY DIALECT  ORIG.HOST TID
               ( PUT INTO ORING )

              2. GETS PSEUDO-NEEDLE (RPORT WOULD BE ASSIGNED)
               00 F0    B2    00    00 01
               RPORT  M.TYPE  KEY  LOCAL KEY
              HAS BEEN
              ASSIGNED
               ( GET FROM IRING )

              3. LOGON CHARACTER ( TO SLOT 0)
               00 F0    B3    C1
               RPORT
               ( PUT IN ORING )

              4. RECEIVE THE LOGON STATUS (FROM SLOT 0)
               00 F0    B4    00
               ( GET FROM IRING )

              5. SUPE RESPONSES A NEEDLE
               00 F0    B6    00 00 00 00 00 00 00
                    (B6--> SUCCESSFUL LOGON)
               ( GET FROM IRING )
	                  ISIS SLOT PROGRAMMING
                                 COURSE OUTLINE

           COURSE :  ISIS PROGRAMMING               DATE:
           COURSE NUMBER :  TTE.442                 WEEK:  1  OF  2

***********************************************************************
       DAY             SUBJECT           LESSON PLAN NO.        TIME
                                         EXERCISE PLAN NO.
***********************************************************************

     MONDAY       ISIS OVERVIEW              LP111.442          2.5
                  COMMUNICATIONS PROCESSES   LP112.442          2.5
                  OVERVIEW OF ISIS SOFTWARE  LP113.442          1.0

     TUESDAY      ISIS EXTERNAL COMM.        LP121.442          1.0
                  ISIS INTERNAL COMM.        LP122.442          1.0
                  CIRCUIT BUILDING           LP123.442           .5
                  MESSAGE FORMATS            LP124.442           .5
                  MESSAGE TYPES              LP125.442          1.0
	          CIRCUIT BUILDING MESSAGES  LP126.442          1.0
                  TERMINAL PARAMETER MESSAGE LP127.442          1.0

     WEDNESDAY    SLOT CONTROL INFO. MESSAGE LP131.442           .5
                  NAD ASSEMBLY LANGUAGE      LP132.442          2.0
                  NAD ASSEMBLY DIRECTIVES    LP133.442          2.0
                  MACRO FACILITY             LP134.442          1.0
                  LAB EXERCISE NO. 1         LE135.442          1.5

     THURSDAY     LIBRARY PACKAGES           LP141.442          4.5
                  ISIS DDT                   LP142.442          2.0
                  NAD DEBUGGER               LP143.442          1.0

     FRIDAY       SLOT FILES                 LP151.442          1.0
                  GOOD GUY LIST AND OTHER    LP152.442          1.0
                  LIBRARY PACKAGES           LP153.442          2.0
                  LAB  1  (FINISH)                        ALL AFTERNOON



_______________________________________________________________________

       COURSE :  ISIS PROGRAMMING               DATE ::
       COURSE NUMBER :  TTE.442                 WEEK :  2 OF 2

***********************************************************************
      DAY             SUBJECT         LESSON PLAN NO.          TIME
                                      EXERCISE PLAN NO.    
************************************************************************

     MONDAY         QUIZ & REVIEW            LP211.442          2.0
                    SYSTEM SVC'S             LP212.442          1.0
                    I/O CONTROL SVC'S        LP213.442          1.0
                    SYNC. INPUT CONTROL SVC  LP214.442          1.5
                    SYNC. OUTPUT CONTROL SVC LP215.442          1.5
                    LAB 2 (SYNC.)            LE216.442          1.0

     TUESDAY        ASYNC. SUPERVISORY CALLS LP221.442          1.5
                    FRONT CONSOLE OF ENGINE  LP223.442          1.0
                    LAB 2 (FINISH)                         ALL AFTERNOON

     WEDNESDAY      LAB 3 (ASYNC.)           LE231.442          1.0
                    DDT SUPERVISORY CALLS    LP232.442          1.5
                    LAB.                                  ALL AFTERNOON

     THURSDAY       SIO                      LP241.442          3.5
                    SIO SUPERVISORY CALLS    LP242.442          2.0
                    LAB.                                        2.5

     FRIDAY         LAB. REVIEW              LP251.442          1.5
                    REVIEW & SUMMARY         LP252.442          1.0
                    FINAL EXAM.              LP253.442          2.0
                    REVIEW THE FINAL EXAM.   LP254.442          1.0
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  : Course Intro. & ISIS Overview      Course No. TTE.442
   Week  :  1   Day  :  1  Period  :  1         Lesson No.  LP111.442

______________________________________________________________________________________


  OBJECTIVES :
        1. TO PROVIDE AN OVERALL VIEW OF THE COURSE CONTENT AND FLOW
           OF MATERIALS.
        2. TO GIVE AN OVERVIEW OF ISIS
              2.1 KERNEL
              2.2 DISPATCHER
              2.3 SLOTS & PROCESSES
              2.4 ORING & IRING
              2.5 SEGMENT E
              2.6 SEGMENT F

   MATERIALS REQUIRED
        1. ISIS-II REFERENCE MANUAL
        2. HANDOUT - CLASS CONTENT AND SCHEDULE  _____HANOUT.442












    COURSE NO.  TTE.442        LESSON NO.  LP111.442      PAGE NO.

 REFERENCES      SLIDE #       LESSON PLAN


-------------------------------------------------------------------------------------------
 ISIS-II         SL.1          I. INTRODUCTION TO ISIS-II
                                  A. ISIS-INTERNALLY SWITCHED INTERFACE SYSTEM
                                     - IS NOT REALLY AND OPERATING SYSTEM,
                                     BUT A SET OF RULES AS TO HOW INTERFACES
                                     ARE TO BE CONSTRUCTED AND HOW THEY ARE
                                     TO COMMUNICATE WITH EACH OTHER WITH A
                                     LITTLE CODE TO HANDLE INTERRUPTS.
                                  B. THE CONCEPT OF THE ISIS DESIGN IS TO
                                     ALLOW THE MACHINE TO BE DIVIDED INTO
                                     PARTITIONS, CALLED 'SLOTS'.
                                     THIS WOULD PROVIDE THE CAPACITY OF
                                     MAKING EACH OF THE VARIOUS NETWORK 
                                     INTERFACES A SEPARATE MODULE THAT COULS
                                     BE DEVELOPED, DEBUGGED AND DEPLOYED
                                     ON NETWORK NODES WHILE PROTECTING
                                     THESE NODES FROM POSSIBLE FAULTS
                                     IN THE INTERFACE.
                                  C. ISIS TREATS THE TYMNET NODE CODE AS
                                     JUST ANOTHER INTERFACE. THE TYMNET 
                                     NODE CODE HAS SPECIAL PROPERTIES ONLY
                                     WHEN EXECUTING IN SLOT 0.
                                     THESE INCLUDE THE ROUTING AND MONITORING
                                     FUNCTIONS RELATING TO THE TYMNET SUPE.
                                     * IF TYMNET INTERFACE IS EXECUTED IN
                                     OTHER SLOT, IT PERFORMS THE FUNCTION
                                     OF A GATEWAY TO TYMNET.
                               II. KERNAL PROCESS
                                     THE KERNEL, ALSO KNOWN AS SLOT FF 
                                     (IMPORTANT  TO KNOW FOR DEBUGGING)
                                     IS THE CONTROL CENTER OF THE ISIS
                                     OPERATING ENVIRONMENT.
                                     1. SCHEDULES CPU TIME FOR ALL PROCESSES.
                                     2. UPDATES SEG. F - WHICH IS 
                                        PHYSICALLY LOCATED IN THE KERNEL
                                        AREA OF MEMORY,,THAT IS SET UP    
                                        IN THE MAC SEGMENTATION REGISTERS.
                                        SEG. F IS A COMMON READ-ONLY DATA
                                        AREA FOR ALL SLOTS.
                                     3. PROCESSES SVC CALLS.
                                     4. HANDLES ALL HARDWARE INTERRUPTS 
                                        (THESE HAVE TOP PRIORITY WITHIN THE 
                                         MACHINE)
                                          A. KERNEL DOES NOT BUFFER ANY
                                             DATA,IT SIMPLY RUNS THE PROCESS
                                             AND TRANSFERS DATA TO THE SLOT.
                                          B. TRANSLATES PHYSICAL I/O 
                                             DEVICES INTO LOGICAL UNITS
                                             SEEN BY THE SLOTS.
                                III. DISPATCHER
                                     1. ACTS  AS A SWITCHING CENTER (COMM.
                                        CENTER) OF ISIS, ROUTING MESSAGES
                                        AND DATA FROM ORIGINATING SLOT 
                                        TO THE DESTINATION SLOT.
                                     2. DOES THE WORK OF SCHEDULING AND 
                                        PROCESSING DATA GOING BETWEEN SLOTS.
                                     3. DOES NOT HAVE ANY KNOWLEDGE
                                        OF THE STRANGE PROPERTIES OF 
                                        SPECIFIC INTERFACES.
                                        - EACH SLOT (INTERFACE) MUST 
                                        FOLLOW A SET OF PROTOCOLS WHICH 
                                        IT USES TO TALK TO THE DISPATCHER.
                                        ( MIGHT NEED TO TRANSLATE REQUESTS
                                        AND MESSAGES TO THE STANDARD FORMAT)
                                     4. CHECKS THE DATA FLOW TO MAKE SURE
                                        THAT, IS THE INTERFACE IS IN ERROR,
                                        IT DAMAGES ONLY ITS DATA.
                                      5. RUNS EVERY TIME A TRUE BACKGROUND
                                        JOB RUNS, AND SETS UP BACKGROUND 
                                        JOB FOR ITS NEXT USE IN THE MACHINE.
                                     6. HAS ACCESS TO ALL MEMORY
                                     7. USES SEG.E OF EACH SLOT FOR DETERMINING
                                        THE SLOT'S CONFIGURATION.
                                        IT USES SEG. TO MAINTAIN RECORDS OF
                                        ONGOING EVENTS.
                                IV.  SLOTS & PROCESSES
                                     A. SLOT - A COLLECTION OF RESOURCES
                                        ALLOCATED TO A SINGLE ENTITY, 
                                        IT INCLUDES THE PARTICULAR
                                        PROCESS OR SET OF PROCESSES 
                                        CAPABLE OF USING THOSE RESOURCES.
                                     B. MEMORY
                                        1. EACH SLOT IS ALLOCATED ITS
                                        OWN MEMORY IN THE MACHINE.
                                        2. 3 -4 K IS ABOUT THE SMALLEST
                                        A SLOT RUNS IN.
                                        (WHATEVER THE KERNEL AND DISPATCHER
                                        DO NOT USE, IT IS AVAILABLE TO
                                        THE SLOTS.)
                                        3. MAX. NO. OF SLOTS IS 64 IN AN
                                        ISIS MACHINE.
                                        4. WHEN A SLOT IS RUNNING, IT HAS
                                        A SET OF 16 SEGMENTATION REGISTERS
                                        DEDICATED TO IT.
                                        5. SEG.14 (SEG. E) IS THE SLOT'S CTA,
                                        CONTAINING THE DESCRIPTORS NECESSARY
                                        TO DESCRIBE THE SLOT'S RUNNING 
                                        CONFIGURATION, SUCH AS POINTERS
                                        TO VARIABLES, MEMORY LAYOUT,ETC.
                                     C. PROCESSES
                                        ISIS DIVIDES JOBS INTO PROCESSES.
                                        THESE PROCESSES ARE, FOR THE PURPOSE
                                        OF SCHEDULING, INDEPENDENT JOBS.
                                        THEY ARE BROKEN DOWN INTO A HEIRARCHY
                                        OF LEVELS, OF WHICH THE SLOT IS 
                                        NOT REQUIRED TO RUN ALL.
                                        THE THREE PROCESSES ARE:-
                                        BACKGROUND, FOREGROUND AND DDT.
                                        C.1 FOREGROUND__ 
                                           1. SCHEDULED TO EXECUTE EVERY
                                            25 MILLISECONDS.
                                           2. TIME IS ALLOCATED IN CLOCK TICKS,
                                            1 TICK = 1/600 SEC (FASTC).
                                            THE MINIMUM TIME IS 2 TICKS, AND
                                            FOR EVERY 3 LOGICAL UNITS, YOU
                                            GET 1 ADDITIONAL TICK OF
                                            EXECUTION TIME.
                                        NOTE: THE ENTIRE MACHINE, THERE IS
                                            ONLY 16 CLOCK TICKS AVAILABLE,
                                            THE KERNEL TAKES 1, SO 15 ARE LEFT
                                            FOR THE REMAINING SLOTS.
                                        C.2 BACKGROUND__BOTTOM LEVEL
                                            1. ALLOCATED 50 MILLISECONDS
                                            OF CPU TIME, BUT IS SCHEDULED
                                            ON AN EXECUTION CHAIN,ROUND ROBIN,
                                            AFTER EXECUTION THEY GO TO THE 
                                            END OF THE LIST.
                                            2. THIS IS THE WORKHORSE OF THE
                                            MACHINE.
                                            3. THESE TIMESLICES CAN BE
                                            INTERRUPTED BY FOREGROUND PROCESS.
                                            NOTE:  IN A WELL BALANCED MACHINE,
                                            BACKGROUND JOBS WILL GET 100 

                                            SHOTS AT THE CPU AND EXECUTE
                                            ONLY 8 MS.
                                            4. A JOB CAN DISMISS AT ANY TIME
                                            DURING ITS TIMESLICE__A NEW 
                                            TIME SLICE IS THEN CREATED FOR
                                            THE NEXT JOB.
                                       C.3  DDT__
                                            CAN BE LOGGED INTO THRU. THE NETWORK
                                            TO CONTROL, MODIFY, DEBUG AND
                                            RELOAD A SLOT.
                                            1. GETS SOME ALLOCATION OF
                                            CPU TIME AS A BACKGROUND JOB.
                                            IT IS GIVEN 50 MS, BUT WILL
                                            ONLY USE SO MUCH TIME AS IT NEEDS
                                            TO EXECUTE.
                                            2. GOES ON THE RUN LIST RIGHT
                                            ALONG WITH BACKGROUND JOBS,
                                            IT HAS HIGHER PRIORITY.
                                       
                                       SLOT PROCESS RULES:
                                           1. KERNEL WILL STEP IN WHEN IT 
                                            GETS AN INTERRUPT, TAKING THE
                                            CPU TIME IT NEEDS TO PROCESS 
                                            THE INTERRUPT, THEN IT WILL 
                                            GIVE THE CPU BACK TO THE PROCESS
                                            THAT HAS BEEN INTERRUPTED.
                                            THE KERNEL WILL TAKE AS MUCH 
                                            TIME AS NEEDED TO PROCESS 
                                            AN INTERRUPT.
                                           2. IF THE SLOT IS RUNNING ONLY
                                            ONE PROCESS, IT CAN ONLY BE
                                            BACKGROUND OR DDT.
                                           3. A FOREGROUND PROCESS CANNOT RUN IN
                                            EITHER A BACKGROUND OR DDT
                                            PROCESS RUNNING ALSO.
   

                                    V. ORING & IRING
                                       - BECAUSE OF THE CONCURRENT NATURE
                                       OF OPERATION, THE TRAFFICS (OR
                                       DATA TRANSFERRING) TO AND FROM
                                       THE DISPATCHER ARE SEPARATE.
                                       - THEREFORE,2 RING BUFFERS ARE USED,
                                       ONE IS FILLED BY THE DISPATCHER AND
                                       THE OTHER IS EMPTIED BY THE DISPATCHER
                                       - INPUT TO A SLOT IS PLACED IN THE 
                                       SLOT'S "IRING" BY THE DISPATCHER,
                                       AND OUTPUT IS REMOVED FROM A SLOT'S
                                       "ORING".
                                       1. EACH RING CONTAINS:
                                           A STRING OF MESSAGES WHICH IS
                                          STARTED OF WITH THE RING DESCRIPTOR
                                          - EACH RING DESCRIPTOR HAS
                                          NFMI - HALFWORD ---> NEST FILL
                                                 MESSAGE INDEX,
                                                 THIS IS A POINTER TO THE
                                                 NEST BYTE TO BE FILLED.
                                          CEI  - HALFWORD ---> CURRENT
                                                 EMPTY INDEX,
                                                 THIS IS A POINTER TO THE
                                                 LAST LOCATION JUST READ
                                                 (IE. THE NEST MESSAGE TO 
                                                 BE EMPTIED)
                                          BY CONVENTION, RING BUFFERS GO TO
                                                 SEGMENT 2.
                                      2.  THE SIZE OF THE RINGS ARE DEFINED
                                          WHEN WE CREATE THE SLOTS; NO CERTAIN
                                          SPECIFIED SIZES AND THEY WRAP UP
                                          ( IE. GO TO THE BEGINNING AGAIN)
                                      3.  IRING
                                          3.1 CONTAINS MESSAGE YOU RECEIVE
                                          FROM DISPATCHER
                                          3.2 NFMI - WHERE THE NEXT MESSAGE
                                          IS TO BE PLACED. 
                                          THIS IS USED & UPDATED BY DISPATCHER
                                          3.3 CEI  - WHERE TO GET THE NEXT 
                                          MESSAGE.
                                          THIS IS USED & UPDATED BY SLOT(USER)
                                          3.4 PROCEDURE FOR THE SLOT(USER):
                                              3.4.1 READ DATA FROM RING
                                                    AND UPDATE CEI
                                                    (READING STARTS FROM CEI 
                                                    TO NFMI-1)
                                              3.4.2 CHECK NFMI AND CEI FOR
                                                    DIFFERENT VALUES
                                              3.4.3 CONTINUE READING UNTIL
                                                    CEI = NFMI
                                                    ( NO MORE DATA IN THE RING)
                                            
                                      4.  ORING
                                          - IT'S THE ONLY WAY TO SEND OUTPUT.
                                          4.1  CONTAINS MESSAGE YOU SEND TO
                                          THE DISPATCHER
                                          4.2  NFMI - WHERE THE NEXT MESSAGE
                                          IS TO BE PLACED.
                                          SLOT(USER) HANDLES AND UPDATES IT
                                          4.3  CEI  - WHERE TO GET THE NEXT
                                          MESSAGE.
                                          DISPATCHER HANDLES AND UPDATES IT.
                                          4.4  PROCEDURES:-
                                               4.4.1 WRITE TO ORING WITH 
                                               DATA AND THEN UPDATE NFMI
                                               4.4.2 START AT CURRENT NFMI,
                                               PLACE AT THE END OF MESSAGE.
                                               4.4.3 UPDATE NFMI BY
                                               NFMI = NFMI + MSG. LENGTH
                                               4.4.4 DISPATCHER CHECKS IF
                                               NFMI = CEI, IF SO, NO MORE
                                               DATA TO FETCH FROM THIS SLOT.
                                    NOTE;
                                        1. RING HANDLING:
                                           WRAP AROUND
                                               WHEN YOU REACH BOTTOM OF RING,
                                               YOU MUST HANDLE WRAP AROUND
                                               -BECAUSE-
                                               MESSAGES ARE OF VARIABLE 
                                               LENGTHS (MESSAGES OF THE SAME
                                               TYPE CAN HAVE DIFFERENT LENGTHS)
                                               -THEREFORE-
                                               ALL MESSAGES MUST BEGIN ON
                                               FULL WORK BOUNDARIES
                                        2. MUST RESERVE ENOUGH SPACE IN ORING
                                           THAT CAN HANDLE ENOUGH DATA TO 
                                           OUTPUT IN A SINGLE BACKGROUND JOB.
                                           USUALLY, RINGS ARE ASSIGNED TO
                                           BE 512D OR 200 IN HEX.

                                        3. ISIS SLOTS RUN UNDER THE MAC
                                           THE KERNEL WILL MAINTAIN THE MAC 
                                           SET UP.
                                           THE USE OF MAC IS THAT IT WILL
                                           3.1 ASSIGN PHYSICAL ADDRESSES
                                           TO LOGICAL ADDRESSES.
                                           3.2 PROTECT AREAS IN CORE MEMORY.

                                   VI.  SEGMENT E
                                        A. CONTROL TABLE AREA FOR THE SLOT
                                           1. TELLS OTHER PROCESSES WHERE 
                                           THINGS ARE LOCATED IN THE SLOT.
                                           2. PHYSICAL LOCATION OF THIS
                                           SEGMENT AT THE LOWEST LOCATION
                                           OF THE CORE, FOLLOWED BY
                                           SEG. 0,1,2.....F
                                        B. FORMAT
                                           1. FIRST WORD - ARE THE CONTROL
                                           BITS FOR THE SLOT AND ARE USED 
                                           BY THE DISPATCHER
                                           2. BY SETTING CERTAIN BITS IN THE
                                           CNTRL WORD, YOU CAN ALLOW OR 
                                           DISALLOW CERTAIN COMMUNICATIONS
                                           MESSAGES TO BE SENT TO YOUR SLOT.
 
                                      NOTE
                                      ----
                                           ISIS CONVENTIONS
                                           1. EACH SLOT MUST HAVE ITS OWN
                                           SET OF 16 SEG.REG.
                                           2. THE KERNEL MAINTAINS THE SEG.REG.
                                           3. SEG. 0 -- USED FOR VARIABLES
                                              SEG. 1 -- USED FOR CODING
                                              SEG. 2-D -- BUFFERS,RING AREA
                                              SEG. E -- CTA
                                              SEG. F -- COMMON MEMORY TO
                                                        BE SHARED BY ALL 
                                                        SLOTS AS READ-ONLY
                                                        ACCESS (NOT USABLE
                                                        BY PROGRAMMER)
                                   VII.  SEGMENT F
                                           - SYSTEM VARIABLES USED BY ALL SLOTS
                                           A. SEG. F IS SET UP BY THE MAC WHEN
                                              THE MACHINE IS LOADED AND NEVER
                                              CHANGES.
                                           B. SEG. F IS PHYSICALLY LOCATED
                                              WITHIN THE KERNEL AREA OF M
                                              MEMORY
                                           C. ALL SLOTS HAVE READ-ONLY ACCESS
                                              TO SEG. F
                            ISIS SLOT PROGRAMMING
                                     LESSON PLAN

   COURSE :  ISIS PROGRAMMING                     DATE :
   LESSON :  COMMUNICATIONS PROCESS               COURSE NO. : TTE.442
   WEEK  :  1   DAY  :  1   PERIOD  :  2          LESSON NO. : LP112.442

   OBJECTIVES :
                1. TO PROVIDE A THOROUGH UNDERSTANDING OF THE ISIS
                 COMMUNICATIONS PROCESSES, BOTH EXTERNAL AND INTERNAL.
                2. TO FAMILIARIZE THE STUDENTS WITH TYPES OF MESSAGES THAT
                 FLOW BETWEEN ISIS SLOTS.
                3. TO DISCUSS ON ISIS MEMORY MANAGEMENT 
                4. TO DISCUSS ON ISIS SLOT'S HOST MANAGEMENT

   MATERIALS REQUIRED:
                1. ISIS-II REFERENCE MANUAL
                2. HANDOUT - HANDOUTS PACKAGE NO. 1 























         COURSE NO.  TTE.442          LESSON NO.  LP112.442     PAGE NO.

  REFERENCES         SLIDE #          I. COMMUNICATION PROCESSES
                                        - ALL I/O COMM. IS DONE THROUGH 
                                          THE KERNEL
                                        - ALL COMM. BETWEEN SLOTS IS
                                          THROUGH THE DISPATCHER
                                        - ALL COMM. IS DONE OVER CIRCUITS-
                                          EVERY CIRCUIT IS GIVEN A RELATIVE
                                          PORT #
                                        - IF A CIRCUIT IS BUILT FROM SOME-
                                          WHERE OUTSIDE THE MACHINE,IT
                                          MUST COME THROUGH SLOT 0
                                      A.  INTERNAL COMM. PROCESS
                                          THIS IS MAINLY THE COMM. BETWEEN
                                          THE DISPATCHER AND THE SLOTS.
                                          1. TWO INTERFACES TALK TO EACH 
                                          OTHER THROUGH THE DISPATCHER. THERE
                                          IS NO REQUIREMENT THAT THE 
                                          ORIGINATOR AND THE RECEIVER OF 
                                          A DATA STREAM BE SYNCHRONOUS,
                                          SO SOME MECHANISM IS NECESSARY
                                          TO APPLY BACKPRESSURE
                                          OVER A CIRCUIT.
                                          NOTE: IT IS NOT DESIRAVLE TO 
                                          BACK PRESSURE THE SOURCE
                                          INTERFACE ITSELF, BUT RATHER TO 
                                          BACK-PRESSURE THE SOURCE PORT 
                                          2.  SLOT 0 INTERFACE HAS THE SET
                                          OF FUNCTIONS RELATING TO INTER-
                                          NODE COMM., CIRCUIT ROUTING,
                                          AND DIAGNOSTIC INCO.
                                          3.  EACH INTERFACE, INCLUDING 
                                          SLOT 0, HAS A SET OF PERMUTER 
                                          TABLES, WHICH TELL THE DISPATCHER
                                          WHICH PORT OF ONE INTERFACE IS 
                                          CONNECTED TO WHAT PORT OF ANOTHER.
                                          4.  THE DISPATCHER HANDLES ALL 
                                          INTER-SLOT COMM. BY TRACKING ALL
                                          PORT ASSIGNMENTS IN PERMUTER
                                          TABLES OF SLOT #0 AND ACTUALLY
                                          PULLING DATA FROM OUTPUT 
                                          BUFFERS AND PLACING IT IN THE 
                                          DESTINATION PORT BUFFERS.
                                          5.  THE INTERNAL FORMAT OF DATA
                                          BEING TRANSMITTED MUST BE UNIFORM
                                          FOR ALL INTERFACES.
                                      B.  EXTERNAL COMMUNICATIONS
                                          1. AND INTERFACE MAY NEED SOME SORT
                                          OF HARDWARE DRIVER (PRINTER,
                                          DISC, ETC.)
                                          2. 4 TYPES OF COMM. CLASSES FOR
                                          DRIVERS:- ASYNC,SYNC,AND SIO
                                          CHANNELS.
                                          3. AN INTERFACE WHICH CORRUPTS 
                                          ITS BUFFER HANDLING HURTS ONLY 
                                          ITSELF, NOT THE HARDWARE, OR THE
                                          OTHER INTERFACES WHICH IT IS
                                          SHARING THE HARDWARE WITH.
                                          4. THEREFORE,EACH INTERFACE IS 
                                          CONSTRAINED TO REQUEST ACTUAL DATA
                                          TRANSFERS FROM THE DRIVERS,
                                          THROUGH THE KERNEL.

                                          IMAGINARY TABLES OF CONNECTION
                                          ( RESIDE IN THE KERNEL )
                                                       SYNC.
                                                  ________________
                                                  |SLOT|LU | PHY |
                                                  | NO.|   |LINE |
                                                  ----------------
                                                  |   0 0  |  0  |
                                                  |   0 1  |  1  |
                                                  |   1 1  |  3  |
                                                  |        |     |
                                                  |        |     |
                                                  |        |     |
	                                                  |        |     |
                                                  ________________


                                                       ASYNC.
                                                  ________________
                                                  |SLOT|LU | GR  |
                                                  | NO.|   |     |
                                                  ________________
                                                  |   0 0  |  0  |
                                                  |   0 1  |  1  |
                                                  |   0 2  |  2  |
                                                  |        |     |
                                                  |        |     |
                                                  |        |     |
                                                  |        |     |
                                                  ________________

                                          NOTE:  IN THE ASYNC. CASE,
                                                 A LOGICAL UNIT IS 
                                                 PHYSICALLY ASSIGNED TO
                                                 1 GROUP OF 16 PORTS.


                                       
                                  
                                     C.  ROUTING AND CIRCUITS
                                         1. FIRST SIGN OF A CIRCUIT IS THE 
                                         NEEDLE IN THE INPUT, MAY BE
                                         FOLLOWED BY MESSAGES FOR THAT PORT
                                         2. CIRCUITS ARE CONSTRUCTED BY
                                         THE SLOT 0 SUPE, AND THE PORTS 
                                         ARE ASSIGNED EXTERNAL TO THE 
                                         INTERFACE.
                                         SO, THE INTERFACE MUST SEND
                                         THE APPROPRIATE FORM OF 
                                         PSEUDO-NEEDLE REQUEST.
                                         3. SLOT 0 EITHER REJECTS IT, OR 
                                         RETURNS A PSEUDO-NEEDLE,CAUSING
                                         A CIRCUIT TO BE CONSTRUCTED
                                         THROUGH ISIS, CONNECTING
                                         NODE CODE AND THE INTERFACE.
                                         4. ALL THE LOGON INCORMATION
                                         WOULD NOW TRAVEL TO THE SUPE.,
                                         5. THERE ARE 2 TYPES OF CIRCUITS:
                                            5.1 NORMAL CIRCUIT
                                            A NORMAL CIRCUIT IS NORMALLY
                                            ORIGINATED AT AN EXTERNAL ENTRY
                                            TO THE NETWORK (REQUIRING A
                                            PASSWORD)
                                            (IN ISIS MANUAL,FULL DISCUSSION
                                            ON LOGON PROCEDURE)
                                            5.2  AUX. CIRCUIT
                                            AN AUX. CIRCUIT IS WITH NO
                                            PASSWORD, AND NO REQUIREMENT
                                            TO SPECIFY THE DEEST. HOST.
                                            IT IS USED FOR WELL-DEFINED USAGE,
                                            SUCH AS A CIRCUIT ORIGINATING
                                            AT THAT HOST.

                                  D. ISIS CONTROL TABLE
                                     - IN SEGMENT 14 ( SEG. E )
                                        1. THERE ARE FIXED LOCATIONS FOR 
                                        FOR CONSTANTS, AND TEMP STORAGE
                                        FOR DISPATCHER.
                                        2. ALL THE INFO. IN CTA ARE FIXED 
                                        AT ASSEMBLY TIME
                                        3. THE FIRST WORD (16 BITS) ARE
                                        CALLED 'CONTROL BITS' TO ALLOW
                                        CERTAIN CONDITIONS TO TAKE PLACE
                                        4. THIS SEGMENT IS PROTECTED
                                        DURING RUNNING
                                        5. EVERY SLOT CAN FIND THIS TABLE
                                        AT A FIXED LOCATION IN THE SLOT'S
                                        ABSOLUTE MEMORY.
                                     D.1  MEMORY MANAGEMENT
                                        1. IN THE CTA, THERE IS A TABLE 
                                        TERMED 'AREAS' DEFINING THE USER'S
                                        MEMORY LAYOUT
                                        THIS AREA CORRESPONDS TO AN INTEGRAL
                                        NUMBER OF MAC SEGMENTS, RATHER THAN 1
                                        2. THE USER CAN SPECIFY THE PROTEC-
                                        TION TO APPLY TO EACH SEGMENT AT
                                        LOAD TIME
                                        3. DEFINING MULTIPLE AREAS OF 
                                        EXECUTABLE CODE
                                        4. SEG. E GOES UNCONDITIONALLY
                                        INTO THE BEGINNING OF THE
                                        USER'S PHYSICAL ADDRESS AREA
                                        5. WHEN THE SLOT IS NOT RUNNING
                                        DDT CAN WRITE INTO SEG. E
                                        
                                     D.2  HOST MANAGEMENT
                                        - SLOTS MANAGE THE HOSTS
                                        1. FIRST MESSAGE TO SEND IS 04(HEX)
                                        TO REPORT THE STATUS OF HOST SO AS
                                        TO GIVE THE HOST NUMBERS AND THE 
                                        NUMBER OF PORTS TO APPLY TO THAT 
                                        HOST.
                                        2. THE DISPATCHER IS RESPONSIBLE 
                                        TO VERIFY THAT RH# IS LESS THAN HOSTN,
                                        ELSE IT WILL CAUSE TO CRASH THE SLOT
                                        3. IN T2,
                                        MAX. NO. OF HOSTS = 64
                                        (BUT KERNEL HOST TAKES 1)
                                        MAX. NO. OF PORTS = 256
                                        IF WHEN REQUESTED BY SLOTS, THESE
                                        NUMBERS ARE EXCEEDED,0B MESSAGE
                                        IS ISSUED BACK TO THE REQUESTING
                                        SLOT, INDICATING ERROR
                                        4. WHEN A CIRCUIT IS BUILT TO A HOST,
                                        IT IS TIED TO THAT SLOT
                                        SO, IT IS THE RESPONSIBILITY OF 
                                        THE SLOT TO REPORT THE STATUS OF
                                        THE HOST. FOR EXAMPLE, WHEN
                                        A HOST GOES DOWN, THE SLOT MUST
                                        MANAGE TO DROP CIRCUITS(M.TYPE 10)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  EXTERNAL COMMUNICATIONS           Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  1         Lesson No.  LP121.442

_______________________________________________________________________________

   OBJECTIVES : 
              1. TO REVIEW THE DISCUSSION OF ISIS EXTERNAL COMM.
              2. TO DISCUSS THE TYPES OF HARDWARE INTERFACES FOR EXTERNAL
                 COMM.

   MATERIALS REQUIRED:
                 ISIS-II REFERENCE MANUAL

























         COURSE NO.  TTE.442       LESSON NO.  LP121.442     PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              ISIS EXTERNAL COMMUNICATONS
              - FOR EACH LOGICAL INTERFACE, THERE MAY BE HARDWARE DRIVERS
                CONNECTED TO THEM
              - EXAMPLES OF THESE DRIVERS ARE:
                ASYNC.,SYNC.,SIO., OR SOME SORT OF SPECIAL I/O DEVICE
                DRIVER (PRINTER,DISC, ETC.)
              - ISIS SUPPORTS DRIVERS FOR ALL THESE DEVICES
              - EACH INTERFACE HAS TO REQUEST ACTUALD DATA TRANSFERS FROM
                THE DRIVERS, THROUGH THE KERNEL

                   1. ASYNCHRONOUS
                THIS IS ALSO KNOWN AS "START/STOP" COMM., AND IS USUALLY
                USED FOR RELATIVELY LOW-SPEED APPLICATIONS (LESS THAN 9600
                BAUD). EACH CHARACTER WITH A START BIT AND ONE OR TWO STOP
                BITS IF ASCII IS USED.

                CHARACTERS ARE SENT OUT ONE AT A TIME, AT ANY TIME. THE
                RECEIVING DEVICE LOOKS FOR A START BIT (0), BECAUSE THE LINE
                IS HELD HIGH DURING ITS IDLE PERIODS. WHEN IT DETECTS A 
                START BIT, IT STARTS SYNCHRONIZING ITSELF TO THE LINE SPEED,
                COUNTS THE INCOMING BITS OF DATA AND STORES THEM, AND THEN
                STRIPS OFF THE STOP BITS. THE STOP BITS SET THE LINE BACK
                TO ITS HIGH, IDLE STATE.

                EQUIPMENT FOR ASYNCHRONOUS COMMUNICATION IS CHEAP, SINCE NO
                COMMON CLOCK IS REQUIRED. IT IS MAINLY USED FOR TERMINAL-TO
                -TERMINAL OR TERMINAL-TO-COMPUTER COMMUNICATIONS.


                   2. SYNCHRONOUS
                THIS TYPE OF COMMUNICATION USES A COMMON CLOCK SIGNAL, TO
                WHICH BOTH SENDING AND RECEIVING DEVICES ARE SYNCHRONIZED.
                THIS CLOCK IS ONE OF THE CONTROL LINES IN MOST HARDWARE
                INTERFACE SPECIFICATIONS. IT ALSO USES SPECIAL CHARACTERS
                TO MAINTAIN SUNCHRONIZATION BETWEEN THE TWO DEVICES WHEN
                THE LINE IS IDLE. THERE IS ANOTHER SPECIAL CHARACTER TO 
                SIGNAL THE END OF THE DATA. AFTER THE TRANSMISSION IS OVER,
                SYNCHRONIZATION CHARACTERS ARE SENT OUT AGAIN UNTIL THERE
                IS ANOTHER TRANSMISSION.

                FOR LONG MESSAGES, SYNCHRONOUS COMMUNICATION CONSIDERABLY
                REDUCES THE NUMBER OF BITS THAT ARE SENT, SINCE THERE ARE ONLY
                TWO SPECIAL CHARACTERS FOR EACH MESSAGE, RATHER THAN START
                AND STOP BITS FOR EACH CHARACTER. IT REQUIRES MORE COMPLEX
                AND EXPENSIVE MODEMS AND IS USUALLY USED FOR COMPUTER-TO-
                COMPUTER LINKS, AS IN TYMNET NETWORK.


                   3. SIO (SERIALLY INPUT OUTPUT)
                THIS IS A BOARD THAT PROVIDES CONTROL OF HIGH SPEED SYNC.
                AND ASYNC. LINES.  THE SIO CONTROLLER BOARD CAN CONTROL
                UP TO 16 ASYNC. LINES AT THE MAX. SPEED OF 480,000 BPS.
                IN SYNC. MODE, THE CONTROLLER BOARD SUPPORTS EITHER THE 
                BIT STUFFING(SDLC/HDLC) PROTOCOLOR BYTE SYNC.(E.G. BSC)
                PROTOCOL.
                EACH MOTHER BOARD CAN CONNECT TO UP TO 8 DAUGHTER BOARDS.
                THERE ARE CURRENTLY 4 TYPES OF DAUGHTER BOARDS APPLICABLE
                TO THE SIO BOARDS.
                3.1 V.24 ASYNC.
                   - HANDLES 2 LINES USING THE V.24/RS232 STANDARD INTERFACE
                   AT SPEED UP TO 9600 BAUD.
                3.2 OPTICALLY COUPLED
                   - FOR HARDWIRED CONNECTIONS BETWEEN MACHINES WITHIN A
                   FEW HUNDRED FEET OF EACH OTHER AT SPEEDS UP TO 
                   162,500 BPS.
                3.3 V.24 SYNC.
                   - HANDLES 2 LINES USING THE V.24/RS232 STANDARD INTERFACE
                   AT SPEEDS UP TO 20,000 BPS.
                3.4 V.35 SYNC.
                   - HANDLES 2 LINES USING THE V.35 STANDARD INTERFACE AT
                   SPEEDS UP TO 160,000 BPS.

                   NOTE:
                   ----
                   PER MOTHER BOARD:
                   1. NO MORE THAN 1  56KB LINE(UNLESS ONLY 1 D.BD)
                   2. IF THERE IS 1 56KB LINE,THEN NO MORE THAN 4 OCL LINES
                   3. IS NO 56KB LINES INSTALLED, NO MORE THAN 16 OCL LINES.
                   ( 8 DAUGHTER BOARDS)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  ISIS Internal Communications      Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  2         Lesson No.  LP122.442

_______________________________________________________________________________

    OBJECTIVES ;
              1. TO REVIEW THE DISCUSSION OF ISIS INTERNAL COMM.
              2. TO FAMILIARIZE STUDENTS WITH ISIS INTERNAL FLOW OF DATA
                 AND MESSAGES.

    MATERIALS REQUIRED:
              ISIS REFERENCE MANUAL





































         COURSE NO. TTE.442            LESSON NO. LP122.442  PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              INTERNAL PROCESS COMMUNICATIONS
              1. COMMUNICATIONS BETWEEN SLOTS ARE DONE THRU THE DISPATCHER
              BY MEANS OF IRING AND ORING
              2. THERE IS NO CONSTRAINT ON THE SIZE OF THE BUFFERS.
              THE DISPATCHER TRIES TO MOVE DATA FROM THE SOURCE PROCESS
              TO THE DESTINATION, BUT SOMETIMES IS UNABLE TO. AS A CONSE-
              QUENCE, THE DISPATCHER WOULD TRY TO BACKPRESSURE THE 
              SOURCE PORT INSTEAD.
              3. WHEN A SLOT REQUESTS A CIRCUIT TO ANOTHER HOST, THE 
              DISPATCHER GETS INFO. FROM SLOT 0 AS TO WHETHER THE CIRCUIT IS
              AN INTERNAL OR EXTERNAL CONNECTION. IF IT IS INTERNAL, THE 
              DISPATCHER WILL SET UP THE COMM. PATH.
              4. THE INTERNAL FORMAT OF DATA BEING TRANSMITTED MUST BE 
              UNIFORM. EACH MESSAGE HAS A HEADER CONTAINING PORT NUMBET AND
              MESSAGE TYPE.(THE MESSAGE TYPE HELPS DETERMINE SIZE OF MESSAGE
              SO AS TO AVOID PROCESSING EACH BYTE)
              5. CIRCUITS MAY BE
                5.1 TOTALLY INTERNAL
                5.2 ORIGINATING EXTERNALLY AND TERMINATING INTERNALLY
                5.3 ORIGINATING INTERNALLY AND TERMINATING EXTERNALLY
                5.4 CIRCUIT MAY ALSO JUST "PASS THRU" ISIS,LETTING THE SUPE
                HANDLE AS MUCH OF THE ROUTING AS POSSIBLE.
              6. EACH SLOT MAY REQUIRE A HARDWARE DRIVER ( ALL OF THESE DRIVERS
              ARE CONTROLLED BY THE KERNEL TO ADD SECURITY AND TO ELIMINATE
              THE NEED FOR SPECIALIZED KNOWLEDGE OF EACH HARDWARE DRIVER
              A SLOT USES. )
              7. SVC'S ARE THE MEANS FOR COMMUNICATING WITH THE KERNEL.
                 ( SUPERVISORY CALLS )

              - IRING AND ORING
                1. RING STRUCTURE
                   2 HALFWORDS FOR NFMI AND CEI
                   ( THIS IS THE HEADER FOR EACH MESSAGE )
                2. EACH MESSAGE MUST START ON A WORD BOUNDARY
                   - INSURES ITS HEADER REFERENCED W/O CONSIDRATION OF
                   RING FOLDING.
                3. MESSAGE TYPES HAVE THE FUNCTIONS:
                   3.1 CONTROL OF CIRCUITS'
                   3.2 DATA ON CIRCUITS
                   3.3 INTRA ISIS CONTROL
                4. RINGS ARE INDEPENDENT OF EACH OTHER
                5. IRING CONTAINS THE MESSAGE YOU RECEIVE FROM THE DISPATCHER,
                   AND ORING CONTAINS THE MESSAGE YOU SEND TO THE DISPATCHER.

              - INTRA ISIS COMMUNICATIONS
                   RPORT = 0
                   1. SOME MESSAGES CAN BE ENABLED/DISABLED IN CTA
                   2. THERE CAN BE 2 HOSTS OR MORE ON ONE SLOT,
                      WHEN A SLOT DOES 2 DIF. FUNCTIONS OR APPLICATIONS
                     (T2 - 256 CIRCUITS ON SLOT,
                      T1 - 64 CIRCUITS ON SLOT)
                   3. HOST # ARE IN DECIMAL
                   4. RH# WOULD BE 0 FOR T1 BECAUSE YOU CANNOT HAVE MORE THAN
                      1 HOST PER SLOT.
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  ISIS Internal Communications      Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  2         Lesson No.  LP122.442

_______________________________________________________________________________

    OBJECTIVES ;
              1. TO REVIEW THE DISCUSSION OF ISIS INTERNAL COMM.
              2. TO FAMILIARIZE STUDENTS WITH ISIS INTERNAL FLOW OF DATA
                 AND MESSAGES.

    MATERIALS REQUIRED:
              ISIS REFERENCE MANUAL





































         COURSE NO. TTE.442            LESSON NO. LP122.442  PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              INTERNAL PROCESS COMMUNICATIONS
              1. COMMUNICATIONS BETWEEN SLOTS ARE DONE THRU THE DISPATCHER
              BY MEANS OF IRING AND ORING
              2. THERE IS NO CONSTRAINT ON THE SIZE OF THE BUFFERS.
              THE DISPATCHER TRIES TO MOVE DATA FROM THE SOURCE PROCESS
              TO THE DESTINATION, BUT SOMETIMES IS UNABLE TO. AS A CONSE-
              QUENCE, THE DISPATCHER WOULD TRY TO BACKPRESSURE THE 
              SOURCE PORT INSTEAD.
              3. WHEN A SLOT REQUESTS A CIRCUIT TO ANOTHER HOST, THE 
              DISPATCHER GETS INFO. FROM SLOT 0 AS TO WHETHER THE CIRCUIT IS
              AN INTERNAL OR EXTERNAL CONNECTION. IF IT IS INTERNAL, THE 
              DISPATCHER WILL SET UP THE COMM. PATH.
              4. THE INTERNAL FORMAT OF DATA BEING TRANSMITTED MUST BE 
              UNIFORM. EACH MESSAGE HAS A HEADER CONTAINING PORT NUMBET AND
              MESSAGE TYPE.(THE MESSAGE TYPE HELPS DETERMINE SIZE OF MESSAGE
              SO AS TO AVOID PROCESSING EACH BYTE)
              5. CIRCUITS MAY BE
                5.1 TOTALLY INTERNAL
                5.2 ORIGINATING EXTERNALLY AND TERMINATING INTERNALLY
                5.3 ORIGINATING INTERNALLY AND TERMINATING EXTERNALLY
                5.4 CIRCUIT MAY ALSO JUST "PASS THRU" ISIS,LETTING THE SUPE
                HANDLE AS MUCH OF THE ROUTING AS POSSIBLE.
              6. EACH SLOT MAY REQUIRE A HARDWARE DRIVER ( ALL OF THESE DRIVERS
              ARE CONTROLLED BY THE KERNEL TO ADD SECURITY AND TO ELIMINATE
              THE NEED FOR SPECIALIZED KNOWLEDGE OF EACH HARDWARE DRIVER
              A SLOT USES. )
              7. SVC'S ARE THE MEANS FOR COMMUNICATING WITH THE KERNEL.
                 ( SUPERVISORY CALLS )

              - IRING AND ORING
                1. RING STRUCTURE
                   2 HALFWORDS FOR NFMI AND CEI
                   ( THIS IS THE HEADER FOR EACH MESSAGE )
                2. EACH MESSAGE MUST START ON A WORD BOUNDARY
                   - INSURES ITS HEADER REFERENCED W/O CONSIDRATION OF
                   RING FOLDING.
                3. MESSAGE TYPES HAVE THE FUNCTIONS:
                   3.1 CONTROL OF CIRCUITS'
                   3.2 DATA ON CIRCUITS
                   3.3 INTRA ISIS CONTROL
                4. RINGS ARE INDEPENDENT OF EACH OTHER
                5. IRING CONTAINS THE MESSAGE YOU RECEIVE FROM THE DISPATCHER,
                   AND ORING CONTAINS THE MESSAGE YOU SEND TO THE DISPATCHER.

              - INTRA ISIS COMMUNICATIONS
                   RPORT = 0
                   1. SOME MESSAGES CAN BE ENABLED/DISABLED IN CTA
                   2. THERE CAN BE 2 HOSTS OR MORE ON ONE SLOT,
                      WHEN A SLOT DOES 2 DIF. FUNCTIONS OR APPLICATIONS
                     (T2 - 256 CIRCUITS ON SLOT,
                      T1 - 64 CIRCUITS ON SLOT)
                   3. HOST # ARE IN DECIMAL
                   4. RH# WOULD BE 0 FOR T1 BECAUSE YOU CANNOT HAVE MORE THAN
                      1 HOST PER SLOT.
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Circuit Building                  Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  3         Lesson No.  LP123.442

_______________________________________________________________________________

   OBJECTIVES:
              TO FAMILIARIZE STUDENTS WITH THE PROCESS OF CIRCUIT 
              BUILDING IN ISIS.

   MATERIALS REQUIRED:
              ISIS-II REFERENCE MANUAL







































         COURSE NO.  TTE.442    LESSON NO.  LP123.442    PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              - THER ARE 2 TYPES OF CIRCUITS
                1. NORMAL CIRCUIT
                   SPECIFY USERNAME:OPTIONAL HOST #;PASSWORD
                2. AUX. CIRCUIT
                   REQUIRES NO PASSWORD, BUT THE MACHINE MUST HAVE AUX. 
                   CIRCUIT CAPABILITY

              - REQUEST TO ISIS SYSTEM TO BUILD A CIRCUIT: M.TYPE 07
                   THE SEQUENCES NECESSARY ARE:
                   1. YOU SEND M.TYPE 07
                   2. YOU RECEIVE     B2 (SUCCESS)
                                  OR  09 (FAILURE)
                   3. YOU SEND B3 (LOGON CHAR. STREAM APPROPRIATE TO 
                                   TYPE OF LOGON)
                   4. YOU RECEIVE B4 (RESPONSE)
                               OR B5 (FAILURE)
                   5. YOU RECEIVE B6 (SUCCESS)

              - ANY MESSAGES THAT COME INTO YOUR IRING THAT HAVE AN RPORT
                VALUE THAT IS THE SAME AS THE 00 NEEDLE RPORT VALUE WILL BE
                MESSAGES THAT PERTAIN TO THAT TERMINAL OR SLOT

              - CIRCUIT BUILDING
                ===> FROM THE SLOT TO DISPATCHER,
                     THRU THE NETWORK TO THE SUPE,
                     THRU THE NETWORK   TILL
                             IT REACHES THE TERMINATING END

              NOTE: CIRCUIT MUST TERMINATE AT A HOST.
                            ----
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Message Formats                  Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  4         Lesson No.  LP124.442

_______________________________________________________________________________

  OBJECTIVES:
              TO FAMILIARIZE THE STUDENTS WITH ISIS INTRA-NODE
              MESSAGE FORMAT AND ITS VARIATIONS

  MATERIALS REQUIRED:
              ISIS-II REFERENCE MANUAL






































         COURSE NO.  TTE.442     LESSON NO. LP124.442     PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              GENERAL FORMAT OF ISIS MESSAGE:-
                FOR EACH MESSAGE, THERE WILL BE A MESSAGE HEADER WITH THE 
              FOLLOWING FORMAT:
              ______________________________________________________
             |  RPORT | M. |     ADDITIONAL STRING DEPENDENT ON M.TYPE
             |        |TYPE|     
             |______________________________________________________

              RPORT (HALFWORD) :- RELATIVE PORT# FOR THIS PROCESS
                                  (THE PORT ASSIGNED TO THE CIRCUIT...
                                   USEFUL FOR SLOT TO BE ABLE TO TRACK A 
                                   PARTICULAR CIRCUIT)
                                  RPORT = 0 FOR INTRA-NODE COMM.
              M.TYPE( 1 BYTE ) :- MESSAGE TYPE
                               :- THE ADDITIONAL STRING WILL HAVE VARIABLE
                                  LENGTHS DEPENDENT ON THE TYPE OF THE 
                                  MESSAGE
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Message Types                     Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  5         Lesson No.  LP125.442

_______________________________________________________________________________

   OBJECTIVES :
              TO FAMILIARIZE STUDENTS WITH DIFFERENT TYPES OF ISIS
              MESSAGES.
              MAIN EMPHASIS IS ON :-
                   1. MESSAGES TO BRING UP A HOST IN A SLOT
                   2. HOW TO SEND SOME MESSAGES TO THE DISPATCHER,
                      IS. ZAP COMMAND,ETC.

    MATERIALS REQUIRED :
              ISIS-II REFERENCE MANUAL
              HANDOUT(ISIS-MESSAGE FORMATS,A SUMMARY)




























         COURSE NO.  TTE.442      LESSON NO. LP125.442    PAGE NO.

  REFERENCES  LESSON PLAN

_______________________________________________________________________________

              THERE ARE BASICALLY 2 TYPES OF MESSAGES:
              1. NON INTRA-ISIS MESSAGES
                 (IE. RPORT > 0 )
                 1.1  00    _____    ORIGINATES IN SLOT 0
                        ----->  NEEDLE
                        THIS IS WHEN THE DISPATCHER REQUESTS A NEW CIRCUIT
                        INTO THIS SLOT. THIS HAPPENS WHEN SOMEONE LOGS
                        INTO YOUR SLOT
                 1.2  01 - 9D  DATA TEXT STRING WITH VARIABLE LENGTHS
                 1.3  9E  ___ DETACH ( WHEN THE DISPATCHER RECEIVES 
                        AN ORANGE BALL , WILL ZAP)
                 1.4  9F  ___ DISCONNECT ( ZAP CIRCUIT )
                 1.5  A0  ___ TELLS THE DISPATCHER NOT TO ACCEPT ANY MORE
                              DATA FOR THIS CIRCUIT
                 1.6  A1  ___ RELEASE BACKPRESSURE
                 1.7  A2  ___ SENDS THE GOBBLER DOWN THE CIRCUIT, ANY DATA
                              IN THE CIRCUIT GETS EATEN
                 1.8  A3  ___ THROW AWAYB ALL THE DATA FROM THIS RPORT
                 1.9  A4  ___ DATA LOST COMING IN TO YOU (BLACK BALL)
                 1.10 A5  ___ DATA LOST (YOU SEND)
                              TYPICALLY BECAUSE SOMEBODY DIDN'T OBEY 
                              BACKPRESSURE
                              (USUALLY DATA GETS LOST IN THE BUFFER NOT IN RING)
                 1.11 A6  ___ DEM --> DEFFERED ECHOE MODE
                              NORMALLY, WHEN TYPING ON A TERMINAL(A FULL 
                              DUPLES) TELLS TO ECHOE ALL THE DATA FOLLOWING
                 1.12 A7  ___ LEAVE 'DEM'
                        |
                        |
                        |
                 1.13 AE  ___ 'BREAK' BEGINS
                              ---> SOMEBODY TYPES IN A BREAK KEY
                 1.14 AF  ___ HANG UP ON THIS PORT (MODEM)
                 1.15 B0  ___ 4 CHARS. QUERRY
                 1.16 B1  ___ 5 CHARS. MESSAGE, SETTING THE TERMINAL
                              (TERMINAL PARAMETER MESSAGES)
                        EX.      N     LENGTH
                            B1   7     1      ----> ASKING ABOUT PARITY OF
                                                    LENGTH 1
                 1.17 B2  ___ PSEUDO-NEEDLE (FROM SLOT 0)
                              A CIRCUIT IS BUILT TO SLOT 0
                 1.18 B3  ___ NORMAL LOGON CHARACTER (TO SLOT 0)
                              IF HIGHER BIT IS NOT SET,SUPE WILL IGNORE
                 1.19 B4  ___ NORMAL LOGON STATUS (FROM SLOT 0)
                 1.20 BC AND BD  ___ CONTROLLING THE PRINTERS
                 1.21 BE  ___ ZAP WITH A REASON : SENT BY SLOT
                          (REASON NOW IS '0', WHICH MEANS 
                            HOST IS OUT OF PORTS)
                 1.22 BF  ___ SIIX INFO. TRANSMISSION
                 NOTE :- ALL OF THESE ARE SPECIFICALLY FOR CERTAIN CIRCUITS
                         INDICATED BY RPORT
           2.  INTRA-ISIS MESSAGES
               RPORT = 0
                EACH MESSAGE HAS A HEADER WITH THE FORMAT
                ----------------------------------------------------------
               |     0  |SUB |  ADDITIONAL STRING DEPENDENT ON THE SUBTYPE
               |        |TYPE|
                ----------------------------------------------------------
                
                  2.1 02 ___ MESSAGE COMING IN TO YOU, ABOUT TAKE-OVER
                  2.2 03 ___ SENDS MESSAGE TO THE LOGGER
                  2.3 04 ___ REPORT HOST STATUS
                             THERE ARE ONLY 4 VALID STATUS
                             H.KEY IS USED IN CASE OF MULTIPLE NODES REPORTING 
                             SAME HOST
                  2.4 06 ___ TELLS HOST TIME (CONES FROM SUPE)
                             (GMT)
                  2.5 0B ___ HOST IS UNACCEPTED
                             ERR2
                             ---> HOST NO. SECURITY, SOME OTHER NODE HAS IT
                  2.6 0D ___ NO SUPE AT THE TIME, TAKE-DOWN
                  2.7 0E ___ '1-DOWN MESSAGE'
                             MESSAGE TO BE PRINTED OUT
                  2.8 0F ___ SLOT 0 TO DISPATCHER, DISPATCHER RESPONDS THIS.
                        





                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  : Circuit Building Messages          Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  6         Lesson No.  LP126.442

_______________________________________________________________________________

   OBJECTIVES:
              TO FAMILIARIZE STUDENTS WITH THE MESSAGES TO BUILD A CIRCUIT
            AND TO DIFFERENTIATE THESE FROM THE TERMINAL PARAMETER MESSAGES

   MATERIALS REQUIRED:
              ISIS-II REFERENCE MANUAL


























         COURSE NO.  TTE.442    LESSON NO. LP126.442    PAGE NO.

 REFERENCES   LESSON PLAN

_______________________________________________________________________________

              TO BUILD A NORMAL CIRCUIT FROM THE SLOT
              1. REQUEST FOR PSEUDO-NEEDLE ( TO SLOT 0)
               00 00    07    00    00 01    00 00    -- --    07
               RPORT  S.TYPE KEY   LOCAL KEY DIALECT  ORIG.HOST TID
               ( PUT INTO ORING )

              2. GETS PSEUDO-NEEDLE (RPORT WOULD BE ASSIGNED)
               00 F0    B2    00    00 01
               RPORT  M.TYPE  KEY  LOCAL KEY
              HAS BEEN
              ASSIGNED
               ( GET FROM IRING )

              3. LOGON CHARACTER ( TO SLOT 0)
               00 F0    B3    C1
               RPORT
               ( PUT IN ORING )

              4. RECEIVE THE LOGON STATUS (FROM SLOT 0)
               00 F0    B4    00
               ( GET FROM IRING )

              5. SUPE RESPONSES A NEEDLE
               00 F0    B6    00 00 00 00 00 00 00
                    (B6--> SUCCESSFUL LOGON)
               ( GET FROM IRING )
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Terminal Parameter Messages       Course No. TTE.442
   Week  :  1   Day  :  2  Period  :  7         Lesson No.  LP127.442

_______________________________________________________________________________

   OBJECTIVES:
             TO FAMILIARIZE STUDENTS WITH TYPES OF MESSAGES TO SEND TO
             THE TERMINAL FROM SLOTS

   MATERIALS REQUIRED:
             ISIS-II REFERENCE MANUAL

































         COURSE NO.  TTE.442   LESSON NO. LP127.442     PAGE NO.

  REFERENCES  LESSON PLAN

_______________________________________________________________________________

     P. 12    THE MESSAGE TYPE FOR THIS MESSAGE IS "B1"
              IT IS USED TO SET THE TERMINAL PARAMETER, USING THE 
              FOLLOWING FORMAT:
              -----------------------------------
              |    RPORT       |  B1    |    N  |
              -----------------------------------
              | VALUE  |
              ----------

              WHERE
              RPORT  (2 BYTES)  --> THE PORT NUMBER
              B1     (A BYTE)   --> MESSAGE TYPE
              N      (1 BYTE)   --> TERMINAL PARAMETER (4TH)
              VALUE  (1 BYTE)   --> 
              (DETAILS IN THE HANDOUT LIST)
                        ISIS SLOT PROGRAMMING
                                 Lesson Plan

   Course :ISIS Programming                    Date :
   Lesson : NAD Assembly Language              Course No. : TTE.442
   Week :  1     Day  :  3   Period  :  2      Lesson No. : LP132.442

_______________________________________________________________________________


   Objectives :
                   Provide a thorough understanding of NAD assembly
                   language, as to how, when and where to use NAD

   Materials required :
                   Tools & Utilities
                   ISIS-ii Reference Manual




































   Course No. TTE.442    Lesson Plan  LP132.442    Page No.
   References   Lesson Plan

_______________________________________________________________________________

               NAD
                -- Node Assembler and Debugger
                   ---> Is a progran used to assemble TYMFILES and
                   general software into Object files or Node 
                   Image Binary (NIB) files. The process prepares
                   the software for loading into the engine via
                   the LOADII program.
                   NAD is also used to load software directly for 
                   slots in nodes that are already in the network.
                   ---> The NAD program executes command files to
                   assemble the various pieces of software.
                   When assembling files:-
                        1) Put all the files together in a Command file
                           (CMD file)
                        2) Assemble each file individually

                   1. To invoke NAD
                      -R NAD
                      ----> It returns the current version number.
                            NAD gives no user prompts.
                      -%Q or esc-esc
                      ----> Is used to exit NAD
                   2. To assemble text
                      ;@ or ;A
                      ----> Is used to assemble a file
                      %@ or %A
                      ----> Is used to assemble a file with listing.
                            The listing will be in  File.lst
                      2.1 Input to the assembler comes from a file which
                          consists of engine instruction mnemonics or
                          NAD assembler directives.
                      2.2 Delimeters used to separate statements are :
                             A> carriage return (C/R)
                             B> semicolon (;)
		
		  3. Statements
		     -- a string of symbols,fields, and expressions that
		        end with a <CR> or ;
		        
		  4. Numbers
		       4.1 default is hex.
		       4.2 the first digit must be between 0 and 9
		           A000 ----> Nad will see this as a symbol
                           0A000----> a number
                       4.3 value of number depends on the radix
                             0  ---  normal hex radix
                             2  ---  binary
                             8  ---  octal
                             A  ---  decimal
                           ex. $A 130 ---->  decimal 130
                           
                   5. Symbols (labels)
                       5.1 a string of 1 to 6 alphanumeric and may
                           include embedded periods.
                           ex. timedown and timedown1 are the same.
                       5.2 first character must be a letter
                       5.3 "." symbol is an exception.
                           it means the current program counter.
                    
                   6. Computed symbols
                       6.1 The expression between two '|' embedded
                           in a symbol is evaluated, according to
                           the current radix.
                       6.2 The value of this expression replaces the
                           original expression.
                           ex.
                                Q    EQ   0
                                     RE   9
                            SYM|Q|   HS   1
                                Q    EQ   Q+1
                                     ER
                            These create the following halfword symbols
                                   SYM0
                                   SYM1
                                    |
                                    |
                                    |
                                   SYM8
                                   
                       7. Operators
                           7.1 no blanks between the operator and the value
                               they operate on.
                           7.2 the higher precedence (priority) operations
                               are performed before the lower precedence
                               operations.
                               'R'  stand for an expression
                               +R   (7) ---> value of R
                               -R   (7) ---> negative value of R
                               @R   (7) ---> one's complement of R
                               \R   (7) ---> used to determine if the label
                                             R has been defined
                                             - the value is 1 if defined
                                             - the value is 0 if not
                               L^R  (6) ---> shift R times left on positive
                                             & R times right on neg.
                               L*R  (5) ---> L times R
                               L+R  (4) ---> L plus R
                               L-R  (4) ---> L minus R
                               L&R  (1) --->L and R
                               L!R  (0) ---> L or R
                               L%R  (0) ---> L exor R
                                     ^
                                     |
                                     |____ lower no.s are evaluated last
                       
                       8.  General Statement Format
                       
                       Label   Opcode   Operands    :  Comment field
                            1.  Labels start in col. 1
                                a ':' in col. 1 indicates a comment stmt.
                                Actually, a ':' can be placed anywhere to 
                                indicate that the rest of the statement
                                is a comment.
                            2.  Opcode
                                -- anything after col. 1 that is a nonspace
                                character.
                                This field represents an operation code or
                                an assembler directive.
                            3.  Operands
                                -- follow the opcode field, separated by
                                one or more spaces.
                                The value of an operand is the value of
                                an expression.
                                3.1 ',' (commas) are the only delimeters
                                used to separate operand fields
                                3.2 radix
                                -- specified by $n, where 'n' can be
                                any hex. digit (to indicate the radix
                                chosen)
                                This special radix setter can be used more
                                then once in an expression.



                          ISIS SLOT PROGRAMMING
                                   Lesson Plan
   
   Course  :  ISIS Programming                      Date  :
   Lesson  :  NAD assembler Directives              Course No. TTE.442
   Week  :  1   Day  :  3  Period  :  3             Lesson No. LP133.442

_______________________________________________________________________________

   Objectives :
              Familiarize students with NAD assembly directives
              and their usage.

   Materials required :
              Tools & Utilities


















   Course No.  TTE.442   Lesson No.  LP133.442    Page No.
   
   References  Lesson Plan

_______________________________________________________________________________

   
               Directives
               ----------
               
               ----> The Opcode field may contain assembler directives
               1.  Symbol Control
                   1.1  Label      EQ       <Expression>
                        -->  The expression is evaluated & placed in
                        symbol table at that address.
                        (ie. equates the address of the label to expression)
                        
                   1.2             GL       Sym1,Sym2,Sym3,....,Symn
                        -->  Declares a list of variables (symbols) as
                        global symbols in list, and made available so that
                        another module may reference them.
                        Both modules must declare the symbol in their
                        global lists to be able to reference it.
                   
                   1.3             UN
                        --> Prints all undefined symbols toi the TTY
                   
                   1.4             KILL       S1,S2,....,Sn
                        -->  Removes all the symbols S1,S2,....,Sn
                        from the symbol table.
                        *** If you are going to define a MACRO,
                            kill it first before redefine it.

               2.  Storage Allocation
                   ----> Allows user to define & allocate storage
                   Label  --  optionally defined
                   Exp    --  is evaluated & storage allocated
                              starting at current PC '.'
                              (this indicated the no. of storage units)
                              
                   2.1  Label      BS      Exp
                        --->  defines byte storage
                        ex.
                        P          BS      12   :  2 bytes for 'P'
                        
                   2.2  Label      HS      Exp
                        --->  defines halfword storage
                        ex.
                        Q          HS      3    :  3 halfwords for 'Q'
                        
                   2.3  Label      WS      Exp
                        --->  defines fullword storage
                        ex.
                        R          WS      1    :  1 fullword for 'R'

               3. Data Allocation
                   ---->  allows user to specify actual data to be used
                          in core.
                          Label  --  optionally defined
                          Exp(s) --  values to be stored at that address
                          
                  3.1  Label      BC     Exp1,Exp2,....,Expn
                       -->  byte constant
                       ex.
                       PP         BC     150,200,123
                                          --  --  --
                       Note :  if low order bits exceed a byte,
                               it takes only the low order 8 bits.

                  3.2  Label      HC     Exp1,Exp2,....,Expn                   3.2  Label        
                       -->  halfword constant
                       ex.
                       QQ         HC     0FFFE,0A123,0012
                       
                  3.3  Label      WC     Exp1,Exp2,....,Expn
                       -->  word constant
                       ex.
                       RR         Wc     01234567,0F6897432
                       
                  3.4  Label      XC     hexstring
                       -->  starting at the next available byte,
                       the hex. string is stored from the left.
                       The first non hex. char. terminates.
                       
                  3.5  Label      AC     /Ascii string/
                       -->  starting at the next byte,
                       first char. at the current PC is stored.
                       ex.
                       Msg        AC     /Hello There "8d"8a/
                       ----> message followed by a <CR> and <LF>,
                       CR and LF are special characters, theymay be
                       inserted into the text by inserting a full quote
                       '"' before a 2 digit hex.
                       
                  3.6  Label      SC     /Host is up now "8d"8a/
                       -->  same as AC except that the byte count 
                       is inserted before the string.
                       ex.
                       Msg1       SC     /Host is up now "8d"8a/
                       What it does in memory:
                          (1) it puts in a byte of 00,
                              followed by the message, in hex.
                          (2) when incountering the '/', it
                              rewrites the 00 with the total no. of
                              character counts in the message.

               4.   Program Counter
                   ---->  The '.' (period) symbol is used as the lacation 
                   counter. (byte value in hex.)
                   4.1  Label    ORG   <Exp>
                        -- changes the program counter to an explicit
                        address,<Exp>
                        (only during assembly time)
                        In another word, ORG tells assembler where
                        to put something in core during assembly.
                        (set PC at an explicit address)
                        ex.
                        Start       ORG    10000
                                           |
                                           |
                                           ---> high order bit specifies
                                                segment in MAC

                    4.2  Label    BND    <Exp>
                        -- changes word boundary
                           forces the PC(.) to the next <exp>,word boundary
                                  BND    0-1  :  force to byte boundary
                                  BND    2    :  force to halfword
                                  BND    4    :  force to fullword 
                                  BND    8    :  force to double-word
                                  BND    10   :  force to quadword
                                  BND    100  :  forceto page
                                  BND    1000 :  force to segment
                                  
                         What happens is :-
                           NAD takes the value in BND, adds it to where 
                          you are, then ANDS off the two low order bits.
                          ( increments PC to the next boundary specified)

  p.87              4.3  Label    SEG    <exp>
 ISIS-II                 -- changes segments,allowing defferent parts           
                            to have their own segment (0-15d)
                            Note :
                            This is to set the PC to segment <exp>
                                 A.CODE  =  1
                                 A.DATA  =  0
                                 A.BUFF  =  2
                            Seg. tells which segment you are assembling on.

               5.  Modules
                   -- These directives allow the program to be broken 
                   into modules. And permits user to define a set of
                   symbols that only exist in that module.
                   (although the same symbols might be used in other
                   modules , as well)
                    5.1          MO     orgexp,Ascnam
                        -- delimits beginning of module referenced by
                        the name Ascnam.
                        Orgexp is usually defined as the current PC., 
                        this is to prevent you not to accidentally
                        write over other codes.   (Default is .MAIN )
                        There are 32 out of 36 modules available to user.
                        
                    5.2          EM                            
                        -- ends current module, the assembler types out
                        hex. value of origin MO, current  PC, & all
                        undefined symbols for the module ending.
                        ( at this time, assembler would go back to the
                        MAIN until another MO directive is encountered)
                        
                    5.3          LO     Ascnam                        
                        -- used when the user wants to reference symbols
                        in another module, the LO command makes them 
                        local to him.

                    5.4          FO     Ascnam
                        -- makes a list of symbols in module Ascnam
                        foreign to that module.
                        
                        Note :- LO & FO are generally used for
                                debugging purposes.
                                
                        Example :-
                        
                            MO    Sync   :  starting of the module Sync
                            GL    ....   :  if you need labels within module
                            EM           :  ending the module
                            
                            LO    Sync    :  localizes everything in Sync 
                            FO    Sync    :  get rid of local

               6. Assembly Time Comments
                  -- source files can be made to output remarks to
                  the controlling terminal at assembly time.

                   6.1          REMARK    %.....
                        -- prints text that follow the command
                        The % means print CR/LF on output
                        REMARK :- to print out text to the terminal
                        %      :- indicates that you wish to have
                                  CR/LF at the end of printing

                   6.2          NUMBER    <Exp>
                        -- evaluates the Exp. & prints it in the 
                        current radix.
                        You can also specify the radix desired.
                                NUMBER    $A  <Exp>
                        ex.
                                REMARK    %not enogh memory%needs
                                NUMBER    %A  Rnbrk - Nbrk
                                          (Rnbrk=required # of K,
                                           Nbrk =# of K now)
                                REMARK    K more%
                        As a result, on the terminal would print :-

                                not enough memory
                                needs ____ K more
                                (Note : (CES)Nibchk.Rem has good ex. on this)

               7.  Conditional Assembly
                   -- used to suppress or condense statements in the
                   source file.
                    7.1   IF  <Exp>  EI
                          IF  <Exp>   :  evaluates the Exp,
                          |           :  if true (>0),codes here
                          |           :  are assembled.
                          |           :  otherwise, skipped.
                          EI
                          
                    7.2   IF  <Exp>    ELSE         EI
                          IF  <Exp>   :  evaluates the Exp,
                          |           :  if true(>0),codes here assembled
                          |           :
                          ELSE
                          |           :  otherwise,codes here assembled
                          |
                          EI
                          
                    7.3   IF  <Exp1>....ELSE <Exp2>....EI
                          IF  <Exp1>  :  evaluates Exp1,
                          |           :  if true(>0),codes here get assembled.
                          |
                          ELSE <Exp2> :  otherwise,evaluates Exp2,
                          |           :  if true(>0),codes here get assembled.
                          |
                          EI          :  if none is true, skip all.
                          
                    7.4          RE    Count1
                                 |
                                 |
                                 ER    
                          -- define the beginning & end of a loop(block)
                          where Count1 is the number of times to repeat.
                          
                          Note :- 
                          1. if ER has a different value than RE,
                          ie. Count2 instead of Count1.
                          Then,Count1 is ignored.
                          2. the assembler will check ER first,
                          for a value;
                          if there is a value,the assembler executes
                          the codes between RE/ER until the value is false.
                          3. there is a 640 character limit between
                          RE/ER
                          
               8.  Other Directives
                    8.1  RA
                         -- is used to change the radix, the default is hex.
                         
                         ex.
                             RA    0    :  radix is hex. until respecified.
                             
                             RA   $a    :  the $ changes the radix, based on
                                           the value following the $.
                                           This is in effect until another
                                           RA is used.
                                           
                    8.2  END
                         -- stops assembly on the current line.




                                






                       ISIS SLOT PROGRAMMING
                                 Lesson Plan
                                 
   Course  :  ISIS Programming                   Date :
   Lesson  :  MACRO Facilities                   Course No. TTE.442
   Week  :  1   Day  :  3   Period  :  4         Lesson No. LP134.442
   
_______________________________________________________________________________

   Objectives :
           Familiarize students with the usage of MACROs:-
           those provided by the system and those that user defines.
           
   Materials required :
           Tools & Utilities























   Course No.   TTE.442   Lesson No. LP134.442    Page No.
   
   References  Lesson Plan

_______________________________________________________________________________

               Definition of a MACRO:-
                  The idea of a MACRO arises from the fact that there are
                 certain instruction sequences which are repeated
                 often.  The basic patterns of these sequences can be 
                 defined as MACROs, & the minor variations can be
                 accomplished by use of parameters to the
                 MACROs and by the conditional assembly feature.
                  In NAD, we have both the pre-defined MACROs,
                 as well as the user-defined MACROs.
                 
                 1. MACRO definition
                 
                 <name>   MACRO(<arg1>,<arg2>,...<argn>)[<text>]
                 
                 <name>  --->  name of this MACRO,
                               it follows the rule for NAD symbols.
                 <arg1>,<arg2>.....
                         --->  optional,
                               - must be surrounded by parentheses
                               - can have up to 16 arguments
                               - must be separated by commas.
                 <text>  --->   MACRO body              
                                has to start with a [ and end with a ]

                 2. Calling a MACRO
                    A MACRO call takes place when the following
                    statement appears.

                        <name>   (<arg1>,<arg2>,     <argn>)	
                        where :
                        <name>  -->  name of the already defined MACRO.
                        arguments --> symbols or constants from the 
                                      calling program.

                    example :-
                        LKNUM     EQ     0
                        TIILNK    MACRO(Neig,Ngrp,Ws,Typ,Speed)[

                 Nneig|Lknum|     EQ     $8  Neig
                 Nngro|Lknum|     EQ     $A  Ngrp  		
                   Nws|Lknum|     EQ     $A  Ws
                          IF      \Typ
                   Ntp|Lknum|     EQ     $A  Typ
                          EI
                          IF      \Speed
                   Nsp|Lknum|     AC     /Speed/
                   Lknum          EQ     Lknum+1
                                  KILL   Neig,Ngrp,Ws,Typ,Speed
                                     ]
               Note :  Labels used within MACRO should not be the same as in 
                     MACRO definition, else you will have a conflict.
             
             MACRO call :
                    TIILNK (2141,8,16,,MS)
             What happens is :-
                    Nneig0    EQ    $8 2141
                    Nngro0    EQ    $A 8
                      Nws0    EQ    $A 16
                      Nsp0    EQ    /MS/
                          
                        ISIS SLOT PROGRAMMING
                                 Lesson Plan
                                 
    Course  :  ISIS Programming                        Date :
    Lesson  :  lab exercise No. 1                      Course No.  TTE.442
    Week  :  1    Day  :  3    Period  :  5            Lesson No.  EP135.442

_______________________________________________________________________________

    Objectives :
                1.  To get students acquainted with ISIS Communications
                Process thru Dispatcher rings.
                2.  To make students practice on the use of engine
                instruction sets to be put together, and run in 
                an ISIS slot.
                3.  To introduce students to a few library packages & SVC's
                    3.1 Dismiss (SVC)
                    3.2 Geth
                    3.3 Flush,Ocs,Ocm,Elir

    Materials required :
           ISIS-II  Reference Manual
           Handout
    Course No. TTE.442   Lesson No. EP135.442     Page No.

_______________________________________________________________________________


    Lab One :
        
        The purpose of this lab exercise is to familiarize the student
    with the process of communicating with the ISIS Dispatcher rings.
    It will also acquaint the student with the use of NAD, ISIS libraries
    and establishing the memory conventions required in a slot.
    
    Write code for a slot that will bring a host up & answered.
    Allow one, and only one, circuit to be built to the host.
    Once the login is received, output a welcome message to the port
    that identifies your slot & host.
    After that, look at the data coming in for a 'P' or 'Q'.
    If it is a 'P', output the value of the slow clock (SLOWC).
    If it is a 'Q', send a logoff message to the port , then ZAP
    the circuit and look for a new login to repeat the process.

    The student may ignore backpressure, all data messages with
    a length greater than one, & the Ball logic or terminal
    characteristics.
    Remember not to 'hog' the CPU, DISMISS if possible.
                       ISIS SLOT PROGRAMMING
                              Leson Plan

  Course  :  ISIS Programming                       Date  :
  Lesson  :  Library Packages                       Course No. TTE.442
  Week  :  1   Day  :  4   Period  :  1             Lesson No. LP141.442
  
_______________________________________________________________________________

  Objectives :
         Introduce students to a few basic library packages and
         utility routines which are useful in writing codes
         for job slots.
             1. Start.Lib
             2. Finish.Lib
             3. Fring.Lib
             4. Outnum.Lib & Convrt.Lib

   Materials required :
         ISIS-II Reference Manual
         Handout
   Course No.  TTE.442   Lesson No.  LP141.442    Page No.
   
  References    Lesson Plan
  
_______________________________________________________________________________

                1.1  Required parameters to be defined
                -   Most library packages require certain parameters to be
                pre-defined.
                -   Standard ones to all interfaces :

                :  MMxxxx.T0n         name of this file, with n=slot number
                Maxhst     EQ     1    :  max. no. of hosts for this slot
                Maxprt     EQ    $A 32 :  max. no. of ports for this slot
                Ntout      EQ     5    :  no. of timeout list entries
                                       :  not required if not using 
                                       :  Timeout package
                Irsize     EQ    200   :  size of ISIS input ring, in bytes
                Orsize     EQ    200   :  size of ISIS output ring, in bytes
                Cntrl      EQ    1     :  first word of CTA area,
                                       :  controlling Dispatcher bits
                Maxchar    EQ    14    :  no. of chars. to input before break
                Echo       EQ     1    :  set up for Tymsat echo
                Engine     EQ    1     :  set to 1 if Tymnet engine
                
                THIS IS A SLOT TYMFILE.

                1.2    Start.Lib
                
                ---->  This is an essential file that MUST be assembled
                right after the slot Tymfile.
                ---->  1)  define 15d  locations
                           ex.  Fastc,Slowc,GMT,etc.
                       2)  define registers
                           ex.   R0  EQ  0
                                 R1  EQ  1
                                     |
                                     |
                                 R15 EQ  15
                       3)  define segments default if not defined by the
                           programmer.
                       4)  define SVC's
                       5)  define global symbols to be referenced by
                           all modules.

                1.3  Finish.Lib
                ---->  This file should always be assembled last.
                    (1) checks if any segments overflow
                    (2) sets up CTA tables
                    (3) tells memory requirements
                        and fives final sizes
                    (4) lists out all undefined symbols.

                1.4  Fring.Lib
                ---->  This file is the ISIS ring handlers.
                This package has the following constraints
                    R15 __  Output Ring Index
                    R14 __  Input Ring Index
                Remember that :-
                    1. once started, reg. 14 or 15 is dedicated
                to that operation. until it is 'ended'
                    2. if a new operation is started before the
                previous operation is 'ended', the previous 
                operation is aborted, and the appropriate
                ring is effectively left unchanged.

                     A. Utility Routines
                         -  link   R5
                         -  preserve R6-R14
                OCS    Output Canned String
                       R2  =  port #
                       R3  =  poiter to string (SC format)
                       OCS will output string as a data message to the 
                       specified port.
                       No interrupt for this operation.
                OCM    Output Canned Message
                       R2  =  port #
                       R3  =  pointer to string (SC format)
                       OCM will output the string as a message to the
                       specified port
                       No interrupt for this operation
                OBS    Output Byte String
                       R2  =  number of characters
                       R3  =  pointer to string
                       OBS will output specified string into the current 
                       message.
                       Note :- message must have already been 'started',
                       and is not 'ended'.

                B. Primitive Input Routines
                   ----> link on R4
                   ----> preserve R1-R3,R5-R13,R15:-
                   Look   determine if an input message exists...
                          normal return, if not
                          skip(4) if so....
                          R1 = port number
                          R2 = message type code (peek)
                          On skip return,condition codes are set 
                          such that JE will succeed on Port 0.
                          The port number will have been removed from
                          the message but the m.code will not.
                          
                   Getch  get a character, returned in R0
                   
                   Geth   get a halfword, returned in R0
                          An even number of bytes should have been removed
                          previously for expected results.
                          
                   Getw   get a word, returned in R0
                          An even number of halfwords should have been 
                          removed previously for expected results.
                          
                   Flush  flush away ("end") remainder of input message.                          
                          R0 is number of bytes remaining to flush. 
                          
                   Elir   End-Logical-Input-Record
                          "ends" current message,
                          sets up R15 for next message.

                C. Primitive Output Routines :
                   ----> link on R4
                   ----> preserve R1-R3,R5-R14,
                         unless used for arguments, or otherwise specified.
                         
                   Space  returns
                          R0 = no. of fharacters of space available
                          in output ring.
                          sets up R15 for "start" of message.
                          
                   Room   1) returns
                          R0 = no. of chars required for next message,
                          returns when that much room is available in 
                          output ring,
                          2) may DISMISS
                          3) sets up R15 for "start" of message
                          4) smashes R1
                   Slor   Start-Logical-Output-Record
                          1) R0 = no. of bytes required
                             R1 = port no.
                             R2 = message type code
                          2) provides function of Room,Puth,and Putch
                             for first 3 chars. of message.
                          3) may DISMISS
                          4) smashes R3

                   Putch  places char. in R0 in next position of ring
                   
                   Puth   places halfword in R0 in next position of ring.
                          Even number of bytes have been output previously in
                          this message.

                   Putw   places word in R0 in next position of ring.
                          Even number of halfwords should have been output
                          previously in this message.

                   Elodr  End Logical Output Data Record;
                          places byte count into message type to make data
                          message, then 'ends' message.
                          smashes R0,R1
                   
                   Elor   ENd Logical Output Record 
                          "ends" message


                1.5   Utility Routines
                    1.5.1 Outnum.Lib
                    --- to convert a binary number, according to any
                    radix R (1<R<17d),
                    placing the result into the specified user buffer.
                    (details on page 106)
                    
                    1.5.2 Convrt.Lib
                    --- to convert a binary number to either a decimal
                    or a hexadecimal.
                    R4  --  link
                    R9  --  binary number
                    R10 --  no. of digits to output
                    R11 --  pointer to output area
                    
                    Bindec  --  subroutine to concert a binary no. to
                                decimal (will zero fill)
                    Binhex  --  subroutine to convert a binary no. to
                                hexadecimal (won't zero fill)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  ISIS  DDT                         Course No. TTE.442
   Week  :  1   Day  :  4  Period  :  2         Lesson No. LP142.442

______________________________________________________________________________________

     Objectives :
          To familiarize the students with a useful tool to debug
     a NAD program running under ISIS in the slot.

     Materials required :
          1. ISIS-II Manual
          2. handout of a sample Tymfile with Goodguy List











   Course No.   TTE.442      Lesson No.   LP142.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                ISIS  DDT :
                ---------

                1. DDT is a  separate background job under ISIS, operating
                   in a slot. It is under the control of the kernel and
                   permits a user to log in to the Kernel and load or
                   examine the contents of a slot.
                   It also permits the user to change the contents of 
                   memory locations within the slot and perform various
                   special diagnostic operations.

                2. To log in :-
                   2.1  Thru the network, by directing the log-in to
                   that machine's host 0. (host no. of the kernel)
                   2.2  Using NAD
                   2.3  On site, using Tty.

                3. Licenses are needed to allow people to access DDT.

                4. Processes in using DDT :
                   4.1 The kernel has what is called a Good-Guy list,
                   used to verify the status of the username logging in.
                   If the user is valid, login may proceed, otherwise dropped.
                   4.2 when valid, slot assignment is checked;
                   if none, the kernel will ask for a slot no.
                   4.3 if the slot is available, the user is connected to DDT.

                5. Good-Guy List
                   - goes at the bottom of the Tymfile.
                     (defined by the Macro XGG)
                   - this is a list of usernames with their access licenses,
                     which permit access to certain special slots.
                   - every valid user has access to the normal "application"
                     slots (slot no. > 0)

                     Example of some access licenses:-
                       L.S0A --> license to log in to slot 0
                       L.SYA --> license to lot in to slot FF (the ISIS kernel)
                       L.SUA --> license to log in to slots associated with
                                 the Supe.(only matters when there is a Supe
                                 on this machine.)
                       L.S0P --> slot 0 patch access
                       L.SYR --> system read access (reading out of kernel)
                       L.SYP --> system (kernel) patch access
                       L.S0R --> slot 0 read only
                       L.P   --> normal patch access(permits patching a 
                                 running slot)
                       L.L   --> load slot
                       L.R   --> slot read
                       L.H   --> halt slot
                       L.DISC -> license to format a disc. for a slot

                        !  ---->  'OR' operation
                       -1  ---->  means 'all' slots accessibility




                      Example:
                      -------

                      ;c   username:xxx;
                                     |
                                     |
                                     ----> kernel host no. of the ISIS node

                      Note : in the case that we have here, for this class,
                             we have to get to an ISIS machine in the 
                             training network


                      ;c   techtrain:217;

                      WORKING
                      CIRCUIT READY
                      INTERLINK.............  TRAIN-NET
                      PLEASE LOG IN:    ::Techtrain:164;DND.TRAIN
                                        |
                                        |
                                        ---> accepts anything up to <CR>
                      NODE :  2040
                      HOST :  164
                      SLOT :  ;R03
                               |
                               |
                               --> relay mode puts you in hex.mode,
                                   anything nonhex. will terminate the mode.
                      *        --> from here, you can start giving commands


          *****  DDt allows only 1 person to attach to a slot at a time *****
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  NAD Debugger                      Course No. TTE.442
   Week  :  1   Day  :  4  Period  :  3         Lesson No.  LP143.442

_______________________________________________________________________________

   Objectives :
          To familiarize students with NAD debugger, & its set of commands
     used to manipulate the assembler.

   Materials required ::
          Tools & Utilities
          Handout on NAD commands



   Course No.   TTE.442      Lesson No.   LP143.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________
                
                NAD Debugger

                1. commands are used to the NAD system thru the Debugger.
                   For ex.,   ;x  is a Debugger command.
                2. the Debugger allows you to assemble different modules
                   into a single assembly & to examine the contents of
                   the assembly, as well as change values in the assembly.
                3. works with the file just assembled.
                4. allows to look at the core memory.
                5. allows to access DDT.


                <CR>   sets the current type-out mode to the standard
                       type-out mode , and sets the current radix to the
                       standard radix.

                Current Type-out mode                       
                       - is the form in which memory contents or addresses               
                       are displayed; it can be one of the following:-
                           (1)  magnitude
                           (2)  (signed) numeric
                           (3)  Ascii
                           (4)  Symbolic
                           (5)  Instruction
                       Different Type-out modes assist in understanding
                       the contents of a memory location or an address,
                       for example:
                            -  magnitude,numeric, or Ascii may be desired
                               whenlooking at a data location.
                            -  instruction mode would be desired when
                               looking at 'locations containing code'.


                 Command       Description
                 -------       -----------

                 <LF>          - causes consecutive reading of the memory.
                               - advances PC to PC + 2 (or 4, depending on
                               whether in halfword or fullword mode),
                               and displays memory from new PC, according
                               to the current Type-out mode.
                               This will change old memory if a value has been 
                               entered.

                 ;^            same as <LF>, except that it decrements PC.
                 
                 
                 address \     display contents of address in current t-o mode
                 
                 address [     display contents of address in magnitude t-o 
                               mode.
                               
                 address ]     display contents of address in instruction 
                               t-o mode.
                               
                               Note:
                               1. they all display memory from the contents of
                               the argument, if one argument is supplied.
                               2. if 2 arguments are supplied, it displays
                               the range.
                               3. if no arguments are supplied, then it 
                               displays the contents of the last value 
                               displayed.
                               4. ";\",";[", and ";]" commands will show
                               the contents of last valued displayed.

                 address_      displays the name of the symbol at address
                 
                 "             stores the Ascii in memory starting at the 
                               current Pc.
                               example:
                               10204]  SR R10,R12  "/text message/
                                                    |
                                                    |
                                                    --> will store the message
                                                    (in hex) at this memory.

                 :             allows defining a label in Debugger
                 
                               example:
                               10204]   SR    R10,R12    LOOP2:
                                                          |
                                                          |
                                                          -> will assign
                                                   the current PC to this label

                 %M            magnitude type-out mode       (default)
                               (unsigned numeric output___whatever the radix is)
                 %N            nemeric typout mode
                               (signed numeric output___
                                                         ^ for positive
                                                         - for negative)

                 %"            Ascii output

                 %S            Symbolic type-out mode
                               - displays label & offset.

                 %I            Instruction type-out mode
                  
                 ;M            - to set the next operation to be in a 
                               magnitude mode.
                               - to get back to default mode,just hit the
                               carriage return <CR>

                 ;N            - to set the next operation to be in a
                               numeric type-out mode

                 ;I            - to set to instruction type-out mode

                 ;S            - to set to symbolic type-out mode
 
                 ;"            - to set to Ascii type-out mode

                 %2            sets the standard halfwoed mode

                 %4            sets the standard fullword mode

                 ;2            - to set current halfword mode.
                               ex.
                                   2;2
                                   |
                                   |
                                   --> 2 halfwords per line
                                   
                                   10204\    0BAC   1234
                                   10208\
                                   
                 ;4            - to set current fullword mode
                 
                 ;%            sets the line and page lengths
                               1st argument__ 50<line length<145
                               2nd argument__  4<page length
                               Note :-
                               1. if only one arg. supplied,
                               it is for page length.
                               2. no arg. given, default is provided :-
                                  line length  =  120
                                  page length  =   56  lines
                               3. the arguments are evaluated in decimal.
                               
                 ;K symbol     deletes the symbol
                 
                 ;;            allows to enter comments
                               - everything up to a <CR> is a comment.
                          
                 %Q or esc-esc exits from NAD



                 NAD-DDT
                 (NAD translates the input before sending)
                 ;R  Binary Relay Mode(<CR> terminates it)
                 %R  Ascii Relay Mode (esc-esc terminates it)
                 :H  halts the NAD
                 ;E  executes the slot
                 
                 GO command can be replaced by C^G
                 
                 nice thing about using DDT thru NAD
                 :R Loop+2,4
                      |
                      |
                      --> instead of Hex. address, the symbol is used,
                          & is translated before sending.

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Slot Files                        Course No. TTE.442
   Week  :  1   Day  :  5  Period  :  1         Lesson No.  LP151.442

_______________________________________________________________________________

   Objectives :
        1.  To make  students acquainted with most of the files they will 
   be encountered with as slot files.
        2.  To have the students debug an assembled file.

   Materials required :
        1. Tymfile with CMD file
        2. Handout on Merlin,Loadii&R  NAD
   Course No.   TTE.442      Lesson No.   LP151.442       Page No.

   References   Lesson Plan
_________________________________________________________________________________
                  
                1.1  File naming conventiions
                     xxNNNN.zzz
                     where
                     xx    :   ND__current code to load
                               NW__new code to load
                               BK__old code to load
                               or  initials of the person assembling the code

                     NNNN  :   4 digit node number
                     
                     zzz   :
                           1) Tym - Tymfile for Kernel
                              Txx - 'T' indicates Tymfile & xx is the slot #
                           2) Assembly command files :-
                              CMD - command file for Kernel
                              Cxx - 'C' indicates command file & xx is slot #
                           3) Files using data compression
                              NIB - Binary Image file for Kernel
                              Nxx - 'N' indicates Binary Image file 
                                     &  xx is slot #
                           4) Other files
                              Sxx -  'S' indicates source file & xx is slot #
                              CRF -  Cross Reference file
                              LST -  Listing (as a result of % command)
                              PVC -  Tym file extension for Per. Virt. circuit
                           5) BND - Bound file from Merlin
                              DSC - Disc file used for Kernel in conjunction
                                    with Tymfile,CMD & NIB

                  1.2  Contents of Tymfile and other files
                       1.2.1  Tymfile
                          A)  Tymfiles are the files that contain the                   
                              description of the network configuration and
                              its interfaces. Each file contains statements
                              which are set according to the chosen config.
                              When a Tymfile has been completed, it will be 
                              assembled with the source and initialization 
                              files to provide the network software. Each 
                              node must have its own Tymfiles configured to
                              indicate its unique capabilities and interfaces.
                              *  Tymfiles for programs running in ISIS slots
                              will define the choices made for each of the
                              available options in these programs.
                          B)  it is recommended that a master copy of each 
                              basic type of Tymfile be maintained, as every
                              node in the network may be so unique that the 
                              user may forget all the available options or 
                              find it difficult to reconstruct a set of
                              preferred choices.
                          C)  Most of the ISIS initialization files are under
                              the SOURCE directory.
                           D) what has always been done with Tymfiles, is                                                          
                              that , we would read in an existing Tymfile 
                              applicable to our needs, & make changes as 
                              neccessary, before writing it into our own
                              named Tymfile.
                              (following the naming conventions)
                           E) Tymfile is basically a file that will be
                              processed by the NAD assembler and is
                              used to define a set of variables. These 
                              definitions are either in the form of
                              EQUATE statements or a MACRO call.
                              All programs (node code,slot code,ISIS kernel)
                              require Tymfiles to establish which options
                              are desired and what physical (or logical)
                              resources are available.
                              In this way, the user describes the physical 
                              config. of the Engine on which the code is
                              to run.

                         1.2.2 Command file (.CMD file)
                           A) designed to execute a series of NAD commands
                              to create a NIB file.
                           B) certain files must be specified in every 
                              command file for any product or job ;-
                              1.  initialization file(s)
                              2.   a Tymfile
                              3.  a source file
                              4. a NIB file
                           C) command files for assembling specific slots 
                               on a node have
                                  Css  instead of CMD file
                                  Tss  instead of Tym specified,
                                  and Nss instead of NIB specified,
                                  where ss =  slot number
                                  
                           D) explanation of CMD file
                              -  This is the command file for the Kernel
                              1.  ;; --> comment,  RLV --> initials
                              2.  initialization file for ISIS
                                  --> ISIS2 Version 5
                              3.  Node 2040 Tymfile
                                  --> this is a Parameter file for the kernel
                                  and slot 0
                              4.  Goodguy list
                                  --> this is normally included at the end
                                  of the Tymfile.
                              5.  actual Kernel source code
                              6.  a small source code telling ISIS that it 
                                  runs in T2 environments.
                              7.  IG file does some clean uopp work & print
                                  out the description & information of the
                                  machine.
                              8.    
                              ;F
                              ---> open a file for WRITE access,
                                  if no argument ahead, it will write into a 
                                  file.
                                  if there is an argument, ie. 1 in front,
                                  it means 'don't ask,fo ahead and write'.
                              TR2040.NIB
                              ---> this is a Node Image Binary (NIB) file.
                                  This is a file prepared for loading
                                  into the Engine via the LOADII program.
                              
                              9.
                              70;T
                              ---> defines a start-up address
                              0,CRCT;P
                              ---> ;P command says write the assembled code
                              to the opened file;
                              if no argument preceded, write everything.
                              if argument exists, start from 0 and go 
                              up to CRCT bytes.
                                Note :-
                                1. we could have written only CRCT;P
                                2. CRCT is usually 1000 hex bytes,
                                   and Crash Table starts here.
                              INTLEN,IEND-INTLEN;P
                              ---> another ;P command
                              where INTLEN is the address right after the
                              Crash table
                              %P
                              ---> write the symbols that have been defined 
                              into the file
                              Segf,Sfsize;P
                              ---> (optional)
                              The only segment that is not commonly used,
                              it contains the list of parameters(with legal
                              values). This gets stored in a file for 
                              MERLIN later to use to compare.
                              %Q
                              ---> exits NAD.
                              
                              1.2.3 Command file for slot 0 __ C00
                              ;@TR2040.Tym
                              ----> just for kernel & slot 0
                              ;x
                              ----> execute command file
                              (Source) TII104.WRT
                              ----> a command file ( with all the ;P 
                              statements for slot 0;
                              this is too complex t write out,
                              so use the WRT file instead)


                              

                        1.3   Example of a Tymfile
                        
                        Engine
                        --> always 1 now, because it is a Tymnet engine. 
                        
                        Micro
                        --> 0__ no enhancement (none of this exists any more)
                            1__ async. enhanced only ( 3 of those left)
                            2__ async. & sync. enhanced
                        --> this indicates the level of Microcode, not the
                            version no. (net dev writes the microcode)
                            
                        Zitel
                        --> 1__ Zitel Mac
                            ( Mac 2 card, which is an expansion
                              -  has segmentation
                              -  can run with semi conductor )
                              
                        Baudr
                        -->  max. baud rate that can be run on Async.)
                             0__ 1200 bauds (normal one)
                             1__ 2400 bauds
                             2__ 4800 bauds (2_if high speed interrupts)
                             
                        Nasync
                        -->  no. of async. groups
                             ( 2 groups on an async. card )
                             
                        N.ada
                        -->  indicates new or old style addressing
                             0__old __ starts at 91
                             1__new __ first async. address is C1
                             
                        Nprint
                        -->  no. of line printers
                        
                        Xsync
                        -->  no. of sync. card
                             0 __ having 1 (assumed)
                             1 aync. card has 16 lines.

                        Ndisc                             
                        --> no. of 10 megabyte drives (disc drives)
                        
                        Ntape
                        --> no. of tape drives
                        
                        Lboot
                        --> if it is 1, space in low core is reserved
                        for bootstrap.
                        when the boot comes up, the low core is already 
                        reserved (&not wiped out) to run the boot.
                        
                        Mscdsk
                        --> count of controllers for 300 megabyte disc. drives
                        
                        M.ncard
                        --> no. of SIO mother board in the machine.
                        if it is set > 1, must have other parameters specified
                            N.DAx  --->  device address of M.board,
                                         normally starts at 80
                            N.NPx  --->  how many daughter boards attached
                                         to this M.board.
                             
                    ISIS CONFIGURATION

                       Nslot   
                       ---->  no. of slots (excluding slot 0)
                       
                       Nlu
                       ---->  max. of logical units that can be attached to
                       any one slot
                       
                       Gghost
                       ---->  Macro call to list valid hosts,
                       max. of 8 hosts each time,
                       & can be called up to 8 times
                       ( 'cause max. port = 64 on the machine )
                       
                       Hlimit
                       ---->  first parameter for host no.
                              second parameter for   no. of circuits to be 
                              built allowed to this host.
                              third parameter for no. of messages per min.
                              on this host.
                              
                       Hstslt
                       ---->  limit host to slot
                       
                       Slimit
                       ---->  first parameter  =  slot no.
                              second parameter =   no. of circuits
                              third parameter  =  no. of messages per min.
                              on thishost.
                      NODE CONFIGURATION                    
                      
                      TII
                      ---->  1  for Tymnet II
                             0  for Tymnet I (only 350 in public net )
                             
                      Pthru
                      ---->  0  __  Passthru allowed
                             1  __  Passthru inhibited
                             --> this is to tell if circuits are allowed
                             to be built thru this node.
                             
                      Machnm
                      ---->  node no.  (in Octal)
                      
                      Hst0
                      ---->  kernel host no.  (in decimal)
                      
                      Nlines
                      ---->  no. of links allowed on a node in an ISIS
                      machine  (  link= comm. path between 2 nodes  )
                      
                      Asynew
                      ---->  types of drivers
                             0  __  only old style is allowed
                             1  __  both ola and new are allowed
                             2  __  new style
                             
                      Consat
                      ---->  can run Consat or not
                             1 for Consat in machine,modify new style driver.

                      R1down
                      ---->  1  __  enable parameter to be set to the slot,
                                    if not set, the machine will ignore.
                                    (however, in the slot tymfile,
                                    the cta has to be specified too)
                                    
                      Memrmk
                      ---->  1  __  to print out the size to be used 
                                    for node code.
                                    
                      Nxublk
                      ---->  no. of Xray user blocks.
                           ( Xray is a debugging tool of node code )
                           
                           
                      NETWORK CONFIGURATION
                      
                      TIIlnk
                      ---->  define valid link of the neughbour
                      example:
                            2001  -->  neighbour no.
                            8     -->  group of links
                            8     -->  window size
                            
                      Silins
                      ---->  no. of SIO lines that will be assigned to the 
                             node code
                             
                      Xlinks
                      ---->  wild card assignment(extra links__default ws=8)
                             this parameter is to allow the engine to
                             have more neighbours w/o predefining them
                             
                      S0core
                      ---->  160 K of core memory
                      
                      Nlus0
                      ---->  no. of logical units assigned to the slot.
                      
                      S0l0
                      ---->  Slot 0 logical unit 0
                      
                      S.Ref(0)
                      ---->is a Macro call , defining the  sync. line.
                           (0) id the physical line no. (in decimal)
                           
                      slot 1
                      Q.BG1
                      ---->  amount of max. ticks allowed for 
                             background
                             (default is 30d which is equal to 50 milliseconds)
                             
                             Quantum Background Time
                             10 ticks = 17 milliseconds of time for BG job
                             ( that is good for around 1200 instructions )
                             
                      Q.FG
                      ----> Quantum Foreground Time
                            Default :-
                            the way it is calculated :-
                               --->  2 + (NLUSx/3)
                                         (= 2 ticks )
                                     where NLUSx  is no. of logical units
                                     
                          A.Ref(0)
                          ---->  Async. froup __  16 ports are assigned
                          
                          S.Ref ()
                          ---->  Sync. lines
                          
                          P.Ref()
                          ---->  line printers
                          
                          M.Ref(M,P)
                          ---->  M __  Mother board no.
                                 P __  Port no. on the Mother board
                                 
                          Xgg
                          ---->   defining the MACRO
                          Inside the Macro, we call GG of the form :-
                          GG(license,access,name)
                          where
                             license   :  any combination
                                         ("!" is the logical OR function)
                             access    :  -1 if all accesses allowed;
                                          else a specified slot                             n
                             name      :  user name (up to 8 chars. long)
                      
                      1.3.4   DSC file                       
                              .DSc --->  parameter file for DISC and tape
                              
                              Disc and tape are done separately beacuse they
                              are Global (shared) units.
                              A GL unit can be assigned to multiple slots.
                              
                       Mxglu
                       ---->  max. no. of global units to allocate
                              =  20 in hex.
                              
                       SGU.Def(F1,F2,F3,F4,F5)
                       where
                       F1  :  global unit no. (hex)
                       F2  :  Mnemonic device type:
                              DK  =  disk  (10 mgb)
                              MT  =  mag.tape
                              MS  =  300 mgb disc drives
                       F3  :  device unit no. (drive no. )        
                       F4  :  area start cylinder (hex) __ for discs only
                       F5  :  area size (hex) - no. of cyl (discs only)
                              1 cyl  =  12,288 bytes (Ampex 10 MB disc)
                              1 cyl  =  12 decimal blocks with 1024 bytes/block
                       F6  :  the value "1" is used to denote the system devicej    
                              (Dk discs only __ only one area on disc may
                               be declared as sys. device )
                               
                       Global units are assigned to the slot, thru SGU.REF Macro
                       
                       SGU.REF(F1,F2,F3,F4)
                       where
                       F1  :  the no. of the slot to which the  assignment
                              is made (decimal)
                       F2  :  logical unit number being assigned (decimal)
                       F3  :  the no. of the Global Unit assigned (hex.)
                       F4  :  a list of mnemonics used to specify access
                              allowed to this usage ;-
                              RD  --  Read access allowed
                              WR  --  Write access allowed
                              AT  --  Attach access allowed
                              SS  --  Save license
                              
                              ex.
                              Xlu1   EQ   1
                              ---->  1 global unit assigned to slot 1
                              SGU.REF(1,0,2,SS+RD+WR+AT) 
                              -->  slot 1
                              -->  logical unit no. is 0
                              -->  area 2
                              -->  licenses are RD,WR,AT,and SS
                              
                              
                      NOTES
                      -----
                      
                      - Slot 0 is always designated for node code
                      - A slot Tymfile depends on the function of the slot,
                      for ex., slot used for Tymsat would have different 
                      parameters than slot used for Gateway or Tymcom.
                      *In a node that contains the Supe, the slots are used for:-
                      RAM, VAL,and may be with other functions needed for that
                      particular Supe.(Supe might also be a gateway)
                      Documents to be referenced:-
                          --  Sysgen
                          --  Tymsat Reference Manual
                          --  Tymcom Reference Manual
                          --  Node Code Reference Manual
                          --  Tom User's Guide

                      
                      
                       



                            
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Software Analysis                 Course No. TTE.442
   Week  :  1   Day  :  5  Period  :  2         Lesson No.  LP152.442

_______________________________________________________________________________

   Objectives :
        1. to enable the students to do crash analysis using software.
        2. show them different approaches of getting crash info.
        
   Materials required :
   Course No.   TTE.442      Lesson No.   LP152.442     Page No.

   References   Lesson Plan
_________________________________________________________________________________

                1. Run LOADII to get a dump file
                  - GO (netcon)Loadii
                  NODE LOADER VERSION-2.11
                  ENTER FUNCTION: c
                  DO YOU WANT A RELOAD:n
                  ENTER MANUAL RESTART ADDRESS(-1 IF NO RESTART): -1
                  THE MACHINE WILL BE LEFT AT ITS BOOT
                  ENTER NEIGHBOUR NUMBER:
                  ENTER LINE NUMBER:
                  ENTER DUMP OUTPUT FILE: ND____.DMP
                  BUILDING CIRCUIT
                  CIRCUIT BUILT
                  NODE    HAS ACKNOWLEDGED THE REQUEST
                  DUMPING
                  
                  
                  REFORMATTING DUMP DATA 
                  DUMP COMPLETE
                  
                  EXIT
                  
                  
                  ---> In order to list out the Dump file:
                  -r   nad
                  
                  ;x   (engdiag)engdmp
                  
                  %F   nd____.dmp  (control D)  
                  
                  
                  
                  ---> then,by using Engdmp.doc, you can proceed 
                  to do the analysis of the Crash Table.
                  
                  
                  
                  ---> In the case of the node being crashed,
                  and Dump file cannot be obtained:
                  looking at location 6c will give the address of the
                  beginning of the crash table.
                  Then, by using the front condole display, the contents of
                  the Crash Table can be obtained.
                  
                  
                  
                  
                  --->  To read in Nxx File thru NAD without re-assembling:
                  
                  r   nad
                  
                  %F    Filename      opens file (existing file)
                  ;G                  reads in code (does CR/LF for you )
                  
                  
                  
                  %G                  reads in symbol table
                  
                  (go on as normal)
                  
                  ;c      
                  
                  
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Library Packages                  Course No. TTE.442
   Week  :  1   Day  :  5  Period  :  3         Lesson No.  LP153.442

_______________________________________________________________________________

   Objectives  :
          To acquaint students with the brief overview of the
          following Library Packages:
          1. Timout.Lib
          2. Buffer.Lib
          3. Crash.Lib
          4. Front.Lib
          5. Frntnd.Lib
          
   Materials required :
         ISIS-II Manual
   Course No.   TTE.442      Lesson No.   LP153.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                1. Timout.Lib
                - This is a package containing the standard timeout routines.
                - Some parameters MUST be defined on entry:
                  1.1 NTOUT
                  ---> no. of timeout entries which may be active at any 
                  one time.
                  
                  1.2 IZT
                  ---> called at initialization,link on R0
                  
                  1.3 TIMOUT
                  ---> called periodically,link on R0
                  ---> will jump to any routines which should be serviced:
                       R0  =  routine address
                       R1  =  current fast-clock time
                       
                  1.4 TORET
                  ---> routines called by Timout should exit to here
                  
                  1.5 TOPUT
                  ---> any code may call this to place an entry on
                  timeout list
                  ---> link on R5, with R6-R15 preserved
                       R0  =  address to transfer to
                       R1  =  next time to call routine
                       
                  1.6 TOGET
                  ---> called to delete an entry already on timeout list
                  ---> link on R5, with R6-R15 preserved
                       R0 = routine address
                            entry with this address will be deleted
                            
                  1.7  TONOW
                  ---> called to flush an entry, &executs it NOW!
                  ---> link on R5____no registers preserved.
                       routine address in R0
                       
                       
                  NOTE:
                  ----
                      1. when a routine is called from timeout list, it is 
                      removed from list,&must call TOPUT to be called again.
                      2. TOGET & TONOW both do normal returns,
                      even if no entry is found.

                  2. Buffer.Lib                      
                  - this package contains all code &storage allocation needed
                  for bufferlet usage.
                  - bufferlet is a chained list, with pointer pointing to the
                  nest buffer.
                  Normally, when you get some data:-
                    FG is used to maintain the ring & store in bufferlets,
                  but so not process.
                    The Bg reads the bufferlets & processes them.
                    FG will actually do some echoing.
                    --> in passing data :-
                        BG will also put data in bufferlets,
                        and FG will get them & send them 
                  - uses routines in Timout.Lib -- requires one timeout
                  list entry, may JAL   R10,CRASH on certain conditions.
                  - each routine is called with :
                     link on R4
                     R0  =  argument
                     R1  =  buffer index (buffer number*2)
                     
                  - routines are :-
                     1.  IZBF
                     ----> link on R5, used to initialize buffers
                     2. GCI
                     ----> get a character from buffer
                     3.  WCI
                     ----> write a character into buffer
                     4.  WCD
                     ----> back up a buffer to restore last character
                     5.  EMPTY
                     ----> empty (flush) buffer
                     
                     6. zap a BFR in order to reserve tank up to 1/8
                     of total BFR storage.
                     
                 3. Crash.Lib
                 - this is a generalized crash package.
                 - handles both hardware & software crashes.
                    On any crash, the registers are saved in CRREG.
                    and CRSHCT is incremented.
                    1. software crashes occur via  JAL    R10,CRASH
                    CRASH  saves (R10) in CPOINT.
                    Software crashes may be 'good' or 'bad'.
                    If 'good', the calling sequence is :
                        JAL     R10,CRASH
                         HC     0         : this key distinguishes a good
                                          : crash from a bad one.
                         BC     4*L,Y     : first byte is 4*register
                                          : linked to routines,
                                          : Y is the reason.
                    then,register (L) is saved in CFROM                      
                    & Y is saved in CRASHC
                    2. hardware failure :
                       CPOINT contains the instruction address at the time
                       of failure,
                       CRASHC contains the failure reason,
                       & CFROM is set = -1
                       
                       * on completion of crash, transfers to label START,
                       defined in the user code.
                       
                       * entering  :RCRAT,4B in NAD will dump the  crash table..
                       
                 4. Front.Lib
                 - this package is used to service the ISIS input & output 
                 rings, & to activate user code whenever a break (user 
                 defined) is encountered.
                 - it activates user code when a user-processable (user 
                 defined) non-data message is encountered, if excessive
                 data is input without a break, or if a timeout occurs
                 for a port.
                 
                 - all ISIS special messages are placed in the buffer for 
                 port 0, & each breaks automacally.
                 - for non-text messages,
                 the escape convention applies only to the message type 
                 ...the body of the message is unescaped.
                 All such messages handled by the user cause a break.
                 5. Frntnd.Lib
                 - this package is an ISIS front end interface to Tymnet.
                 - it is used to service the ISIS input ring, & to
                 activate user defined routines whenever a message is found 
                 for a port & optionally for output service when output
                 requests are pending.
                 - it is designed to permit the activation routines to be 
                 defined on an individual port basis if desired.
                 - it is also designed so that context within a process 
                 can be indicated by dynamically changing to a different
                 set of activation routines.
                 
                 In brief :-
                 1. automatic handling the dispatcher
                 2. used for many circuits coming into a slot
                 3. causes automatic backpressure application
                 & release for a port based upon comparing number of
                 characters in input buffer & Maxchar
                 4. works with Bfflet Package
                 5. tears down needle
                 6. does all the dirty work

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Quiz & Review                     Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  1         Lesson No.  LP211.442

_______________________________________________________________________________
 
   Objectives :
                1. to reinforce students on the materials covered in the 
                first week.
                2. to reemphasize the importance of the following topics :
                         2.1  ISIS  internal comm. messages
                         2.2  concept of ISIS intercommunications,
                              mainly IRING & ORING
                         2.3  NAD-DDT
                         
   Materials required :
   Course No.   TTE.442      Lesson No.   LP211.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

     1.  Kernel is in slot
                   a.  0
                   b.  E
                   c.  F
                   d.  FF


     2.  Who handles all the hardware interrupts
                   a.  the Dispatcher
                   b.  IRING
                   c.  the Kernel
                   d.  the slot


     3.  Communication between slots in the same node is done thru :
                   a. the Dispatcher
                   b. the slots' own comm. links
                   c. the Kernel
                   d. segment  E


     4.  How many processes are there for each slot?
                   a. 1 process, ie. to run the slot job only (background)
                   b. 2 processes, ie. background and foreground
                   c. 3 processes, ie. background,foreground & DDT
                   d. none of the above


     5.  Data transferring to and from the dispatcher is done thru :
                   a. IRING in the slot, and ORING in the dispatcher
                   b. IRING &ORING in the slots
                   c. segment E & F of each slot
                   d. the Kernel


     6. Each ring descriptor (of IRING or ORING) has
                   a. both NFMI and CEI
                   b. only NFMI for IRING and only CEI for ORING
                   c. NFMI only
                   d. CEI only


     7.  Node code resides in
                   a. slot FF
                   b. slot 0
                   c. slot F
                   d. none of the above


     8.  ISIS Control Table is in
                   a. segment 0 
                   b. segment F
                   c. segment E
                   d. the Kernel


     9.  to repeat the status of a host from a slot, the first message
         to send is :
                   a. 0A
                   b. 01
                   c. 0C
                   d. 04
                   
                   
      10. Under ISIS, DDT is trated as
                   a. a background job, horse power of the processes
                   b. a foreground job
                   c. a separate background job, independent of the 
                      true background job
                   d. none of the above
                   
                   
         
                   

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  System's SVC's                    Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  2.        Lesson No. LP212.442

_______________________________________________________________________________

   Objectives  :
                 To introduce students to the Supervisory calls which
            would be used in the slot jobs.

   Materials required :
   Course No.   TTE.442      Lesson No.   LP212.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Supervisory calls :
                1. Kernel sets up an SVC table with starting address for 
                each SVC lookup in table as to where to begin
                2. whenver an interrupt occurs the PC and PSW are stored
                away. You get a new PSW & PC from table.
                3. you may get the results of hardware interrupts from
                some of these SVC's.
                
                ** System SVC's provide system functions, common to 
                many processes.
                
                
                -- Syscall            SVC   SYS<2>,Sysop
                - performs many operations for user
                - Sysop specifies operation to perform
                - if there is a parameter to be passed, it is passed in R0
                  (unless otherwise specified)
                - TRAP BLOCKS : Common form
                * if trap occurs, old PSW is stored at ADDR
                * R0 & R1 are saved at ADDR + 8 and ADDR + 0C
                * control is transferred to some crash routine at ADDR+010
                   In this event, special info. may be placed in R0 or R1,
                  depending on Trap condition

                1.  Restart Syscall    -    SVC   Sus,0
                    - used with own crash routine
                    - the Restart SVC causes all hardware and system traps
                      to be taken by the kernel and passed to the job,
                      rather than crashing the job
                      * Trap block adress is in R0,
                      a non-valid ADDR causes a non skip return (inst  
                      following SVC exec.),
                      valid ADDR causes skip return.
                      
                      
                Note :
                    1. to reenable Restart, user code should later execute
                    another Restart SVC,
                    ie. only good for 1 crash __  must reset.
                    If a 2nd trap occurs before the 2nd Restart SVC executes,
                    then the user program is removed from RUN queue permanently.
                    2. the crash/trap reason is in R1 
                    3. if either FG or BG crashes, they both get bumped off
                    4. the execution of a Restart Syscall will have the 
                    same effect on a running BG job as if that job had 
                    taken a system-detected crash; all Dispatcher circuits
                    will be disconnected, the FG will be halted,
                    host will be set down,
                    and the slot will be dismissed for 4 secs.




                2. Connect Foreground Syscall     SVC   Sys,1
                -- use if you want a process to run in foregraound
                -- must be called from the background.
                -- start ADDR of foreground code in R0,(first inst in FG),
                   if R0 = 0, the foreground is halted.
                   
                   
                3. Turn-on-Debug-mode  Syscall    SVC   Sys,2
                -- sets slot to debug mode
                -- can be executed from DDT,FG, or BG
                -- any crash (thru the kernel) will cause the slot to be 
                   frozen

                4. Turn-off-debug-mode Syscall      SVC    Sys,3
                -- subsequent crashes taken in normal fashion

                5. Test-debug-mode Syscall          SVC  Sys,4
                -- to test if the debug mode is on or not,
                   R0  =  0, if in debug mode
                   R0  =  0, if debug mode is not on.

                6. Freeze slot syscall            SVC   Sys,5
                -- causes BG &  F  to be frozen
                -- executable from DDT, FG or BG
                Note :                
                This freezes the slot & saves registers,
                use instead of Crash routine because it does not loop
                like the crash routine does.
                
                7. Thaw-slot Syscall              SVC   Sys,6
                -- turns off FREEZE__BG &FG will continue w/ execution
                -- can use in BG job when you detect a condition
                in your code that is not right.
                
                8. Test Freeze Syscall            SVC  Sys,7
                --  returns
                    R0  =  0, if the slot is frozen
                    R0  =  0,  if the slot is not.
                    
                9. Read-DDT-Register Syscall       SVC  Sys,8
                -- used to address one DDT register & put it in R0
                (explain Modulo)
                
                10. Read-DDT-PSD      Syscall      SVC  Sys,9
                   |
                   |
                   |
                   
                11. (27)  Set/Clear Alarm          SVC   Sys,26
                -- a timed interrupt : based on slots execution time that
                insures that a process will be trapped after a given 
                amount of time__ if it does not cancel the request.
                -- process loads a value into R0
                | ticks | trap address |
                |1/600  |   |   |      |
                * request is cancelled if R0  =  0
                * tick is the number of clock ticks to be taken 
                before trapping
                * Trap Address - the address of a trap block to be used 
                if that timeout occurs            ----------
                -- time specified is internal to your slot's time,not overall
                system
                -- either DISMISS SVC equals running out of time 
                &causes an exit to the trap control block.
                
                
                
                
                
                   
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  I/O Control SVC's                 Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  3         Lesson No.  LP213.442

_______________________________________________________________________________

   Objectives :
            To introduce the students to the SVC's used in controlling the
        hardware components connected to the ISIS machine.
   Materials required :
            ISIS manual
   Course No.   TTE.442      Lesson No.   LP213.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                I/O  Control SVC
                ----------------
                
                Form :
                                SVC   IO<3>,OP:reg#
              
                OP:reg is the operand telling what operation to perform
                - structure        1 byte,left nibble:right nibble
                - format example   
                                 SVC   IO,12
                                 where:
                                 SVC IO connects I/O to the job
                                 1  = operation to perform
                                 2  = register that you first argument
                                      will start at (in hex)

                Note :   unless otherwise specified


                   IO statue query              OP = 8000
                   - sed to find out the attributes connected with each
                   logical unit, what type of devices is specified for 
                   a LU, what is available to you
                   * Note :
                     Because of address range,you must use RX3 instruction
                     ex.
                          SVC    IO,8000,,
                          
                   - SVC loads specified buffer in user area with 
                   appropriate attributes for specified LU
                   - Normal return = failure
                    (may fail for invalid buffer address fo you slot only)
                   - skip return = successful query
                       __  at least 1 byte - the device type will be placed in 
                           buffer
                           * reg     -    LU#
                           * reg + 1 -    start address of buffer
                           * reg + 2 -    # of attribute bytes requested
                    Note;
                        1. ISIS will not wrap around to R0 for you, so be 
                        careful not to exceed reg. F
                        2. If # of bytes is greater than 1
                              first byte  =  device type
                              2nd byte  =  actual device number assigned to 
                              that device (physical)
                    example:
                                seg    2
                     attqry     BS     4
                                seg    1
                                LIS    R4,0
                             
                     repeat     LA     R5,attqry
                                LIS    R6,4
                                SVC    IO,8000,,
                                AIS    R4,1
                                J      repeat

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Synchronous Input control         Course No. TTE.442
   Week  :  2   Day  :  1  Period  :   4        Lesson No.

_______________________________________________________________________________
 
   Objectives :
              1. to provide part of the tools to be used for Lab 2
              2. to provide the Ring Structure for sync. I/O

   Materials required:
              ISIS-II Reference Manual
   Course No.   TTE.442      Lesson No.   Lp214.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Sync. I/O Control
                -----------------
                -- all I/O devices are initiated & ccontrolled by the Kernel
                -- use an SVC call to tell the kernel you are ready to 
                initiate an SVC I/O operation.
                
                
                Sync. Input control
                -------------------
                - input is via an input Ring buffer
                - you must have separate buffer for each sync. line that 
                you want to connect
                - Ring is always an even # of bytes
                - you tell slot where and how long the buffer is
                - the first halfword of the buffer will be used by the
                kernel as the next area to fill
                - the kernel updates the fill index
                - user must define & update an empty index
                - in your program:-
                    you will compare fill & empty index,
                    when they are different, you must read data.
                - the structure of the Ring
                   -----------------
                  |                 |
                  |  fill index     |
                  |-----------------|
                  |  the data area  |
                  |                 |
                  |                 |




                 Connect Sync. Input      op=  0
                 -------------------
                          SVC       IO,03
                          
                   reg #3    --->  contains the logical unit number
                   reg # +1  --->  the start address of the input buffer
                                   (points to fill index)
                   reg # +2  --->  the size of the input buffer                                   
                                   (bytes-not including Fill Index)
                                   
                  Note :-
                    This SVC overrides any input currently in progress, and,
                    if successful, initializes the buffer header
                    No way provided to disconnect sync. except may be used
                     SVC disconnect LU>

                   

                
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Synchronous Output Control        Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  5         Lesson No.  LP215.442

_______________________________________________________________________________

   Objectives  :
       1. to provide info. on the Sync. O/P SVC
       2. to acquaint students with the structure of the Rotor list,
          needed to be set up for Sync. Output Control

   Materials required :
          ISIS-II Reference Manual
   Course No.   TTE.442      Lesson No.   LP215.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Synchronous Output Control
                --------------------------
                - output is done with command rotor list
                - each entry is 8 bytes long (2 words)
                - format of a rotor entry:-
                
                 ---------------------------------
                |   command      |     count      |
                |---------------------------------|
                |    address of OUTPUT string     |  
                |                                 |
                 ---------------------------------
                 
                 example :
                 
                 1.
                 ---------------------------------
                |          1     |       200      |
                |---------------------------------|
                |             24000               |
                 ---------------------------------
                ----> starts at 24000(address), output 200 hex digits
                
                2.
                 ---------------------------------
                |          2     |                |
                |---------------------------------|
                |             22800               |
                 ---------------------------------
                 ----> transfers the control to address 22800
                 
                 3.
                 ---------------------------------
                |       5        | syn LU  6      |
                |---------------------------------|
                |             22400               |
                 ---------------------------------
                 ---->  starts address 22400 (with HS = 0),
                        sets the bit no. (according to the Sync LU) to 1
                        ex. here :- turns on bit 6 to 1
                        

                 -- to monitor the top of the rotor list__the command field__
                    when it goes to 0, change it to a 1 immediately.
                    
                 -- # 10d, Padding or Marking State (default value = all 1's)
                    you can change default for what is sent out when line is
                    not active.
                    
                    ----------------------------------
                   |                |                 |
                   |----------------------------------|
                   |                                  |
                   |----------------------------------|
                   |                |                 |
                   |----------------------------------|
                   |                                  |
                   |----------------------------------|
                   |                |                 |
                   |----------------------------------|
                   |                                  |
                    ----------------------------------
                                           |
                                           |---> where to find the next cmd.
                                             point to top of list to wrap 
                                             around.

                  Note :-
                  ----
                       when the kernel is done with data output command, 
                       he changes (resets) command field to 0 and goes to next.
                       if kernel gets a 0 command he stops and will only
                       start again after being issued another SVC.
                       
                       
                  Connect Synchronous Output       OP=1
                             SVC          IO,1R#
                             
                  - attempts to connect a list of output descriptors to
                  a logical unit
                    normal return --> failure, due to an invalid 
                                      specification, or to a LU 
                                      being active
                    skip return   --> output operation has started
                                  1. R# --> the LU number
                                  2. R#+1 --> address of the first output 
                                      descriptor.

                   note :-
                            connect will not disconnect a currently connected
                        LU (will fail if LU is already connected)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Connecting Foreground Process    Course No. TTE.442
   Week  :  2   Day  : 1   Period  :  6         Lesson No.  LP216.442

_______________________________________________________________________________

   Objectives:
            To enlighten students with the use of the SVC for
           foreground process, in preparation for Lab 2.
   Materials required:
            ISIS - II Reference Manual
   Course No.   TTE.442      Lesson No.   LP216.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                1. Connect Foreground Syscall     (p.33)  
                                  SVC       SYS,1
                   --> BACKGROUND job can control a FOREGROUND process
                   R0  --> address to start execution
                   if R0 = 0 means turn off FOREGROUND.
                   
                   
               2. I/O Attributes Query             (p.40)
               
                                   SVC           IO,12
                                   
                     1  is the OP value for sync. output
                     2  is the reg. #
                     
                     
                     
               Note:
                   1. slots execute in Register set 0F
                      kernel executes in Register set 0
                   2. DISMISS whenever possible,
                      communication between FG & BG must be thru memory.
                      
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Connect Sync. I/O                 Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  7         Lesson No.  EP217.442

_______________________________________________________________________________

    Objective :_
            To have students practice in using the SVC's for the slot
           job in connecting sync. line for a slot.
    Materials required :
           Handout on Lab 2
   Course No.   TTE.442      Lesson No.   LP             Page No.

   References   Lesson Plan
_________________________________________________________________________________




               Lab  2
               -------
               
               Bring up host & allow only 1 login  as in the previos lab.
               
               You will also connect a sync. line. It will be wired in
               loopback such that anything you output will be looped 
               back into your input.
               You will continuously output a 200 (hex) byte output
               buffer & you will count the zero bits you receive from
               the sync. input & continue to store this count from
               a circuit, output the zero bit count instead of 'slowc'.
               
               Handle everyting else as it was in the first lab.
               
               Method for counting zero bits.
                 read in your data 1 halfword at a time.
                 define:
                   define the # of 0 bits in each hex digit
                   NBITS    BC  4,3,3,2,3,2,2,1,3,2,2,1,2,1,1,0

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Async. Supervisory call          Course No. TTE.442
   Week  :  2   Day  :  2  Period  :  1         Lesson No.  LP221.442

_______________________________________________________________________________

   Objectives :
         To give students information about Asynchronous I/O.
         To acquaint students with the method of connecting Async. in ISIS

   Materials required :
   Course No.   TTE.442      Lesson No.   LP221.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Asynchronous I/O
                ----------------
                
                - Async. is allocated in groups (of 16)
                - Async. is driven by rings (very similar to IRING & ORING),
                  handled by the Kernel.
                - Ring array :
                   1. 16 port blocks, 1 block for each port.
                   2. each block contains 2 data rings, Input & Output.
                   ---> Input ring is for input TO the slot (from the port)
                        Output ring is for output FROM the slot (to the port)
                        






                   Input Ring Structure
                   --------------------

                  0               15
                  ----------------
                 |      BCT       |
                 |----------------|
                 |    unused      |
                 |----------------|
                 |  Fill  | Empty |
                 |----------------|
                 |                |
                 |    Data  area  |
                 |                |
                 |                |
                 |    N-6 bytes   |
                 |  ( N describes |
                 | the beginning  |
                 |  of the ring   |
                 | to the end of  |
                 |    the ring )  |
                 |                |
                 |                |
                  ----------------


               BCT  __  filled in by driver 
                        ( count of bytes in the ring )
                        -1 means the ring is empty.

              Fill  __  updated by the driver

              Empty __  update by the slot's user.
              





                Output Ring Structure
                ---------------------

                0               15
                -----------------
                |      BCT      |
                |---------------|
                |     TAM       |
                |---------------|
                |  Fill | Empty |
                |---------------|
                |               |
                |               |
                |    N-6 bytes  |
                |   of data     |
                |               |
                |               |
                -----------------
                
                BCT  __  no. of bytes stored in the ring
                         -1 meand the ring is empty.
                     __  we update this;
                         whenever we put data in the ring,
                         we have to update the BCT
                         
               TAM   __  a counter used for seeing haw many bytes
                         can be in the ring array before Backpressure is 
                         applied.
                         The driver does not use this, we do.



              Procedures to handle Output ring :-

                1. Filling in data
                2. Update BCT & Fill Index
                3. Add the values of BCT & TAM
                   ( TAM is initialixed to a negative number)
                   ( for 300   :-   -3,-4
                        1200   :-  -4
                        4800   :-  -8  )
                   If it is negative, keep on doing
                            positive, stop sticking data in the ring.

                  Note:
                       TAM bit array :-
                            0 bit - backpressure applied
                            1 bit - backpressure not applied
                         Tam stands for Trinsmitter Active Mask
                         it is the value of bits to be changed

                 To connect Async.
                         OP  =  12d    (new style)
                         
                         SVC         IO,0c0
                                          |
                                          |
                                          |--> R0 must be used,
                                          contains a ptr. to a descriptor in 
                                          memory.
                                          
                        ( detail of the Async. descriptor on p.45 )
                      1. high order bits (halfword) of w (the first word of
                         the descriptor) contains the ring size  n;
                         8 < n < 256
                      2. the input ring consists of 1 halfword of BCT counter,
                         1 unused halfword, 1 byte of Fill Index,
                         1 byte of Empty Index,
                         & n-6 of ring storage.
                      3. the ring is empty when BCT has the valus -1.



                                                                           

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Slot Files                        Course No. TTE.442
   Week  :  1   Day  :  5  Period  :  1         Lesson No.  LP151.442

_______________________________________________________________________________

   Objectives :
        1.  To make  students acquainted with most of the files they will 
   be encountered with as slot files.
        2.  To have the students debug an assembled file.

   Materials required :
        1. Tymfile with CMD file
        2. Handout on Merlin,Loadii&R  NAD
   Course No.   TTE.442      Lesson No.   LP151.442       Page No.

   References   Lesson Plan
_________________________________________________________________________________
                  
                1.1  File naming conventiions
                     xxNNNN.zzz
                     where
                     xx    :   ND__current code to load
                               NW__new code to load
                               BK__old code to load
                               or  initials of the person assembling the code

                     NNNN  :   4 digit node number
                     
                     zzz   :
                           1) Tym - Tymfile for Kernel
                              Txx - 'T' indicates Tymfile & xx is the slot #
                           2) Assembly command files :-
                              CMD - command file for Kernel
                              Cxx - 'C' indicates command file & xx is slot #
                           3) Files using data compression
                              NIB - Binary Image file for Kernel
                              Nxx - 'N' indicates Binary Image file 
                                     &  xx is slot #
                           4) Other files
                              Sxx -  'S' indicates source file & xx is slot #
                              CRF -  Cross Reference file
                              LST -  Listing (as a result of % command)
                              PVC -  Tym file extension for Per. Virt. circuit
                           5) BND - Bound file from Merlin
                              DSC - Disc file used for Kernel in conjunction
                                    with Tymfile,CMD & NIB

                  1.2  Contents of Tymfile and other files
                       1.2.1  Tymfile
                          A)  Tymfiles are the files that contain the                   
                              description of the network configuration and
                              its interfaces. Each file contains statements
                              which are set according to the chosen config.
                              When a Tymfile has been completed, it will be 
                              assembled with the source and initialization 
                              files to provide the network software. Each 
                              node must have its own Tymfiles configured to
                              indicate its unique capabilities and interfaces.
                              *  Tymfiles for programs running in ISIS slots
                              will define the choices made for each of the
                              available options in these programs.
                          B)  it is recommended that a master copy of each 
                              basic type of Tymfile be maintained, as every
                              node in the network may be so unique that the 
                              user may forget all the available options or 
                              find it difficult to reconstruct a set of
                              preferred choices.
                          C)  Most of the ISIS initialization files are under
                              the SOURCE directory.
                           D) what has always been done with Tymfiles, is                                                          
                              that , we would read in an existing Tymfile 
                              applicable to our needs, & make changes as 
                              neccessary, before writing it into our own
                              named Tymfile.
                              (following the naming conventions)
                           E) Tymfile is basically a file that will be
                              processed by the NAD assembler and is
                              used to define a set of variables. These 
                              definitions are either in the form of
                              EQUATE statements or a MACRO call.
                              All programs (node code,slot code,ISIS kernel)
                              require Tymfiles to establish which options
                              are desired and what physical (or logical)
                              resources are available.
                              In this way, the user describes the physical 
                              config. of the Engine on which the code is
                              to run.

                         1.2.2 Command file (.CMD file)
                           A) designed to execute a series of NAD commands
                              to create a NIB file.
                           B) certain files must be specified in every 
                              command file for any product or job ;-
                              1.  initialization file(s)
                              2.   a Tymfile
                              3.  a source file
                              4. a NIB file
                           C) command files for assembling specific slots 
                               on a node have
                                  Css  instead of CMD file
                                  Tss  instead of Tym specified,
                                  and Nss instead of NIB specified,
                                  where ss =  slot number
                                  
                           D) explanation of CMD file
                              -  This is the command file for the Kernel
                              1.  ;; --> comment,  RLV --> initials
                              2.  initialization file for ISIS
                                  --> ISIS2 Version 5
                              3.  Node 2040 Tymfile
                                  --> this is a Parameter file for the kernel
                                  and slot 0
                              4.  Goodguy list
                                  --> this is normally included at the end
                                  of the Tymfile.
                              5.  actual Kernel source code
                              6.  a small source code telling ISIS that it 
                                  runs in T2 environments.
                              7.  IG file does some clean uopp work & print
                                  out the description & information of the
                                  machine.
                              8.    
                              ;F
                              ---> open a file for WRITE access,
                                  if no argument ahead, it will write into a 
                                  file.
                                  if there is an argument, ie. 1 in front,
                                  it means 'don't ask,fo ahead and write'.
                              TR2040.NIB
                              ---> this is a Node Image Binary (NIB) file.
                                  This is a file prepared for loading
                                  into the Engine via the LOADII program.
                              
                              9.
                              70;T
                              ---> defines a start-up address
                              0,CRCT;P
                              ---> ;P command says write the assembled code
                              to the opened file;
                              if no argument preceded, write everything.
                              if argument exists, start from 0 and go 
                              up to CRCT bytes.
                                Note :-
                                1. we could have written only CRCT;P
                                2. CRCT is usually 1000 hex bytes,
                                   and Crash Table starts here.
                              INTLEN,IEND-INTLEN;P
                              ---> another ;P command
                              where INTLEN is the address right after the
                              Crash table
                              %P
                              ---> write the symbols that have been defined 
                              into the file
                              Segf,Sfsize;P
                              ---> (optional)
                              The only segment that is not commonly used,
                              it contains the list of parameters(with legal
                              values). This gets stored in a file for 
                              MERLIN later to use to compare.
                              %Q
                              ---> exits NAD.
                              
                              1.2.3 Command file for slot 0 __ C00
                              ;@TR2040.Tym
                              ----> just for kernel & slot 0
                              ;x
                              ----> execute command file
                              (Source) TII104.WRT
                              ----> a command file ( with all the ;P 
                              statements for slot 0;
                              this is too complex t write out,
                              so use the WRT file instead)


                              

                        1.3   Example of a Tymfile
                        
                        Engine
                        --> always 1 now, because it is a Tymnet engine. 
                        
                        Micro
                        --> 0__ no enhancement (none of this exists any more)
                            1__ async. enhanced only ( 3 of those left)
                            2__ async. & sync. enhanced
                        --> this indicates the level of Microcode, not the
                            version no. (net dev writes the microcode)
                            
                        Zitel
                        --> 1__ Zitel Mac
                            ( Mac 2 card, which is an expansion
                              -  has segmentation
                              -  can run with semi conductor )
                              
                        Baudr
                        -->  max. baud rate that can be run on Async.)
                             0__ 1200 bauds (normal one)
                             1__ 2400 bauds
                             2__ 4800 bauds (2_if high speed interrupts)
                             
                        Nasync
                        -->  no. of async. groups
                             ( 2 groups on an async. card )
                             
                        N.ada
                        -->  indicates new or old style addressing
                             0__old __ starts at 91
                             1__new __ first async. address is C1
                             
                        Nprint
                        -->  no. of line printers
                        
                        Xsync
                        -->  no. of sync. card
                             0 __ having 1 (assumed)
                             1 aync. card has 16 lines.

                        Ndisc                             
                        --> no. of 10 megabyte drives (disc drives)
                        
                        Ntape
                        --> no. of tape drives
                        
                        Lboot
                        --> if it is 1, space in low core is reserved
                        for bootstrap.
                        when the boot comes up, the low core is already 
                        reserved (&not wiped out) to run the boot.
                        
                        Mscdsk
                        --> count of controllers for 300 megabyte disc. drives
                        
                        M.ncard
                        --> no. of SIO mother board in the machine.
                        if it is set > 1, must have other parameters specified
                            N.DAx  --->  device address of M.board,
                                         normally starts at 80
                            N.NPx  --->  how many daughter boards attached
                                         to this M.board.
                             
                    ISIS CONFIGURATION

                       Nslot   
                       ---->  no. of slots (excluding slot 0)
                       
                       Nlu
                       ---->  max. of logical units that can be attached to
                       any one slot
                       
                       Gghost
                       ---->  Macro call to list valid hosts,
                       max. of 8 hosts each time,
                       & can be called up to 8 times
                       ( 'cause max. port = 64 on the machine )
                       
                       Hlimit
                       ---->  first parameter for host no.
                              second parameter for   no. of circuits to be 
                              built allowed to this host.
                              third parameter for no. of messages per min.
                              on this host.
                              
                       Hstslt
                       ---->  limit host to slot
                       
                       Slimit
                       ---->  first parameter  =  slot no.
                              second parameter =   no. of circuits
                              third parameter  =  no. of messages per min.
                              on thishost.
                      NODE CONFIGURATION                    
                      
                      TII
                      ---->  1  for Tymnet II
                             0  for Tymnet I (only 350 in public net )
                             
                      Pthru
                      ---->  0  __  Passthru allowed
                             1  __  Passthru inhibited
                             --> this is to tell if circuits are allowed
                             to be built thru this node.
                             
                      Machnm
                      ---->  node no.  (in Octal)
                      
                      Hst0
                      ---->  kernel host no.  (in decimal)
                      
                      Nlines
                      ---->  no. of links allowed on a node in an ISIS
                      machine  (  link= comm. path between 2 nodes  )
                      
                      Asynew
                      ---->  types of drivers
                             0  __  only old style is allowed
                             1  __  both ola and new are allowed
                             2  __  new style
                             
                      Consat
                      ---->  can run Consat or not
                             1 for Consat in machine,modify new style driver.

                      R1down
                      ---->  1  __  enable parameter to be set to the slot,
                                    if not set, the machine will ignore.
                                    (however, in the slot tymfile,
                                    the cta has to be specified too)
                                    
                      Memrmk
                      ---->  1  __  to print out the size to be used 
                                    for node code.
                                    
                      Nxublk
                      ---->  no. of Xray user blocks.
                           ( Xray is a debugging tool of node code )
                           
                           
                      NETWORK CONFIGURATION
                      
                      TIIlnk
                      ---->  define valid link of the neughbour
                      example:
                            2001  -->  neighbour no.
                            8     -->  group of links
                            8     -->  window size
                            
                      Silins
                      ---->  no. of SIO lines that will be assigned to the 
                             node code
                             
                      Xlinks
                      ---->  wild card assignment(extra links__default ws=8)
                             this parameter is to allow the engine to
                             have more neighbours w/o predefining them
                             
                      S0core
                      ---->  160 K of core memory
                      
                      Nlus0
                      ---->  no. of logical units assigned to the slot.
                      
                      S0l0
                      ---->  Slot 0 logical unit 0
                      
                      S.Ref(0)
                      ---->is a Macro call , defining the  sync. line.
                           (0) id the physical line no. (in decimal)
                           
                      slot 1
                      Q.BG1
                      ---->  amount of max. ticks allowed for 
                             background
                             (default is 30d which is equal to 50 milliseconds)
                             
                             Quantum Background Time
                             10 ticks = 17 milliseconds of time for BG job
                             ( that is good for around 1200 instructions )
                             
                      Q.FG
                      ----> Quantum Foreground Time
                            Default :-
                            the way it is calculated :-
                               --->  2 + (NLUSx/3)
                                         (= 2 ticks )
                                     where NLUSx  is no. of logical units
                                     
                          A.Ref(0)
                          ---->  Async. froup __  16 ports are assigned
                          
                          S.Ref ()
                          ---->  Sync. lines
                          
                          P.Ref()
                          ---->  line printers
                          
                          M.Ref(M,P)
                          ---->  M __  Mother board no.
                                 P __  Port no. on the Mother board
                                 
                          Xgg
                          ---->   defining the MACRO
                          Inside the Macro, we call GG of the form :-
                          GG(license,access,name)
                          where
                             license   :  any combination
                                         ("!" is the logical OR function)
                             access    :  -1 if all accesses allowed;
                                          else a specified slot                             n
                             name      :  user name (up to 8 chars. long)
                      
                      1.3.4   DSC file                       
                              .DSc --->  parameter file for DISC and tape
                              
                              Disc and tape are done separately beacuse they
                              are Global (shared) units.
                              A GL unit can be assigned to multiple slots.
                              
                       Mxglu
                       ---->  max. no. of global units to allocate
                              =  20 in hex.
                              
                       SGU.Def(F1,F2,F3,F4,F5)
                       where
                       F1  :  global unit no. (hex)
                       F2  :  Mnemonic device type:
                              DK  =  disk  (10 mgb)
                              MT  =  mag.tape
                              MS  =  300 mgb disc drives
                       F3  :  device unit no. (drive no. )        
                       F4  :  area start cylinder (hex) __ for discs only
                       F5  :  area size (hex) - no. of cyl (discs only)
                              1 cyl  =  12,288 bytes (Ampex 10 MB disc)
                              1 cyl  =  12 decimal blocks with 1024 bytes/block
                       F6  :  the value "1" is used to denote the system devicej    
                              (Dk discs only __ only one area on disc may
                               be declared as sys. device )
                               
                       Global units are assigned to the slot, thru SGU.REF Macro
                       
                       SGU.REF(F1,F2,F3,F4)
                       where
                       F1  :  the no. of the slot to which the  assignment
                              is made (decimal)
                       F2  :  logical unit number being assigned (decimal)
                       F3  :  the no. of the Global Unit assigned (hex.)
                       F4  :  a list of mnemonics used to specify access
                              allowed to this usage ;-
                              RD  --  Read access allowed
                              WR  --  Write access allowed
                              AT  --  Attach access allowed
                              SS  --  Save license
                              
                              ex.
                              Xlu1   EQ   1
                              ---->  1 global unit assigned to slot 1
                              SGU.REF(1,0,2,SS+RD+WR+AT) 
                              -->  slot 1
                              -->  logical unit no. is 0
                              -->  area 2
                              -->  licenses are RD,WR,AT,and SS
                              
                              
                      NOTES
                      -----
                      
                      - Slot 0 is always designated for node code
                      - A slot Tymfile depends on the function of the slot,
                      for ex., slot used for Tymsat would have different 
                      parameters than slot used for Gateway or Tymcom.
                      *In a node that contains the Supe, the slots are used for:-
                      RAM, VAL,and may be with other functions needed for that
                      particular Supe.(Supe might also be a gateway)
                      Documents to be referenced:-
                          --  Sysgen
                          --  Tymsat Reference Manual
                          --  Tymcom Reference Manual
                          --  Node Code Reference Manual
                          --  Tom User's Guide

                      
                      
                       



                            
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Software Analysis                 Course No. TTE.442
   Week  :  1   Day  :  5  Period  :  2         Lesson No.  LP152.442

_______________________________________________________________________________

   Objectives :
        1. to enable the students to do crash analysis using software.
        2. show them different approaches of getting crash info.
        
   Materials required :
   Course No.   TTE.442      Lesson No.   LP152.442     Page No.

   References   Lesson Plan
_________________________________________________________________________________

                1. Run LOADII to get a dump file
                  - GO (netcon)Loadii
                  NODE LOADER VERSION-2.11
                  ENTER FUNCTION: c
                  DO YOU WANT A RELOAD:n
                  ENTER MANUAL RESTART ADDRESS(-1 IF NO RESTART): -1
                  THE MACHINE WILL BE LEFT AT ITS BOOT
                  ENTER NEIGHBOUR NUMBER:
                  ENTER LINE NUMBER:
                  ENTER DUMP OUTPUT FILE: ND____.DMP
                  BUILDING CIRCUIT
                  CIRCUIT BUILT
                  NODE    HAS ACKNOWLEDGED THE REQUEST
                  DUMPING
                  
                  
                  REFORMATTING DUMP DATA 
                  DUMP COMPLETE
                  
                  EXIT
                  
                  
                  ---> In order to list out the Dump file:
                  -r   nad
                  
                  ;x   (engdiag)engdmp
                  
                  %F   nd____.dmp  (control D)  
                  
                  
                  
                  ---> then,by using Engdmp.doc, you can proceed 
                  to do the analysis of the Crash Table.
                  
                  
                  
                  ---> In the case of the node being crashed,
                  and Dump file cannot be obtained:
                  looking at location 6c will give the address of the
                  beginning of the crash table.
                  Then, by using the front condole display, the contents of
                  the Crash Table can be obtained.
                  
                  
                  
                  
                  --->  To read in Nxx File thru NAD without re-assembling:
                  
                  r   nad
                  
                  %F    Filename      opens file (existing file)
                  ;G                  reads in code (does CR/LF for you )
                  
                  
                  
                  %G                  reads in symbol table
                  
                  (go on as normal)
                  
                  ;c      
                  
                  
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Library Packages                  Course No. TTE.442
   Week  :  1   Day  :  5  Period  :  3         Lesson No.  LP153.442

_______________________________________________________________________________

   Objectives  :
          To acquaint students with the brief overview of the
          following Library Packages:
          1. Timout.Lib
          2. Buffer.Lib
          3. Crash.Lib
          4. Front.Lib
          5. Frntnd.Lib
          
   Materials required :
         ISIS-II Manual
   Course No.   TTE.442      Lesson No.   LP153.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                1. Timout.Lib
                - This is a package containing the standard timeout routines.
                - Some parameters MUST be defined on entry:
                  1.1 NTOUT
                  ---> no. of timeout entries which may be active at any 
                  one time.
                  
                  1.2 IZT
                  ---> called at initialization,link on R0
                  
                  1.3 TIMOUT
                  ---> called periodically,link on R0
                  ---> will jump to any routines which should be serviced:
                       R0  =  routine address
                       R1  =  current fast-clock time
                       
                  1.4 TORET
                  ---> routines called by Timout should exit to here
                  
                  1.5 TOPUT
                  ---> any code may call this to place an entry on
                  timeout list
                  ---> link on R5, with R6-R15 preserved
                       R0  =  address to transfer to
                       R1  =  next time to call routine
                       
                  1.6 TOGET
                  ---> called to delete an entry already on timeout list
                  ---> link on R5, with R6-R15 preserved
                       R0 = routine address
                            entry with this address will be deleted
                            
                  1.7  TONOW
                  ---> called to flush an entry, &executs it NOW!
                  ---> link on R5____no registers preserved.
                       routine address in R0
                       
                       
                  NOTE:
                  ----
                      1. when a routine is called from timeout list, it is 
                      removed from list,&must call TOPUT to be called again.
                      2. TOGET & TONOW both do normal returns,
                      even if no entry is found.

                  2. Buffer.Lib                      
                  - this package contains all code &storage allocation needed
                  for bufferlet usage.
                  - bufferlet is a chained list, with pointer pointing to the
                  nest buffer.
                  Normally, when you get some data:-
                    FG is used to maintain the ring & store in bufferlets,
                  but so not process.
                    The Bg reads the bufferlets & processes them.
                    FG will actually do some echoing.
                    --> in passing data :-
                        BG will also put data in bufferlets,
                        and FG will get them & send them 
                  - uses routines in Timout.Lib -- requires one timeout
                  list entry, may JAL   R10,CRASH on certain conditions.
                  - each routine is called with :
                     link on R4
                     R0  =  argument
                     R1  =  buffer index (buffer number*2)
                     
                  - routines are :-
                     1.  IZBF
                     ----> link on R5, used to initialize buffers
                     2. GCI
                     ----> get a character from buffer
                     3.  WCI
                     ----> write a character into buffer
                     4.  WCD
                     ----> back up a buffer to restore last character
                     5.  EMPTY
                     ----> empty (flush) buffer
                     
                     6. zap a BFR in order to reserve tank up to 1/8
                     of total BFR storage.
                     
                 3. Crash.Lib
                 - this is a generalized crash package.
                 - handles both hardware & software crashes.
                    On any crash, the registers are saved in CRREG.
                    and CRSHCT is incremented.
                    1. software crashes occur via  JAL    R10,CRASH
                    CRASH  saves (R10) in CPOINT.
                    Software crashes may be 'good' or 'bad'.
                    If 'good', the calling sequence is :
                        JAL     R10,CRASH
                         HC     0         : this key distinguishes a good
                                          : crash from a bad one.
                         BC     4*L,Y     : first byte is 4*register
                                          : linked to routines,
                                          : Y is the reason.
                    then,register (L) is saved in CFROM                      
                    & Y is saved in CRASHC
                    2. hardware failure :
                       CPOINT contains the instruction address at the time
                       of failure,
                       CRASHC contains the failure reason,
                       & CFROM is set = -1
                       
                       * on completion of crash, transfers to label START,
                       defined in the user code.
                       
                       * entering  :RCRAT,4B in NAD will dump the  crash table..
                       
                 4. Front.Lib
                 - this package is used to service the ISIS input & output 
                 rings, & to activate user code whenever a break (user 
                 defined) is encountered.
                 - it activates user code when a user-processable (user 
                 defined) non-data message is encountered, if excessive
                 data is input without a break, or if a timeout occurs
                 for a port.
                 
                 - all ISIS special messages are placed in the buffer for 
                 port 0, & each breaks automacally.
                 - for non-text messages,
                 the escape convention applies only to the message type 
                 ...the body of the message is unescaped.
                 All such messages handled by the user cause a break.
                 5. Frntnd.Lib
                 - this package is an ISIS front end interface to Tymnet.
                 - it is used to service the ISIS input ring, & to
                 activate user defined routines whenever a message is found 
                 for a port & optionally for output service when output
                 requests are pending.
                 - it is designed to permit the activation routines to be 
                 defined on an individual port basis if desired.
                 - it is also designed so that context within a process 
                 can be indicated by dynamically changing to a different
                 set of activation routines.
                 
                 In brief :-
                 1. automatic handling the dispatcher
                 2. used for many circuits coming into a slot
                 3. causes automatic backpressure application
                 & release for a port based upon comparing number of
                 characters in input buffer & Maxchar
                 4. works with Bfflet Package
                 5. tears down needle
                 6. does all the dirty work

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Quiz & Review                     Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  1         Lesson No.  LP211.442

_______________________________________________________________________________
 
   Objectives :
                1. to reinforce students on the materials covered in the 
                first week.
                2. to reemphasize the importance of the following topics :
                         2.1  ISIS  internal comm. messages
                         2.2  concept of ISIS intercommunications,
                              mainly IRING & ORING
                         2.3  NAD-DDT
                         
   Materials required :
   Course No.   TTE.442      Lesson No.   LP211.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

     1.  Kernel is in slot
                   a.  0
                   b.  E
                   c.  F
                   d.  FF


     2.  Who handles all the hardware interrupts
                   a.  the Dispatcher
                   b.  IRING
                   c.  the Kernel
                   d.  the slot


     3.  Communication between slots in the same node is done thru :
                   a. the Dispatcher
                   b. the slots' own comm. links
                   c. the Kernel
                   d. segment  E


     4.  How many processes are there for each slot?
                   a. 1 process, ie. to run the slot job only (background)
                   b. 2 processes, ie. background and foreground
                   c. 3 processes, ie. background,foreground & DDT
                   d. none of the above


     5.  Data transferring to and from the dispatcher is done thru :
                   a. IRING in the slot, and ORING in the dispatcher
                   b. IRING &ORING in the slots
                   c. segment E & F of each slot
                   d. the Kernel


     6. Each ring descriptor (of IRING or ORING) has
                   a. both NFMI and CEI
                   b. only NFMI for IRING and only CEI for ORING
                   c. NFMI only
                   d. CEI only


     7.  Node code resides in
                   a. slot FF
                   b. slot 0
                   c. slot F
                   d. none of the above


     8.  ISIS Control Table is in
                   a. segment 0 
                   b. segment F
                   c. segment E
                   d. the Kernel


     9.  to repeat the status of a host from a slot, the first message
         to send is :
                   a. 0A
                   b. 01
                   c. 0C
                   d. 04
                   
                   
      10. Under ISIS, DDT is trated as
                   a. a background job, horse power of the processes
                   b. a foreground job
                   c. a separate background job, independent of the 
                      true background job
                   d. none of the above
                   
                   
         
                   

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  System's SVC's                    Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  2.        Lesson No. LP212.442

_______________________________________________________________________________

   Objectives  :
                 To introduce students to the Supervisory calls which
            would be used in the slot jobs.

   Materials required :
   Course No.   TTE.442      Lesson No.   LP212.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Supervisory calls :
                1. Kernel sets up an SVC table with starting address for 
                each SVC lookup in table as to where to begin
                2. whenver an interrupt occurs the PC and PSW are stored
                away. You get a new PSW & PC from table.
                3. you may get the results of hardware interrupts from
                some of these SVC's.
                
                ** System SVC's provide system functions, common to 
                many processes.
                
                
                -- Syscall            SVC   SYS<2>,Sysop
                - performs many operations for user
                - Sysop specifies operation to perform
                - if there is a parameter to be passed, it is passed in R0
                  (unless otherwise specified)
                - TRAP BLOCKS : Common form
                * if trap occurs, old PSW is stored at ADDR
                * R0 & R1 are saved at ADDR + 8 and ADDR + 0C
                * control is transferred to some crash routine at ADDR+010
                   In this event, special info. may be placed in R0 or R1,
                  depending on Trap condition

                1.  Restart Syscall    -    SVC   Sus,0
                    - used with own crash routine
                    - the Restart SVC causes all hardware and system traps
                      to be taken by the kernel and passed to the job,
                      rather than crashing the job
                      * Trap block adress is in R0,
                      a non-valid ADDR causes a non skip return (inst  
                      following SVC exec.),
                      valid ADDR causes skip return.
                      
                      
                Note :
                    1. to reenable Restart, user code should later execute
                    another Restart SVC,
                    ie. only good for 1 crash __  must reset.
                    If a 2nd trap occurs before the 2nd Restart SVC executes,
                    then the user program is removed from RUN queue permanently.
                    2. the crash/trap reason is in R1 
                    3. if either FG or BG crashes, they both get bumped off
                    4. the execution of a Restart Syscall will have the 
                    same effect on a running BG job as if that job had 
                    taken a system-detected crash; all Dispatcher circuits
                    will be disconnected, the FG will be halted,
                    host will be set down,
                    and the slot will be dismissed for 4 secs.




                2. Connect Foreground Syscall     SVC   Sys,1
                -- use if you want a process to run in foregraound
                -- must be called from the background.
                -- start ADDR of foreground code in R0,(first inst in FG),
                   if R0 = 0, the foreground is halted.
                   
                   
                3. Turn-on-Debug-mode  Syscall    SVC   Sys,2
                -- sets slot to debug mode
                -- can be executed from DDT,FG, or BG
                -- any crash (thru the kernel) will cause the slot to be 
                   frozen

                4. Turn-off-debug-mode Syscall      SVC    Sys,3
                -- subsequent crashes taken in normal fashion

                5. Test-debug-mode Syscall          SVC  Sys,4
                -- to test if the debug mode is on or not,
                   R0  =  0, if in debug mode
                   R0  =  0, if debug mode is not on.

                6. Freeze slot syscall            SVC   Sys,5
                -- causes BG &  F  to be frozen
                -- executable from DDT, FG or BG
                Note :                
                This freezes the slot & saves registers,
                use instead of Crash routine because it does not loop
                like the crash routine does.
                
                7. Thaw-slot Syscall              SVC   Sys,6
                -- turns off FREEZE__BG &FG will continue w/ execution
                -- can use in BG job when you detect a condition
                in your code that is not right.
                
                8. Test Freeze Syscall            SVC  Sys,7
                --  returns
                    R0  =  0, if the slot is frozen
                    R0  =  0,  if the slot is not.
                    
                9. Read-DDT-Register Syscall       SVC  Sys,8
                -- used to address one DDT register & put it in R0
                (explain Modulo)
                
                10. Read-DDT-PSD      Syscall      SVC  Sys,9
                   |
                   |
                   |
                   
                11. (27)  Set/Clear Alarm          SVC   Sys,26
                -- a timed interrupt : based on slots execution time that
                insures that a process will be trapped after a given 
                amount of time__ if it does not cancel the request.
                -- process loads a value into R0
                | ticks | trap address |
                |1/600  |   |   |      |
                * request is cancelled if R0  =  0
                * tick is the number of clock ticks to be taken 
                before trapping
                * Trap Address - the address of a trap block to be used 
                if that timeout occurs            ----------
                -- time specified is internal to your slot's time,not overall
                system
                -- either DISMISS SVC equals running out of time 
                &causes an exit to the trap control block.
                
                
                
                
                
                   
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  I/O Control SVC's                 Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  3         Lesson No.  LP213.442

_______________________________________________________________________________

   Objectives :
            To introduce the students to the SVC's used in controlling the
        hardware components connected to the ISIS machine.
   Materials required :
            ISIS manual
   Course No.   TTE.442      Lesson No.   LP213.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                I/O  Control SVC
                ----------------
                
                Form :
                                SVC   IO<3>,OP:reg#
              
                OP:reg is the operand telling what operation to perform
                - structure        1 byte,left nibble:right nibble
                - format example   
                                 SVC   IO,12
                                 where:
                                 SVC IO connects I/O to the job
                                 1  = operation to perform
                                 2  = register that you first argument
                                      will start at (in hex)

                Note :   unless otherwise specified


                   IO statue query              OP = 8000
                   - sed to find out the attributes connected with each
                   logical unit, what type of devices is specified for 
                   a LU, what is available to you
                   * Note :
                     Because of address range,you must use RX3 instruction
                     ex.
                          SVC    IO,8000,,
                          
                   - SVC loads specified buffer in user area with 
                   appropriate attributes for specified LU
                   - Normal return = failure
                    (may fail for invalid buffer address fo you slot only)
                   - skip return = successful query
                       __  at least 1 byte - the device type will be placed in 
                           buffer
                           * reg     -    LU#
                           * reg + 1 -    start address of buffer
                           * reg + 2 -    # of attribute bytes requested
                    Note;
                        1. ISIS will not wrap around to R0 for you, so be 
                        careful not to exceed reg. F
                        2. If # of bytes is greater than 1
                              first byte  =  device type
                              2nd byte  =  actual device number assigned to 
                              that device (physical)
                    example:
                                seg    2
                     attqry     BS     4
                                seg    1
                                LIS    R4,0
                             
                     repeat     LA     R5,attqry
                                LIS    R6,4
                                SVC    IO,8000,,
                                AIS    R4,1
                                J      repeat

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Synchronous Input control         Course No. TTE.442
   Week  :  2   Day  :  1  Period  :   4        Lesson No.

_______________________________________________________________________________
 
   Objectives :
              1. to provide part of the tools to be used for Lab 2
              2. to provide the Ring Structure for sync. I/O

   Materials required:
              ISIS-II Reference Manual
   Course No.   TTE.442      Lesson No.   Lp214.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Sync. I/O Control
                -----------------
                -- all I/O devices are initiated & ccontrolled by the Kernel
                -- use an SVC call to tell the kernel you are ready to 
                initiate an SVC I/O operation.
                
                
                Sync. Input control
                -------------------
                - input is via an input Ring buffer
                - you must have separate buffer for each sync. line that 
                you want to connect
                - Ring is always an even # of bytes
                - you tell slot where and how long the buffer is
                - the first halfword of the buffer will be used by the
                kernel as the next area to fill
                - the kernel updates the fill index
                - user must define & update an empty index
                - in your program:-
                    you will compare fill & empty index,
                    when they are different, you must read data.
                - the structure of the Ring
                   -----------------
                  |                 |
                  |  fill index     |
                  |-----------------|
                  |  the data area  |
                  |                 |
                  |                 |




                 Connect Sync. Input      op=  0
                 -------------------
                          SVC       IO,03
                          
                   reg #3    --->  contains the logical unit number
                   reg # +1  --->  the start address of the input buffer
                                   (points to fill index)
                   reg # +2  --->  the size of the input buffer                                   
                                   (bytes-not including Fill Index)
                                   
                  Note :-
                    This SVC overrides any input currently in progress, and,
                    if successful, initializes the buffer header
                    No way provided to disconnect sync. except may be used
                     SVC disconnect LU>

                   

                
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Synchronous Output Control        Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  5         Lesson No.  LP215.442

_______________________________________________________________________________

   Objectives  :
       1. to provide info. on the Sync. O/P SVC
       2. to acquaint students with the structure of the Rotor list,
          needed to be set up for Sync. Output Control

   Materials required :
          ISIS-II Reference Manual
   Course No.   TTE.442      Lesson No.   LP215.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Synchronous Output Control
                --------------------------
                - output is done with command rotor list
                - each entry is 8 bytes long (2 words)
                - format of a rotor entry:-
                
                 ---------------------------------
                |   command      |     count      |
                |---------------------------------|
                |    address of OUTPUT string     |  
                |                                 |
                 ---------------------------------
                 
                 example :
                 
                 1.
                 ---------------------------------
                |          1     |       200      |
                |---------------------------------|
                |             24000               |
                 ---------------------------------
                ----> starts at 24000(address), output 200 hex digits
                
                2.
                 ---------------------------------
                |          2     |                |
                |---------------------------------|
                |             22800               |
                 ---------------------------------
                 ----> transfers the control to address 22800
                 
                 3.
                 ---------------------------------
                |       5        | syn LU  6      |
                |---------------------------------|
                |             22400               |
                 ---------------------------------
                 ---->  starts address 22400 (with HS = 0),
                        sets the bit no. (according to the Sync LU) to 1
                        ex. here :- turns on bit 6 to 1
                        

                 -- to monitor the top of the rotor list__the command field__
                    when it goes to 0, change it to a 1 immediately.
                    
                 -- # 10d, Padding or Marking State (default value = all 1's)
                    you can change default for what is sent out when line is
                    not active.
                    
                    ----------------------------------
                   |                |                 |
                   |----------------------------------|
                   |                                  |
                   |----------------------------------|
                   |                |                 |
                   |----------------------------------|
                   |                                  |
                   |----------------------------------|
                   |                |                 |
                   |----------------------------------|
                   |                                  |
                    ----------------------------------
                                           |
                                           |---> where to find the next cmd.
                                             point to top of list to wrap 
                                             around.

                  Note :-
                  ----
                       when the kernel is done with data output command, 
                       he changes (resets) command field to 0 and goes to next.
                       if kernel gets a 0 command he stops and will only
                       start again after being issued another SVC.
                       
                       
                  Connect Synchronous Output       OP=1
                             SVC          IO,1R#
                             
                  - attempts to connect a list of output descriptors to
                  a logical unit
                    normal return --> failure, due to an invalid 
                                      specification, or to a LU 
                                      being active
                    skip return   --> output operation has started
                                  1. R# --> the LU number
                                  2. R#+1 --> address of the first output 
                                      descriptor.

                   note :-
                            connect will not disconnect a currently connected
                        LU (will fail if LU is already connected)
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Connecting Foreground Process    Course No. TTE.442
   Week  :  2   Day  : 1   Period  :  6         Lesson No.  LP216.442

_______________________________________________________________________________

   Objectives:
            To enlighten students with the use of the SVC for
           foreground process, in preparation for Lab 2.
   Materials required:
            ISIS - II Reference Manual
   Course No.   TTE.442      Lesson No.   LP216.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                1. Connect Foreground Syscall     (p.33)  
                                  SVC       SYS,1
                   --> BACKGROUND job can control a FOREGROUND process
                   R0  --> address to start execution
                   if R0 = 0 means turn off FOREGROUND.
                   
                   
               2. I/O Attributes Query             (p.40)
               
                                   SVC           IO,12
                                   
                     1  is the OP value for sync. output
                     2  is the reg. #
                     
                     
                     
               Note:
                   1. slots execute in Register set 0F
                      kernel executes in Register set 0
                   2. DISMISS whenever possible,
                      communication between FG & BG must be thru memory.
                      
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Connect Sync. I/O                 Course No. TTE.442
   Week  :  2   Day  :  1  Period  :  7         Lesson No.  EP217.442

_______________________________________________________________________________

    Objective :_
            To have students practice in using the SVC's for the slot
           job in connecting sync. line for a slot.
    Materials required :
           Handout on Lab 2
   Course No.   TTE.442      Lesson No.   LP             Page No.

   References   Lesson Plan
_________________________________________________________________________________




               Lab  2
               -------
               
               Bring up host & allow only 1 login  as in the previos lab.
               
               You will also connect a sync. line. It will be wired in
               loopback such that anything you output will be looped 
               back into your input.
               You will continuously output a 200 (hex) byte output
               buffer & you will count the zero bits you receive from
               the sync. input & continue to store this count from
               a circuit, output the zero bit count instead of 'slowc'.
               
               Handle everyting else as it was in the first lab.
               
               Method for counting zero bits.
                 read in your data 1 halfword at a time.
                 define:
                   define the # of 0 bits in each hex digit
                   NBITS    BC  4,3,3,2,3,2,2,1,3,2,2,1,2,1,1,0

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Async. Supervisory call          Course No. TTE.442
   Week  :  2   Day  :  2  Period  :  1         Lesson No.  LP221.442

_______________________________________________________________________________

   Objectives :
         To give students information about Asynchronous I/O.
         To acquaint students with the method of connecting Async. in ISIS

   Materials required :
   Course No.   TTE.442      Lesson No.   LP221.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Asynchronous I/O
                ----------------
                
                - Async. is allocated in groups (of 16)
                - Async. is driven by rings (very similar to IRING & ORING),
                  handled by the Kernel.
                - Ring array :
                   1. 16 port blocks, 1 block for each port.
                   2. each block contains 2 data rings, Input & Output.
                   ---> Input ring is for input TO the slot (from the port)
                        Output ring is for output FROM the slot (to the port)
                        






                   Input Ring Structure
                   --------------------

                  0               15
                  ----------------
                 |      BCT       |
                 |----------------|
                 |    unused      |
                 |----------------|
                 |  Fill  | Empty |
                 |----------------|
                 |                |
                 |    Data  area  |
                 |                |
                 |                |
                 |    N-6 bytes   |
                 |  ( N describes |
                 | the beginning  |
                 |  of the ring   |
                 | to the end of  |
                 |    the ring )  |
                 |                |
                 |                |
                  ----------------


               BCT  __  filled in by driver 
                        ( count of bytes in the ring )
                        -1 means the ring is empty.

              Fill  __  updated by the driver

              Empty __  update by the slot's user.
              





                Output Ring Structure
                ---------------------

                0               15
                -----------------
                |      BCT      |
                |---------------|
                |     TAM       |
                |---------------|
                |  Fill | Empty |
                |---------------|
                |               |
                |               |
                |    N-6 bytes  |
                |   of data     |
                |               |
                |               |
                -----------------
                
                BCT  __  no. of bytes stored in the ring
                         -1 meand the ring is empty.
                     __  we update this;
                         whenever we put data in the ring,
                         we have to update the BCT
                         
               TAM   __  a counter used for seeing haw many bytes
                         can be in the ring array before Backpressure is 
                         applied.
                         The driver does not use this, we do.



              Procedures to handle Output ring :-

                1. Filling in data
                2. Update BCT & Fill Index
                3. Add the values of BCT & TAM
                   ( TAM is initialixed to a negative number)
                   ( for 300   :-   -3,-4
                        1200   :-  -4
                        4800   :-  -8  )
                   If it is negative, keep on doing
                            positive, stop sticking data in the ring.

                  Note:
                       TAM bit array :-
                            0 bit - backpressure applied
                            1 bit - backpressure not applied
                         Tam stands for Trinsmitter Active Mask
                         it is the value of bits to be changed

                 To connect Async.
                         OP  =  12d    (new style)
                         
                         SVC         IO,0c0
                                          |
                                          |
                                          |--> R0 must be used,
                                          contains a ptr. to a descriptor in 
                                          memory.
                                          
                        ( detail of the Async. descriptor on p.45 )
                      1. high order bits (halfword) of w (the first word of
                         the descriptor) contains the ring size  n;
                         8 < n < 256
                      2. the input ring consists of 1 halfword of BCT counter,
                         1 unused halfword, 1 byte of Fill Index,
                         1 byte of Empty Index,
                         & n-6 of ring storage.
                      3. the ring is empty when BCT has the valus -1.



                                                                           
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Engine Front Console Operation    Course No. TTE.442
   Week  :  2   Day  :  2  Period  :  2         Lesson No. LP222.442

_______________________________________________________________________________

 
 

                              Chapter 2

                       FRONT CONSOLE OPERATION




This section describes the operation of the front console.  It assumes
that the Engine is stopped, that is, the WAIT bit in the PSW is set.



2-1    UTILITY OPERATIONS


2-1.1    STOPPING THE COMPUTER

There are a number of keys which will stop the processor.  The easiest
is the [PSW] key.  Pressing the [PSW] key will stop the  computer, and
cause the console to display  the current PSW, with the WAIT  bit set,
and the current  memory address, that of  the instruction about  to be
executed.  Note that the Engine  can only be stopped if  the Keyswitch
is set to RUN mode.  If it  is in the Lock position, the keys  have no
effect.   See  "Additional  Console  Operating  Procedures"  for  more
information.


2-1.2    CLEARING THE SWITCH REGISTER

The Switch Register may be  cleared by pressing the [DTA] key.   It is
also cleared when the first digit  of a new number is entered  after a
function key is pressed.  For example, if [ADR] was pressed  to select
an address, entering the first digit of the data for that address will
clear the register.


2-1.3    ENTERING DIGITS INTO THE SWITCH REGISTER

Simply key the numbers in.  If the console was in some other mode when
the first digit is entered, it will clear, and display the contents of
the Switch Register.   The right half of  the display, along  with its
label, will flash, indicating a pending operation.


2-1.4    REPEATING AN OPERATION

Pressing [RPT] will repeat the  previous operation for as long  as the
key is pressed.

Example:  [RD] and [RPT] will repeat the read data operation  from the
          same memory  address.  [RD],[INC] and  [RPT] will  read data
          from successive memory locations.




FRONT CONSOLE OPERATION                                              3
ISIS __TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


2-2    MEMORY OPERATIONS


2-2.1    SELECTING AN ADDRESS

1.  Enter the digits of the address into the Switch Register.

2.  Press [ADR].  The console will display the address and the PSW.


2-2.2    READING FROM MEMORY

1.  Select the address as described above (Section 2-2.1).

2.  Press [RD].  This  will cause the  current memory address  and the
    data in it to be displayed.


2-2.3    WRITING INTO MEMORY

1.  Select the address as described above (Section 2-2.1).

2.  Enter the data into the Switch Register.

3.  Press [WRT].   The console will  display the selected  address and
    the data  written in.  To  check on the  correctness of  the data,
    press [RD].


2-2.4    INCREMENTING OR DECREMENTING THROUGH MEMORY

It is  possible to  read or  write to  successive memory  locations in
either ascending or descending order using the [INC] and [DEC] keys by
simply pressing [INC] for  incrementing or [DEC] for  decrementing the
current address after performing a Read or Write operation.  Each time
the key is depressed, the  current address will be decremented  by two
to  the  next half-word,  and  the  Read or  Write  operation  will be
performed again.  If either  key is pressed after any  operation other
than a Read  or Write, the console  will display a DEAD  0BAD message,
indicating that a disallowed sequence has occurred.

NOTE:  Remember that while performing an increment or decrement during
a Write operation, you are writing the contents of the Switch Register
into each successive memory location, filling the memory with the same
number.











4                             Chapter 2 
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


2-3    THE PSW


2-3.1    READING THE PSW

To read the  PSW, press the [PSW]  key.  The console will  display the
current address and PSW.


2-3.2    SETTING A NEW PSW

1.  Enter the new PSW into the Switch Register.

2.  Press [SET].  The console will display the new PSW.  Note that the
    third digit in the PSW is the current Register Set.









































THE PSW                                                              5
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


2-4    REGISTER OPERATIONS


2-4.1    SELECTING A REGISTER SET

1.  Enter the number of the  register set you wish to select  into the
    third digit of the Switch Register.

2.  Press [SET].

NOTE:  This procedure changes the PSW.


2-4.2    SELECTING A GENERAL REGISTER

1.  Press [REG].

2.  Press the number  of the register you  wish to read from  or write
    to.  The console will display the register number and the contents
    of the register.  If [PSW] or [SET] is pushed first, the number of
    the register  set will  be displayed  on the  extreme left  of the
    console.


2-4.3    WRITING INTO A GENERAL REGISTER

1.  Select the  desired register set  and general register  within the
    set.

2.  Enter the first four (left-most) digits of the desired number into
    the Switch Register.

3.  Press [WRG].  The right-most  four digits of the  general register
    will shift left four places, and the Switch Register contents will
    copy into the right half of the general register.

4.  Enter  the  second  four  digits of  the  number  into  the Switch
    Register.

5.  Press  [WRG]  again.   The complete  new  32-bit  general register
    contents will be displayed at the console.















6                             Chapter 2 
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


2-5    RUNNING THE COMPUTER


2-5.1    STARTING THE COMPUTER

1.  Select the desired starting memory address.

2.  Press [RUN].  The light bar on the console will go off, indicating
    that the computer is running.


2-5.2    SINGLE STEPPING THE COMPUTER

Press [SGL].  The computer will execute one machine instruction, halt,
and display the current memory address and the PSW.


2-5.3    INITIALIZING THE COMPUTER

Press [INI].   Pressing this  simulates a power  failure and  causes a
restart from microcode address zero, creating a power-up interrupt.


2-5.4    STARTING THE BOOTSTRAP

The Boot will  load from a  byte-oriented device, starting  at address
00080  and ending  at the  current address,  which must  be  less than
00300.  The  device address and  a command code  (94) must  be entered
into the Switch Register first.



























RUNNING THE COMPUTER                                                 7
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


2-6    ADDITIONAL CONSOLE OPERATING PROCEDURES

        The  procedures above  are for  normal console  operation, are
obvious and can be  quickly learned.  There are  additional procedures
which are more  subtle, but which can  be of immense help  in hardware
trouble-shooting   or  software   debugging.   These   procedures  are
described below.


2-6.1    STOPPING THE COMPUTER

        As  previously  mentioned,  the  computer  may  be  stopped in
several ways.  Each method stops the CPU in a slightly different way.

1.  Press [PSW].  The  computer will stop IMMEDIATELY,  displaying the
    current memory address and the PSW.

2.  Press  [SGL].   The   computer  will  execute  the   next  machine
    instruction, then stop and display the current memory  address and
    data.

3.  Press [REG][N].  Select a Register.  The computer will immediately
    stop, and display  the contents of  the selected register  and its
    number.

4.  Press [RD].  The console  will display the current  memory address
    and data.  The address will not be off by two.


2-6.2    MAKING THE COMPUTER PAUSE

        Press [RPT] while the computer is running.  The  computer will
stop (pause) and the light bar  will light.  As long as [RPT]  is held
down, the console will indicate the current PSW and memory  address at
the instant [RPT] was pressed.


2-6.3    TAKING A  SAMPLE (SNAP) OF  A RUNNING MACHINE'S  LOCATION AND
         STATUS

        Press [RUN] while the  computer is running.  The  console will
show  the current  memory address  and PSW  at the  instant  [RUN] was
pressed.  The processor will  continue to run and the  console display
will change on the next console output instruction.












8                             Chapter 2 
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


2-7    CONSOLE DIAGNOSTICS

        Certain console error diagnostics have been  incorporated into
the microcode in order to assist in determining the more  common types
of machine  or operator  errors.  These codes  and their  meanings are
shown in  Table 2-1.  Note  that, except  in the case  of the  Sync up
when it  should be down  and operator error  messages, that  the first
four digits are the microcode addresses of the error routines.


                              Table 2-1

                        Console Error Messages


     CONSOLE CODE MEANING

     001A DEAD       Illegal  second   decode.   Possibly   caused  by
                     MAPSEL, bit 44 of the microcode, not being reset.

     0160 DEAD       Illegal ATN0 interrupt.  Usually caused by having
                     an enhanced Multi-Function Card in a machine that
                     does not have async-enhanced microcode.

     01A0 DEAD       Illegal  ATN 1  interrupt.  Caused  by  having an
                     enhanced  sync card  in a  machine that  does not
                     have sync-enhanced microcode.

     01E9 DEAD       No  SYNC  response  to  ATN2  interrupt.  Usually
                     caused  by a  broken RACK0/TACK0  chain,  or some
                     device holding ATN2  active.  In the  first case,
                     check the RACK0/TACK0 lines.  In the second case,
                     remove the I/O boards from the machine, one  at a
                     time, until the problem goes away,  thus locating
                     the offending board.

     0100 DEAD       No response to address on boot function.

     02XX DEAD       Bad status (boot function), XX= status.

     0060 DEAD       Early power down.

     01A8 DEAD       SYNC up when it should be down.

     DEAD 0BAD       Console operator error.

     0020 DEAD       Caused by  a bad interrupt  decoder on the  ROM &
                     I/O Board.

     0201 DEAD       Device unavailable.






CONSOLE DIAGNOSTICS                                                  9
 
 

                              Chapter 3

                       THE PROGRAM STATUS WORD




The Program Status Word  (PSW) is a 16-bit  register on the ROM  & I/O
Card,  which is  used  to control  and/or  describe the  state  of the
machine.  The functions and meanings of the various bits are  shown in
Table 3-1:


                              Table 3-1

                         Meaning of PSW Bits

     PSW BIT         FUNCTION
     0               Wait Bit.
     1               I/O Interrupt Enable.
     2               Machine Malfunction Enable.
     3               Trace Bit.
     4               Async-enhanced microcode enable.
     5               Enables relocation/protection interrupts.
     6               Enables sync-enhanced microcode interrupt
                     (ATN1) servicing.
     7               Declares execution of privileged mode
                     instructions illegal.
     8               Bit 0 of Register Set Select.  Also used
                     to enable I/O interrupts.
     9               Bit 1 of Register Set Select.  Also used to
                     enable I/O interrupts.
     10              Bit 2 of Register Set Select.
     11              Bit 3 of Register Set Select.
     12              Result of operation is longer than 32 bits.
     13              False SYNC time-out on I/O Bus.
     14              Result of operation is greater than 0.
     15              Result of operation is less than 0.

BIT 0
WAIT BIT

When set, this  bit will cause the  processor to wait,  halting normal
program  execution  until a  new  PSW  is loaded,  with  bit  0 reset,
allowing the processor to execute instructions.











10                            Chapter 3 
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


BIT 1
I/O INTERRUPT ENABLE

When  set, this  bit allows  the CPU  to acknowledge  and  service I/O
interrupts,  in conjunction  with bits  8 and  9, which  determine the
levels of  I/O interrupts  enabled.  The selection  is shown  below in
Table 3-2.

If bit 1 is reset, all I/O interrupts are disabled.


                              Table 3-2

                         I/O Interrupt Enable

     BIT 1   BIT 8   BIT 9           INTERRUPTS ENABLED
     SET     RESET   DON'T CARE      ATN0
     SET     SET     RESET           ATN0 & ATN1
     SET     SET     SET             ATN0,ATN1, & ATN2

BIT 2
MACHINE MALFUNCTION INTERRUPT ENABLE

This bit, when  set, allows the  machine to recognize  and acknowledge
machine malfunction  interrupts.  When such  an interrupt  occurs with
bit  2  set,  the machine  enters  the  appropriate  interrupt service
routine.  If the bit is reset, the interrupt is ignored.

BIT 3
TRACE BIT

The Trace Bit is a debugging tool for software.  It can be  enabled by
a UPSW instruction (opcode D5), which is not a privileged instruction.
When  it  is  enabled,  it  causes  the  program  to  enter  a special
subroutine,  analogous to  an interrupt  service routine,  before each
jump instruction is executed.

When a jump instruction is read  in and the Trace Bit is on,  the Jump
address is stored in memory  address 14, subject to relocation  by the
MAC.  The PSW in  effect at the time  is stored in memory  address 10,
also  subject to  relocation.   The Trace  Bit  is turned  off,  and a
fullword  pointer  from user  memory  address 18  is  loaded  into the
Program  Counter.   This  address  is  the  beginning  of  the special
subroutine, whose  function is  completely up  to the  programmer.  It
might  check program  conditions, store  program addresses,  or simply
display something  on the  console.  At  the end  of the  routine, the
programmer should put in a UPSW instruction from address 10 to restore
the old PSW  and jump address, reset  the Trace Bit and  continue with
the original program.  Each  time a jump instruction is  executed with
the Trace Bit on, the above sequence will occur.






THE PROGRAM STATUS WORD                                             11
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


BIT 4
ASYNC-ENHANCED MICROCODE ENABLE

When Bit 4 is set,  it allows the use of the  async-enhanced microcode
instructions **SBOD, **XMIT, **SPM,  and **GCHAR.  If bit 4  is reset,
these instructions are treated as illegal instructions.

BIT 5
MEMORY RELOCATION/PROTECTION ENABLE

When set, this bit turns on the relocation and protection circuitry in
the  MAC.  All  memory accesses  are then  subject to  relocation, and
validity  checks  by the  protection  circuitry.  It  also  allows the
processor to recognize and service interrupts from the MAC.   When the
bit is reset, all relocation and protection is turned off, and  no MAC
interrupts are recognized.

BIT 6
SYNC-ENHANCED MICROCODE INTERRUPT SERVICE ENABLE

When  this  bit  is  set, it  allows  the  processor  to  service ATN1
interrupts with  the routine  in the  sync-enhanced microcode,  if the
machine has it.  If the  bit is not set, a machine  with sync-enhanced
microcode receiving an ATN1 interrupt treats it as an  ATN2 interrupt.
If a machine doesn't have sync-enhanced microcode, the setting  of bit
6 is immaterial.  If ATN1 is received the machine will die.

BIT 7
PRIVILEGED INSTRUCTION DISABLE

When this bit is set, no privileged instructions will be executed.  If
one  is  encountered, it  is  treated as  an  illegal  instruction and
creates an Illegal Instruction interrupt.  When the bit is  reset, all
privileged instructions can be executed.  The  privileged instructions
are listed below in Table 3-3:


                              Table 3-3

                       Privileged Instructions

     INSTRUCTION                             MNEMONIC        OPCODE
     Exchange Program Status Register        EPSR            95
     Load Program Status Word                LPSW            C2
     Load Program Status Word Register       LPSWR           18
     Write Data Register                     WDR             9A
     Write Data                              WD              DA
     Read Data                               RDR             9B
     Sense Status                            SSR             9D
     Output Command                          OC              DE
     Output Command Register                 OCR             9E





12                            Chapter 3 
ISIS__TTE.442          TYMNET ENGINE TRAINING MANUAL     December 1, 1982


BITS 8-11
REGISTER SET SELECT

Bits 8-11 of  the PSW are used  to select which of  the 16 sets  of 16
general registers is to be used in that portion of the  program.  Bits
8 and 9 are also used in  conjunction with bit 1 of the PSW  to enable
the various levels of I/O  interrupts, as described in the  section on
bit 1.

BITS 12-15
CONDITION CODE

The Condition  Code is  used to give  the programmer  some information
about the results of  instructions and to determine whether  jumps are
executed.  Most  user instructions change  the Condition Code  in some
way.  See the description of the instruction in Chapter 5  for details
on how it is changed.  The usual meaning of each bit in  the Condition
Code is explained below:

        BIT 12
        CARRY FLAG

        This bit is set whenever the result of an operation  is longer
        than 32 bits.

        BIT 13
        OVERFLOW FLAG

        This flag  corresponds to the  Overflow Flag on  the Interdata
        7/32, so it has the same name in the write-ups.   However, its
        function is different in the Engine.  Following any arithmetic
        instruction, the flag is set to zero.  The flag is set  when a
        false sync timeout occurs  after an I/O instruction.   A false
        sync  timeout  occurs  when an  I/O  device  is  addressed and
        doesn't respond with SYN0.

        BIT 14
        GREATER THAN ZERO FLAG

        This flag is set whenever the sign bit (most  significant bit)
        of the result is zero and there is at least one bit set in the
        result, indicating a result greater than zero.  It is also set
        when a memory parity error interrupt occurs.

        BIT 15
        LESS THAN ZERO FLAG

        This flag is set when the  sign bit of the result is  one.  If
        neither the G flag nor the L flag is set, the result was zero.







                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :   Async.  Lab.                     Course No. TTE.442
   Week  :  2   Day  :  3  Period  :  1         Lesson No.  LP231.442

_______________________________________________________________________________
     
       Objectives :
                 To  have students practice on the use of
              Async. SVC's call

      Materials required :
                Lab Handout
   Course No.   TTE.442      Lesson No.   LP231.442     Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Lab. Three
                ----------

                * Do not bring up a host.*
                Connect an Async. port group. A terminal will be hardwired
                to your port 0. Enable port 0 and echo all DATA (not ESC
                characters) typed back to the terminal. If a <CR> is typed,
                also echo a <LF>. Do not enter ECHO mode until you detect
                BREAK state, then send a Welcome message to the terminal
                and start echoing characters. 
                Assuming the termiunal is at 300 bauds.
                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  DDT  SVC's                        Course No. TTE.442
   Week  :  2   Day  :  3  Period  :  2         Lesson No.  LP232.442

_______________________________________________________________________________

                   DDT SVC's
                   ---------
                   
                   -- these are the SVC's used by the KIO (Kernel IO) users,
                      such as DDT users.
                   -- FG & BG are not allowed to use these SVC's
                   -- used only while DDT jobs are executing
                   -- used when writing your own DDT slot along with SYS SVC's
                   
                   (Details on pp.59 to 63)












                         CHAPTER 1

                       ISIS MESSAGES



          1.1  INTRODUCTION

               ISIS was defined in order to develop, debug, and deploy
          new interfaces on network nodes while protecting these nodes
          from  possible  faults  that  might  take  place  in   these
          interfaces.

               ISIS is a system, not a programme.   It  is  a  set  of
          rules  as  to  how the interfaces are to be constructed, and
          how they are to communicate with each other.  ISIS is not  a
          TYMNET node or implementation of TYMNET technology.

               ISIS divides the machine  into  partitions,  or  SLOTS.
          Slot 0 is expected to have special properties and abilities,
          including the routing of circuits within  the  machine,  and
          the collection of diagnostic and accounting information.

               To this end, ISIS treats the TYMNET node code  as  just
          another   interface.   The  TYMNET  node  code  has  special
          properties only when executing in slot 0.  These include the
          routing  and  monitoring  functions  relating  to the TYMNET
          supervisor.  When executing in a slot other than slot 0, the
          TYMNET  interface  performs  the  function  of  a gateway to
          TYMNET.



          1.2  THE KERNEL

               The control center of ISIS is  the  KERNEL,  a  process
          which  provides  ultimate control of hardware, including the
          scheduling of other processes.

               Interrupts  have  absolute  priority  in  the  machine.
          During  intervals  when  no  interrupts  are  active,  other
          processes are active.  These are either the kernel, or  some
          process  to  which  the  kernel has temporarily assigned the
          machine.
          PART II - ISIS MESSAGES                             Page 1-2


               These processes are, for the  purposes  of  scheduling,
          independent  jobs,  even  though  a  set of processes may be
          working together, as a SLOT.  These processes  fall  into  a
          hierarchy of levels.

               The  top  level  consists  of  Foreground  (or  Quasi-)
          processes.   The  kernel  schedules  all  active  foreground
          processes to execute once every 25 milliseconds  (nominally;
          40 scheduled activities/second is guaranteed), for a maximum
          period dependent upon the number of devices  which  must  be
          serviced.  Periods are in clock ticks (1/600 second), with a
          minimum of 2 ticks, and  one  additional  tick  for  each  3
          logical  units.   These are intended to communicate with the
          interrupt level processes, and thus  must  be  scheduled  at
          frequent  intervals,  to  permit  timely responses.  To this
          end, each time the kernel tries to schedule a job, it  first
          searches  the  queue  of  foreground jobs, to find which one
          should  run  next.   If  none  should  go  immediately,  the
          time--until  the  next foreground process is to run--is made
          available to a background process.

               At the bottom level are the Background jobs.  These are
          the  work-  horses,  which  perform  the  major effort of an
          interface.   Background  jobs  actually  fall  into  several
          categories, which the kernel's scheduler treats identically.
          The Kernel divides the time-domain into  timeslices,  of  50
          milliseconds;    these  timeslices  are  interruptable  (for
          foreground execution).  A job may dismiss at any time during
          it's  timeslice  and  new  timeslice is then created for the
          next job.  If the job doesn't dismiss itself, the machine is
          taken  away  from  it  at  the end of the timeslice, and all
          other jobs are given a chance to execute  their  timeslices.
          As  a  result,  a  job  may  get  as  many  as  500  or more
          timeslices/second  (in  a   lightly-loaded   machine,   with
          well-behaved  jobs)  to  as few as 2-4, if there are several
          pathologic jobs active.

               The true background job,, is the main effort of a given
          interface.   In addition, there are a set of DDT jobs.  Each
          of these can be logged into through the network, and be used
          to  control,  modify,  debug,  or  reload  a  given  set  of
          processes (a SLOT).

               Each slot has an DDT, a foreground,  and  a  background
          job associated with it (note--not all jobs associated with a
          slot need be active concurrently).

               An intermediate  level  job  is  the  DISPATCHER.   The
          dispatcher  is run each time a true background job runs, and
          is used to set up that background job for it's next  use  of
          the  machine.   In  particular,  the dispatcher switches the
          output which was produced by that slot  to  the  appropriate
          destination slots.
          PART II - ISIS MESSAGES                             Page 1-3


          1.3  DISPATCHER

               The communications center of ISIS  is  the  DISPATCHER.
          The  primary  function  of  the  dispatcher  is  to act as a
          switching center, talking to several interfaces.  Subsidiary
          functions  are to perform network accounting, and such other
          functions which it is convenient to centralize.  It does NOT
          have any knowledge of the properties of specific interfaces,
          except that the interface associated with  slot  0  has  the
          capability  to  perform  routing,  and is the repository for
          diagnostic, accounting, and other messages.

               Each interface has a set of descriptors which  it  uses
          to  talk  to  the  dispatcher,  and may have a translator to
          convert its requests and messages to  the  standard  format.
          Each  interface  runs  as one or more independent jobs under
          the  KERNEL,  sharing  time-slices  with  the  rest  of  the
          interfaces.   The  MAC  (Memory  Access Controller) prevents
          each interface from destroying another interface because  of
          illegal  memory stores.  The dispatcher checks the data flow
          to insure that, if the interface is  in  error,  it  damages
          only its own subset of circuits.

               Under the MAC, a job slot can have up to  16  segments.
          By   ISIS   convention,  segment  15d  is  readable  by  all
          processes, and contains system variables  (such  as  clocks)
          which  may  be  of interest to al processes.  Segment 14d is
          the slot's Control Table Area (CTA), which is protected from
          inadvertent  modification  by  the  slot  itself,  and which
          contains  the  descriptors  necessary  and   sufficient   to
          describe  the slot's running configuration, such as pointers
          to variables, memory layout,  etc.   The  dispatcher  shares
          segment  14d  with  the  slot, and uses these fixed cells to
          communicate with the individual jobs.  This segment is used,
          by the dispatcher, to maintain records of ongoing events.



          1.4  ISIS MESSAGE FORMAT AND STRUCTURE

               Independent processes communicate with  the  dispatcher
          via  input and output rings.  Each ring contains a string of
          MESSAGES, each of which has a  HEADER  of  standard  format.
          Each  message  starts  on  a  word  boundary.   Each ring is
          described by a collection of DESCRIPTOR cells, to permit the
          driver   and   receiver  to  synchronize  with  each  other.
          Requiring  that  messages  start  on  word  boundaries  also
          insures   that   the   header   can  be  referenced  without
          consideration of ring folding.


               Each ring descriptor has the following parameters :


          
          PART II - ISIS MESSAGES                             Page 1-4


                  _______________________. . . . . . . 
                  |      |     |       
                  | NFMI | CEI |  Ring
                  |______|_____|_________. . . . . . .
          
                  Where  NFMI  is the next fill message index
                               and is half word long ( 2 bytes ).
                               It is the character index of the
                               next message to be filled.
                           
                          CEI  is the current empty index
                               and is half word long (2 bytes).
                               It is the character index of the
                               next message to be emptied.
          
                         Ring  is the set of data and is of
                               variable number of words.
          
          Refer to the (netdvdoc:33)ISIS2.DOC for a full description
          of the message format and message types. The following is
          an abstract from that document for field debugging purposes.
          
             <byte>   <-----full word----->         <half word>
             |.##.:...|....:....!....:....|....:....!....|....|
          
              -  = Input only to slot
              +  = Output only from slot
              *  = Can be either way
          
              The first halfword is ALWAYS the port number (RPORT)
              except for Intra-ISIS communication, when the RPORT
              is ALWAYS zero.
          
          PART II - ISIS MESSAGES                             Page 1-5


                  ********** CIRCUIT ISIS MESSAGES  **********


          
          - Needle         00  :leng|..invoice number...|
                                    |Dest Host!Orig Node|
                                    |Orig Host!Orig Port|
                                    |----:----!----!TPC.|
                                    |HIQ=8000.!TID.:Size|
                                    |User Name .....
          
          * Data           01  :Data|
             :
          * Data           9D  :Data ......
          
          + Detach         9E  :----|
          * Zap            9F  :----|
          * Set BP         A0  :----|
          * Release BP     A1  :----|
          * Gobbler        A2  :----|
          * Flush Input    A3  :----|
          * Black Ball     A4  :----|
          * Gray Ball      A5  :----|
          * Enter DEM      A6  :----|
          * Leave DEM      A7  :----|
          * Enter Trans    A8  :----|
          * Leave Trans    A9  :----|
          * Green Ball     AA  :----|
          * Red Ball       AB  :----|
          * Yellow Ball    AC  :----|
          * Orange Ball    AD  :----|
          * Break Begin    AE  :----|
          * Hang up        AF  :----|
          * Query Term.    B0  :tpar|
          * Set Terminal   B1  :tpar|valu:----!----:----|
          - Pseudo Need.   B2  :Key.|Local.Key!----:----|
          + Logon Char     B3  :Char|
          - Logon status   B4  :lsta|
          - Logon failed   B5  :lerr|
          - Logon OK       B6  :IIX.|..invoice number...|
                                    |Orig Host!----:----|
          + Accounting     B7  :----|0Emg:..Acct Value..|
          * Super Hang     B8  :----|
          * Set xmit lim   B9  :limt|
          * Break end      BA  :----|
          + Zap Ack        BB  :----|
          * Ent Alt Dev    BC  :----|
          * Lev Alt Dev    BD  :----|
          + Zap W/Reason   BE  :resn|
          * SIIX           BF  :.00.|
          * TIIX           C0  :.00.|
          
          
                Where    tpar : 0 = echo on/off  (1)
                                1 = echo TAB     (1)
          PART II - ISIS MESSAGES                             Page 1-6


                                2 = echo lf w/cr (1)
                                3 = echo cr w/lf (1)
                                4 = cr delay     (1)
                                5 = input baud   (4)
                                6 = output baud  (4)
                                7 = parity       (1)
                                8 = half duplex  (1)
                                9 = param - A    (4)
                                A = param - B    (4)
                                B = param - C    (4)
                                C = X-enable     (1)
                                D = Echo BS      (1)
                                E = Rev X-enable (1)
                                F = param - D    (4)
                               10 = Katakana     (1)
                               11 = Term on brk  (1)
                               12 = Echo - Esc   (1)
                               13 = Q-Mode       (1)
          
          
                         lsta : 0 = Continue
                                1 = Please Log in
                                2 = Error, type username
                                3 = Error, type password
                                4 = username
                                5 = password
          
                         lerr : 0 = ISIS unable to complete request
                                1 = format error
                                2 = bad user name
                                3 = bad mud
                                4 = system unavailable
                                5 = down line load or dial out failure
                                6 = timeout
                                7 = access not permitted
                                8 = out of origination ports
                                9 = try again later
                                A = bad requesting host number
                                B = requesting host not up on node
          
                         resn : 0 = host out of ports
          
           EXAMPLE A :
          
           1. Needle - Type 00
          
              000F  001D  0017  4953  0599  041C  0000  006B
              0000  0000  0000  CC09  4C49  4E43  4F4C  4E31
              8D--
          
           
           2. Data - 
          
              000E  1A8D  8AF2  E5ED  EFF4  E5BA  A0E3  E1EC
              ECA0  E3EF  EEEE  E5E3  F4E5  E48D  8A1B  5936
          PART II - ISIS MESSAGES                             Page 1-7


          
          
          
           3. SIIX - Type BF
          
              000E  BF00
          
           
          PART II - ISIS MESSAGES                             Page 1-8


                ***** NON-CIRCUIT ISIS MESSAGES, RPORT = 0 *****


          - Restart Req.   00  :----|
          + Restart Resp   01  :----|
          - Take over      02  :Sup#|
          + Rpt to SUP     03  :Key.|Half wd 4!Half wd 3|
                                    |Hw2l:----!----:----|
          + Host status    04  :Key.|.Host no.!# of prts|
                                    |Rel Host#!Hsta:HKey|
          + Report Accnt   05  :----|accounting message |
          - Tell host time 06  :----|....:...GMT...:....|
          + Pseudo N Req   07  :Key.|local Key!SIQ=8000.|
                                    |Orig Host!TID.:....|
          + Aux Cir Req    08  :Key.|Local Key!SIQ=8000.|
                                    |Orig Host!Size: User name ....
          - Pseudo N Rej   09  :Key.|Local Key!lerr:----|
          + Host Prt aval  0A  :Key.|.Host no.!# of prts|
                                    |Rel Host#!----:----|
          - Host unaccep   0B  :Key.|.Host no.!Herr:----|
          + Rpt Host cost  0C  :Key.|.Host no.!Host Cost|
                                    |Rel Host#!----:----|
          - No SUP         0D  :----|
          - 1Down Mess     0E  :Key.|Type:Size!Text ...
          + Rpt all Hosts  0F  :----|
          + Ext Host stat  10  :Key.|.Host no.!# of prts|
                                    |Rel Host#!Hsta:HKey|
                                    |I.Q.:PID !----:----|
          
          
                  Where   Hsta : 0 = Host answered
                                 1 = Host down
                                 2 = Host shut (but up)
                                 3 = Host gone
          
                      Host no. : Always a Hex number, convert to radix 10
                                 for the actual network host number.
          
                    # of ports : Always a Hex number, convert to radix 10
                                 for the actual number of ports in decimal.
          
                          I.Q. : Host Intelligent Level
                                 (80 - IIX Capable)
          
                           PID : Product ID for the interface
                                 Value should be 3 for version 1.15 or lower
                                 or 33 for Version 2.0 or higher.
          
                                 Ex.  0001    ASAT
                                      0002    ACOM
                                      0003    XCOM (for Version 1.15)
                                      0004    3270 Host Interface
                                      0005    3270 Terminal Interface
                                      0009    Standalone Tymsat
                                      000B    ELF
          PART II - ISIS MESSAGES                             Page 1-9


                                      0010    ONTYME
                                      0012    RAM
                                      0014    VAL
                                      0015    CONSAT
                                      0033    XCOM (for Version 2.00)
          
                                      (Refer to CIRCUI.DOC for further
                                       details )
          
          
          
          
           EXAMPLE B :
          
           1. Pseudo Needle Request - Type 07
          
              0000  0700  0002  8000 0599  CC--
          
           
           2. Ext Host Stat - Type 10 (Host answered)
          
              0000  100E  0768  000A  0000  0200  8003
          
          
           3. Ext Host Stat - Type 10 (Host shut)
          
              0000  100E  0768  000A  0000  0000  8003
          
          
           EXAMPLE C :
          
          
          
          
          *:r oring,4
          508A0  037C  037C
          *:r oring,37c+4
          508A0  037C  037C  0599  000F  0000  0000  8003  02AC
          508B0  000F  012B  000F  B100  01B0  742E  000F  B103
          508C0  01A0  E4F4  000F  B102  00E7  E9EE  000F  ACE4
          508D0  000F  AA57  000F  B700  E007  0100  000F  1A8D
          508E0  8AF2  E5ED  EFF4  E5BA  A0E3  E1EC  ECA0  E3EF
          508F0  EEEE  E5E3  F4E5  E48D  8A00  0002  000F  B700
          50900  E00E  8000  000F  B700  E002  0000  000F  B700
          50910  E003  1433  000F  B700  E004  3106  000F  B700
          50920  E005  0C00  000F  B700  E00A  0099  000F  B700
          50930  E00B  0340  000F  B700  E00C  0602  000F  B700
          50940  E00D  0E31  000F  B10C  000A  1433  000F  B10E
          50950  010B  3106  000F  2050  5249  4D45  4E45  5420
          50960  3138  2E33  2E33  204C  696E  636F  6C6E  204E
          50970  4F44  452E  320D  0A00  000F  490D  0A50  5249
          50980  4D4F  5320  5665  7273  696F  6E20  3138  2E33
          50990  2E33  204C  696E  636F  6C6E  0D0A  4241  434B
          509A0  5550  2028  3633  2920  4C4F  4747  4544  2049
          509B0  4E20  4154  2020  3232  3A35  3920  3039  3035
          PART II - ISIS MESSAGES                            Page 1-10


          509C0  3832  0D0A  000F  B10E  0000  6575  000F  020D
          509D0  0A0F  A044  000F  044F  4B2C  20C0  000F  1B5B
          509E0  4E45  544C  494E  4B20  2052  6576  2E20  3138
          509F0  2E33  585D  0D0A  0D0A  4420  0002  000F  2649
          50A00  6C6C  6567  616C  2061  6464  7265  7373  2066
          50A10  6F72  6D61  7420  2774  796D  6E65  7420  270D
          50A20  0A0D  0A40  2006  0107  0000  0700  0002  8000
          50A30  0599  CC11  000E  B30D  000F  020D  0A1E  108E
          50A40  000F  2754  594D  4E45  5420  436F  6E6E  6563
          50A50  7465  640D  0A0D  0A72  656D  6F74  653A  2075
          50A60  7365  7220  6E61  6D65  3A20  0420  000F  B700
          50A70  E800  000C  000F  B700  E700  000A  000F  B700
          50A80  E600  000A  000F  B700  E500  0009  000E  B369
          50A90  000E  B364  000E  B363  000E  B331  000E  B330
          50AA0  000E  B334  000E  B332  000E  B30D  000E  B700
          50AB0  E002  0000  000E  B700  E003  3106  000E  B700
          50AC0  E004  0000  000E  B700  E005  0800  000E  B700
          50AD0  E00A  1433  000E  B700  E00B  3106  000E  B700
          50AE0  E00C  0000  000E  B700  E00D  0800  000E  B700
          50AF0  E008  0599  000E  BF00  000E  0480  8180  8300
          50B00  000E  BF00  000E  04C0  9300  0033  000E  BF00
          50B10  000E  0AC0  8708  3106  0000  0000  000F  B700
          50B20  000E  BF00  000E  0AC0  8808  3106  1433  0000
          50B30  000F  0480  000E  BF00  000E  08C0  8D05  0400
          50B40  0100  013A  000E  BF59  000E  07C0  8904  0100
          50B50  0000  0000  000E  AD59  000F  010D  000E  BFC0
          50B60  000E  06C0  8203  0002  0132  0108  000F  B100
          50B70  000F  06C0  000F  B10E  0020  2020  000E  BF20
          50B80  000E  1EC0  821B  0002  0003  0204  0005  0107
          50B90  1508  0009  000C  0000  2101  0012  0024  00B9
          50BA0  010F  BF1B  000E  BFC0  000E  06C0  8203  000B
          50BB0  0304  1485  000E  AD07  000E  B700  E200  0008
          50BC0  000E  B700  E100  0006  000E  B700  E400  0004
          50BD0  000E  B700  E300  0001  000E  9EC0  000F  B100
          50BE0  015F  5F5F  000F  B10E  000F  06C0  000F  250D
          50BF0  0A00  0654  594D  4E45  5400  0000  0000  0000
          50C00  0000  0000  0020  4469  7363  6F6E  6E65  6374
          50C10  6564  0D0A  000F  040D  0A40  2053  000F  AAC0
          
          
          *:r iring,irsize+4
          50CA0  00F8  00F8  000F  0169  000F  0164  000F  0163
          50CB0  000F  0131  000F  0130  000F  0134  000F  0132
          50CC0  000F  010D  000E  B601  0018  7FE9  011E  9FB9
          50CD0  000E  028D  8A5D  018D  000E  B100  015D  028D
          50CE0  000E  B103  015D  018D  000E  B102  008F  0680
          50CF0  000E  BF80  000E  0680  8080  8380  818F  AC8D
          50D00  000E  C0B2  000E  ACC0  000E  BFB6  000E  03C0
          50D10  8F00  21C0  000E  BF01  000E  1EC0  821B  0202
          50D20  0003  0204  0005  0107  1508  0009  000C  0000
          50D30  2101  0012  0024  0039  018F  0801  000E  BF1E
          50D40  000E  03C0  8203  BFB4  000E  0304  0B00  040B
          50D50  000E  BFCC  000E  03C0  8400  21C0  000E  BF72
          50D60  000E  03C0  8E00  204E  000E  AC6F  000F  A631
          50D70  000F  B100  0053  7973  000F  B10E  008F  0C35
          PART II - ISIS MESSAGES                            Page 1-11


          50D80  000E  9F72  000F  B100  0161  73BF  000F  B10E
          50D90  0053  6967  000F  AA6E  000F  A73E  7465  6D20
          50DA0  000F  0C35  310D  0A0D  0A20  506C  6561  73BF
          50DB0  000F  0D65  2053  6967  6E20  4F6E  200D  0A3E
          50DC0  000F  BFCE  000F  0CC0  8209  0602  010C  0100
          50DD0  2101  04CC  000F  BF8D  000F  21C0  8022  5072
          50DE0  696D  6563  6F6D  204E  6574  776F  726B  2031
          50DF0  382E  3342  2053  7973  7465  6D20  000F  0435
          50E00  320D  0A08  000F  BF8D  000F  21C0  8064  4469
          50E10  616C  636F  6D20  496E  7465  726E  6174  696F
          50E20  6E61  6C20  436F  6D70  7574  6572  000F  1720
          50E30  5365  7276  6963  6573  2031  382E  3342  2835
          50E40  3229  0D0A  4F6E  01C5  000F  1620  4174  2032
          50E50  323A  3038  2030  392F  3033  2F38  320D  0A4C
          50E60  618F  21C0  000F  1973  7420  4F6E  2041  7420
          50E70  3137  3A32  3220  3039  2F30  332F  3832  0D0A
          50E80  000F  BF27  000F  21C0  802F  0D0A  4D61  696C
          50E90  2063  616C  6C20  2831  2052  6561  642C  2031
          50EA0  2052  6561  6420  6578  000F  1170  7265  7373
          50EB0  2C20  546F  7461  6C20  3229  0D0A  000F  BF31
          50EC0  000F  06C0  8003  0D0A  3E65  6D20  000F  BF35
          50ED0  000F  21C0  803C  4F66  6620  4174  2032  323A
          50EE0  3038  2030  392F  3033  2F38  320D  0A43  6F6E
          50EF0  6E65  6374  000F  1720  4D69  6E73  203D  2030
          50F00  0D0A  436F  6D70  7574  6520  5365  6373  204E
          50F10  000F  0720  3D20  312F  310A  3342  000F  BF73
          50F20  000F  21C0  804D  0D0A  204D  6169  6C20  6361
          50F30  6C6C  2028  3120  5265  6164  2C20  3120  5265
          50F40  6164  2065  000F  1778  7072  6573  732C  2054
          50F50  6F74  616C  2032  290D  0A20  0D0A  4469  6573
          50F60  000F  1673  636F  6E6E  6563  7465  6420  6672
          50F70  6F6D  2053  5953  3532  203A  3232  000F  020D
          50F80  0A33  2F38  000F  BF4C  000F  03C0  8400  1973
          50F90  000F  BF6E  000F  03C0  8E00  3A33  000F  AC39
          50FA0  000F  9F2F  0000  020A  0000  02CF  0000  02C0
          50FB0  000F  001D  0018  7F9A  0599  041C  0000  0063
          50FC0  0000  0000  0000  CC09  4C49  4E43  4F4C  4E31
          50FD0  8D0F  1170  000F  B100  013C  4F66  000F  B103
          50FE0  0131  373A  000F  B102  002F  3033  000F  AD0D
          50FF0  000F  AA6E  000F  A774  000F  010D  000F  B10C
          51000  003D  2030  000F  B10E  0170  7574  000F  016C
          51010  000F  016F  000F  0167  000F  0169  000F  066E
          51020  2062  6163  6B8F  21C0  000F  0175  000F  0170
          51030  000F  010D  000F  B10E  0020  5265  000F  016C
          51040  000F  0169  000F  016E  000F  016B  000F  016E
          51050  000F  0165  000F  0174  000F  010D  000F  0163
          51060  000F  0120  000F  0174  000F  0179  000F  056D
          51070  6E65  7420  000F  010D  000F  0163  000F  0120
          51080  000F  0174  000F  0179  000F  046D  6E65  74C0
          51090  000F  010D  000E  B200  0002  7465  000E  B444
ISIS__TTE.442
          COMMANDS AND DEFINITIONS
          NAD is used to read  and  write  image  binary  files  which
          contain information necessary to load and dump memory images
          for TYMNET ENGINES.  These files  may  also  contain  symbol
          table  and  macro  information  so  that a user may save and
          reconstruct NAD environments for debugging purposes.
               The following is a summary of commands frequently  used
          when working on a XCOM type communication interface.
               ;X<FILE.CMD>   Will cause  subsequent  commands  to  be
                              read  from FILE.CMD.  This is especially
                              useful for assembling a series of files.
               ;;             This command allows comments in  command
                              files   or   at   command   level.   All
                              characters after the ";;" and up to  but
                              not  including  a  carriage  return  are
                              ignored except that they  are  typed  if
                              the  command  is  in a command file.  An
                              example can be found in the  first  four
                              lines of above XCOM slot command fil.
               n[SYMBOL       Sets  the  current  type-out   mode   to
                              magnitude.   It  also opens and displays
                              memory from the current program  counter
                              and leaves the memory open.
               ;@<filename>   Cause an assembly to take  place.   This
                              command is equivalent to ";A".  
               n;P<filename>  A new file, <filename>  is  created  and
                              becomes   the   current  NIB  file.   If
                              <filename> exists and n is equated to 1,
                              the  existing  file  is deleted.  If the
                              file already exists and n is zero or not
                              present,  then  the  user  is  given the
                              option of deleting the existing file  or
ISIS__TTE.442
                              aborting the command.
               ad,cnt;P       This command appends a range  of  memory
                              image data into the NIB file.  ad is the
                              beginning address and cnt  is  the  byte
                              count.   A  typical example in the above
                              slot command file is SEG7,S7SIZE;P where
                              SEG7  is  the  address for segment seven
                              and  S7SIZE  is  the  number  of   bytes
                              assigned for the segment.
               %P             Puts state information and  all  symbols
                              except opcodes on NIB file.
               %Q             Exits NAD to  the  monitor.   Exit  also
                              occurs  if  two  successive  escapes are
                              typed.
               GL             This is a NAD symbol  control  found  in
                              the  slot  command file.  This directive
                              marks a symbol as global to all modules.
               n%F<filename>  An  existing  file  with  the  specified
                              filename  becomes  the current NIB file.
                              If n is 1 (1%F) then new information may
                              be  appended  to the file.  If n is zero
                              or not present then the file may be read
                              from   but   not  written  to.   If  the
                              <filename> does  not  exist,  a  warning
                              comment  is  issued  and  a  new file is
                              opened.
               %G             Get state information  and  all  symbols
                              from  last "%P" record of all symbols on
                              NIB file.
               ;G             Get entire NIB  memory  image  into  NAD
                              local image.
               ;C             This command is  used  to  construct  an
                              auxiliary    circuit.     It    requires
                              additional argument  consisting  of  the
                              username   string,   a   ":",   and  the
                              destination host.
               ;R             This is a hex-relay command used in  the
                              NAD     debugger-DDT     communications.
                              Succeeding pairs of  hexidecimal  digits
                              are   transmitted  as  characters.   The
                              command is  terminated  when  the  first
                              non-digit  is  entered.   An example for
ISIS__TTE.442
                              relaying the slot number to the DDT when
                              logging  into  slot  3  of  a particular
                              machine is ;R03\ where 03 is the desired
                              slot number and \ is the terminator.
               :R Addr,Cnt    Read Engine slot memory  and  print  Cnt
                              bytes    starting   a   location   Addr.
                              Example, :R Crat,4C where  Crat  is  the
                              beginning address of the crash table and
                              4C is the number of bytes in hex  to  be
                              read in the table.
               ::RR Reg,Cnt   Reads contents of Cnt registers starting
                              at Register Reg.  These are the register
                              values  at  the  time  the   last   user
                              instruction  was executed.  Example, ::R
                              R0,0F to read all sixteen  registers  in
                              this slot.
               ::H            Halts the job associated  with  a  slot.
                              This  is  a  fatal command and should be
                              used with discretion.               ::E            Execute the job associated with  a  slot
                              and starts execution independent of DDT.
                              This command initializes all  table  and
                              traces  and  should not be used during a
                              debugging session on a crashed slot.
               ::?HOST        Query host command, the  DDT  outputs  a
                              table  of  host(s)  in use by that slot.
                              Each message  gives  the  relative  host
                              number  for that slot, i.e.  0 being the
                              first relative host number.  It is  then
                              followed  by  the  actual host number in
                              decimal radix and the  number  of  ports
                              configured.   Each message is terminated
                              by one of the four  possible  states  of
                              the host.  It can be gone, down, shut or
                              answered.
               ::?USE         Query  dispatcher  buffer  usage.   This
                              command causes the DDT to output a table
                              of the ports currently  active  and  the
                              maximum  number  of  characters that the
                              dispatcher needed to buffer  because  of
                              full rings in each direction.
               ::?SLOT        This command causes the  DDT  to  output
                              the  current  slot number.  This command
                              should be used  to  ascertain  the  slot
                              connected during initial logon.
ISIS__TTE.442
               ::?Vern        This command causes the  DDT  to  output
                              the ISIS version number, followed by the
                              slot's version.  This command is used to
                              determine  if  the right version of code
                              is loaded.
               ::?HIST        This command causes the DDT to list  all
                              diagnostics  in  the  system  diagnostic
                              queue, starting  with  the  oldest,  are
                              dumped to the terminal making the query.
                              This  command  is  used   to   determine
                              historically  if  and  when the slot was
                              restarted,  crashed   or   reloaded   in
                              days:hours:minutes:seconds.
               ::?PORT        This command causes the DDT to list  the
                              users  of  the  Kernel  ports.  The port
                              sending this query command should have a
                              * adjacent to the port number printed.
               ::?HANG N      From time to time, it  is  necessary  to
                              enter  into  a  slot  which  is  already
                              connected to another kernel port.   This
                              is  likely  to happen when another field
                              consultant is logging into  the  desired
                              slot  without your consent or if the aux
                              circut to  this  slot  was  accidentally
                              broken  previously.   To  re-gain access
                              into   desired   slot,   log   into   an
                              unoccupied  slot  in the same Engine and
                              enter the ::?PORT command  to  find  out
                              the  kernel  port  number other than the
                              one with the * adjacent  to  it.   Enter
                              ::?HANG  N  where  N is the other kernel
                              port number in order to  break  the  aux
                              circuit  for  this  port.   It  is  then
                              possible to re-enter the desired slot by
                              doing  ::^M  where M is the desired slot
                              number.
               ::^M           A command to transfer control  from  the
                              DDT  of  the slot currently logged into,
                              to the slot specified by M as  explained
                              above.

ISIS__TTE.442

               ^Z^Z           A Zap command to log off from the  slot.
                              Where  ^Z  is  control key + key Z.  The
                              second ^Z is a confirmation to  the  DDT
                              of the intention of logging off from the
                              slot.
               :\             This  is  a   NAD-Kernel   communication
                              command     to     recover    from    an
                              unrecognizable command.  It is therefore
                              used effectively to restart a DDT.  
               NUM_           Underscore sets  the  current  type  out
                              mode  to  symbolic  mode.  It is used to
                              determine  the  symbol  associated  with
                              NUM.   Where  NUM  is  a location in the
                              slot.  Example, 1A65A_  gives  TRC010+08
                              which   is  a  location  in  the  Record
                              teardown logic module.
               SYM[           Sets  the  current  type-out   mode   to
                              magnitude  and displays the SYM mnemonic
                              in hex.   Example,  SECN2B[  gives  7310
                              where   SECN2B   is   a  symbol  in  the
                              initialization timer routine.  And  7310
                              is  the  mnemonic  hex representation of
                              LHL,TEMP,,
               Sym]           Sets  the  current  type-out   mode   to
                              instruction   and   displays   the   Sym
                              mnemonic.  Example,  SECN2B]  gives  LHL
                              R1,TEMP,,

                   ISIS SLOT PROGRAMMING
                            Lesson Plan

   Course  :  ISIS Programming                  Date  :
   Lesson  :  Slot Crash Analysis               Course No. TTE.442
   Week  :  2   Day  :  4  Period  :  1         Lesson No. LP241.442

_______________________________________________________________________________

   Objectives :

          To provide tools for the student to be able to dump a slot            
          and to analyze the problem to some extent.

   Materials required :

          Handout on the sample runstream to get a slot dump.
   Course No.   TTE.442      Lesson No.   LP241.442      Page No.

   References   Lesson Plan
_________________________________________________________________________________

                Basically , there are two ways to get the contents of the 
                slot crash information.

                1.  If the engine is still running, but the slot is crashed.
                
                  1. get into the slot with NAD.
                  2. if there is any message printed out upon entering the slot,
                     write it down for later reference.
                  3. do a ::?VERN to get the version number of both the 
                     slot and of ISIS.
                  4. do a ::?HIST to see if the slot has been crashing 
                     frequently in the recent past.
                  5. try to determine what esternal circumstances preceded                     
                     the crash.
                  6. record the results.
                  7. if CRSTOP has been set, dump the slot with LOADII and 
                     restart the slot. always attach the symbol table from the 
                     corresponding NIB file to the dump file soon after
                     the dump is complete.
                  8. if CRSTOP has not been set, look at the crash table.
                  9. if the crash code is 10 (dispatcher crash).
                      1. try to determine the circumstances preceding the
                      crash.
                      2. try to reproduce the crash.
                      3. if the crash cannot be reproduced, enable CRSTOP 
                      and BUFTRC and get a dump of the slot after the next
                      crash.
                  10.if the crash code is 14 (protection violation), or if
                     the crashes occur frequently, see if the cause of the 
                     crash can be determined solely from the crash table.
                     
                     Things that you should be getting from the crash
                     table :
                      1. crash count,
                      2. crash type,
                      3. crash location, specified as a label plus displacement,
                      4. locations of executable code contained in the reg.,
                         specified as a label plus displacement.



                  IF THE SLOT SHOWS NO RESPONSE:
                      ---> user and/or host receives no response,
                      IRING/ORING pointers do not move, even though user/host
                      claims to be sending data,
                      
                      1. get into the slot with NAD.
                      2. if a message is printed out upon entering the slot,
                         write it down for later reference.
                      3. use DDT to check CPU usage to see if the slot is 
                         using an abnormally large amount of CPU. The slot
                         may be caught in a loop.
                      4. check IRING/ORING pointers to see if they are 
                         unequal. If they are unequal and remain so,
                         the code may be caught in a loop.
                      5. check the background and foreground PSD to see if 
                         the address changes. If things are moving slow 
                         enough to see the address change, you've located 	
                         the code area caught in a loop.
                      
                         1. take some sample readings of the PSD that is 
                         moving and determine the locations (label plus
                         displacement) to which they refer.
                         
                         2. go to the appropriate source listing and examine 
                         the area of code that is having the problems. 
                         Try to determine what could be causing the code to 
                         loop.
                         
                         3. submit your findings to your tech sup. rep.
                         
                         
                         
                         Example:
                         
                         -R LOADII
                         
                         NODE LOADER VERSION- 2.11
                         ENTER FUNCTION:G
                         ENTER GATEWAY HOST:xxx
                         ENTER PASSWORD FOR EXTERNAL NET:
                         
                         ENTER FUNCTION:U
                         ENTER KERNEL HOST NUMBER:yyy
                         CIRCUIT BUILT
                         ENTER SLOT NUMBER:z
                         ENTER FILE FOR SLOT:aabbbb.D0z
                         
                         READING FROM ADDRESS:E0000 BYTES=    326
                         *
                         READING FROM ADDRESS:00000 BYTES=  13784
                         **********************************
                         READING FROM ADDRESS:10000 BYTES=  23588
                         ************************************************
                         READING FROM ADDRESS:20000 BYTES=  15492
                         **************************************
                         READING FROM ADDRESS:30000 BYTES=   3072
                         *******
                         SLOT DUMP COMPLETE
                         
                         EXIT






                        Get into NAD and do the following:
                        
                        -R NAD
                        062382
                        %F    aabbbb.N0z
                        
                        %G
                        %F    aabbbb.D0z
                        
                        ;G
                        
                        Data ranges read:
                        0-35D7 10000-15C23 20000-23C83 30000-30BFF 0E0000-0E0145
                        
                        ORING[   2C
                        ORING+2\    0A09B
                        ORING+4\    2C
                        
                        ORING,ORING+ORSIZE[
                        
                        
                        8%2
                        
                        ORING,ORING+ORSIZE[
                        2C  A09B    2C  A19B  2C A0D3  2C A1C2
                        2C  A0CF    2C  A1C4  2C  1B2  24  18D
                        |
                        |
                        |
                        (until the end of ORING)
                        
                        
   Crash Codes From ISIS Crash Library
   -----------------------------------
   
   14  -  Protection violation
   13  -  System crash
   12  -  Illegal SVC
   11  -  Illegal instruction
   10  -  Dispatcher crash
   01  -  Manual start
   00  -  Power failure
   
   
   Crash Codes From BUFFER Library
   -------------------------------
   
   0D  -  Buffer no. out of range on entry to *EMPTY*
   06  -  Unreasonably fast storage drain of buffer
   05  -  Buffer no. out of range on entry to *WCI*
   04  -  Buffer no. out of range on entry to *MCI*
   03  -  Buffer no. out of range on entry to *GCI* or buffer empty
;;  UPDATED  20-OCT-82 TR2040 ISIS-II T-II RLV
;@(SOURCE)I2IS05.I02
;@TR2072.TYM
;@(TRAINLAB)TRAIN.GGY
;@(SOURCE)I2IS05.R02
;@(SOURCE)I2T205.R02
;@(SOURCE)I2IG05.R02
1;FTR2072.NIB
70;T0,CRCT;PINTLEN,IEND-INTLEN;P%PSEGF,SFSIZE;P%Q
:***********************************************************************
: NOTE: TYM-II .TYM FILE NEIGHBOR LISTINGS DO NOT REPRESENT PHYSICAL
: PORT ORDER.  DO SYNPRT (PROBE) FOR PHYSICAL PORT LOCATION.
:***********************************************************************



:               HARDWARE CONFIGURATION
ENGINE  EQ      1               :  1 IF HARDWARE IS TYMNET ENGINE
MICRO   EQ      2               :* ENHANCED SYNC/ASYNC
ZITEL	EQ	0		:* 1 IF ZITEL MAC (MAC II)
BAUDR	EQ	0		:* 2 IF HIGH SPEED INTERRUPTS
NASYNG  EQ      8               :4 ASYNC GROUPS (2 CARDS)
N.ADA   EQ      1               :NEW DEVICE ADDRESSES FOR ASYNC
NPRINT  EQ      0               :2 PRINTERS
XSYNC   EQ      0               :USED TO DEFINE AN EXTRA SYNC CARD
NDISC	EQ	0		:0 DISC DRIVES
NTAPE   EQ	0               :1 TAPE DRIVE
LBOOT	EQ	1		:* 1 IF SPACE SET ASIDE FOR BOOT PROGRAM
MSCDSK	EQ	0		:ONE MSC DISK CONTROLLER
M.NCARD EQ      0

:               ISIS CONFIGURATION CONSTRAINTS
NSLOT	EQ	$A 8		:  NO. OF SLOTS TO CONNECT
NLU	EQ	$A 3		:  MAX. NO. OF LOGICAL UNITS/SLOT

NLINES  EQ      $A 2		:  NO. OF LINKS (MUST BE.LE.NLUS0)
ASYNEW	EQ	1		:* 1 FOR NEW+OLD. 2 FOR NEW ASYNC DRIVER ONLY
CONSAT	EQ	1		:* 1 FOR CONSAT IN MACHINE
R1DOWN	EQ	1		:* ENABLE R1DOWN MESSAGES
MEMRMK	EQ	1		:* IF 1 PRINT NODE CODE SIZE
NXUBLK	EQ	3		: NUMBER XRAY USERS

	: OPTION MACRO
	:
	:BFTR - BUFFER TRACE OPTION
	:BUBB - BUBBNET BUBBLE OPTION
	:CIRD - XRAY CIRCUIT TRACE DISPLAY
	:DBUG - GENERAL DEBUG OPTION
	:NBTH - GO TO BOOT ON HARDWARE CRASH
	:NBTS - GO TO BOOT ON SOFTWARE CRASH
	:NHTH - HALT NODE ON HARDWARE CRASH
	:NHTS - HALT NODE ON SOFTWARE CRASH
	:NRSH - RESTART ON HARDWARE CRASH (RESTART)
	:NRSS - RESTART ON SOFTWARE CRASH (RESTART)
	:NSTH - STOP NODE CODE BUT RUN XRAY ON HARDWARE CRASH
	:NSTS - STOP NODE CODE BUT RUN XRAY ON SOFTWARE CRASH
	:OALL - SET ALL OPTIONS
	:TLEV - TRACE LINE EVENT OPTION
	:UTRC - UPSW JUMP TRACE OPTION

	OPTION(BFTR,TLEV,UTRC)

:               NETWORK CONFIGURATION

	TIILNK(2001,8,8)

SILINS  EQ   $A 0		:NUMBER OF SIO LINES FOR NODE CODE
XLINKS  EQ   $A 2		:WILD CARD ASSIGNMENT-2

:       SLOT 0 --- THE NODE CODE
S0CORE  EQ      $A 160
NLUS0   EQ      $A 2
S0L0    S.REF(0)
S0L1    S.REF(1)

:       SLOT 1 - LAB GROUP 1
S1CORE	EQ	$A 24		:SL0T 1 KB CORE SIZE
NLUS1   EQ      $A 2		:SLOT 1 LOGICAL UNIT CNT
Q.BG1   EQ      $A 10
S1L0    S.REF(8)
S1L1    A.REF(0)

:       SLOT 2 - LAB GROUP 2
S2CORE  EQ      $A 24
NLUS2   EQ      $A 2
Q.BG2   EQ      $A 10
S2L0    S.REF(9)
S2L1    A.REF(1)

:       SLOT 3 - LAB GROUP 3
S3CORE  EQ      $A 24
NLUS3   EQ      2
Q.BG3   EQ      $A 10
S3L0	S.REF(10)
S3L1	A.REF(2)

:       SLOT 4 - LAB GROUP 4
S4CORE  EQ      $A 24
NLUS4   EQ      2
Q.BG4   EQ      $A 10
S4L0    S.REF(11)
S4L1    A.REF(3)

:       SLOT 5 - LAB GROUP 5
S5CORE  EQ      $A 24
NLUS5   EQ      2
Q.BG5   EQ      $A 10
S5L0	S.REF(12)
S5L1	A.REF(4)

:       SLOT 6 - LAB GROUP 6
S6CORE  EQ      $A 24
NLUS6   EQ      2
Q.BG6   EQ      $A 10
S6L0	S.REF(13)
S6L1	A.REF(5)

:       SLOT 7 - LAB GROUP 7
S7CORE  EQ      $A 24
NLUS7   EQ      2
Q.BG7   EQ      $A 10
S7L0	S.REF(14)
S7L1	A.REF(6)

:       SLOT 8 - LAB GROUP 8
S8CORE  EQ      $A 24
NLUS8   EQ      2
Q.BG8   EQ      $A 10
S8L0	S.REF(15)
S8L1	A.REF(7)

	END
;;  UPDATED 20-OCT-82 TR2040 ISIS-II T-II RLV
;@(SOURCE)TII004.I04
;@TR2040.TYM
;@(SOURCE)T2FILE.CMD
;@(SOURCE)TII004.R04
1;FTR2040.N00
;X(SOURCE)TIII04.WRT
    @\ê