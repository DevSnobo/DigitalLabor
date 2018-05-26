%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 9;
%AUTOASSIGN      = 1;
%DECIMALS        = 0;
%ENDTIME         = 100000;
clk { A In Default None 0 1 50 } = (0 5000 1 5000)#32  0 5000
   1 5000 0 5000 1 5000;
r_l { A In Default None 0 1 50 } = 1 80000 0 80000 1 160000 0 20000
  ;
rst { A In Default None 0 1 50 } = 1 17500 0 303000 1 10000 0 10000
  ;
data[7:0] { A In Default None 0 1 50 } = 1 5500 2 12500 3 17000
   4 16500 5 13000 f6 22000 a 23000 b 40500 c 11000 7 28500 a8 26500
   d 22000 e 46500 f 19000 10 17000 aa 20000;
q[7:0] { A Out Default None 0 1 50 } = ;
