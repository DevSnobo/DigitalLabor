--**************************************
--* VHDL source constraint example
--* 	Open Drain Output
--* Lattice Semiconductor Corporation 
--**************************************

-- VHDL syntax for IO Types Setting
-- Note: There is no dedicated attribute of Opendrain in VHDL.
--       The IO_TYPES attibute can be used to assign Opendrain to a pin.
--
--  ATTRIBUTE IO_TYPES : string;                           		
--  ATTRIBUTE IO_TYPES OF [PinName]: SIGNAL IS "LVCMOS33_OD,[DriveCurrent]"; or
--  ATTRIBUTE IO_TYPES OF [PinName]: SIGNAL IS "LVCMOS25_OD,[DriveCurrent]"; or
--  ATTRIBUTE IO_TYPES OF [PinName]: SIGNAL IS "LVCMOS18_OD,[DriveCurrent]"; 
--
--
--   DriveCurrent(mA) = 20, 16, 12, 8, 5, 4 or NONE;
------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity vhdlod is port
      (	inA :  in  std_logic_vector(1 downto 0);
	inB :  in  std_logic_vector(1 downto 0);
	outA_OD: out std_logic_vector(1 downto 0);
	outB_OD: out std_logic_vector(1 downto 0);
	outC_OD: out std_logic_vector(1 downto 0));

--*** Attribute declaration
ATTRIBUTE IO_TYPES : string;                           		

--*** Open Drain setting for output pins ***
ATTRIBUTE IO_TYPES OF outA_OD : SIGNAL IS "LVCMOS33_OD,-,LVCMOS33_OD,-"; 
ATTRIBUTE IO_TYPES OF outB_OD : SIGNAL IS "LVCMOS25_OD,-,LVCMOS25_OD,-"; 
ATTRIBUTE IO_TYPES OF outC_OD : SIGNAL IS "LVCMOS18_OD,-,LVCMOS18_OD,-"; 

end;

architecture behavioral of vhdlod is
begin

outA_OD <= inA and inB;
outB_OD <= inA and not inB;
outC_OD <= not inA and inB;
 
end behavioral;

