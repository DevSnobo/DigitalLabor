-- VHDL model created from schematic alarmclk.sch -- Dec 15 15:08:40 2000

LIBRARY vanmacro;
USE vanmacro.components.ALL;
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity ALARMCLK is
      Port (   clock : In    std_logic;
             ld_new_alrm_time : In    std_logic;
             ld_new_clk_time : In    std_logic;
             new_alrm_time : In    std_logic_vector (3 downto 0);
             new_clk_time : In    std_logic_vector (3 downto 0);
               reset : In    std_logic;
             showalrm : In    std_logic;
             display : Out   std_logic_vector (3 downto 0);
             sound_alrm : Out   std_logic );
end ALARMCLK;

architecture SCHEMATIC of ALARMCLK is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      clk : std_logic;
   signal      rst : std_logic;
   signal alrmtime : std_logic_vector (3 downto 0);
   signal cur_time : std_logic_vector (3 downto 0);
   signal      nat : std_logic_vector (3 downto 0);
   signal      nct : std_logic_vector (3 downto 0);
   signal    dsply : std_logic_vector (3 downto 0);

   component COMPTIME
      Port ( alrm_time3 : In    std_logic;
             alrm_time2 : In    std_logic;
             alrm_time1 : In    std_logic;
             alrm_time0 : In    std_logic;
             cur_time3 : In    std_logic;
             cur_time2 : In    std_logic;
             cur_time1 : In    std_logic;
             cur_time0 : In    std_logic;
               sound : Out   std_logic );
   end component;

   component TIMESTOR
      Port (     clk : In    std_logic;
              ldtime : In    std_logic;
             new_time3 : In    std_logic;
             new_time2 : In    std_logic;
             new_time1 : In    std_logic;
             new_time0 : In    std_logic;
                 rst : In    std_logic;
             cur_time3 : Out   std_logic;
             cur_time2 : Out   std_logic;
             cur_time1 : Out   std_logic;
             cur_time0 : Out   std_logic );
   end component;

   component DSPLYMUX
      Port ( alrm_time : In    std_logic_vector (3 downto 0);
             cur_time : In    std_logic_vector (3 downto 0);
             showalrm : In    std_logic;
               dsply : Out   std_logic_vector (3 downto 0) );
   end component;

   component ALRMSTOR
      Port (     clk : In    std_logic;
              ldalrm : In    std_logic;
             new_alrm_time : In    std_logic_vector (3 downto 0);
                 rst : In    std_logic;
             alrm_time : Out   std_logic_vector (3 downto 0) );
   end component;

begin

   I_25 : COMPTIME
      Port Map ( alrm_time3=>alrmtime(3), alrm_time2=>alrmtime(2),
                 alrm_time1=>alrmtime(1), alrm_time0=>alrmtime(0),
                 cur_time3=>cur_time(3), cur_time2=>cur_time(2),
                 cur_time1=>cur_time(1), cur_time0=>cur_time(0),
                 sound=>N_1 );
   I_29 : G_CLKBUF
      Port Map ( I=>clock, O=>clk );
   I_33 : G_OUTPUT
      Port Map ( I=>N_1, O=>sound_alrm );
   dsply_3 : G_OUTPUT
      Port Map ( I=>dsply(3), O=>display(3) );
   dsply_2 : G_OUTPUT
      Port Map ( I=>dsply(2), O=>display(2) );
   dsply_1 : G_OUTPUT
      Port Map ( I=>dsply(1), O=>display(1) );
   dsply_0 : G_OUTPUT
      Port Map ( I=>dsply(0), O=>display(0) );
   I_26 : G_INPUT
      Port Map ( I=>reset, O=>rst );
   I_30 : G_INPUT
      Port Map ( I=>showalrm, O=>N_2 );
   I_12 : G_INPUT
      Port Map ( I=>ld_new_clk_time, O=>N_3 );
   nct_3 : G_INPUT
      Port Map ( I=>new_clk_time(3), O=>nct(3) );
   nct_2 : G_INPUT
      Port Map ( I=>new_clk_time(2), O=>nct(2) );
   nct_1 : G_INPUT
      Port Map ( I=>new_clk_time(1), O=>nct(1) );
   nct_0 : G_INPUT
      Port Map ( I=>new_clk_time(0), O=>nct(0) );
   I_28 : G_INPUT
      Port Map ( I=>ld_new_alrm_time, O=>N_4 );
   nat_3 : G_INPUT
      Port Map ( I=>new_alrm_time(3), O=>nat(3) );
   nat_2 : G_INPUT
      Port Map ( I=>new_alrm_time(2), O=>nat(2) );
   nat_1 : G_INPUT
      Port Map ( I=>new_alrm_time(1), O=>nat(1) );
   nat_0 : G_INPUT
      Port Map ( I=>new_alrm_time(0), O=>nat(0) );
   I_23 : TIMESTOR
      Port Map ( clk=>clk, ldtime=>N_3, new_time3=>nct(3),
                 new_time2=>nct(2), new_time1=>nct(1), new_time0=>nct(0),
                 rst=>rst, cur_time3=>cur_time(3),
                 cur_time2=>cur_time(2), cur_time1=>cur_time(1),
                 cur_time0=>cur_time(0) );
   I_22 : DSPLYMUX
      Port Map ( alrm_time(3 downto 0)=>alrmtime(3 downto 0),
                 cur_time(3 downto 0)=>cur_time(3 downto 0),
                 showalrm=>N_2, dsply(3 downto 0)=>dsply(3 downto 0) );
   I_24 : ALRMSTOR
      Port Map ( clk=>clk, ldalrm=>N_4,
                 new_alrm_time(3 downto 0)=>nat(3 downto 0), rst=>rst,
                 alrm_time(3 downto 0)=>alrmtime(3 downto 0) );

end SCHEMATIC;
