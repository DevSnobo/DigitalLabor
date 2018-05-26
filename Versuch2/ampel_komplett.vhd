library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ampel_komplett_e is

	PORT(takt, reset, S2: in std_logic;
		q: out std_logic_vector(3 downto 0);
		rot, gelb, gruen: out std_logic);

end;

architecture ampel_komplett_a of ampel_komplett_e is

-- components
component zaehler_e PORT(
			intTakt, intReset : in std_logic;
	    	q		 : out std_logic_vector(3 downto 0));
end component;


component Ampel_sn_e PORT(
			v : in std_logic_vector(3 downto 0);
	     	R, G, Y : out std_logic);
end component;


component gelb_blinken_e PORT(
		q: in std_logic_vector(3 downto 0);
		bR, bG, bY : out std_logic);
end component;


component multiplexer_e PORT (
		 sel: in std_logic;
		 a : in std_logic_vector (2 downto 0);
		 b : in std_logic_vector (2 downto 0);
		 x : out std_logic_vector (2 downto 0));
end component;
-- components


-- signals
signal zOut : std_logic_vector(3 downto 0);
signal blinkInt : std_logic_vector(2 downto 0);
signal ampelInt : std_logic_vector(2 downto 0);
-- signals


begin

z: zaehler_e PORT MAP(
	intTakt => takt,
	intReset => reset,
	q => zOut
);

ampel: Ampel_sn_e PORT MAP(
	v => zOut,
	R => ampelInt(2),
	Y => ampelInt(1),
	G => ampelInt(0)
);

blinken: gelb_blinken_e PORT MAP(
	q => zOut,
	bR => blinkInt(2),
	bY => blinkInt(1),
	bG => blinkInt(0)
);

mux: multiplexer_e PORT MAP(
	sel => S2,
	a => ampelInt,
	b => blinkInt,
	x(2) => rot,
	x(1) => gelb,
	x(0) => gruen
);

q <= zOut;


end ampel_komplett_a;

