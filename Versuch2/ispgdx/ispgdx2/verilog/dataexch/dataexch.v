module dataexch( busAdata, busBdata, busCdata, busDdata, oe0,oe1);
inout [63:0] busAdata;
inout [63:0] busBdata;
inout [63:0] busCdata;
inout [63:0] busDdata;
input oe0, oe1;


assign busAdata = oe0 ? busBdata : 64'bz;
assign busBdata = ~oe0 ? busAdata : 64'bz;
assign busCdata = oe1 ? busDdata : 64'bz;
assign busDdata = ~oe1 ? busCdata : 64'bz;

endmodule
