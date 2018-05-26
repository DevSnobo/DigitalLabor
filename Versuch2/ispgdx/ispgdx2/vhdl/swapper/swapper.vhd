library ieee;
use ieee.std_logic_1164.all;
entity swapper is
	port( oe0,clk0 : in std_logic;
             lowA, highA : in std_logic_vector (31 downto 0);
             lowB, highB : out std_logic_vector (31 downto 0)
           );
    
end swapper;
architecture behave of swapper is
       signal reg_low : std_logic_vector(31 downto 0);
       signal reg_high : std_logic_vector(31 downto 0);
begin
       process ( clk0 )
       begin
          if rising_edge (clk0) then
             reg_low <= highA;
             reg_high <= lowA;
          end if;
       end process; 
       highB <= reg_high when oe0 = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       lowB <= reg_low when oe0 = '1' else   "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end behave;
