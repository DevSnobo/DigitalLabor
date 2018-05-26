library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity zaehler_ampel_e is

PORT(takt, reset: in std_logic;
	rot, gelb, gruen: out std_logic;
	zaehler: out std_logic_vector(3 downto 0));
end;


architecture zaehler_ampel_a of zaehler_ampel_e is


component zaehler_e
	PORT(intTakt, intReset: in std_logic;
		q: out std_logic_vector (3 downto 0));
end component;

component Ampel_sn_e
	PORT(v: in std_logic_vector  (3 downto 0);
		R, Y, G: out std_logic);
end component;

signal internal : std_logic_vector (3 downto 0);



begin

z: zaehler_e PORT MAP(
	intTakt => takt,
	intReset => reset,
	q => internal
);

ampel: Ampel_sn_e PORT MAP(
	v => internal,
	R => rot,
	Y => gelb,
	G => gruen
);

zaehler <= internal;
		
end zaehler_ampel_a;

