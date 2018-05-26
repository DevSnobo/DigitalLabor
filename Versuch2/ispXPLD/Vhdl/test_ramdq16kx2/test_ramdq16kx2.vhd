library IEEE;
use IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_ramdq16kx2 is

    port (
           Data         : in std_logic_vector(1 downto 0);
           Address      : in  std_logic_vector(13 downto 0);
           Clock        : in  std_logic;
           ClockEn      : in  std_logic;
           WE           : in  std_logic;
           Reset        : in  std_logic;
           Q            : out std_logic_vector(1 downto 0));
end test_ramdq16kx2;

architecture struct of  test_ramdq16kx2  is

component ram_dq
  generic(
  	module_type            : string  := "RAM_DQ";
  	module_width           : integer := 1;
  	module_numwords        : integer := 1;
  	module_widthad         : integer := 1;
  	module_indata          : string  := "REGISTERED";
  	module_outdata         : string  := "UNREGISTERED";
  	module_address_control : string  := "REGISTERED";
  	module_init_file          : string := "RAM_init";
  	module_hint            : string  := "UNUSED");

  port(
  	Data                : in  std_logic_vector (module_width-1 downto 0);
  	Address             : in  std_logic_vector (module_widthad-1 downto 0);
  	Clock               : in  std_logic;
  	ClockEn             : in  std_logic;
  	WE                  : in  std_logic;
  	Reset               : in  std_logic;
  	Q                   : out std_logic_vector (module_width-1 downto 0));

end component;
begin
U0: ram_dq
         generic map (module_width     => 2,
                      module_widthad   => 14,
                      module_numwords  => 16384,
                      module_indata    => "REGISTERED",
                      module_address_control => "REGISTERED",
                      module_init_file => "RAM_init",
                      module_outdata   => "UNREGISTERED")
         port map (
                      Data          => Data,
                      Address       => Address,
                      Clock         => Clock,
                      ClockEn       => ClockEn,
                      WE            => WE,
                      Reset         => Reset,
                      Q             => Q);
end struct;
