--**************************************
--* VHDL source constraint example
--* 	Node Preserving for Synplify
--*	       2/05/2001
--* Lattice Semiconductor Corporation 
--**************************************

-- VHDL Node Preserving Syntax for Synplify

-- Preserve nodes for VHDL synthesizer
-- ATTRIBUTE SYN_KEEP : INTEGER;
-- ATTRIBUTE SYN_KEEP OF [NodeName(s)] : SIGNAL IS 1;

-- Preserve nodes for the device fitter
-- ATTRIBUTE OPT : string;
-- ATTRIBUTE OPT OF [NodeName(s)] : SIGNAL IS "KEEP";

library ieee;
use ieee.std_logic_1164.all;

entity preserve is
port (	inA,inB,inC,inD	:in STD_LOGIC;
	out1,out2	:out STD_LOGIC);
end preserve;

architecture behavioral of preserve is

SIGNAL nodeA, nodeB : STD_LOGIC;

ATTRIBUTE SYN_KEEP : integer;
ATTRIBUTE SYN_KEEP OF nodeA, nodeB : SIGNAL IS 1;

ATTRIBUTE OPT : string;
ATTRIBUTE OPT OF nodeA, nodeB : SIGNAL IS "KEEP";

begin

nodeA 	<= inA AND inB;
nodeB 	<= inC AND inD;

out1	<= nodeA AND nodeB;
out2 	<= nodeA OR nodeB;

end behavioral;

