
 NOPRINT

 BEGINTYM

 MSIOTP(M.TYP1)

 TIMEZONE(0)

 FREEZE(YES)

 GROUP

        SECONDARY
        VTAM(NO)

        HOST(299)

        LINE(0)

                DSIOTP(D.TYP1)
                SWITCHED(NO)
                RTSCTS(NO)

                        PU(0)
                        ADDR(040)


GROUP

        PRIMARY

:        HOST(1018)

        LINE(1)

                LGN.USER(dnsonly)
                LGN.PASSWORD(pno drugs)
                LGN.HOST(299)

                DSIOTP(D.TYP1)
                SWITCHED(NO)
                RTSCTS(NO)

                        PU(0)
                        ADDR(040)
                        LGN.MAPADDR(040)
                        LGN.HOST(1017)
                        LGN.DLINE(00)


 MONITOR(1019)
        MPORTS(02)
        MUSR.TBL(04)
        MGOODGUY(ISISTECH)
        MGOODGUY(GATEWAY)
        MGOODGUY(DLOAD)


 ENDTYM

 