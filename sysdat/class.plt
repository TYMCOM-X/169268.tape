o (fjavadi)vh (msbig)ckts2.
init 1 TWO.lin.
init 2 TWO.nod.
define integer tempv.
define integer temph.
    dpl start.        
    dbset 2.
     F H1 GT 0 AND H2 GT 0 AND V1 GT 0 AND V2 GT 0.
      sort by site1 site2.
     let store1 eq 0.
     let store2 eq 0.

osearch class1 eq 2.
search  bndw eq 56kb.
search site1 ne site2.

start1: getrec nodes.

inter1: if site1 ne store1 then print1.
       if site2 ne store2 then print1.
       drop.
       goto start1.

print1: print on 1 site1 site2 bndw format 2(i10 1x) a5 end.
        let store2 eq site2.
        if site1 ne store1 then drptst.
        drop.
        goto start1.
drptst: let store1 eq site1.
       goto start1.

nodes: f last.
       sort by site1.
start: getrec finish.
       map to 1 via npa1 to npa and via nxx1 to nxx.
       let tempv eq v.
       let temph eq h.
       dbset 2. 
       print on 2 site1 tempv temph site1 &
       format i10 1x 2(i5 1x) 4x i4 1x end.  
       goto start.

finish: dpl stop.
        dpl end. 