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

entity LPM_COUNTER is
	generic (LPM_WIDTH : positive;
		 LPM_MODULUS: natural;
		 LPM_DIRECTION : string;
		 LPM_AVALUE : string;
		 LPM_SVALUE : string;
		 LPM_PVALUE : string;
		 LPM_TYPE: string;
		 LPM_HINT : string);
	port (DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
		 CLOCK : in std_logic;
		 CLK_EN : in std_logic;
		 CNT_EN : in std_logic;
		 UPDOWN : in std_logic;
		 SLOAD : in std_logic;
		 SSET : in std_logic;
		 SCLR : in std_logic;
		 ALOAD : in std_logic;
		 ASET : in std_logic;
		 ACLR : in std_logic;
		 CIN : in std_logic;
		 COUT : out std_logic;
		 Q : out std_logic_vector(LPM_WIDTH-1 downto 0));
	function str_to_int(s: string) return integer is
	variable len : integer:= s'length;
	variable ivalue : integer := 0;
	variable digit : integer;
	begin
	   for i in 1 to len loop
	      case s(i) is
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
	         when others =>
	            ASSERT FALSE
	            REPORT "Illegal Character "& s(i) & "in string parameter! "
	            SEVERITY ERROR;
	      end case;
	      ivalue := ivalue*10 + digit;
	   end loop;
	   return ivalue;
	end;

end LPM_COUNTER;

architecture LPM_SYN of LPM_COUNTER is

signal COUNT : std_logic_vector(LPM_WIDTH downto 0);
signal INIT : std_logic := '0';

begin

	Counter: process (CLOCK, ACLR, ASET, ALOAD, DATA, INIT)
	variable IAVALUE, ISVALUE : integer;
	variable IMODULUS : integer;
	variable dir_tmp : integer;
	variable vmodulus : std_logic_vector (LPM_WIDTH downto 0);

	begin
	   -- INITIALIZE TO PVALUE & SETUP VARIABLES --
	   if INIT = '0' then
	      if LPM_PVALUE /= "UNUSED" then
		 COUNT <= conv_std_logic_vector(str_to_int(LPM_PVALUE), LPM_WIDTH+1);
	      end if;
	      FOR i IN (LPM_WIDTH) downto 0 LOOP
	         if i = LPM_WIDTH then
	            vmodulus(i) := '1';
	         else
	            vmodulus(i) := '0';
	         end if;
	      END LOOP;
	      INIT <= '1';
	   else
	      if ACLR =  '1' then
		 COUNT <= (OTHERS => '0');
	      elsif ASET = '1' then
		 if LPM_AVALUE = "UNUSED" then
		    COUNT <= (OTHERS => '1');
		 else
		    IAVALUE := str_to_int(LPM_AVALUE);
		    COUNT <= conv_std_logic_vector(IAVALUE, LPM_WIDTH+1);
		 end if;
	      elsif ALOAD = '1' then
		 COUNT(LPM_WIDTH-1 downto 0) <= DATA;
	      elsif CLOCK'event and CLOCK = '1' then
		 if CLK_EN = '1' then
		    if SCLR = '1' then
		       COUNT <= (OTHERS => '0');
		    elsif SSET = '1' then
		       if LPM_SVALUE = "UNUSED" then
			  COUNT <= (OTHERS => '1');
		       else
			  ISVALUE := str_to_int(LPM_SVALUE);
			  COUNT <= conv_std_logic_vector(ISVALUE, LPM_WIDTH+1);
		       end if;
		    elsif SLOAD = '1' then
		       COUNT(LPM_WIDTH-1 downto 0) <= DATA;
		    elsif CNT_EN = '1' then
		       if LPM_DIRECTION = "UNUSED" then
			  if UPDOWN = '0' then
			     dir_tmp := 0;   -- decrement
			  else
			     dir_tmp := 1;   -- increment
			  end if;
		       elsif LPM_DIRECTION = "UP" then
			  dir_tmp := 1;       -- increment
		       elsif LPM_DIRECTION = "DOWN" then
			  dir_tmp := 0;       -- decrement
		       else
			  dir_tmp := 1;       -- illegal param value; increment
		       end if;

		       if vmodulus = 1 then
			  COUNT <= (OTHERS => '0');
		       elsif dir_tmp = 1 then
			  -- INCREMENT --
			  if COUNT >= vmodulus - 1 then
			     COUNT <= conv_std_logic_vector(CIN, LPM_WIDTH+1);
			  elsif COUNT >= vmodulus - 2 then
			     if CIN = '1' then
				COUNT <= conv_std_logic_vector(0, LPM_WIDTH+1);
			     else
				COUNT <= vmodulus-1;
			     end if;
			  else
			     COUNT <= COUNT + 1 + CIN;
			  end if;
		       else
			  -- DECREMENT --
			  if COUNT = 0 then
			     if CIN = '1' then
				COUNT <= vmodulus-2;
			     else
				COUNT <= vmodulus-1;
			     end if;
			  elsif COUNT = 1 then
			     if CIN = '1' then
				COUNT <= vmodulus-1;
			     else
				COUNT <= conv_std_logic_vector(0, LPM_WIDTH+1);
			     end if;
			  else
			     COUNT <= COUNT - 1 - CIN;
			  end if;
		       end if;
		    else
		    end if;
		 else
		 end if;
	      else
	      end if;
	   end if;
	   COUNT(LPM_WIDTH) <= '0';
	end process Counter;

	CarryOut: process (COUNT, CIN, INIT)
	variable IMODULUS : integer;
	variable dir_tmp : integer;
	variable vmodulus : std_logic_vector (LPM_WIDTH downto 0);

	begin
	   if INIT = '1' then
	      FOR i IN (LPM_WIDTH) downto 0 LOOP
	         if i = LPM_WIDTH then
	            vmodulus(i) := '1';
	         else
	            vmodulus(i) := '0';
	         end if;
	      END LOOP;
	      if LPM_DIRECTION = "UNUSED" then
		 if UPDOWN = '0' then
		    dir_tmp := 0;   -- decrement
		 else
		    dir_tmp := 1;   -- increment
		 end if;
	      elsif LPM_DIRECTION = "UP" then
		 dir_tmp := 1;       -- increment
	      elsif LPM_DIRECTION = "DOWN" then
		 dir_tmp := 0;       -- decrement
	      else
		 dir_tmp := 1;       -- illegal param value; increment
	      end if;

	      COUT <= '0';
	      if vmodulus = 1 then
		 COUT <= '1';
	      elsif CIN = '1' then
		 if (dir_tmp = 1 and COUNT >= vmodulus - 2)
		    or (dir_tmp = 0 and COUNT <= 1) then
		       COUT <= '1';
		 else
		 end if;
	      else
		 if (dir_tmp = 1 and COUNT >= vmodulus - 1)
		    or (dir_tmp = 0 and COUNT = 0) then
		       COUT <= '1';
		 else
		 end if;
	      end if;
	   else
	   end if;
	end process CarryOut;

	Q <= COUNT(LPM_WIDTH-1 downto 0);

