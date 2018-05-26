--------------------------------------
-- Jan DeHoop
-- Vantis FAE
-- 2/25/99
-- (C) Copyright Vantis 1999
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity COMP_EQ is
	port (O1 : out std_logic;
		  IN0 : in std_logic_vector (3 downto 0);
		  IN1 : in std_logic_vector (3 downto 0));

end COMP_EQ;

architecture IMP_COMP_EQ of COMP_EQ is
	
begin  -- IMP_COMP_EQ

	FUNCTION_EQ : process (IN0, IN1)
	begin  -- process FUNCTION_GT
		if IN0 = IN1 then
			O1 <= '1';
		else
			O1 <= '0';
		end if;
	end process FUNCTION_EQ;

end IMP_COMP_EQ;
