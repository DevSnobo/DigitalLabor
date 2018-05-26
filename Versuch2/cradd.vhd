library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cradd_ent is
	port(	x: in std_logic_vector(1 downto 0);
		y: in std_logic_vector(1 downto 0);
		Sout: out std_logic_vector(2 downto 0));

end cradd_ent;



architecture cradd_arch of cradd_ent is

component fulladd_ent
	port(	a: in std_logic;
		b: in std_logic;
		Cin: in std_logic;
		s: out std_logic;
		Cout: out std_logic
	);
end component;

signal Cint: std_logic;



begin

FA1: fulladd_ent PORT MAP(
	a => x(0),
	b => y(0),
	Cin => '0',
	s => Sout(0),
	Cout => Cint
);

FA2: fulladd_ent PORT MAP(
	a => x(1),
	b => y(1),
	Cin => Cint,
	s => Sout(1),
	Cout => Sout(2)
);


end cradd_arch;

