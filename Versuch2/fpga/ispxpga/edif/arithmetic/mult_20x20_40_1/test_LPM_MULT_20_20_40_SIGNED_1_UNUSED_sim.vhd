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
use IEEE.std_logic_signed.all;
use work.LPM_COMPONENTS.all;

entity LPM_MULT_SIGNED is
	generic (LPM_WIDTHA : positive;
		LPM_WIDTHB : positive;
		--LPM_WIDTHS : positive;
		LPM_WIDTHS : natural;
		LPM_WIDTHP : positive;
		LPM_PIPELINE : integer;
		LPM_TYPE: string;
		LPM_HINT : string);
	port (DATAA : in std_logic_vector(LPM_WIDTHA-1 downto 0);
		DATAB : in std_logic_vector(LPM_WIDTHB-1 downto 0);
		ACLR : in std_logic;
		CLOCK : in std_logic;
		--CLKEN : in std_logic;
		SUM : in std_logic_vector(LPM_WIDTHS-1 downto 0);
		RESULT : out std_logic_vector(LPM_WIDTHP-1 downto 0));
end LPM_MULT_SIGNED;

architecture LPM_SYN of LPM_MULT_SIGNED is

signal FP : std_logic_vector(LPM_WIDTHS-1 downto 0);
type t_resulttmp IS ARRAY (0 to LPM_PIPELINE) of std_logic_vector(LPM_WIDTHP-1 downto 0);

begin

	process (CLOCK, ACLR, DATAA, DATAB, SUM)
	variable resulttmp : t_resulttmp;
	begin
	   if LPM_PIPELINE >= 0 then
		if LPM_WIDTHP >= LPM_WIDTHS then
		   if LPM_WIDTHS > 0 then
			resulttmp(LPM_PIPELINE) := (DATAA * DATAB) + SUM;
		   else
			resulttmp(LPM_PIPELINE) := (DATAA * DATAB);
		   end if;
		else
		   FP <= (DATAA * DATAB) + SUM;
		   resulttmp(LPM_PIPELINE) := FP(LPM_WIDTHS-1 downto LPM_WIDTHS-LPM_WIDTHP);
		end if;

		if LPM_PIPELINE > 0 then
		   if ACLR = '1' then
			for i in 0 to LPM_PIPELINE loop
			   resulttmp(i) := (OTHERS => '0');
			end loop;
		   elsif CLOCK'event and CLOCK = '1' then
			resulttmp(0 to LPM_PIPELINE - 1) := resulttmp(1 to LPM_PIPELINE);
		   end if;
		end if;
	   end if;

	   RESULT <= resulttmp(0);
	end process;

end LPM_SYN;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.LPM_COMPONENTS.all;

entity LPM_MULT_UNSIGNED is
	generic (LPM_WIDTHA : positive;
		 LPM_WIDTHB : positive;
		 --LPM_WIDTHS : positive;
		 LPM_WIDTHS : natural;
		 LPM_WIDTHP : positive;
		 LPM_PIPELINE : integer;
		 LPM_TYPE: string;
		 LPM_HINT : string);
	port (DATAA : in std_logic_vector(LPM_WIDTHA-1 downto 0);
		 DATAB : in std_logic_vector(LPM_WIDTHB-1 downto 0);
		 ACLR : in std_logic;
		 CLOCK : in std_logic;
		 --CLKEN : in std_logic;
		 SUM : in std_logic_vector(LPM_WIDTHS-1 downto 0);
		 RESULT : out std_logic_vector(LPM_WIDTHP-1 downto 0));
end LPM_MULT_UNSIGNED;

architecture LPM_SYN of LPM_MULT_UNSIGNED is

signal FP : std_logic_vector(LPM_WIDTHS-1 downto 0);
type t_resulttmp IS ARRAY (0 to LPM_PIPELINE) of std_logic_vector(LPM_WIDTHP-1 downto 0);

