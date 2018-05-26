
-- VHDL Test Bench Created from source file gelb_blinken_e.vhd -- 05/03/18  16:13:33
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

	COMPONENT gelb_blinken_e
	PORT(
		q : IN std_logic_vector(3 downto 0);          
		bR : OUT std_logic;
		bG : OUT std_logic;
		bY : OUT std_logic
		);
	END COMPONENT;

	SIGNAL q :  std_logic_vector(3 downto 0);
	SIGNAL bR :  std_logic;
	SIGNAL bG :  std_logic;
	SIGNAL bY :  std_logic;

BEGIN

	uut: gelb_blinken_e PORT MAP(
		q => q,
		bR => bR,
		bG => bG,
		bY => bY
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***


tb_v: process
begin
for i in 0 to 15 loop

	wait for 10 ns;

	q <= std_logic_vector(to_unsigned(i,q'length));	
	
	wait for 10 ns;

	end loop;
end process;

END;
