
-- VHDL Test Bench Created from source file fulladd_ent.vhd -- 04/23/18  15:24:28
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

	COMPONENT fulladd_ent
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		Cin : IN std_logic;          
		s : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL a :  std_logic;
	SIGNAL b :  std_logic;
	SIGNAL Cin :  std_logic;
	SIGNAL s :  std_logic;
	SIGNAL Cout :  std_logic;

BEGIN

	uut: fulladd_ent PORT MAP(
		a => a,
		b => b,
		Cin => Cin,
		s => s,
		Cout => Cout
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
