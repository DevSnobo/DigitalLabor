--**************************************
--* VHDL source constraint example
--* 	Slew Rate Control
--*	2/05/2001
--* Lattice Semiconductor Corporation 
--**************************************

-- VHDL syntax for Slew Rate Control
--  ATTRIBUTE SLEW : string;                           		
--  ATTRIBUTE SLEW OF [SigName]: SIGNAL IS "TYPE"; 
--   TYPE can be either SLOW or FAST.  

LIBRARY IEEE;					
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY slew IS
PORT (		inA	:in STD_LOGIC;
		inB	:in STD_LOGIC;
		inC	:in STD_LOGIC;
		slewS	:out STD_LOGIC;
		slewF	:out STD_LOGIC);

---------- Slew Rate Assignments ----------
ATTRIBUTE SLEW : string;                           		
ATTRIBUTE SLEW OF slewS: SIGNAL IS "SLOW"; 
ATTRIBUTE SLEW OF slewF: SIGNAL IS "FAST";  

END slew;

ARCHITECTURE rtl OF slew IS


BEGIN

slewS <= inA OR inB;
slewF <= inB OR inC;

END rtl;

