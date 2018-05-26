// 32-bit Data Exchange from A-bus/C-bus to B-bus/D-bus;
// dataA0 to dataA31 are A-bus bidirectional signals;
// dataB0 to dataB31 are B-bus bidirectional signals;
// dataC0 to dataC31 are C-bus bidirectional signals;
// dataD0 to dataD31 are D-bus bidirectional signals;
// oe0 is an enable signal that controls A-bus and B-bus;
// oe1 is an enable signal that controls C-bus and D-bus;
// Data goes from A-bus to B-bus if oe0 is low (0);
// Data goes from B-bus to A-bus if oe0 is high (1);
// Data goes from C-bus to D-bus if oe1 is low (0);
// Data goes from D-bus to C-bus if oe1 is high (1);
// Fitted to ispGDX160A-5Q208

module dataexch( busAdata, busBdata, busCdata, busDdata, oe0,oe1);
inout [31:0] busAdata /*synthesis LOC = "P2,P3,P4,P5,P7,P8,P9,P10,P11,P12,P13,P14,P16,P18,P19,P20,P21,P22,P23,P24,P26,P27,P28,P29,P30,P31,P32,P34,P36,P37,P38,P39"*/;
inout [31:0] busBdata;
inout [31:0] busCdata /*synthesis PULL = "UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP" */;
inout [31:0] busDdata;
input oe0, oe1;
//exemplar attribute busAdata LOC P2,P3,P4,P5,P7,P8,P9,P10,P11,P12,P13,P14,P16,P18,P19,P20,P21,P22,P23,P24,P26,P27,P28,P29,P30,P31,P32,P34,P36,P37,P38,P39
//exemplar attribute busBdata PULL UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP

assign busAdata = oe0 ? busBdata : 32'bz;
assign busBdata = ~oe0 ? busAdata : 32'bz;
assign busCdata = oe1 ? busDdata : 32'bz;
assign busDdata = ~oe1 ? busCdata : 32'bz;

endmodule
