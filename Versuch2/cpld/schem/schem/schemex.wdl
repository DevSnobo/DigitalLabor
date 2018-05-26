%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 6;
%AUTOASSIGN      = 1;
%DECIMALS        = 1;
%ENDTIME         = 360;
clka { A In Default None 0 1 50 } = 0 1(0 1 0 1 0 1)(0 1 1 1 0 1
  )#100 (0 1 1 1 0 1)#3 (0 1 1 1 0 1)#3 (0 1 1 1 0 1)#3 (0 1 1 1
   0 1)#3 ;
regclk { A In Default None 0 1 50 } = 0 1(0 1 1 1 0 1)(0 1 0 1
   0 1)#100 (0 1 0 1 0 1)#3 (0 1 0 1 0 1)#3 (0 1 0 1 0 1)#3 (0 1
   1 1 0 1)#3 ;
count { A In Default None 0 1 50 } = 1 1(1 1 1 1 1 1)(1 1 1 1
   1 1)#100 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (1 1
   1 1 1 1)#3 ;
hold { A In Default None 0 1 50 } = 0 1(0 1 0 1 0 1)(0 1 0 1 0 1
  )#100 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (0 1 0 1 0 1)#3 (0 1 0 1
   0 1)#3 ;
ext_reset { A In Default None 0 1 50 } = 1 1(0 1 0 1 0 1)(0 1
   0 1 0 1)#100 (0 1 0 1 0 1)#3 (1 1 1 1 1 1)#3 (0 1 0 1 0 1)#3 
  (0 1 0 1 0 1)#3 ;
logic_enable { A In Default None 0 1 50 } = 0 1(0 1 0 1 0 1)(1 1
   1 1 1 1)#100 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 
  (1 1 1 1 1 1)#3 ;
sel3 { A In Default None 0 1 50 } = 0 1(0 1 0 1 0 1)(0 1 0 1 0 1
  )#100 (0 1 0 1 0 1)#3 (0 1 0 1 0 1)#3 (0 1 0 1 0 1)#3 (0 1 0 1
   0 1)#3 ;
sel2 { A In Default None 0 1 50 } = 0 1(0 1 0 1 0 1)(0 1 0 1 0 1
  )#100 (0 1 0 1 0 1)#3 (0 1 0 1 0 1)#3 (0 1 0 1 0 1)#3 (0 1 0 1
   0 1)#3 ;
sel1 { A In Default None 0 1 50 } = 1 1(1 1 1 1 1 1)(1 1 1 1 1 1
  )#100 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (1 1 1 1
   1 1)#3 ;
sel0 { A In Default None 0 1 50 } = 1 1(1 1 1 1 1 1)(1 1 1 1 1 1
  )#100 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (1 1 1 1 1 1)#3 (0 1 0 1
   0 1)#3 ;
bit11 { A Out Default None 0 1 50 } = ;
bit10 { A Out Default None 0 1 50 } = ;
bit9 { A Out Default None 0 1 50 } = ;
bit8 { A Out Default None 0 1 50 } = ;
bit7 { A Out Default None 0 1 50 } = ;
bit6 { A Out Default None 0 1 50 } = ;
bit5 { A Out Default None 0 1 50 } = ;
bit4 { A Out Default None 0 1 50 } = ;
bit3 { A Out Default None 0 1 50 } = ;
bit2 { A Out Default None 0 1 50 } = ;
bit1 { A Out Default None 0 1 50 } = ;
bit0 { A Out Default None 0 1 50 } = ;
