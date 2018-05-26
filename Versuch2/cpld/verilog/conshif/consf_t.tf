
`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module consf_t(); 

`include "conshif.tfi"

  initial begin   // 'clk'
 
              clk=0;
           #1 clk=1; 
   forever #20 clk = !clk; 
    
  end  // clk
  initial begin  // 'reset'

          xrst=0;
   #3     xrst=1;
   #15    xrst=0;
   #20000 xrst=0;

  end // reset
  initial begin   // 'load'

          ld=0;
   #30    ld=1;
   #15    ld=0;   
   #100   ld=1;
   #20    ld=0;
   #180   ld=1;
   #20    ld=0; 
   #30000 ld = 0; 

  end  // load

  initial begin   // 'data'
          a0 = 1'b0;
          a1 = 1'b1; 
          a2 = 1'b1; 
          a3 = 1'b0; 
   #200   a0=1'b0;
   #200   a1=1'b1;
   #200   a2=1'b0;
   #200   a3=1'b1;
   #200   a0=1'b0;
   #200   a1=1'b0;
   #200   a2=1'b0;
   #200   a3=1'b1;
   #200   a0=1'b1; 
   #200   a1=1'b1; 
   #200   a2=1'b1; 
   #200   a3=1'b0; 
   #20000   a0=1'b0; 
   #20000   a1=1'b1; 
   #20000   a2=1'b1; 
   #20000   a3=1'b0; 
  
  end  // data

endmodule // consf_t

