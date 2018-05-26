`timescale 1ns / 10ps

/** The following steps are required to use OSCTIMER functions in Verilog.
   Step 1. OSCTIMER parameter definition
   Step 2. OSCTIMER block instantiation
   Step 3. Use of OSCTIMER outputs **/

module osc_pg_vlog(in0, in1, rst, tmr_rst, osc_dis0, osc_dis1, out0, out1, DX, Enable, QX);

input [3:0] DX;
input Enable;
output [3:0] QX;
wire [3:0] Q_REG;
reg [3:0] QX;

input 		rst, tmr_rst, osc_dis0, osc_dis1;
input		in0, in1;
output 	 	out0, out1;
reg		out0, out1;

/** Step 1. OSCTIMER parameter definition **/
defparam I1.TIMER_DIV = "128";

/** Step 2. OSCTIMER block instantiation **/
OSCTIMER I1 (.DYNOSCDIS(osc_dis), .TIMERRES(tmr_rst), .OSCOUT(osc_clk), .TIMEROUT(tmr_clk));

pg_bus I11 (.d(DX), .e(Enable),	.q(Q_REG));

assign osc_dis = osc_dis0 & osc_dis1;

/** Step 3. Use of OSCTIMER outputs **/
always@(posedge osc_clk or posedge rst)
    if(rst)
	out0 <= 1'b0;
    else
	out0 <= out0 + 1;

always@(posedge osc_clk or posedge rst)
    if(rst)
	QX <= "0000";
    else
	QX <= Q_REG;


always@(posedge tmr_clk or posedge rst) 
    if(rst)
	out1 <= 1'b0;
    else
	out1 <= in1 & in0;

endmodule


module pg_bus (d,e,q);
	parameter size = 4;
	input [size-1:0] d;
	input e;
	output [size-1:0] q;

  genvar i;

  generate
  for (i=0; i < 4; i=i+1) 
    begin : 
	PG_BUS PG BUS11 (
	.D(d[i]), 
	.E(e), 
	.Q(q[i]));
    end
  endgenerate
endmodule










