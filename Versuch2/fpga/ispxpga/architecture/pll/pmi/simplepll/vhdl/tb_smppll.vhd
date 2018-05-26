library ieee;
use ieee.std_logic_1164.all;

entity tb_simpll is
end tb_simpll;

architecture simulate of tb_simpll is


component simplepll
	port (
		clk    : in std_logic;
		rst    : in std_logic;
		qout   : out std_logic_vector(3 downto 0));
end component;

signal inclk, rst: std_logic := '0';
signal q_out : std_logic_vector(3 downto 0);

begin

UUT : simplepll port map (clk=>inclk, rst=>rst, qout=>q_out);

	inclk <= not inclk after 40 ns;

process
begin
        rst <= '0';
        wait for 200 ns;
        rst <= '1';
        wait for 10000 ns;

end process;

end simulate;

configuration cfg_tb of tb_simpll is
	for simulate
	end for;
end cfg_tb;
