      SUBROUTINE QQSYSI(IRAY)                                               7. 2
      DIMENSION IRAY(13)                                                    7. 2
      DIMENSION ID(3)                                                       7. 2
      DATA ICHEK/7047202 /                                                  7. 2
      DATA INSTNO /102 /                                                    7. 2
      DATA LID,ID /10,5H TYMS,5HHARE ,5H      /                             7. 2
      IRAY(1)=ICHEK                                                         7. 2
      IRAY(2)=INSTNO                                                        7. 2
      IRAY(3)=LID                                                           7. 2
      CALL QQMVC(ID,1,IRAY(4),1,LID)                                        7. 2
      RETURN                                                                7. 2
      END                                                                   7. 2
 