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
use work.LPM_COMPONENTS.all;

entity LPM_SHIFTREG is
	generic (LPM_WIDTH : positive;
	   LPM_SHIFT_VALUE : integer;
	   LPM_AVALUE : string;
	   LPM_SVALUE : string;
	   LPM_PVALUE : string;
	   LPM_DIRECTION: string;
	   LPM_TYPE: string;
	   LPM_HINT : string);
	port (DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
	      CLOCK : in std_logic;
	      ENABLE : in std_logic;
	      SHIFTIN : in std_logic;
	      LOAD : in std_logic;
	      SCLR : in std_logic;
	      SSET : in std_logic;
	      ACLR : in std_logic;
	      ASET : in std_logic;
	      Q : out std_logic_vector(LPM_WIDTH-1 downto 0);
	      SHIFTOUT : out std_logic);
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
end LPM_SHIFTREG;

architecture LPM_SYN of LPM_SHIFTREG is

signal INIT : std_logic := '0';

begin

	process (CLOCK, ACLR, ASET, SCLR)
	variable so_tmp : std_logic_vector(LPM_SHIFT_VALUE downto 0);
	variable IAVALUE, ISVALUE : integer;
	variable IQ : std_logic_vector(LPM_WIDTH-1 downto 0);
	begin
	   -- INITIALIZE TO PVALUE --
	   if INIT = '0' then
		if LPM_PVALUE /= "UNUSED" then
		   IQ := conv_std_logic_vector(str_to_int(LPM_PVALUE), LPM_WIDTH);
		else
		   IQ := (OTHERS => 'X');
		end if;
		so_tmp := (OTHERS => '1');
		INIT <= '1';
	   elsif ACLR =  '1' then
		IQ := (OTHERS => '0');
	   elsif ASET = '1' then
		if LPM_AVALUE = "UNUSED" then
		   IQ := (OTHERS => '1');
		else
		   IAVALUE := str_to_int(LPM_AVALUE);
		   IQ := conv_std_logic_vector(IAVALUE, LPM_WIDTH);
		end if;
	   elsif CLOCK'event and CLOCK = '1' then
		if ENABLE = '1' then
		   if SCLR = '1' then
			IQ := (OTHERS => '0');
		   elsif SSET = '1' then
			if LPM_SVALUE = "UNUSED" then
			   IQ := (OTHERS => '1');
			else
			   ISVALUE := str_to_int(LPM_SVALUE);
			   IQ := conv_std_logic_vector(ISVALUE, LPM_WIDTH);
			end if;
		   elsif LOAD = '0' then
		      if LPM_DIRECTION = "LEFT" then
		        IQ := IQ(LPM_WIDTH-2 downto 0) & SHIFTIN;
		      else
		        IQ := SHIFTIN & IQ(LPM_WIDTH-1 downto 1);
		      end if;
		   else
		      IQ :=  DATA;
		   end if;
		   if LPM_SHIFT_VALUE > 0 then
		   	so_tmp := SHIFTIN & so_tmp(LPM_SHIFT_VALUE downto 1);
		   end if;
		end if;
	   end if;
	   Q <= IQ;
	   if LPM_SHIFT_VALUE > 0 then
	   	   	SHIFTOUT <= so_tmp(0);
	   else 
	        if LPM_DIRECTION = "LEFT" then
	           SHIFTOUT <= IQ(LPM_WIDTH-1);
	        else
	        	SHIFTOUT <= IQ(0);
	        end if;
	   end if;
	end process;

end LPM_SYN;

Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.lpm_components.all;

ENTITY test IS

    PORT (
	Data : IN  STD_LOGIC_VECTOR( 15 DOWNTO 0);
	Clock : IN  STD_LOGIC;
	Enable : IN  STD_LOGIC;
	Aclr : IN  STD_LOGIC;
	ShiftIn : IN  STD_LOGIC;
	Load : IN  STD_LOGIC;
	Q : OUT  STD_LOGIC_VECTOR( 15 DOWNTO 0);
	ShiftOut : OUT  STD_LOGIC);
END test;

ARCHITECTURE LATTICE_ARCH OF test IS
  COMPONENT LPM_SHIFTREG
     GENERIC(LPM_WIDTH : positive;
             LPM_SHIFT_VALUE : integer;
             LPM_AVALUE : string;
	     LPM_SVALUE : string;
	     LPM_PVALUE : string;
             LPM_DIRECTION : string;
             LPM_TYPE  : string;
             LPM_HINT  : string);
     PORT(DATA  : IN std_logic_vector(15 downto 0);
          CLOCK : IN std_logic;
          ENABLE : IN std_logic;
	  SHIFTIN : IN std_logic;
	  LOAD : IN std_logic;
	  SCLR : IN std_logic;
	  SSET : IN std_logic;
	  ACLR : IN std_logic;
	  ASET : IN std_logic;
   SHIFTOUT: OUT std_logic;
	  Q : OUT std_logic_vector(15 downto 0));
  END COMPONENT;
  SIGNAL logic0: std_logic := '0';
  SIGNAL logic1: std_logic := '1';
BEGIN
  IO: LPM_SHIFTREG GENERIC MAP(LPM_WIDTH => 16,
             	              LPM_SHIFT_VALUE => 0,
             	              LPM_AVALUE => "UNUSED",
             	              LPM_SVALUE => "UNUSED",
             	              LPM_PVALUE => "UNUSED",
                              LPM_DIRECTION => "LEFT",
                              LPM_TYPE => "SHIFTREG",
                              LPM_HINT => "UNUSED")
      PORT MAP(
                 DATA => Data,
               CLOCK=>Clock,
               ENABLE => Enable,
               SHIFTIN => ShiftIn,
               SHIFTOUT => ShiftOut,
               LOAD => Load,
               SCLR => logic0,
               SSET => logic0,
               ACLR => Aclr,
               ASET => logic0,
                 Q => Q);
END LATTICE_ARCH;
