
-- VHDL Test Bench Created from source file fullad_ent.vhd -- 04/20/18  17:11:37
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

	COMPONENT fullad_ent
	PORT(
		d : IN std_logic;
		e : IN std_logic;
		cin : IN std_logic;       
		);
	END COMPONENT;

	SIGNAL d :  std_logic;
	SIGNAL e :  std_logic;
	SIGNAL cin :  std_logic;

BEGIN

	uut: fullad_ent PORT MAP(
		d => d,
		e => e,
		cin => cin
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
