library IEEE;
use IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_ramdp8kx2x2 is

    port (
           DataInA       : in std_logic_vector(1 downto 0);
           AddressA      : in  std_logic_vector(12 downto 0);
           DataInB       : in std_logic_vector(1 downto 0);
           AddressB      : in  std_logic_vector(12 downto 0);
           ClockA        : in  std_logic;
           ClockEnA      : in  std_logic;
           ClockB        : in  std_logic;
           ClockEnB      : in  std_logic;
           WrA           : in  std_logic;
           WrB           : in  std_logic;
           ResetA        : in  std_logic;
           ResetB        : in  std_logic;
           QA            : out std_logic_vector(1 downto 0);
           QB            : out std_logic_vector(1 downto 0));
end test_ramdp8kx2x2;

architecture struct of  test_ramdp8kx2x2  is
component ram_dp_true
  generic (
  	module_type      : string  := "RAM_DP_TRUE";
  	module_widtha    : positive:= 1;
  	module_widthada  : positive:= 1;
  	module_numwordsa : positive:= 1;
  	module_widthb    : positive:= 1;
  	module_widthadb  : positive:= 1;
  	module_numwordsb : positive:= 1;
  	module_indata    : string :="REGISTERED";
  	module_outdata   : string :="UNREGISTERED";
  	module_addressa_control   : string :="REGISTERED";
  	module_addressb_control   : string :="REGISTERED";
  	module_init_file          : string := "RAM_init";
	module_hint      : string :="UNUSED");
  port (
  	DataInA       : in std_logic_vector(module_widtha-1 downto 0);
  	AddressA      : in std_logic_vector(module_widthada-1 downto 0);
  	DataInB       : in std_logic_vector(module_widthb-1 downto 0);
  	AddressB      : in std_logic_vector(module_widthadb-1 downto 0);
  	ClockA        : in std_logic := '0';
  	ClockEnA      : in std_logic := '0';
  	ClockB        : in std_logic := '0';
  	ClockEnB      : in std_logic := '0';
  	WrA           : in std_logic;
  	WrB           : in std_logic;
  	ResetA        : in std_logic;
  	ResetB        : in std_logic;
  	QA            : out std_logic_vector(module_widtha-1 downto 0);
  	QB            : out std_logic_vector(module_widthb-1 downto 0));
end component;
begin
U0: ram_dp_true
         generic map (                      
                      module_widtha     => 2,
                      module_widthada   => 13,
                      module_numwordsa  => 8192,
                      module_widthb     => 2,
                      module_widthadb   => 13,
                      module_numwordsb  => 8192,
                      module_indata     => "REGISTERED",
                      module_outdata    => "UNREGISTERED",
                      module_addressa_control => "REGISTERED",
                      module_addressb_control => "REGISTERED",
                      module_init_file  => "RAM_init")
         port map (
                      DataInA       => DataInA,
                      AddressA      => AddressA,
                      DataInB       => DataInB,
                      AddressB      => AddressB,
                      ClockA        => ClockA,
                      ClockEnA      => ClockEnA,
                      ClockB        => ClockB,
                      ClockEnB      => ClockEnB,
                      WrA           => WrA,
                      WrB           => WrB,
                      ResetA        => ResetA,
                      ResetB        => ResetB,
                      QA            => QA,
                      QB            => QB);

end struct;
