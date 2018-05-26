--------------------------------------
-- 2/25/99 designed
-- (C) Copyright Lattice 1999 - 2001
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity COMP_GT is
	
	port (O1 : out std_logic;
		  IN0 : in std_logic_vector (3 downto 0);
		  IN1 : in std_logic_vector (3 downto 0));

end COMP_GT;

architecture IMP_COMP_GT of COMP_GT is
	
begin  -- IMP_COMP_GT
FUNCTION_GT : process (IN0,IN1)
begin  -- process FUNCTION_GT
	if IN0 > IN1 then
		O1 <= '1';
	else
		O1 <= '0';
	end if;
end process FUNCTION_GT;
end IMP_COMP_GT;
