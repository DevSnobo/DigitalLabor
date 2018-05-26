//4 bit cycle right shifter
module shift(d,a,clk,rst,ld);
input[3:0] a;
input clk,rst,ld;
output[3:0] d;
reg[3:0] d;
  
always @(posedge clk or posedge rst)
     begin
	if (rst)
            d = 4'b0000;
        else if (ld)
             	d = a;
             else
                d = {d[0],d[3:1]};
       end
endmodule

