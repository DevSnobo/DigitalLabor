library ieee;
library MACH;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use MACH.components.all;


entity HARD_A4e is

port (S1 : in std_logic; -- Schalter S1 => reset
T1 : in std_logic; -- Taster T1 => Test-Eingang
rot, gelb, gruen : out std_logic;
q : out std_logic_vector(3 downto 0)); -- Zaehlerausgang
end;



architecture HARD_A4a of HARD_A4e is


signal takt : std_logic;
signal q_out : std_logic_vector(3 downto 0);

component OSCTIMER

generic (TIMER_DIV : string);

port (DYNOSCDIS : in std_logic;
TIMERRES : in std_logic;
OSCOUT : out std_logic;
TIMEROUT : out std_logic);
end component;


component zaehler_ampel_e is
port (takt : in std_logic;
reset : in std_logic;
q : out std_logic_vector(3 downto 0);
rot, gelb, gruen : out std_logic);
end component;



begin

i1: OSCTIMER

generic map (TIMER_DIV => "1048576") -- Teilungsfaktor

port map (DYNOSCDIS => '0',
	TIMERRES => not T1, -- Taster T1 zum Test
	OSCOUT => open,
	TIMEROUT => takt); -- auf signal takt
	i2: zaehler_ampel_e port map (takt => takt, reset => S1,
	rot => rot, gelb => gelb, gruen => gruen,
	q => q_out);
	q <= not q_out; -- aktuellen Zaehlerstand den LEDs invertiert zuweisen
	-- da LEDs leuchten, wenn eine 0 anliegt


end HARD_A4a;
