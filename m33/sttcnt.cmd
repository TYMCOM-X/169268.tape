0005�	commod:
    0010�	%%pat!skipa p4,. 1
  0020�	-bpaun,,unttbl
  0030�	setz p1,
   0040�	loop:%%fet t1,(p4)
   0050�	%%end
 0060�	%%fet p2,unistt(t1)
  0070�	%%end
 0080�	jumpe p2,%%pat+40
    0090�	%%fet t2,unippu(t1)
  0100�	%%end
 0110�	%%fet t3,unip4s(t1)
  0120�	%%end
 0130�	andi t3,17777
   0140�	sub t2,t3
  0150�	idivi t2,unvrsf
 0160�	%%fet t3,unispu(t1)
  0170�	%%end
 0180�	hlrzs t3
   0190�	andi t3,377
0200�	imuli t2,t3
0210�	sub p1,t2
  0220�	nstt:%%fet t1,sttptr(p2)
  0230�	%%end
 0240�	jumpe t1,%%pat+40
    0250�	%%fet t1,sttfpc(p2)
  0260�	%%end
                0270�	add p1,t1
  0280�	addi p2,sttlen
  0290�	jrst nstt
  0300�	%%pat+40!aobjn p4,loop
    0310�	%%fet t1,strddb+strtal
    0320�	%%end
 0330�	sub p1,t1
  0340�	outchi ">
 0350�	%%end
 