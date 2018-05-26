
`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module ct();
//Define input and output variables 
reg clk, rst;
wire [2:0] c;
reg[2:0] dd;
// Call count block

count UUT ( .clk(clk), .rst(rst), .c(c) );

// Code for all top level Inputs 

  initial begin   // 'clk'
               clk=0;
           #1  clk=1;    
   forever #20 clk = !clk; 
    
  end  // clk

  initial begin   // 'load'
          rst=0;
        # 5 rst=1;
        #30 rst=0;   
        #20000 rst = 0;
    

 end  // load
  initial begin
//show in ModelSim console 
     $monitor ("at time %d  clk=%b  rst=%b  c=%b  ",$time,clk,rst,c); 
//set output result    
            dd='b000;
        #41 dd='b001;
        #40 dd='b010;
        #40 dd='b011;
        #40 dd='b100;
        #40 dd='b101;
        #40 dd='b110;
        #40 dd='b111;
        #40 dd='b000;
        #40 dd='b001;
        #40 dd='b010;
        #40 dd='b011;
        #40 dd='b100;
        #40 dd='b101;
        #40 dd='b110;
        #40 dd='b111;
        #40 dd='b000;
        #40 dd='b001;
        #40 dd='b010;
        #40 dd='b011;
        #40 dd='b100;
        #40 dd='b101;
        #40 dd='b110;
        #40 dd='b111;
        #40 dd='b000;
        #40 dd='b001;
        #40 dd='b010;
        #40 dd='b011;
        #40 dd='b100;
        #40 dd='b101;
        #40 dd='b110;
        #40 dd='b111;
        #40 dd='b000;
        #40 dd='b001;
        #40 dd='b010;
        #40 dd='b011;
        #40 dd='b100;
        #40 dd='b101;
        #40 dd='b110;
        #40 dd='b111;
        #40 dd='b000;
        #40 dd='b001;
        #40 dd='b010;
        #40 dd='b011;
        #40 dd='b100;
        #40 dd='b101;
        #40 dd='b110;
        #40 dd='b111;
          
   
end 
always @(posedge clk)
     begin 
// compare and check output result 
      
#1      if (dd == c)
       $display ("successfully!!! c=%b",c);
      else 
       $display ("error !!! c=%b", c);
    end


endmodule // ct
