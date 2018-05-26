library ieee;
use ieee.std_logic_1164.all;

entity tb_stdpll is
end tb_stdpll;

architecture simulate of tb_stdpll is

component standardpll
	port (
		clk    : in std_logic;
		rst    : in std_logic;
		clken  : in std_logic;
		qa     : out std_logic_vector(3 downto 0));
end component;

signal inclk, rst, clken: std_logic := '0';
signal q_out : std_logic_vector(3 downto 0);

begin

UUT : standardpll port map (clk=>inclk, rst=>rst, clken=>clken, qa=>q_out);

	inclk <= not inclk after 40 ns;

process
begin
        rst <= '0';
        clken <= '0';
        wait for 200 ns;
        rst <= '1';
	wait for 20 ns;
        clken <= '1';
        wait for 10000 ns;
end process;

end simulate;

configuration cfg_tb of tb_stdpll is
	for simulate
	end for;
end cfg_tb;
