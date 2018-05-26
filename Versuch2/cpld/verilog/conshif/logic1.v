module logic1(b1,d0,d1,d2,d3);

input d0,d1,d2,d3;
wire out1,out2;
output b1;
//call sub_module logic11 and logic12 
user_nor2 u11(out1,d0,d1);
user_and2 u12(out2,d2,d3);

assign b1= out1 & out2;


endmodule

