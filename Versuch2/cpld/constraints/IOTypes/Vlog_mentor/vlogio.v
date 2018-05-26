/****************************************
 * Verilog source constraint example
 *   IO_Types Configuration for Mentor
 *
 * Lattice Semiconductor Corporation
"****************************************/

/** Verilog Mentor syntax for Pin IO Type Configuration

   //exemplar attribute [PinName] IO_TYPES [Type],[DriveCurrent];

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
 	GTL+,    		3.3, 2.5, 1.8, 1.5
	LVTTL,			3.3
	LVCMOS33,		3.3
 	LVCMOS33_OD,		3.3, 2.5, 1.8, 1.5
	LVCMOS25,		2.5
 	LVCMOS25_OD,		3.3, 2.5, 1.8, 1.5
 	LVCMOS18,		1.8
	LVCMOS18_OD,		3.3, 2.5, 1.8, 1.5
 	** For Clock Pins **
	LVDS,			3.3, 2.5, 1.8, 1.5
	LVPECL_S,		3.3, 2.5, 1.8, 1.5
	LVPECL_D,		3.3, 2.5, 1.8, 1.5

     DriveCurrent(mA) = 20, 16, 12, 8, 5, 4 or NONE(or -);
     	NONE(or -): default setting or not applicable */


/* Note:1. In Verilog, the PinName for IO Type must be the same as the name declared.
	    The individual set expression such as portA[0] is not allowed as a valid name.

	 2. The following example shows a set of valid configuration for the IO types
	     not used in this design.

			
		//exemplar attribute portA PCI-X,NONE;
		//exemplar attribute portA AGP_1X,NONE;
		//exemplar attribute portA SSTL3_I,NONE;
		//exemplar attribute portA SSTL3_II,-;
		//exemplar attribute portA SSTL2_I,NONE;
		//exemplar attribute portA SSTL2_II,-;
		//exemplar attribute portA HSTL_I,NONE;
		//exemplar attribute portA HSTL_III,NONE;
		//exemplar attribute portA CTT25,NONE;
		//exemplar attribute portA GTL+,NONE;
		//exemplar attribute portA LVTTL,NONE;
		//exemplar attribute portA LVCMOS33_OD,16;
		//exemplar attribute portA LVCMOS25,-;
		//exemplar attribute portA LVCMOS18,5;
		//exemplar attribute portA LVCMOS18_OD,4;

********************************************************************/

//Example

module vlogio(md,Din,Clk0,Clk1,Clk2,Clk3,portA,portB,portC,portD);

input	[1:0] md;
input	[4:0] Din;
input	Clk0,Clk1,Clk2,Clk3;

output 	[4:0] portA;
output 	[4:0] portB;
output 	[4:0] portC;
output 	[4:0] portD;

reg 	[4:0] portA;
reg 	[4:0] portB;
reg 	[4:0] portC;
reg 	[4:0] portD;


/*** IO types for I/O pins ***/
//exemplar attribute md IO_TYPES PCI,NONE,PCI,NONE; 
//exemplar attribute portA IO_TYPES PCI,-,PCI,-,PCI,-,PCI,-,PCI,-; 
//exemplar attribute portB IO_TYPES LVCMOS33,-,LVCMOS33,-,LVCMOS33,-,LVCMOS33,-,LVCMOS33,-;
//exemplar attribute portC IO_TYPES LVCMOS18,NONE,LVCMOS18,NONE,LVCMOS18,NONE,LVCMOS18,NONE,LVCMOS18,NONE;  	
//exemplar attribute portD IO_TYPES LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-;



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


