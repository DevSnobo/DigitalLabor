-- 32-bit High Byte and Low Byte Swapper;
-- dataA0 to dataA15 are low-byte of A-bus input signals;
-- dataA16 to dataA31 are high-byte of A-bus input signals;
-- dataB0 to dataB15 are low-byte of B-bus output signals;
-- dataB16 to dataB31 are high-byte of B-bus output signals;
-- oe0 is an enable signal that controls B-bus output signals;
-- clk0 is the clock signal that triggers the registers of
-- B-bus output signals;
-- Data goes from A-bus to B-bus with swapped byte order when 
-- oe0 is high (1) and clk0 jumps to high (1);
-- Fitted to ispGDX160A-5Q208

library ieee;
use ieee.std_logic_1164.all;
entity swapper is
	port( oe0,clk0 : in std_logic;
             lowA, highA : in std_logic_vector (15 downto 0);
             lowB, highB : out std_logic_vector (15 downto 0)
           );
       attribute LOC : string;
       attribute LOC of oe0 : signal is "P31";
       attribute LOC of clk0 : signal is "P30";
       attribute LOC of lowA : signal is "P2,P3,P4,P5,P7,P8,P9,P10,P11,P12,P13,P14,P16,P18,P19,P20";
end swapper;
architecture behave of swapper is
       signal reg_low : std_logic_vector(15 downto 0);
       signal reg_high : std_logic_vector(15 downto 0);
begin
       process ( clk0 )
       begin
          if rising_edge (clk0) then
             reg_low <= highA;
             reg_high <= lowA;
          end if;
       end process; 
       highB <= reg_high when oe0 = '1' else "ZZZZZZZZZZZZZZZZ";
       lowB <= reg_low when oe0 = '1' else "ZZZZZZZZZZZZZZZZ";
end behave;
