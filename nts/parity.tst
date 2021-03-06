
This program will test memory with parity enabled. Enter the program as
follows:

addr.   data

00000   100445  START           EXC     0445    enable parity
00001   005002                  TXB             zero the B register
00002   030032                  LDX     ADR     Load starting memory address
00003   065000                  STB     1,0     store data
00004   025000                  LDB     1,0     load data
00005   005144                  IXR             increment address
00006   005041                  TXA             transfer X to A
00007   130027                  ERA     MAX     test max address
00010   001010                  JAZ     START+2 jump to reload address
00011   000002
00012   005122                  IBR             increment data
00013   001000                  JMP     START+3 jump to start next cycle
00014   000003  
00015   000000  MARK            0               start of interrupt service
00016   100545                  EXC     0545    disable parity
00017   005041                  TXA             transfer X to A
00020   103177                  OAR     077     output address to front panel
00021   001100                  JSS1    HLT     jump if SS1 to halt
00022   000033  
00023   100445                  EXC     0445    enable parity
00024   001000                  JMP*    START+3 jump to continue test
00025   100015
00026   005000                  NOP
00027   037777  MAX             37777           maximum memory address
00030   002000  PINT            JMPM    MARK    jump and mark tto interrupt
00031   000015                                  routine
00032   000034  ADR             34              starting memory address
00033   000007  HLT             HLT     7       halt on parity error

Note: Location 27 should be set to the top of memory as listed below;
37777   16K
57777   24K
77777   32K
To execute the program;
a. Set program counter (P) to 0
b. Press system reset (RESET)
c. Go to step/run (flashing run)
d. Press START

The program will continously cycle through memory. If a parity error is 
encountered, the data address will be displayed. If sense switch 1 (SS1) is 
set, the program will halt on error with the X register containing the data
address. If SS1 is reset the program will display the data address and then
continue the test. When the processor halts (SS1 and parity error) read
memory location 00015, it will contain the address plus 1 of the instruction
being executed at the time of the parity error. If location 00015 is other
than 5, the instruction being executed had the parity error. If location 00015 
equals 5 then the data was in error and the error address is in the X register.
 