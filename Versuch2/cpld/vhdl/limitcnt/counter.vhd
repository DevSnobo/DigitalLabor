-- VHDL Model Created from ECS Symbol counter.sym 
-- Jan 15 14:50:10 1997

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity counter is
      Port (     clk : In    std_logic;
                  ld : In    std_logic;
                 rst : In    std_logic;
               count : Out   std_logic_vector (3 downto 0) );
end counter;

architecture BEHAVIORAL of counter is

      signal Q: unsigned(3 downto 0);

begin

   count <= std_logic_vector(Q); -- type conversion

   p_count: process(clk, rst)   -- Counter with Rst as asynchronous reset
      begin
      if (rst = '1') then -- async reset condition
         Q <= "0000";
      elsif rising_edge(clk) then -- Edge triggered clock
         if (ld = '1') then
            Q <= "1111";
         else
            Q <= Q + 1;
         end if;
      end if;
   end process;

end BEHAVIORAL;

