-- The following steps are required to use OSCTIMER functions in VHDL
-- Step 1. Lattice library declaration
-- Step 2. OSCTIMER instantiation
-- Step 3. Use of OSCTIMER outputs
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
-- Step 1. Lattice library declaration
library MACH;
use MACH.components.all;

entity OSC_PGUARD is
	port (
		RST, RST2: in std_logic;
		PG_D	: in std_logic;
		PG_E	: in std_logic;
		QOUT	: out std_logic;
		XOUT : out std_logic_vector (3 downto 0);
		TOUT : out std_logic);
end OSC_PGUARD;

architecture IMP_OSC_PGUARD of OSC_PGUARD is

	component PG
        port (
		D : in std_logic;
		E	: in std_logic;
		Q	: out std_logic);
	end component;

	component OSCTIMER
	generic(TIMER_DIV : string);
	port(	
		DYNOSCDIS	: in  std_logic; 
		TIMERRES	: in  std_logic;
		OSCOUT		: out std_logic;
		TIMEROUT	: out std_logic); 
	end component;

	signal PG_Q		: std_logic;
	signal OSCOUT		: std_logic;
	signal TIMEROUT		: std_logic; 
	signal reg1		: std_logic_vector (3 downto 0);

begin  -- IMP_TOP_SCHEMATIC

-- Step 2. OSCTIMER instantiation
I1: OSCTIMER
	generic map (TIMER_DIV => "128")
	port map (	
		DYNOSCDIS 	=> RST,
		TIMERRES 	=> RST2,
		OSCOUT 		=> OSCOUT,
		TIMEROUT 	=> TIMEROUT);	

-- Step 3. Use of OSCTIMER outputs
	LOAD_COMP_REG2 : process (OSCOUT, RST2)
	begin  -- process LOAD_COMP_REG
		if (RST2='1') then
			reg1 <= "0000";
		elsif OSCOUT'event and OSCOUT = '1' then
			reg1 <= reg1 + 1 ;
		end if;
	end process LOAD_COMP_REG2;

	XOUT <= reg1;
	TOUT <= OSCOUT;

I11: PG
	port map (	
		D => PG_D,
		E => PG_E,
		Q => PG_Q);	

	LOAD_PGQ : process (OSCOUT, RST2)
	begin
		if (RST2='1') then
			QOUT <= '0';
		elsif OSCOUT'event and OSCOUT = '1' then
			QOUT <= not PG_Q;
		end if;
	end process LOAD_PGQ;

end IMP_OSC_PGUARD;







