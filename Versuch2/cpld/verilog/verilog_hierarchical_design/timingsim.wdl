%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 9;
%AUTOASSIGN      = 1;
%DECIMALS        = 0;
%ENDTIME         = 100000;
a[7:0] { A In Default None 0 1 50 } = 1 50000 2 50000 3 50000
   4 50000 5 50000 6 50000 7 40000;
b[7:0] { A In Default None 0 1 50 } = 8 50000 9 51000 a 49000
   b 50000 c 50000 d 50000 e 40000;
q[7:0] { A Out Default None 0 1 50 } = ;
sel { A In Default None 0 1 50 } = 1 160000 0 159000 1 21000;
clk { A In Default None 0 1 50 } = (0 5000 1 5000)#32  0 5000
   1 5000 0 5000 1 5000;
r_l { A In Default None 0 1 50 } = 1 80000 0 80000 1 160000 0 20000
  ;
rst { A In Default None 0 1 50 } = 1 17500 0 303000 1 10000 0 10000
  ;