begin

	process (CLOCK, ACLR, DATAA, DATAB, SUM)
	variable resulttmp : t_resulttmp;
	begin
	   if LPM_PIPELINE >= 0 then
		if LPM_WIDTHP >= LPM_WIDTHS then
		   if LPM_WIDTHS > 0 then
			resulttmp(LPM_PIPELINE) := (DATAA * DATAB) + SUM;
		   else
			resulttmp(LPM_PIPELINE) := (DATAA * DATAB);
		   end if;
		else
		   FP <= (DATAA * DATAB) + SUM;
		   resulttmp(LPM_PIPELINE) := FP(LPM_WIDTHS-1 downto LPM_WIDTHS-LPM_WIDTHP);
		end if;

		if LPM_PIPELINE > 0 then
		   if ACLR = '1' then
			for i in 0 to LPM_PIPELINE loop
			   resulttmp(i) := (OTHERS => '0');
			end loop;
		   elsif CLOCK'event and CLOCK = '1' then
			resulttmp(0 to LPM_PIPELINE - 1) := resulttmp(1 to LPM_PIPELINE);
		   end if;
		end if;
	   end if;

	   RESULT <= resulttmp(0);
	end process;

end LPM_SYN;

--------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.LPM_COMPONENTS.all;

entity LPM_MULT is
	generic (LPM_WIDTHA : positive;
		 LPM_WIDTHB : positive;
		 --LPM_WIDTHS : positive;
		 LPM_WIDTHS : natural;
		 LPM_WIDTHP : positive;
		 LPM_REPRESENTATION : string;
		 LPM_PIPELINE : integer;
		 LPM_TYPE: string;
		 LPM_HINT : string);
	port (DATAA : in std_logic_vector(LPM_WIDTHA-1 downto 0);
		 DATAB : in std_logic_vector(LPM_WIDTHB-1 downto 0);
		 ACLR : in std_logic;
		 CLOCK : in std_logic;
		 --CLKEN : in std_logic;
		 SUM : in std_logic_vector(LPM_WIDTHS-1 downto 0);
		 RESULT : out std_logic_vector(LPM_WIDTHP-1 downto 0));
end LPM_MULT;

architecture LPM_SYN of LPM_MULT is

	component LPM_MULT_UNSIGNED
		generic (LPM_WIDTHA : positive;
			 LPM_WIDTHB : positive;
			 --LPM_WIDTHS : positive;
			 LPM_WIDTHS : natural;
			 LPM_WIDTHP : positive;
			 LPM_PIPELINE : integer;
			 LPM_TYPE: string := "LPM_MULT";
			 LPM_HINT : string := "UNUSED");
		port (DATAA : in std_logic_vector(LPM_WIDTHA-1 downto 0);
		      DATAB : in std_logic_vector(LPM_WIDTHB-1 downto 0);
		      ACLR : in std_logic := '0';
		      CLOCK : in std_logic := '0';
		      --CLKEN : in std_logic := '1';
		      SUM : in std_logic_vector(LPM_WIDTHS-1 downto 0);
		      RESULT : out std_logic_vector(LPM_WIDTHP-1 downto 0));
	end component;

	component LPM_MULT_SIGNED
		generic (LPM_WIDTHA : positive;
			 LPM_WIDTHB : positive;
			 --LPM_WIDTHS : positive;
			 LPM_WIDTHS : natural;
			 LPM_WIDTHP : positive;
			 LPM_PIPELINE : integer;
			 LPM_TYPE: string;
			 LPM_HINT : string);
		port (DATAA : in std_logic_vector(LPM_WIDTHA-1 downto 0);
		      DATAB : in std_logic_vector(LPM_WIDTHB-1 downto 0);
		      ACLR : in std_logic;
		      CLOCK : in std_logic;
		      --CLKEN : in std_logic;
		      SUM : in std_logic_vector(LPM_WIDTHS-1 downto 0);
		      RESULT : out std_logic_vector(LPM_WIDTHP-1 downto 0));
	end component;

begin

L1: if LPM_REPRESENTATION = "UNSIGNED" generate

U1: LPM_MULT_UNSIGNED
	generic map (LPM_WIDTHA => LPM_WIDTHA,
		     LPM_WIDTHB => LPM_WIDTHB, LPM_WIDTHS => LPM_WIDTHS,
		     LPM_WIDTHP => LPM_WIDTHP, LPM_PIPELINE => LPM_PIPELINE,
		     LPM_TYPE => LPM_TYPE, LPM_HINT => LPM_HINT)
	port map (DATAA => DATAA, DATAB => DATAB, ACLR => ACLR,
		  SUM => SUM, CLOCK => CLOCK, RESULT => RESULT);
	end generate;

L2: if LPM_REPRESENTATION = "SIGNED" generate

