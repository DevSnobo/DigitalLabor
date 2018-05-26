/*******************************************
 * Verilog source constraint example
 *   IO_Types Configuration for Synplicity
 *
 *	2/07/2001 designed by K.Lee
 *	3/22/2001 modified by K.Lee
 *
 * Lattice Semiconductor Corporation
 *******************************************/

/**** Verilog Synplicity syntax for Pin IO Type Configuration */

//   PinType [PinName] /* synthesis IO_TYPES="[Type],PIN,[Bank#],[DriveCurrent]" */; 
 
/*   PinType: Either input or output

     Type: The following IO types are available
	---------------------------------------------
	IO_Type Names		VCCIO
	---------------------------------------------
 	** For IO pins **
	PCI,			3.3
	PCI-X,			3.3
	AGP_1X,			3.3
	SSTL3_I,		3.3
	SSTL3_II,		3.3
	SSTL2_I,		2.5
	SSTL2_II,		2.5
	HSTL_I,			1.5
 	HSTL_III,		1.5
	CTT33,			3.3
	CTT25,			2.5
 	GTL+,			3.3, 2.5, 1.8, 1.5
	LVTTL,			3.3
	LVCMOS33,		3.3
 	LVCMOS33_OD,		3.3, 2.5, 1.8, 1.5
	LVCMOS25,		2.5
 	LVCMOS25_OD,		3.3, 2.5, 1.8, 1.5
 	LVCMOS18,		1.8
	LVCMOS18_OD,		3.3, 2.5, 1.8, 1.5
 
     DriveCurrent(mA) = 20, 16, 12, 8, 5, 4 or NONE(or -);
     	NONE(or -): default setting or not applicable



   Note:1. In Verilog, the PinName for IO Type must be the same as the name declared.
	    The individual set expression such as portA[0] is not allowed as a valid name.

	 2. The following example shows a set of valid configuration for the IO types
	     not used in this design. (The comment signs are not included.)
			
		synthesis IO_TYPES="PCI-X,NONE"
		synthesis IO_TYPES="AGP_1X,NONE"
		synthesis IO_TYPES="SSTL3_I,NONE"
		synthesis IO_TYPES="SSTL3_II,-"
		synthesis IO_TYPES="SSTL2_I,NONE"
		synthesis IO_TYPES="SSTL2_II,-"
		synthesis IO_TYPES="HSTL_I,NONE"
		synthesis IO_TYPES="HSTL_III,NONE"
		synthesis IO_TYPES="CTT25,NONE"
		synthesis IO_TYPES="GTL+,NONE"
		synthesis IO_TYPES="LVTTL,NONE"
		synthesis IO_TYPES="LVCMOS33_OD,16"
		synthesis IO_TYPES="LVCMOS25,-"
		synthesis IO_TYPES="LVCMOS18,5"
		synthesis IO_TYPES="LVCMOS18_OD,4"

********************************************************************/


module vlogio(md,Din,Clk0,Clk1,Clk2,Clk3,portA,portB,portC,portD);


/*** Clock declaration ***/
input 	Clk0;
input 	Clk1;
input 	Clk2;
input 	Clk3;


/*** IO types for I/O pins ***/
input	[1:0] md /* synthesis IO_TYPES="PCI,NONE"*/;
input	[4:0] Din;
output 	[4:0] portA /* synthesis IO_TYPES="PCI,-"*/;	 
output 	[4:0] portB /* synthesis IO_TYPES="LVCMOS33,20"*/;	//20ma
output 	[4:0] portC /* synthesis IO_TYPES="CTT33,NONE"*/;	
output 	[4:0] portD /* synthesis IO_TYPES="LVCMOS25_OD,8"*/;	//8ma

reg 	[4:0] portA;
reg 	[4:0] portB;
reg 	[4:0] portC;
reg 	[4:0] portD;


always @(posedge Clk0)
    begin
	if (md == 2'b00) 
	    portA <= Din;
	else
	    portA <= 5'b00000;
    end

always @(posedge Clk1)
    begin
	if (md == 2'b01) 
	    portB <= Din;
	else
	    portB <= 5'b00000;
    end

always @(posedge Clk2)
    begin
	if (md == 2'b10) 
	    portC <= Din;
	else
	    portC <= 5'b00000;
    end

always @(posedge Clk3)
    begin
	if (md == 2'b11) 
	    portD <= Din;
	else
	    portD <= 5'b00000;
    end


endmodule


