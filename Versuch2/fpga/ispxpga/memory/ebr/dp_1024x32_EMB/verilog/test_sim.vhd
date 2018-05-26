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
use std.textio.all;

entity LPM_RAM_DP is
	generic (LPM_WIDTH : positive;
		 LPM_WIDTHAD : positive;
		 LPM_PARITH_WIDTH : positive;
		 LPM_NUMWORDS : natural;
		 LPM_INDATA : string;
		 LPM_OUTDATA : string;
		 LPM_RDADDRESS_CONTROL : string;
		 LPM_WRADDRESS_CONTROL : string;
		 LPM_FILE : string;
		 LPM_TYPE : string;
		 LPM_HINT : string);
	port (RDCLOCK : in std_logic;
		 --RDCLKEN : in std_logic;
		 RDADDRESS : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
		 RDEN : in std_logic;
		 DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
		 WRADDRESS : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
		 WREN : in std_logic;
		 WRCLOCK : in std_logic;
		 --WRCLKEN : in std_logic := '1';
		 Q : out std_logic_vector(LPM_WIDTH-1 downto 0));

	function int_to_str( value : integer ) return string is
	variable ivalue,index : integer;
	variable digit : integer;
	variable line_no: string(8 downto 1) := "        ";
	begin
	   ivalue := value;
	   index := 1;
	   while (ivalue > 0) loop
		digit := ivalue MOD 10;
		ivalue := ivalue/10;
		case digit is
		   when 0 =>
			line_no(index) := '0';
		   when 1 =>
			line_no(index) := '1';
		   when 2 =>
			line_no(index) := '2';
		   when 3 =>
			line_no(index) := '3';
		   when 4 =>
			line_no(index) := '4';
		   when 5 =>
			line_no(index) := '5';
		   when 6 =>
			line_no(index) := '6';
		   when 7 =>
			line_no(index) := '7';
		   when 8 =>
			line_no(index) := '8';
		   when 9 =>
			line_no(index) := '9';
		   when others =>
			ASSERT FALSE
			REPORT "Illegal number!"
			SEVERITY ERROR;
		end case;
		index := index + 1;
	   end loop;
	   return line_no;
	end;

	function hex_str_to_int( str : string ) return integer is
	variable len : integer := str'length;
	variable ivalue : integer := 0;
	variable digit : integer;
	begin
	   for i in len downto 1 loop
		case str(i) is
		   when '0' =>
			digit := 0;
		   when '1' =>
			digit := 1;
		   when '2' =>
			digit := 2;
		   when '3' =>
			digit := 3;
		   when '4' =>
			digit := 4;
		   when '5' =>
			digit := 5;
		   when '6' =>
			digit := 6;
		   when '7' =>
			digit := 7;
		   when '8' =>
			digit := 8;
		   when '9' =>
			digit := 9;
		   when 'A' =>
			digit := 10;
		   when 'a' =>
			digit := 10;
		   when 'B' =>
			digit := 11;
		   when 'b' =>
			digit := 11;
		   when 'C' =>
			digit := 12;
		   when 'c' =>
			digit := 12;
		   when 'D' =>
			digit := 13;
		   when 'd' =>
			digit := 13;
		   when 'E' =>
			digit := 14;
		   when 'e' =>
			digit := 14;
		   when 'F' =>
			digit := 15;
		   when 'f' =>
			digit := 15;
		   when others =>
			ASSERT FALSE
			REPORT "Illegal character "&  str(i) & "in Intel Hex File! "
			SEVERITY ERROR;
		end case;
		ivalue := ivalue * 16 + digit;
	   end loop;
	   return ivalue;
	end;

	procedure Shrink_line(L : inout LINE; pos : in integer) is
	subtype nstring is string(1 to pos);
	variable stmp : nstring;
	begin
	   if pos >= 1 then
		read(l, stmp);
	   end if;
	end;

end LPM_RAM_DP;

architecture LPM_SYN of lpm_ram_dp is

--type lpm_memory is array(lpm_numwords-1 downto 0) of std_logic_vector(lpm_width-1 downto 0);
type lpm_memory is array((2**lpm_widthad)-1 downto 0) of std_logic_vector(lpm_width-1 downto 0);

signal data_tmp, data_reg : std_logic_vector(lpm_width-1 downto 0);
signal q_tmp, q_reg : std_logic_vector(lpm_width-1 downto 0) := (others => 'X');
signal rdaddress_tmp, rdaddress_reg : std_logic_vector(lpm_widthad-1 downto 0);
signal wraddress_tmp, wraddress_reg : std_logic_vector(lpm_widthad-1 downto 0);
signal wren_tmp, wren_reg : std_logic;
signal rden_tmp, rden_reg : std_logic;
signal mem_data : lpm_memory;