U1: LPM_MULT_SIGNED
	generic map (LPM_WIDTHA => LPM_WIDTHA,
		     LPM_WIDTHB => LPM_WIDTHB, LPM_WIDTHS => LPM_WIDTHS,
		     LPM_WIDTHP => LPM_WIDTHP, LPM_PIPELINE => LPM_PIPELINE,
		     LPM_TYPE => LPM_TYPE, LPM_HINT => LPM_HINT)
	port map (DATAA => DATAA, DATAB => DATAB, ACLR => ACLR,
		  SUM => SUM, CLOCK => CLOCK, RESULT => RESULT);
	end generate;

end LPM_SYN;
Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.lpm_components.all;

ENTITY test_LPM_MULT_20_20_40_SIGNED_1_UNUSED IS

    PORT (
	DataA : IN  STD_LOGIC_VECTOR( 19 DOWNTO 0);
	DataB : IN  STD_LOGIC_VECTOR( 19 DOWNTO 0);
	Clock : IN  STD_LOGIC;
	Aclr : IN  STD_LOGIC;
	Result : OUT  STD_LOGIC_VECTOR( 39 DOWNTO 0));
END test_LPM_MULT_20_20_40_SIGNED_1_UNUSED;

ARCHITECTURE LATTICE_ARCH OF test_LPM_MULT_20_20_40_SIGNED_1_UNUSED IS
  COMPONENT LPM_MULT
     GENERIC(LPM_WIDTHA : positive;
             LPM_WIDTHB : positive;
             LPM_WIDTHS : natural;
             LPM_WIDTHP : positive;
             LPM_PIPELINE: integer;
             LPM_REPRESENTATION : string;
             LPM_TYPE  : string;
             LPM_HINT  : string);
     PORT(DATAA  : IN std_logic_vector(19 downto 0);
          DATAB  : IN std_logic_vector(19 downto 0);
          ACLR  : IN std_logic;
          CLOCK : IN std_logic;
          SUM   : IN std_logic_vector(39 downto 0);
          RESULT: OUT std_logic_vector(39 downto 0));
  END COMPONENT;
  SIGNAL logic0: std_logic := '0';
  SIGNAL logic1: std_logic := '1';
BEGIN
  IO: LPM_MULT GENERIC MAP(LPM_WIDTHA => 20,
             	              LPM_WIDTHB => 20,
             	              LPM_WIDTHS => 40,
             	              LPM_WIDTHP => 40,
                              LPM_PIPELINE => 1,
                              LPM_REPRESENTATION => "SIGNED",
                              LPM_TYPE => "LPM_MULT",
                              LPM_HINT => "UNUSED")
      PORT MAP(
                 DATAA => DataA,
                 DATAB => DataB,
                 CLOCK=>Clock,
                 ACLR=>Aclr,
                 SUM(0)=>logic0,
                 SUM(1)=>logic0,
                 SUM(2)=>logic0,
                 SUM(3)=>logic0,
                 SUM(4)=>logic0,
                 SUM(5)=>logic0,
                 SUM(6)=>logic0,
                 SUM(7)=>logic0,
                 SUM(8)=>logic0,
                 SUM(9)=>logic0,
                 SUM(10)=>logic0,
                 SUM(11)=>logic0,
                 SUM(12)=>logic0,
                 SUM(13)=>logic0,
                 SUM(14)=>logic0,
                 SUM(15)=>logic0,
                 SUM(16)=>logic0,
                 SUM(17)=>logic0,
                 SUM(18)=>logic0,
                 SUM(19)=>logic0,
                 SUM(20)=>logic0,
                 SUM(21)=>logic0,
                 SUM(22)=>logic0,
                 SUM(23)=>logic0,
                 SUM(24)=>logic0,
                 SUM(25)=>logic0,
                 SUM(26)=>logic0,
                 SUM(27)=>logic0,
                 SUM(28)=>logic0,
                 SUM(29)=>logic0,
                 SUM(30)=>logic0,
                 SUM(31)=>logic0,
                 SUM(32)=>logic0,
                 SUM(33)=>logic0,
                 SUM(34)=>logic0,
                 SUM(35)=>logic0,
                 SUM(36)=>logic0,
                 SUM(37)=>logic0,
                 SUM(38)=>logic0,
                 SUM(39)=>logic0,
                 RESULT => Result);
END LATTICE_ARCH;
