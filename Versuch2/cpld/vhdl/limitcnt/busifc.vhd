-- VHDL Model Created from ECS Symbol busifc.sym -- Feb 14 09:22:19 1997

LIBRARY ieee;
--LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity busifc is
      Port (     clk : In    std_logic;
                 csn : In    std_logic;
                endi : In    std_logic_vector (3 downto 0);
                 rst : In    std_logic;
                 wen : In    std_logic;
                endo : Out   std_logic_vector (3 downto 0) );
end busifc;

architecture BEHAVIORAL of busifc is
   
   signal latched_endi, endr : std_logic_vector (3 downto 0);

   begin

   -- latch the end input at the end of a write, whenever
   -- csn or wen is high
   p_latch: process(rst, csn, wen, endi)
   begin
      if (rst = '1') then
         latched_endi <= (others => '0');
      elsif (csn = '0' and wen = '0') then
         latched_endi <= endi;
      end if;
   end process;

   -- prevent metastability problems by synchronizing the latch
   -- output through two register stages
   p_reg: process (clk, rst)
   begin
      if (rst = '1') then
         endr <= (others => '0');
         endo <= (others => '0');
      elsif (rising_edge(clk)) then
         endr <= latched_endi;
         endo <= endr;
      end if;
   end process;

end BEHAVIORAL;

