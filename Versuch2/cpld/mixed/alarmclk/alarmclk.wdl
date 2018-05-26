%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 9;
%AUTOASSIGN      = 0;
%DECIMALS        = 0;
%ENDTIME         = 1000;
clock { Z In Default None 0 1 50 } = (0 20 1 20)#25 ;
ld_new_alrm_time { Z In Default None 0 1 50 } = 0 203 1 37 0 760
  ;
ld_new_clk_time { Z In Default None 0 1 50 } = 0 603 1 37 0 360
  ;
new_alrm_time[3:0] { Z In Default None 0 1 50 } = 0 203 b 797
  ;
new_clk_time[3:0] { Z In Default None 0 1 50 } = 0 603 8 397;
reset { Z In Default None 0 1 50 } = 1 10 0 990;
showalrm { Z In Default None 0 1 50 } = 0 220 1 40 0 740;
display[3:0] { Z Out Default None 0 1 50 } = ;
sound_alrm { Z Out Default None 0 1 50 } = ;
