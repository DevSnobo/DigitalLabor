--**************************************
--* VHDL source constraint example
--* 	Pin PULL Control
--*	2/05/2001
--* Lattice Semiconductor Corporation 
--**************************************

-- VHDL syntax for Pin PULL Control
--  ATTRIBUTE PULL : string;                           		
--  ATTRIBUTE PULL OF [SigName]: SIGNAL IS "TYPE"; 
--   TYPE can be either UP, DOWN, HOLD or OFF.  

LIBRARY IEEE;					
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pull IS
PORT (		ina	:in STD_LOGIC;
		inb	:in STD_LOGIC;
		inc	:in STD_LOGIC;
		pullof	:out STD_LOGIC;
		pullhd	:out STD_LOGIC;
		pullup	:out STD_LOGIC;
		pulldn	:out STD_LOGIC);

------- VHDL Pin PULL Assignments --------
ATTRIBUTE PULL : string;                           		
ATTRIBUTE PULL OF ina:    SIGNAL IS "UP"; 
ATTRIBUTE PULL OF pullup: SIGNAL IS "UP"; 
ATTRIBUTE PULL OF pulldn: SIGNAL IS "DOWN";
ATTRIBUTE PULL OF pullhd: SIGNAL IS "HOLD";
ATTRIBUTE PULL OF pullof: SIGNAL IS "OFF";

END pull;


ARCHITECTURE rtl OF pull IS

BEGIN

pullup <= ina OR inb;
pulldn <= ina OR inc;
pullhd <= inb OR inc;
pullof <= ina AND inc;

END rtl;

