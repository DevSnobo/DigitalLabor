-- VHDL Model Created from ECS Symbol compare.sym 
-- Jan 15 14:49:52 1997

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity compare is
      Port (       a : In    std_logic_vector (3 downto 0);
                   b : In    std_logic_vector (3 downto 0);
                aeqb : Out   std_logic );
end compare;

architecture BEHAVIORAL of compare is

begin

   aeqb <= '1' when a = b else '0';

end BEHAVIORAL;

