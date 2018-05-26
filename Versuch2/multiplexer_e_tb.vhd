
-- VHDL Test Bench Created from source file multiplexer_e.vhd -- 05/03/18  02:15:58
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

	COMPONENT multiplexer_e
	PORT(
		sel : IN std_logic;
		a : IN std_logic_vector(2 downto 0);
		b : IN std_logic_vector(2 downto 0);          
		x : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	SIGNAL sel :  std_logic;
	SIGNAL a :  std_logic_vector(2 downto 0);
	SIGNAL b :  std_logic_vector(2 downto 0);
	SIGNAL x :  std_logic_vector(2 downto 0);

BEGIN

	uut: multiplexer_e PORT MAP(
		sel => sel,
		a => a,
		b => b,
		x => x
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