begin
	sync: process(data, data_reg, rden, rden_reg, rdaddress, rdaddress_reg,
				  wren, wren_reg, wraddress, wraddress_reg, q_tmp, q_reg)
	begin
	   if (lpm_rdaddress_control = "REGISTERED") then
		rdaddress_tmp <= rdaddress_reg;
		rden_tmp <= rden_reg;
	   else
		rdaddress_tmp <= rdaddress;
		rden_tmp <= rden;
	   end if;
	   if (lpm_wraddress_control = "REGISTERED") then
		wraddress_tmp <= wraddress_reg;
		wren_tmp <= wren_reg;
	   else
		wraddress_tmp <= wraddress;
		wren_tmp <= wren;
	   end if;
	   if (lpm_indata = "REGISTERED") then
		data_tmp <= data_reg;
	   else
		data_tmp <= data;
	   end if;
	   if (lpm_outdata = "REGISTERED") then
		q <= q_reg;
	   else
		q <= q_tmp;
	   end if;
	end process;

	input_reg: process (wrclock)
	begin
	   --if wrclock'event and wrclock = '1' and wrclken = '1' then
	   if wrclock'event and wrclock = '1' then
		data_reg <= data;
		wraddress_reg <= wraddress;
		wren_reg <= wren;
	   end if;
	end process;

	output_reg: process (rdclock)
	begin
	   --if rdclock'event and rdclock = '1' and rdclken = '1' then
	   if rdclock'event and rdclock = '1' then
		rdaddress_reg <= rdaddress;
		rden_reg <= rden;
		q_reg <= q_tmp;
	   end if;
	end process;

	wr_memory: process(wren_tmp, wraddress_tmp)
	variable mem_data_tmp : std_logic_vector(lpm_width-1 downto 0):= (others => 'X');
	variable mem_init: boolean := false;
	variable i, j, k, lineno : integer := 0;
	variable buf: line ;
	variable booval: boolean ;
	variable base, byte, rec_type, datain, addr, checksum: string(2 downto 1);
	variable startadd: string(4 downto 1);
	variable ibase: integer := 0;
	variable ibyte: integer := 0;
	variable istartadd: integer := 0;
	variable check_sum_vec, check_sum_vec_tmp: std_logic_vector(7 downto 0);
	begin
	   -- INITIALIZE --
	   if NOT(mem_init) then
		if (LPM_FILE = "UNUSED") then
		   ASSERT FALSE
		   REPORT "Initialization file not found!"
		   SEVERITY WARNING;
		end if;
		mem_init := TRUE;
	   end if;

	   -- MEMORY FUNCTION --
	   if wren_tmp = '1' then
		mem_data (conv_integer(wraddress_tmp)) <= data_tmp;
	   end if;
	end process;

	rd_memory: process(rdaddress_tmp, rden_tmp)
	variable mem_data_tmp : std_logic_vector(lpm_width-1 downto 0):= (others => 'X');
	variable mem_init: boolean := false;
	variable i, j, k, lineno : integer := 0;
	variable buf: line ;
	variable booval: boolean ;
	variable base, byte, rec_type, datain, addr, checksum: string(2 downto 1);
	variable startadd: string(4 downto 1);
	variable ibase: integer := 0;
	variable ibyte: integer := 0;
	variable istartadd: integer := 0;
	variable check_sum_vec, check_sum_vec_tmp: std_logic_vector(7 downto 0);
	begin
	   if rden_tmp = '1' then
		q_tmp <= mem_data(conv_integer(rdaddress_tmp));
	   --else
	   --    q_tmp <= (OTHERS => 'Z');
	   end if;
	end process;

end LPM_SYN;
Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.lpm_components.all;

ENTITY test IS

    PORT (
	EDI : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
	Data : IN  STD_LOGIC_VECTOR( 31 DOWNTO 0);
	WrAddress : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);
	RdAddress : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);
	RdClock : IN  STD_LOGIC;
	WrClock : IN  STD_LOGIC;
	RdEn : IN  STD_LOGIC;
	WrEn : IN  STD_LOGIC;
	EDO : OUT  STD_LOGIC_VECTOR( 3 DOWNTO 0);
	Q : OUT  STD_LOGIC_VECTOR( 31 DOWNTO 0));
END test;

ARCHITECTURE LATTICE_ARCH OF test IS
  COMPONENT LPM_RAM_DP
     GENERIC(LPM_WIDTH : positive;
 		LPM_WIDTHAD : positive;
 		LPM_PARITH_WIDTH : positive;
   		LPM_NUMWORDS : natural;
   		LPM_INDATA : string;
   		LPM_OUTDATA : string;
   		LPM_RDADDRESS_CONTROL : string;
   		LPM_WRADDRESS_CONTROL : string;
   		LPM_FILE : string;
   		LPM_TYPE : string;
  		LPM_HINT : string);
     PORT(RDCLOCK : in std_logic;
  		--RDCLKEN : in std_logic;
  		RDADDRESS : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
  		RDEN : in std_logic;
  		DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
  		WRADDRESS : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
  		WREN : in std_logic;
  		WRCLOCK : in std_logic;
  		--WRCLKEN : in std_logic;
		Q : out std_logic_vector(LPM_WIDTH-1 downto 0));
  END COMPONENT;

  SIGNAL logic0: std_logic := '0';
  SIGNAL logic1: std_logic := '1';
BEGIN

  IO: LPM_RAM_DP GENERIC MAP(LPM_WIDTH => 36,
  				 LPM_WIDTHAD => 10,
  				 LPM_PARITH_WIDTH => 4,
  				 LPM_NUMWORDS => 1024,
  				 LPM_INDATA => "UNREGISTERED",
  				 LPM_OUTDATA => "REGISTERED",
  				 LPM_RDADDRESS_CONTROL => "UNREGISTERED",
  				 LPM_WRADDRESS_CONTROL => "REGISTERED",
  				 LPM_FILE => "UNUSED",
  				 LPM_TYPE => "LPM_RAM_DP",
  				 LPM_HINT => "EMB")

      PORT MAP(
                 DATA(31 downto 0) => Data(31 downto 0),
                 DATA(35 downto 32) => EDI(3 downto 0),
                 RDADDRESS => RdAddress,
                 WRADDRESS => WrAddress,
                 WRCLOCK => WrClock,
                 RDCLOCK => RdClock,
                 RDEN => RdEn,
                 WREN => WrEn,
                 Q(35 downto 32) => EDO(3 downto 0),
                 Q(31 downto 0) => Q(31 downto 0));
END LATTICE_ARCH;