end LPM_SYN;

Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.lpm_components.all;

ENTITY test IS

    PORT (
	Data : IN  STD_LOGIC_VECTOR( 15 DOWNTO 0);
	Clock : IN  STD_LOGIC;
	Cnt_En : IN  STD_LOGIC;
	UpDown : IN  STD_LOGIC;
	Sclr : IN  STD_LOGIC;
	Q : OUT  STD_LOGIC_VECTOR( 15 DOWNTO 0));
END test;

ARCHITECTURE LATTICE_ARCH OF test IS
  COMPONENT LPM_COUNTER 
     GENERIC(LPM_WIDTH : positive;
             LPM_MODULUS  : natural;
             LPM_DIRECTION: string;
             LPM_AVALUE   : string;
             LPM_SVALUE   : string;
             LPM_PVALUE   : string;
             LPM_TYPE  : string;
             LPM_HINT  : string);
     PORT(DATA  : IN std_logic_vector(15 downto 0);
          CLOCK : IN std_logic;
          CLK_EN: IN std_logic;
          CNT_EN: IN std_logic;
          UPDOWN: IN std_logic;
          SLOAD : IN std_logic;
          SSET   : IN std_logic;
          SCLR  : IN std_logic;
          ALOAD : IN std_logic;
          ASET  : IN std_logic;
          ACLR  : IN std_logic;
          CIN   : IN std_logic;
          COUT  : OUT std_logic;
          Q     : OUT std_logic_vector(15 downto 0));
  END COMPONENT;
  SIGNAL logic0: std_logic := '0';
  SIGNAL logic1: std_logic := '1';
BEGIN

  IO: LPM_COUNTER GENERIC MAP(LPM_WIDTH => 16,
                          LPM_MODULUS  => 65536,
                          LPM_DIRECTION=> "UNUSED",
                          LPM_AVALUE => "UNUSED",
                          LPM_SVALUE => "UNUSED",
                          LPM_PVALUE => "UNUSED",
                          LPM_TYPE => "LPM_COUNTER",
                          LPM_HINT => "UNUSED")
      PORT MAP(
                 Data(0) => logic0,
                 Data(1) => logic0,
                 Data(2) => logic0,
                 Data(3) => logic0,
                 Data(4) => logic0,
                 Data(5) => logic0,
                 Data(6) => logic0,
                 Data(7) => logic0,
                 Data(8) => logic0,
                 Data(9) => logic0,
                 Data(10) => logic0,
                 Data(11) => logic0,
                 Data(12) => logic0,
                 Data(13) => logic0,
                 Data(14) => logic0,
                 Data(15) => logic0,
                 CLK_EN=>logic1,
                 CNT_EN=>Cnt_En,
                 UPDOWN=>UpDown,
                 ACLR=>logic0,
                 ASET=>logic0,
                 ALOAD=>logic0,
                 SCLR=>Sclr,
                 SSET=>logic0,
                 SLOAD=>logic0,
                 CLOCK=>Clock,
                 CIN=>logic0,
                 Q => Q);
END LATTICE_ARCH;

