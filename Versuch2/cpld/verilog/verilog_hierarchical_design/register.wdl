%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 9;
%AUTOASSIGN      = 1;
%DECIMALS        = 1;
%ENDTIME         = 100000;
rst { A In Default None 0 1 50 } = 1 25000 0 105500;
clk { A In Default None 0 1 50 } = (1 6800 0 6800)#10 ;
data[7:0] { A In Default None 0 1 50 } = 1 10000 2 10500 3 9500
   4 10000 5 10000 6 10000 7 10000 8 10000 9 9600 a 9400 b 10000
   c 10500 d 9500;
q[7:0] { A Out Default None 0 1 50 } = ;
