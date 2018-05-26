--**************************************
--* VHDL source constraint example
--* 	Group Assignment for Mentor
--*	       2/02/2001
--* Lattice Semiconductor Corporation
--**************************************

-- Note: 1. This syntax is supported by Mentor.
--	 2. One GROUPING attribute assignment per entity is allowed.
--       3. A std_logic_vector signal must be converted to the final form for the fitter handling.(ex. inA3 -> inA_3_)

-- VHDL Grouping Syntax
-- ATTRIBUTE GROUPING OF [EntityName] : ENTITY IS "[GrpName]= Seg#,GLB#,SigList";


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY vhdgroup IS

  PORT (Den	:in std_logic;
	inA	:in std_logic_vector(3 downto 0);
	outA	:out std_logic_vector(3 downto 0));
		
-- VHDL Group constraints
  ATTRIBUTE GROUPING : STRING;                             

-- GrpA will be placed in Seg.0, GLB A. 
--ATTRIBUTE GROUPING OF grouping : ENTITY IS "GrpA = 0,A,Den:inA_3_:inA_2_:inA_1_:inA_0_:outA_3_:outA_2_:outA_1_:outA_0_";

-- GrpA will be placed in Seg.1, any GLB
--ATTRIBUTE GROUPING OF grouping : ENTITY IS "GrpA = 1,*,Den:inA_3_:inA_2_:inA_1_:inA_0_:outA_3_:outA_2_:outA_1_:outA_0_";

-- GrpA will be placed in any Seg, Any GLB
ATTRIBUTE GROUPING OF vhdgroup : ENTITY IS "GrpA = *,A,Den:inA_3_:inA_2_:inA_1_:inA_0_:outA_3_:outA_2_:outA_1_:outA_0_";

END vhdgroup;


ARCHITECTURE rtl OF vhdgroup IS

BEGIN

PROCESS (Den, inA)
BEGIN

    IF (Den = '1') THEN
	outA <= inA;

    ELSE
	outA <= "0000";

    END IF;

END PROCESS;

END rtl;
