--**************************************
--* VHDL source constraint example
--* 	IO Types Setting
--*	2/07/2001 designed by K.Lee
--*	3/14/2001 modified by K.Lee
--* Lattice Semiconductor Corporation
--**************************************

-- VHDL syntax for IO Types Setting

--  ATTRIBUTE IO_TYPES : string;                           		
--  ATTRIBUTE IO_TYPES OF [PinName]: SIGNAL IS "[Type],[DriveCurrent]"; 
--
--   Type: The following IO types are available
--	---------------------------------------------
--	IO_Type Names		VCCIO
--	---------------------------------------------
--	** For IO pins **
--	PCI,			3.3
--	PCI-X,			3.3
--	AGP_1X,			3.3
--	SSTL3_I,		3.3
--	SSTL3_II,		3.3
--	SSTL2_I,		2.5
--	SSTL2_II,		2.5
--	HSTL_I,			1.5
--	HSTL_III,		1.5
--	CTT33,			3.3
--	CTT25,			2.5
--	GTL+,			3.3, 2.5, 1.8, 1.5
--	LVTTL,			3.3
--	LVCMOS33,		3.3
--	LVCMOS33_OD,		3.3, 2.5, 1.8, 1.5
--	LVCMOS25,		2.5
--	LVCMOS25_OD,		3.3, 2.5, 1.8, 1.5
-- 	LVCMOS18,		1.8
--	LVCMOS18_OD,		3.3, 2.5, 1.8, 1.5
--	** For Clock Pins **
--	LVDS,			3.3, 2.5, 1.8, 1.5
--	LVPECL_S,		3.3, 2.5, 1.8, 1.5
--	LVPECL_D,		3.3, 2.5, 1.8, 1.5
--
--   DriveCurrent(mA) = 20, 16, 12, 8, 5, 4 or NONE(or -);
--   	NONE(or -): default setting or not applicable
--
--   Note: The following example shows a set of valid configuration for the IO types
--	     not used in this design.
--	
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "PCI-X,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "AGP_1X,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "SSTL3_I,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "SSTL3_II,-";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "SSTL2_I,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "SSTL2_II,-";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "HSTL_I,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "HSTL_III,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "CTT25,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "GTL+,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "LVTTL,NONE";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "LVCMOS33_OD,16";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "LVCMOS25,-";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "LVCMOS18,5";
--		ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "LVCMOS18_OD,4";
--
--------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity iovhdl is port
      (	md  : 	in std_logic_vector (1 downto 0);
	Din :   in std_logic_vector (4 downto 0);
	Clk0 :	in std_logic;
	Clk1 :	in std_logic;
	Clk2 :	in std_logic;
	Clk3 :	in std_logic;
	portA :	out std_logic_vector (4 downto 0);
	portB :	out std_logic_vector (4 downto 0);
	portC :	out std_logic_vector (4 downto 0);
	portD :	out std_logic_vector (4 downto 0));

--*** Attribute declaration
	ATTRIBUTE IO_TYPES : string;                           		

--*** IO types for I/O pins ***
	ATTRIBUTE IO_TYPES OF md:    SIGNAL IS "PCI,NONE";		
	ATTRIBUTE IO_TYPES OF portA: SIGNAL IS "PCI,-";		 
	ATTRIBUTE IO_TYPES OF portB: SIGNAL IS "LVCMOS33,20";	-- 20ma
	ATTRIBUTE IO_TYPES OF portC: SIGNAL IS "CTT33,NONE";	
	ATTRIBUTE IO_TYPES OF portD: SIGNAL IS "LVCMOS25_OD,8";	-- 8ma

--*** IO types for Clock pins ***
--	ATTRIBUTE IO_TYPES OF Clk0: SIGNAL IS "LVDS,NONE";
--	ATTRIBUTE IO_TYPES OF Clk1: SIGNAL IS "LVPECL_S,-";
--	ATTRIBUTE IO_TYPES OF Clk2: SIGNAL IS "LVPECL_D,-";

end;


architecture behavioral of iovhdl is

begin

process (Clk0)
begin
  if rising_edge(Clk0) then   
    if (md = "00") then
	portA <= Din;
    else 
	portA <= "00000";
    end if;
  end if;
end process;

process (Clk1)
begin
  if rising_edge(Clk1) then 
    if (md = "01") then
	portB <= Din;
    else 
	portB <= "00000";
    end if;
  end if;
end process;

process (Clk2)
begin
  if rising_edge(Clk2) then   
    if (md = "10") then
	portC <= Din;
    else 
	portC <= "00000";
    end if;
  end if;
end process;

process (Clk3)
begin
  if rising_edge(Clk3) then    
    if (md = "11") then
	portD <= Din;
    else 
	portD <= "00000";
    end if;
  end if;
end process;

end behavioral;


