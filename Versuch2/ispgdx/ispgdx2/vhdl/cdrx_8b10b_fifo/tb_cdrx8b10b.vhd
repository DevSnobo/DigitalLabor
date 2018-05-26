
-- VHDL Test Bench Created to source file tb_cdrx8b10b.vhd -- 11/11/04
--

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
library gdx2;
use gdx2.all;


ENTITY tb_cdrx8b10b IS
END tb_cdrx8b10b;

ARCHITECTURE behavior OF tb_cdrx8b10b IS 

	COMPONENT cdrx_8b10b_fifo
	PORT(

	SIN_P, SIN_N	: in std_logic;
	REF_CLK		: in std_logic;
	RST		: in std_logic;
	REN		: in std_logic;
	FIFO_OUT	: out std_logic_vector(9 downto 0);
       	REC_CLK		: inout std_logic;
       	CS_LOCK		: out std_logic;
       	SYDT_X		: out std_logic;
       	FULL		: out std_logic;
       	EMPTY		: out std_logic;
       	START_RD	: out std_logic
	);
	END COMPONENT;


	SIGNAL SIN_P		: std_logic := '0' ;
	SIGNAL SIN_N		: std_logic := '1' ;
	SIGNAL REF_CLK		: std_logic := '0';                     
	SIGNAL RST		: std_logic := '0';                     
	SIGNAL REN		: std_logic := '0';                     
	SIGNAL FIFO_OUT		: std_logic_vector(9 downto 0); 
	SIGNAL REC_CLK		: std_logic;                 
	SIGNAL CS_LOCK		: std_logic;                    
	SIGNAL sydt_x		: std_logic;                    
	SIGNAL FULL		: std_logic;                    
	SIGNAL EMPTY		: std_logic;                    
	SIGNAL START_RD		: std_logic;                    
	SIGNAL CNT		: std_logic_vector(9 downto 0) := "0000000000"; 
	SIGNAL ALIGNMENT	: std_logic_vector(19 downto 0) := "11000001010011111010"; 
	SIGNAL VECA		: std_logic_vector(9 downto 0) := "1101000101";
	SIGNAL VECB		: std_logic_vector(9 downto 0) := "1111001101";



BEGIN
	REF_CLK <= not REF_CLK after 10 ns;

	uut: cdrx_8b10b_fifo PORT MAP(

		SIN_P 		=> 	SIN_P,
		SIN_N 		=> 	SIN_N,
		REF_CLK 	=> 	REF_CLK,
		RST 		=> 	RST,
		REN 		=> 	REN,
		FIFO_OUT 	=> 	FIFO_OUT,
		REC_CLK 	=> 	REC_CLK,
		CS_LOCK 	=> 	CS_LOCK,
		SYDT_X 		=> 	SYDT_X,
		FULL 		=> 	FULL,
		EMPTY 		=> 	EMPTY,
		START_RD 	=> 	START_RD);



PROCESS
   BEGIN
   	wait for 15 ns;
   	RST <= '1';
   	wait for 55 ns;
   	for k in 0 to 4 loop
		for j in 19 downto 0 loop
			SIN_P <= ALIGNMENT(j);	
			wait for 2 ns;
		end loop;
	end loop;			   			 

   	for k in 0 to 9 loop
		CNT <= VECA;
		for j in 0 to 9 loop
			SIN_P <= CNT(j);
			wait for 2 ns;
		end loop;
	end loop;			   			 

   	for k in 0 to 9 loop
		CNT <= VECB;
		for j in 0 to 9 loop
			SIN_P <= CNT(j);
			wait for 2 ns;
		end loop;
	end loop;			   			 

        wait; 
 
   END PROCESS;


   process
   begin
   	wait for 400 ns;
   	REN <= '1';
   	wait;
   end process;

END;
