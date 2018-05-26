----------------------------------------------------------
-- This file was developed by Lattice Semiconductor Corp.
-- Lattice Semiconductor Corp. does not guarantee that
-- this file is complete or fit for any particular purpose.
-- Any one using this file are responsible for the results
-- of such use.
----------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.ALL;

package LPM_COMPONENTS IS
  type std_logic_2d is array (NATURAL RANGE <>, NATURAL RANGE <>) of std_logic;
end;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.LPM_COMPONENTS.all;

entity LPM_FIFO is
	generic (LPM_WIDTH : positive;
		 LPM_WIDTHU : natural;
		 LPM_PARITY_WIDTH : positive;
		 LPM_NUMWORDS : positive;
		 LPM_SHOWAHEAD : string;
		 LPM_TYPE : string;
		 LPM_HINT : string);
	port (DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
		  CLOCK : in std_logic;
		  WRREQ : in std_logic;
		  RDREQ : in std_logic;
		  ACLR : in std_logic;
		  SCLR : in std_logic;
		  Q : out std_logic_vector(LPM_WIDTH-1 downto 0);
		  USEDW : out std_logic_vector(LPM_WIDTHU-1 downto 0);
		  FULL : out std_logic;
		  EMPTY : out std_logic);
end LPM_FIFO;

architecture LPM_SYN of lpm_fifo is

type lpm_memory is array (lpm_numwords-1 downto 0) of std_logic_vector(lpm_width-1 downto 0);

signal tmp_q : std_logic_vector(lpm_width-1 downto 0) := (OTHERS => 'X');
signal read_id, write_id, count_id : integer := 0;
signal empty_flag : std_logic := '1';
signal full_flag : std_logic := '0';
constant ZEROS : std_logic_vector(lpm_width-1 downto 0) := (OTHERS => 'X');

begin

	process (clock, aclr)
	variable mem_data : lpm_memory := (OTHERS => ZEROS);

	begin
	   if (aclr = '1') then
		tmp_q <= ZEROS;
		full_flag <= '0';
		empty_flag <= '1';
		read_id <= 0;
		write_id <= 0;
		count_id <= 0;
		if (lpm_showahead = "ON") then
		   tmp_q <= mem_data(0);
		end if;
	   elsif (clock'event and clock = '1') then
		if (sclr = '1') then
		   tmp_q <= mem_data(read_id);
		   full_flag <= '0';
		   empty_flag <= '1';
		   read_id <= 0;
		   write_id <= 0;
		   count_id <= 0;
		   if (lpm_showahead = "ON") then
			tmp_q <= mem_data(0);
		   end if;
		else
		   ----- IF BOTH READ AND WRITE -----
		   if (wrreq = '1' and full_flag = '0') and
				(rdreq = '1' and empty_flag = '0') then
			mem_data(write_id) := data;
			if (write_id >= lpm_numwords-1) then
			   write_id <= 0;
			else
			   write_id <= write_id + 1;
			end if;

			tmp_q <= mem_data(read_id);
			if (read_id >= lpm_numwords-1) then
			   read_id <= 0;
			   if (lpm_showahead = "ON") then
				tmp_q <= mem_data(0);
			   end if;
			else
			   read_id <= read_id + 1;
			   if (lpm_showahead = "ON") then
				tmp_q <= mem_data(read_id+1);
			   end if;
			end if;

		   ----- IF WRITE (ONLY) -----
		   elsif (wrreq = '1' and full_flag = '0') then
			mem_data(write_id) := data;
			if (lpm_showahead = "ON") then
			   tmp_q <= mem_data(read_id);
			end if;
			count_id <= count_id + 1;
			empty_flag <= '0';
			if (count_id >= lpm_numwords-1) then
			   full_flag <= '1';
			   count_id <= lpm_numwords;
			end if;
			if (write_id >= lpm_numwords-1) then
			   write_id <= 0;
			else
			   write_id <= write_id + 1;
			end if;

		   ----- IF READ (ONLY) -----
		   elsif (rdreq = '1' and empty_flag = '0') then
			tmp_q <= mem_data(read_id);
			count_id <= count_id - 1;
			full_flag <= '0';
			if (count_id <= 1) then
			   empty_flag <= '1';
			   count_id <= 0;
			end if;
			if (read_id >= lpm_numwords-1) then
			   read_id <= 0;
			   if (lpm_showahead = "ON") then
				tmp_q <= mem_data(0);
			   end if;
			else
			   read_id <= read_id + 1;
			   if (lpm_showahead = "ON") then
				tmp_q <= mem_data(read_id+1);
			   end if;
			end if;
		   end if;  -- if WRITE and/or READ
		end if;  -- if sclr = '1'
	   end if;  -- if aclr = '1'
	end process;

	q <= tmp_q;
	full <= full_flag;
	empty <= empty_flag;
	usedw <= conv_std_logic_vector(count_id, lpm_widthu);

end LPM_SYN;
Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.lpm_components.all;

ENTITY test_LPM_FIFO_4_8_256_1_OFF_EMB IS

    PORT (
	EDI : IN  STD_LOGIC_VECTOR( 0 DOWNTO 0);
	Data : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
	Clock : IN  STD_LOGIC;
	WrReq : IN  STD_LOGIC;
	RdReq : IN  STD_LOGIC;
	Aclr : IN  STD_LOGIC;
	EDO : OUT  STD_LOGIC_VECTOR( 0 DOWNTO 0);
	Q : OUT  STD_LOGIC_VECTOR( 3 DOWNTO 0);
	UsedW : OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0);
	Full : OUT  STD_LOGIC;
	Empty : OUT  STD_LOGIC);
END test_LPM_FIFO_4_8_256_1_OFF_EMB;

ARCHITECTURE LATTICE_ARCH OF test_LPM_FIFO_4_8_256_1_OFF_EMB IS
  COMPONENT LPM_FIFO
     GENERIC(LPM_WIDTH : positive;
	     LPM_WIDTHU : natural;
	     LPM_PARITY_WIDTH : positive;
	     LPM_NUMWORDS : positive;
	     LPM_SHOWAHEAD : string;
	     LPM_TYPE : string;
	     LPM_HINT : string);
     PORT(DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
	  CLOCK : in std_logic;
	  WRREQ : in std_logic;
	  RDREQ : in std_logic;
	  ACLR : in std_logic;
	  SCLR : in std_logic;
	  Q : out std_logic_vector(LPM_WIDTH-1 downto 0);
	  USEDW : out std_logic_vector(LPM_WIDTHU-1 downto 0);
	  FULL : out std_logic;
	  EMPTY : out std_logic);
  END COMPONENT;
  SIGNAL logic0: std_logic := '0';
  SIGNAL logic1: std_logic := '1';
BEGIN

  IO: LPM_FIFO GENERIC MAP(LPM_WIDTH =>5,
		 	   LPM_WIDTHU => 8,
		 	   LPM_PARITY_WIDTH => 1,
		 	   LPM_NUMWORDS => 256,
		 	   LPM_SHOWAHEAD => "OFF",
		 	   LPM_TYPE => "LPM_FIFO",
		 	   LPM_HINT => "EMB")
      PORT MAP(
                 DATA(3 downto 0) => Data(3 downto 0),
                 DATA(4) => EDI(0),
	       ACLR =>Aclr,
               SCLR => logic0,
               CLOCK=>Clock,
               WRREQ => WrReq,
               RDREQ => RdReq,
               FULL =>Full,
               EMPTY => Empty,
               USEDW => UsedW,
                 Q(4) => EDO(0),
                 Q(3 downto 0) => Q(3 downto 0));
END LATTICE_ARCH;
