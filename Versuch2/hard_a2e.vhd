library ieee;
library MACH;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use MACH.components.all;

entity HARD_A2e is
port (S1 : in std_logic; -- Schalter S1 => reset
T1 : in std_logic; -- Taster T1 => Test-Eingang
q : out std_logic_vector(3 downto 0)); -- Zaehlerausgang
end;


architecture HARD_A2a of HARD_A2e is

signal takt : std_logic;
signal q_out : std_logic_vector(3 downto 0);

component OSCTIMER
generic (TIMER_DIV : string);
port (DYNOSCDIS : in std_logic;
TIMERRES : in std_logic;
OSCOUT : out std_logic;
TIMEROUT : out std_logic);
end component;


component zaehler_e is
port (takt, reset : in std_logic;
q : out std_logic_vector(3 downto 0));
end component;


begin
i1: OSCTIMER
generic map (TIMER_DIV => "1048576") -- Teilungsfaktor – es sind nur 3 Werte
-- zulässig: 128, 1024 und 1048576
port map (DYNOSCDIS => '0',
TIMERRES => not T1, -- Taster T1 zum Test
OSCOUT => open,
TIMEROUT => takt); -- auf signal takt
i2 : zaehler_e port map (takt=>takt, reset=>S1, q=>q_out);
q <= not q_out; -- aktuellen Zaehlerstand den LEDs invertiert zuweisen
-- da LEDs leuchten, wenn eine 0 anliegt
end HARD_A2a;
