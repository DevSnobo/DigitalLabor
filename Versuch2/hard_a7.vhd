library ieee;
library MACH;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use MACH.components.all;
entity HARD_A7e is
port (S1 : in std_logic; -- S1 => reset
S2 : in std_logic; -- S2 => Sx
T1 : in std_logic; -- Test-Eingang
rot, gelb, gruen : out std_logic;
q : out std_logic_vector(3 downto 0)); -- Zaehlerausgang
end;
architecture HARD_A7a of HARD_A7e is
signal takt : std_logic;
signal q_out : std_logic_vector(3 downto 0);
component OSCTIMER
generic (TIMER_DIV : string);
port (DYNOSCDIS : in std_logic;
TIMERRES : in std_logic;
OSCOUT : out std_logic;
TIMEROUT : out std_logic);
end component;
component ampel_komplett_e is
port (takt : in std_logic;
reset : in std_logic;
S2 : in std_logic; -- Umschalter, Ampel oder gelb blinken
q : out std_logic_vector(3 downto 0);
rot, gelb, gruen : out std_logic);
end component;
begin
i1: OSCTIMER
generic map (TIMER_DIV => "1048576")
port map (DYNOSCDIS => '0',
TIMERRES => not T1,
OSCOUT => open,
TIMEROUT => takt);
i2: ampel_komplett_e port map (takt=>takt, reset=>S1, S2=>S2,
q=>q_out,
rot=>rot, gelb=>gelb, gruen=>gruen);
q <= not q_out; -- aktuellen Zaehlerstand den LEDs invertiert zuweisen
-- da LEDs leuchten, wenn eine 0 anliegt
end HARD_A7a;
