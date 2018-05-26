module multiplexer4to1(value,ld,select,z);

reg [3:0] data;
input[3:0] value;
input ld;
input [1:0] select;
output z;


always @ (posedge ld) 
 	data= value;

assign z= data[select];


endmodule

