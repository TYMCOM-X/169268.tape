

*************************
*                       *
*       TYMNET PIR      *
*        Project        *
*       Initiation      *
*        Request        *
*                       *
*************************







PIR NAME:  TYMNET ENGINE STANDALONE DIAGNOSTIC ENHANCEMENTS

PIR REQUEST DATE:  18-JAN-88
DESIRED PIR RESPONSE DATE:  29-FEB-88
DESIRED PIR IMPLEMENTATION DATE:  31-MARCH-88
PRODUCT(S) AFFECTED/PRODUCT NAME:  SUPERVISOR ENGINE
                                   STANDARD ENGINE
                                   MINI  ENGINE
                                   MICRO ENGINE II
                                   MICRO ENGINE IV
                                   PICO  ENGINE
                                   TSI

REQUESTOR NAME:  T.C. KOCHMANN
REQUESTOR PHONE NUMBER:  408/922-7493
REQUESTOR ONTYME NAME:  EMSQSATS;QSATS.T/KOCHMANN
REQUESTING DIVISION NAME:  NETWORK SYSTEMS
REQUESTING DEPT NAME:  NTS
REQUESTING DEPT COST CODE:  2603

PRODUCT MANAGER NAME:  N/A

CLIENT NAME:  TYMNET

PIR DESCRIPTION:

    Engine diagnostics to be implemented on 1/2 Meg  PROM interface
    board  which can be loaded  into target memory via  a local TTY
    asynchronous  port.   The PROM interface  board  would  ideally
    utilize the popular Model 60 EIA interface monitor and breakout
    box AC Adapter/Charger common to nearly all Tymnet FE tool kits
    for a power source.   Async baud rates should be selectable via
    an on-board dip switch array for either 1200, 4800 or 9600 baud.
    Another dip switch array would permit selection of the specific
    diagnostic to be loaded. The diagnostics which should reside on
    the board are the CPU, MAC, MEM, REL, SYN, SYA and SIO programs.

PIR PURPOSE:

    Engine diagnostics will be available to  the field  engineering
    personnel for testing Tymnet products with a minimal  impact to
    customer facilities and  resources.   Very few  field engineers
    have a PC available for loading diagnostic code from and  often
    inconvience customers while calling  in on  the customer phones
    for code to be down-line-loaded over and  over  for the various
    diagnostics which takes considerable amounts of "down" time and
    presumes a significant amount of hardware is functional to even
    permit the execution of the boot and the I/O for the down-line-
    loading.  

REVENUE OR COST IMPACT:

    Diagnostic programs will require minimal modification to be PROM
    based.   The interface  board should cost less than $ 100.00 for
    the PC board and components.  Development time to map the logics
    for the interface will be minimal.  UV erasable 256K PROMs which
    can be reprogrammed in the event of diagnostics upgrades  should
    insure that no additional costs will be incurred to support  the
    interface board in the future.

PIR IMPACT:

    The diagnostic interface board will have immediate impact in the
    field.  It will accelerate field repair times and help the field
    engineer present a more competent image of Tymnet  to customers.
    The diagnostic interface board could be released to the field as
    the Picoengine and the TSI products are being deployed to field.
    Both products incorporate the TTY load facility  which  could be
    utilized to bring up and debug the initial installations of  the
    new products helping to present a positive  efficient  image  to
    the market place.  Being TTY loadable allows the interface to be
    used with the current base of Tymnet products in the field  with
    no additional costs.

MARKETING COMMENTS:

    Diagnostics on  PROM will make support of the TSI, PICO and most
    of the existing engines easier to support by the  field  service
    personnel. Additonally,manufacturing and repair technicians will
    be able to load units under test quickly without having  to have
    access to the network or a PC (which still costs several hundred
    dollars).   The diagnostic interface board can be utilized any -
    where in the world  regardless  of  being in a private or public
    network.

ADDENDA:

    The EIA brakout box AC Adapter/charger outputs  18.2 VDC @ 75 ma
    which could be used to charge an  on-board  rechargable  battery
    whose output could be used to provide RS-232C level voltages for
    the asynchronous TTY driver and divided down to provide TTL level
    voltages as well.
    **********************DIAGNOSTIC PROGRAMSIZE*********************

     PROGRAM                     PROGRAM
      NAME                         SIZE

(SOURCE) DMAC07.R00         11C82x = 72,834d
(SOURCE) DCPU04.R00         124F8x = 75,000d
(SOURCE) DMEM04.R00         0D4EEx = 54,510d
(SOURCE) DREL02.R00         132D0x = 78,544d
(SOURCE) DSYA05.R01         02658x =  9,816d
(SOURCE) DSYN03.R00         0CEBEx = 52,926d
(XXXXXX) DSIO0X.RXX         1DFBAx =122,810d *** UNDER DEVELOPMENT

APPROXIMATE PROM REQUIRED:  71E04x =466,440d

1/2 MEG OF PROM (524,287) should be adequate for diag storage, overhead
and expansion of diag code

Disk and Tape diags require approximately 1/2 MEG of storage and are not
as fundamentally essential to the bring up and debug of the standard
engine as are the CPU, MEM, MAC and I/O diagnostics.

(SOURCE) DISK03.R01         0C674x = 50,804d
(SOURCE) DMSC04.R00         7F126x =520,486d
(SOURCE) DTAP01.R01         06B97x = 27,543d

              TOTAL         92331x  =598,833d

  