
-- VHDL Test Bench Created from source file zaehler_e.vhd -- 05/02/18  22:41:53
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT zaehler_e
	PORT(
		takt : IN std_logic;
		reset : IN std_logic;          
		q : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL takt :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL q :  std_logic_vector(3 downto 0);

BEGIN

	uut: zaehler_e PORT MAP(
		takt => takt,
		reset => reset,
		q => q
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

tb_res: process -- Prozzess für Reset und ggf. weitere Signale
	begin
		reset <= '0';
		wait for 10ns;
		reset <= not reset;
		wait for 100ns;
		reset <= '0';
		wait for 400ns;
		reset <= not reset;
	

	end process;

tb_takt: process -- zur Takterzeugung 
	begin
		takt <= '0';
		loop
			wait for 10 ns;
			takt <= not takt;
			end loop;
	end process;
END;
