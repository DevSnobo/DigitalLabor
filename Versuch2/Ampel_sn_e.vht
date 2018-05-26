
-- VHDL Test Bench Created from source file Ampel_sn_e.vhd -- 05/03/18  00:49:39
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

	COMPONENT Ampel_sn_e
	PORT(
		v : IN std_logic_vector(3 downto 0);          
		R : OUT std_logic;
		G : OUT std_logic;
		Y : OUT std_logic
		);
	END COMPONENT;

	SIGNAL v :  std_logic_vector(3 downto 0);
	SIGNAL R :  std_logic;
	SIGNAL G :  std_logic;
	SIGNAL Y :  std_logic;

BEGIN

	uut: Ampel_sn_e PORT MAP(
		v => v,
		R => R,
		G => G,
		Y => Y
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
