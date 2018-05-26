%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 12;
%AUTOASSIGN      = 1;
%DECIMALS        = 0;
%ENDTIME         = 100000;
a[7:0] { A In Default None 0 1 50 } = 1 10000 2 9500 3 10000 4 10500
   5 10000 6 10000 7 10000 8 10500 9 9500 a 10000;
b[7:0] { A In Default None 0 1 50 } = 6 10000 7 9500 8 10500 9 10000
   a 10000 b 10000 c 10000 d 10000 e 10000 f 9500;
sel { A In Default None 0 1 50 } = 1 50000 0 50000;
out[7:0] { A Out Default None 0 1 50 } = ;
