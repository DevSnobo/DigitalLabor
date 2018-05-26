library IEEE;
use IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_cam128x48 is

    port (
           Data          : in  std_logic_vector(47 downto 0);
           WrAddress     : in  std_logic_vector(6 downto 0);
           ClockEn       : in  std_logic;
           Clock         : in  std_logic;
           We            : in  std_logic;
           EnMask        : in  std_logic;
           WrMask        : in  std_logic;
           WrDC          : in  std_logic;
           Reset         : in  std_logic;
           Address       : out std_logic_vector(6 downto 0);
           Match        : Out std_logic;
           MulMatch     : Out std_logic);
end test_cam128x48;

architecture struct of  test_cam128x48  is

component CAM
  generic (
  	module_type               : string  := "CAM";
  	module_width              : integer := 1;
  	module_numwords           : integer := 1;
  	module_widthad            : integer := 1;
  	module_init_file          : string  := "CAM_init";
  	module_hint               : string  := "UNUSED");

  port (
  	ClockEn                   :	in    STD_ULOGIC;
  	WE                        :	in    STD_ULOGIC;
  	Clock                     :	in    STD_ULOGIC;
  	EnMask                    :	in    STD_ULOGIC;
  	WrMask                    :	in    STD_ULOGIC;
  	WrDC                      :	in    STD_ULOGIC;
  	Reset                     :	in    STD_ULOGIC;
  	WrAddress                 :	in    STD_LOGIC_VECTOR(module_widthad-1 downto 0);
  	Data                      :	in    STD_LOGIC_VECTOR(module_width-1 downto 0);
  	Address                   :	out   STD_LOGIC_VECTOR(module_widthad-1 downto 0);
  	Match                     :	out   STD_ULOGIC;
  	MulMatch                  :	out   STD_ULOGIC);

end component;
begin
U0: CAM
         generic map (module_width    => 48,
                      module_widthad  => 7,
                      module_numwords => 128,
                      module_init_file => "CAM_init")
         port map (   Data        => Data,
                      WrAddress   => WrAddress,
                      ClockEn     => ClockEn,
                      Clock       => Clock,
                      WE          => We,
                      Reset       => Reset,
                      EnMask      => EnMask,
                      WrMask      => WrMask,
                      WrDC        => WrDC,
                      Address     => Address,
                      Match       => Match,
                      MulMatch    => MulMatch );
end struct;
