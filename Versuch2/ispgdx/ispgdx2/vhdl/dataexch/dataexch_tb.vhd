LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY dataexch_tb IS
END dataexch_tb;

ARCHITECTURE behavior OF dataexch_tb IS 

	COMPONENT dataexch
	PORT(
		oe0 : IN std_logic;
		oe1 : IN std_logic;       
		busAdata : INOUT std_logic_vector(63 downto 0);
		busBdata : INOUT std_logic_vector(63 downto 0);
		busCdata : INOUT std_logic_vector(63 downto 0);
		busDdata : INOUT std_logic_vector(63 downto 0)
		);
	END COMPONENT;

	SIGNAL busAdata :  std_logic_vector(63 downto 0);
	SIGNAL busBdata :  std_logic_vector(63 downto 0);
	SIGNAL busCdata :  std_logic_vector(63 downto 0);
	SIGNAL busDdata :  std_logic_vector(63 downto 0);
	SIGNAL oe0 :  std_logic;
	SIGNAL oe1 :  std_logic;

BEGIN

	uut: dataexch PORT MAP(
		busAdata => busAdata,
		busBdata => busBdata,
		busCdata => busCdata,
		busDdata => busDdata,
		oe0 => oe0,
		oe1 => oe1
	);


-- *** Test Bench - User Defined Section ***
   p_oe0 : PROCESS
   BEGIN
       oe0 <= '0'; wait for 200 ns;
       oe0 <= '1'; wait for 200 ns;
       oe0 <= '0'; wait for 100 ns;
       oe0 <= '1'; wait for 100 ns;
       oe0 <= '0'; wait for 100 ns;
      wait; -- forever
   END PROCESS;

   p_oe1 : PROCESS
   BEGIN
       oe1 <= '1'; wait for 200 ns;
       oe1 <= '0'; wait for 200 ns;
       oe1 <= '1'; wait for 100 ns;
       oe1 <= '0'; wait for 100 ns;
       oe1 <= '1'; wait for 100 ns;
      wait; -- forever
   END PROCESS;

   busA : PROCESS
   BEGIN
       busAdata <= "0101010101010101010101010101010101010101010101010101010101010101"; wait for 100 ns;
       busAdata <= "0111011101110111011101110111011101110111011101110111011101110111"; wait for 100 ns;
       busAdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 200 ns;
       busAdata <= "1001100110011001100110011001100110011001100110011001100110011001"; wait for 100 ns;
       busAdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 100 ns;
       busAdata <= "1011101110111011101110111011101110111011101110111011101110111011"; wait for 100 ns;
      wait; -- forever
   END PROCESS;

   busB : PROCESS
   BEGIN
       busBdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 200 ns;
       busBdata <= "0101010101010101010101010101010101010101010101010101010101010101"; wait for 100 ns;
       busBdata <= "1111111111111111111111111111111111111111111111111111111111111111"; wait for 100 ns;
       busBdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 100 ns;
       busBdata <= "0001001000110100010101100111100000010010001101000101011001111000"; wait for 100 ns;
       busBdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 100 ns;
      wait; -- forever
   END PROCESS;

   busC : PROCESS
   BEGIN
       busCdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 200 ns;
       busCdata <= "0001001000110100010101100111100000010010001101000101011001111000"; wait for 100 ns;
       busCdata <= "1011101110111011101110111011101110111011101110111011101110111011"; wait for 100 ns;
       busCdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 100 ns;
       busCdata <= "1000100010001000100010001000100010001000100010001000100010001000"; wait for 100 ns;
       busCdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 100 ns;
      wait; -- forever
   END PROCESS;

   busD : PROCESS
   BEGIN
       busDdata <= "0010001000100010001000100010001000100010001000100010001000100010"; wait for 100 ns;
       busDdata <= "0100010001000100010001000100010001000100010001000100010001000100"; wait for 100 ns;
       busDdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 200 ns;
       busDdata <= "0110011001100110011001100110011001100110011001100110011001100110"; wait for 100 ns;
       busDdata <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; wait for 100 ns;
       busDdata <= "1010101010101010101010101010101010101010101010101010101010101010"; wait for 100 ns;
      wait; -- forever
   END PROCESS;

-- *** End Test Bench - User Defined Section ***

END;
