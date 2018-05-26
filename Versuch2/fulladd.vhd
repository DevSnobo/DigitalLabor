library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fulladd_ent is
	port(	a: in std_logic;
		b: in std_logic;
		Cin: in std_logic;
		s: out std_logic;
		Cout: out std_logic);

end;

architecture fulladd_arch of fulladd_ent is

component halfadd_ent
	port(x, y: IN std_logic;
		c, s: OUT std_logic);
end component;

component or2_ent
	PORT(a, b: IN std_logic ;
		y: OUT std_logic);
end component;

signal s1ha: std_logic;
signal c1ha: std_logic;
signal s2ha: std_logic;
signal c2ha: std_logic;

begin

ha1: halfadd_ent PORT MAP(
x => a,
y => b,
c => c1ha,
s => s1ha
);

ha2: halfadd_ent PORT MAP(
x => s1ha,
y => Cin,
c => c2ha,
s => s2ha
);

or2: or2_ent PORT MAP(
a=> c1ha,
b=> c2ha,
y=> Cout
);
s<= s2ha;

end fulladd_arch;

