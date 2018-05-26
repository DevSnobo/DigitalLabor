library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- synthesis translate_off
library gdx2; 
use gdx2.components.all;
-- synthesis translate_on
-- This design can be synthesized by either Synplify or LeonardoSpectrum.
-- The source code contains attributes for both synthesis tools.
-- Simple CDRX + FIFO to process 8B10B encoded pattern.
-- Target Device: LX256V-5F484C.
-- High Speed serial data enters RX, then Recovered Parallel Data is written 
-- to FIFO with Recovered clock.  
-- The RX is assigned to SERDES Block 3B.
-- CDR and FIFO share a same reset.

entity cdrx_8b10b_fifo is
port (

	-- High Speed LVDS I/Os
	SIN_P, SIN_N	: in std_logic; -- Rx Port

	REF_CLK		: in std_logic; -- System clock and processor clock
	RST		: in std_logic; -- System reset
	REN		: in std_logic; -- System reset

	-- Low Speed I/Os
	FIFO_OUT	: out std_logic_vector(9 downto 0);

        REC_CLK		: out std_logic;
        CS_LOCK		: out std_logic;
        SYDT_X		: out std_logic;
        FULL		: out std_logic;
        EMPTY		: out std_logic;
        START_RD	: out std_logic
);

-- Assign RX to HSI3B
attribute LOC : string;
attribute LOC of SIN_P  	: signal is "PG15";
attribute LOC of SIN_N	 	: signal is "PG14";

end cdrx_8b10b_fifo;


architecture behave of cdrx_8b10b_fifo is

component LVDSIN
port (
	P_IN		: in std_logic;
	N_IN		: in std_logic;
	O		: out std_logic
);
end component;

component CDRX_8B10B
generic (
	IN_FREQ		: string := "50.000"
	);
port 	(
	SIN		: in std_logic;
	REFCLK		: in std_logic;
	CDRRST		: in std_logic;
	RXD0		: out std_logic;
	RXD1		: out std_logic;
	RXD2		: out std_logic;
	RXD3		: out std_logic;
	RXD4		: out std_logic;
	RXD5		: out std_logic;
	RXD6		: out std_logic;
	RXD7		: out std_logic;
	RXD8		: out std_logic;
	RXD9		: out std_logic;
	RECCLK		: out std_logic;
	CSLOCK		: out std_logic;
	SYDT		: out std_logic
	);
end component;

component FIFO15X10A
port 	(
	DI0		: in std_logic;
	DI1		: in std_logic;
	DI2		: in std_logic;
	DI3		: in std_logic;
	DI4		: in std_logic;
	DI5		: in std_logic;
	DI6		: in std_logic;
	DI7		: in std_logic;
	DI8		: in std_logic;
	DI9		: in std_logic;
        WE		: in std_logic;
	WCLK		: in std_logic;
 	RST		: in std_logic;
        RE		: in std_logic;
	RCLK		: in std_logic;
        DO0		: out std_logic;
	DO1		: out std_logic;
	DO2		: out std_logic;
	DO3		: out std_logic;
	DO4		: out std_logic;
	DO5		: out std_logic;
	DO6		: out std_logic;
	DO7		: out std_logic;
	DO8		: out std_logic;
	DO9		: out std_logic;
        FULL		: out std_logic;
	EMPTY		: out std_logic;
        START_RD	: out std_logic
	); 

end component;

signal	SIN, rst_node, int_recclk, WEN, int_sydt	: std_logic;
signal 	d 		: std_logic_vector(9 downto 0);

-- Set the HSI's frequency
attribute IN_FREQ : string;
attribute IN_FREQ of I2  : label is "50.0";

begin

I1: LVDSIN port map (P_IN => SIN_P, N_IN => SIN_N, O => SIN);

I2: CDRX_8B10B 
	generic map (
		IN_FREQ => "50.0")

	port map (
		SIN => SIN, 
		REFCLK => REF_CLK, 
		CDRRST => rst_node, 
              	RXD0 => d(0), 
		RXD1 => d(1), 
		RXD2 => d(2), 
		RXD3 => d(3), 
		RXD4 => d(4),
              	RXD5 => d(5), 
		RXD6 => d(6), 
		RXD7 => d(7), 
		RXD8 => d(8), 
		RXD9 => d(9),
		RECCLK => int_recclk, 
		CSLOCK => CS_LOCK, 
		SYDT => int_sydt);


I3: FIFO15X10A
   port map (
		DI0 	=> 	d(0),
		DI1 	=> 	d(1),
		DI2 	=> 	d(2),
		DI3 	=> 	d(3),
		DI4 	=> 	d(4),
		DI5 	=> 	d(5),
		DI6 	=> 	d(6),
		DI7 	=> 	d(7),
		DI8 	=> 	d(8),
		DI9 	=> 	d(9),
		WE 	=> 	WEN,
		WCLK 	=> 	int_recclk,
		RST 	=> 	rst_node,
		RE 	=> 	REN,
		RCLK 	=> 	REF_CLK,
		DO0 	=> 	FIFO_OUT(0),
		DO1 	=> 	FIFO_OUT(1),
		DO2 	=> 	FIFO_OUT(2),
		DO3 	=> 	FIFO_OUT(3),
		DO4 	=> 	FIFO_OUT(4),
		DO5 	=> 	FIFO_OUT(5),
		DO6 	=> 	FIFO_OUT(6),
		DO7 	=> 	FIFO_OUT(7),
		DO8 	=> 	FIFO_OUT(8),
		DO9 	=> 	FIFO_OUT(9),
		FULL 	=> 	FULL,
		EMPTY 	=> 	EMPTY,
		START_RD=> 	START_RD);

	rst_node <= 	not RST ;
	REC_CLK  <= 	int_recclk;
	SYDT_X   <=	int_sydt;



process(rst_node, int_recclk)
begin
	if rst_node = '1' then
		WEN <= '0';
	elsif falling_edge(int_recclk) then
		if int_sydt = '1' then
			WEN <= '1';			
		end if;
	end if;
end process;	


end behave;
