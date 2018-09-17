
-- VHDL Test Bench Created from source file VA_ent.vhd -- 04/16/18  17:32:01
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

	COMPONENT VA_ent
	PORT(
		ai : IN std_logic;
		bi : IN std_logic;
		ci : IN std_logic;          
		sumi : OUT std_logic;
		cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL ai :  std_logic;
	SIGNAL bi :  std_logic;
	SIGNAL ci :  std_logic;
	SIGNAL sumi :  std_logic;
	SIGNAL cout :  std_logic;

BEGIN

	uut: VA_ent PORT MAP(
		ai => ai,
		bi => bi,
		ci => ci,
		sumi => sumi,
		cout => cout
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   x_tb : PROCESS
BEGIN

x <= "00";

if x = "10" then
x <= "11";
elsif x = "11" then
x <= "00";
elsif x = "00" then
x <= "01";
elsif x = "01" then
x <= "10";
end if;
WAIT FOR 100 ns;

end PROCESS;


y_tb : PROCESS
BEGIN

y <= "00";

if y = "00" then
y <= "01";
elsif y = "01" then
y <= "10";
elsif y = "10" then
y <= "11";
elsif y = "11" then
y <= "00";
end if;
WAIT FOR 100 ns;

end PROCESS;



   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
