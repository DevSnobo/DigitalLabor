library ieee;
use ieee.std_logic_1164.all;

entity tb_stdpllx is
end tb_stdpllx;

architecture simulate of tb_stdpllx is

component extendedpll
	port (
		clk     : in std_logic;
		rst     : in std_logic;
		clken   : in std_logic;
		pllfbk  : in std_logic;
		pllrst  : in std_logic;
		qa      : out std_logic_vector(3 downto 0);
		qb      : out std_logic_vector(3 downto 0));
end component;

signal inclk, rst, pllrst, pllfbk, clken: std_logic := '0';
signal qa_out : std_logic_vector(3 downto 0);
signal qb_out : std_logic_vector(3 downto 0);

begin

UUT : extendedpll port map (clk=>inclk, rst=>rst, clken=>clken, pllfbk =>pllfbk, pllrst=>pllrst,qa=>qa_out,qb=>qb_out);

	inclk <= not inclk after 40 ns;

process
begin
        rst <= '0';
        pllrst <= '1';
        clken <= '0';
        wait for 200 ns;
        rst <= '1';
        pllrst <= '0';
        clken <= '1';
        wait for 10000 ns;
end process;

end simulate;

configuration cfg_tb of tb_stdpllx is
	for simulate
	end for;
end cfg_tb;
