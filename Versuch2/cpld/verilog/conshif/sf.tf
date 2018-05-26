
`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module sf();
// Define Input and Output variables

reg clk,ld,rst;
reg [3:0] a;
wire [3:0] d;

// call shift block

shift UUT ( .clk(clk), .ld(ld), .rst(rst), .a(a), .d(d) );


  initial begin   // 'clk'
   clk=1;    
   forever #20 clk = !clk; 
    
  end  // clk
  initial begin  // 'reset'
    rst=0;
  #2 rst=1;
  #50 rst=0;
  #2000 rst=0; 
  end  // 'reset'
  initial begin   // 'load'
     ld=0;
      # 40 ld=1;
      # 50 ld=0;   
      #20000 ld = 0; 
  end  // load

  initial begin   // 'data'
   a = 'h1;    
  end  // data
  initial begin
//show on the ModelSim console   
  $monitor("time %d,clk=%b,rst=%b,ld=%b,a=%h,   d=%h",$time,clk,rst,ld,a,d);
  end

endmodule // sf
