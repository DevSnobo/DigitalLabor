// 16-bit Data Exchange from A-bus to B-bus;
// dataA0 to dataA15 are A-bus bidirectional signals;
// dataB0 to dataB15 are B-bus bidirectional signals;
// oe0 is an enable signal that controls A-bus and B-bus;
// Data goes from A-bus to B-bus if oe0 is low (0);
// Data goes from B-bus to A-bus if oe0 is high (1);
// Fitted to ispGDX160VA-5Q208

module a2bexch(busa, busb, oe0);
inout [15:0] busa /*synthesis PULL = "UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP"*/;
inout [15:0] busb /*synthesis LOC = "P4,P5,P3,P7,P9,P10,P11,P12,P13,P14,P2,P16,P20,P21,P22,P23"*/;
input oe0;

//exemplar attribute busa PULL UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP
//exemplar attribute busb LOC P4,P5,P3,P7,P9,P10,P11,P12,P13,P14,P2,P16,P20,P21,P22,P23


assign busa = oe0 ? busb : 16'bz;
assign busb = ~oe0 ? busa : 16'bz;

endmodule
