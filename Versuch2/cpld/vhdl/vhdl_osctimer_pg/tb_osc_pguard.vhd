--------------------------------------
-- 2/25/99 designed
-- (C) Copyright Lattice 1999 -- 2001
--------------------------------------
--
-- This is test bench for top-module
-- If it is always the same name then script
-- for MTI is simple to handle
--------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY MACH;
USE MACH.components.ALL;

entity TB_TOP is
end TB_TOP;

-- purpose: STIMULUS for testing comparitor
architecture TB of TB_TOP is

	component OSC_PGUARD
	port (
		  RST : in std_logic;
		  RST2 : in std_logic;
		  PG_D : IN std_logic;
		  PG_E : IN std_logic;    
		  QOUT : OUT std_logic;
  		  XOUT : out std_logic_vector (3 downto 0);
		  TOUT : out std_logic);
	end component;


	signal RST  : std_logic := '1';  		-- RESET
	signal RST2 : std_logic := '1';  		-- RESET
	signal XOUT    : std_logic_vector (3 downto 0 );
	signal TOUT : std_logic;
	SIGNAL PG_D :  std_logic;
	SIGNAL PG_E :  std_logic;
	SIGNAL QOUT :  std_logic;

	constant CLK_PERIOD : time := 500 ns;

begin  


UUT : OSC_PGUARD	port map (
		RST => RST,
		RST2 => RST2,
		PG_D => PG_D,
		PG_E => PG_E,
		QOUT => QOUT,
		XOUT => XOUT,
		TOUT => TOUT
);

	
p_RST: PROCESS -- stimulus for signal RST
   BEGIN
   RST <= '1'; WAIT FOR 1500 NS;
   RST <= '0'; WAIT FOR 109000 NS;
--   WAIT; -- forever
 END PROCESS;

p_RST2: PROCESS -- stimulus for signal RST2
   BEGIN
   RST2 <= '1'; WAIT FOR 2000 NS;
   RST2 <= '0'; WAIT FOR 109000 NS;
--   WAIT; -- forever
 END PROCESS;

p_PG_E: PROCESS -- stimulus for signal PG_E
   BEGIN
   PG_E <= '1'; WAIT FOR 1200 NS;
   PG_E <= '0'; WAIT FOR 20000 NS;
   PG_E <= '1'; WAIT FOR 69016 NS;
   PG_E <= '0'; WAIT FOR 20000 NS;
--   WAIT; -- forever
 END PROCESS;



 p_PG_D: PROCESS -- stimulus for signal PG_D
   BEGIN
      PG_D <= '0'; WAIT FOR 137 NS;
   FOR i0 IN 1 TO 200 LOOP
      PG_D <= '1'; WAIT FOR 600 NS;
      PG_D <= '0'; WAIT FOR 600 NS;
   END LOOP;
--   WAIT; -- forever
 END PROCESS;


end TB;
