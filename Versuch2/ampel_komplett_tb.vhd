
-- VHDL Test Bench Created from source file ampel_komplett_e.vhd -- 05/03/18  17:21:24
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

	COMPONENT ampel_komplett_e
	PORT(
		takt : IN std_logic;
		reset : IN std_logic;
		S2 : IN std_logic;          
		q : OUT std_logic_vector(3 downto 0);
		rot : OUT std_logic;
		gelb : OUT std_logic;
		gruen : OUT std_logic
		);
	END COMPONENT;

	SIGNAL takt :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL S2 :  std_logic;
	SIGNAL q :  std_logic_vector(3 downto 0);
	SIGNAL rot :  std_logic;
	SIGNAL gelb :  std_logic;
	SIGNAL gruen :  std_logic;

BEGIN

	uut: ampel_komplett_e PORT MAP(
		takt => takt,
		reset => reset,
		S2 => S2,
		q => q,
		rot => rot,
		gelb => gelb,
		gruen => gruen
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



tb_S2ect: process -- zur Erzeugung des S2ect Signals
	begin
		S2 <= '0';
		wait for 200ns;

		S2 <= not S2;
		wait for 100ns;

		S2 <= '0';
		wait for 200ns;
	end process;



END;
