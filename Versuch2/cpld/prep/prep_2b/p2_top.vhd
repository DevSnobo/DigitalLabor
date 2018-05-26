-- VHDL model created from schematic p2_top.sch -- Dec 15 15:26:45 2000

LIBRARY vanmacro;
USE vanmacro.components.ALL;
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity P2_TOP is
      Port (  ldcomp : In    std_logic;
               ldpre : In    std_logic;
                 clk : In    std_logic;
             data2_0 : In    std_logic;
             data2_1 : In    std_logic;
             data2_2 : In    std_logic;
             data2_3 : In    std_logic;
             data2_4 : In    std_logic;
             data2_5 : In    std_logic;
             data2_6 : In    std_logic;
             data2_7 : In    std_logic;
             data1_0 : In    std_logic;
             data1_1 : In    std_logic;
             data1_2 : In    std_logic;
             data1_3 : In    std_logic;
             data1_4 : In    std_logic;
             data1_5 : In    std_logic;
             data1_6 : In    std_logic;
             data1_7 : In    std_logic;
                 sel : In    std_logic;
             data0_0 : Out   std_logic;
             data0_1 : Out   std_logic;
             data0_2 : Out   std_logic;
             data0_3 : Out   std_logic;
             data0_4 : Out   std_logic;
             data0_5 : Out   std_logic;
             data0_6 : Out   std_logic;
             data0_7 : Out   std_logic;
             ext_reset : In    std_logic );
end P2_TOP;

architecture SCHEMATIC of P2_TOP is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      N_5 : std_logic;
   signal   data00 : std_logic_vector (2 downto 0);
   signal   data01 : std_logic_vector (2 downto 0);
   signal   data02 : std_logic_vector (2 downto 0);
   signal   data03 : std_logic_vector (2 downto 0);
   signal   data04 : std_logic_vector (2 downto 0);
   signal   data05 : std_logic_vector (2 downto 0);
   signal   data06 : std_logic_vector (2 downto 0);
   signal    data1 : std_logic_vector (7 downto 0);
   signal   data07 : std_logic_vector (2 downto 0);
   signal    data2 : std_logic_vector (7 downto 0);

   component PREP2B
      Port (     clk : In    std_logic;
               data1 : In    std_logic_vector (7 downto 0);
               data2 : In    std_logic_vector (7 downto 0);
              ldcomp : In    std_logic;
               ldpre : In    std_logic;
                 rst : In    std_logic;
                 sel : In    std_logic;
               data0 : Out   std_logic_vector (7 downto 0) );
   end component;

begin

   prep2_2 : PREP2B
      Port Map ( clk=>N_1, data1(0)=>data00(1), data1(1)=>data01(1),
                 data1(2)=>data02(1), data1(3)=>data03(1),
                 data1(4)=>data04(1), data1(5)=>data05(1),
                 data1(6)=>data06(1), data1(7)=>data07(1),
                 data2(7 downto 0)=>data2(7 downto 0), ldcomp=>N_5,
                 ldpre=>N_2, rst=>N_4, sel=>N_3, data0(0)=>data00(2),
                 data0(1)=>data01(2), data0(2)=>data02(2),
                 data0(3)=>data03(2), data0(4)=>data04(2),
                 data0(5)=>data05(2), data0(6)=>data06(2),
                 data0(7)=>data07(2) );
   prep2_1 : PREP2B
      Port Map ( clk=>N_1, data1(0)=>data00(0), data1(1)=>data01(0),
                 data1(2)=>data02(0), data1(3)=>data03(0),
                 data1(4)=>data04(0), data1(5)=>data05(0),
                 data1(6)=>data06(0), data1(7)=>data07(0),
                 data2(7 downto 0)=>data2(7 downto 0), ldcomp=>N_5,
                 ldpre=>N_2, rst=>N_4, sel=>N_3, data0(0)=>data00(1),
                 data0(1)=>data01(1), data0(2)=>data02(1),
                 data0(3)=>data03(1), data0(4)=>data04(1),
                 data0(5)=>data05(1), data0(6)=>data06(1),
                 data0(7)=>data07(1) );
   prep2_0 : PREP2B
      Port Map ( clk=>N_1, data1(0)=>data1(0), data1(1)=>data1(1),
                 data1(2)=>data1(2), data1(3)=>data1(3),
                 data1(4)=>data1(4), data1(5)=>data1(5),
                 data1(6)=>data1(6), data1(7)=>data1(7),
                 data2(7 downto 0)=>data2(7 downto 0), ldcomp=>N_5,
                 ldpre=>N_2, rst=>N_4, sel=>N_3, data0(0)=>data00(0),
                 data0(1)=>data01(0), data0(2)=>data02(0),
                 data0(3)=>data03(0), data0(4)=>data04(0),
                 data0(5)=>data05(0), data0(6)=>data06(0),
                 data0(7)=>data07(0) );
   I_26 : G_CLKBUF
      Port Map ( I=>clk, O=>N_1 );
   I_25 : G_INPUT
      Port Map ( I=>sel, O=>N_3 );
   I_2 : G_INPUT
      Port Map ( I=>data2_1, O=>data2(1) );
   I_3 : G_INPUT
      Port Map ( I=>data2_0, O=>data2(0) );
   I_4 : G_INPUT
      Port Map ( I=>data2_4, O=>data2(4) );
   I_5 : G_INPUT
      Port Map ( I=>data2_3, O=>data2(3) );
   I_6 : G_INPUT
      Port Map ( I=>data2_2, O=>data2(2) );
   I_7 : G_INPUT
      Port Map ( I=>data2_7, O=>data2(7) );
   I_8 : G_INPUT
      Port Map ( I=>data2_6, O=>data2(6) );
   I_9 : G_INPUT
      Port Map ( I=>data2_5, O=>data2(5) );
   I_10 : G_INPUT
      Port Map ( I=>data1_1, O=>data1(1) );
   I_11 : G_INPUT
      Port Map ( I=>data1_0, O=>data1(0) );
   I_12 : G_INPUT
      Port Map ( I=>data1_4, O=>data1(4) );
   I_13 : G_INPUT
      Port Map ( I=>data1_3, O=>data1(3) );
   I_14 : G_INPUT
      Port Map ( I=>data1_2, O=>data1(2) );
   I_15 : G_INPUT
      Port Map ( I=>data1_7, O=>data1(7) );
   I_16 : G_INPUT
      Port Map ( I=>data1_6, O=>data1(6) );
   I_17 : G_INPUT
      Port Map ( I=>data1_5, O=>data1(5) );
   I_27 : G_INPUT
      Port Map ( I=>ldpre, O=>N_2 );
   I_28 : G_INPUT
      Port Map ( I=>ext_reset, O=>N_4 );
   I_29 : G_INPUT
      Port Map ( I=>ldcomp, O=>N_5 );
   I_18 : G_OUTPUT
      Port Map ( I=>data00(2), O=>data0_0 );
   I_19 : G_OUTPUT
      Port Map ( I=>data01(2), O=>data0_1 );
   I_20 : G_OUTPUT
      Port Map ( I=>data02(2), O=>data0_2 );
   I_21 : G_OUTPUT
      Port Map ( I=>data03(2), O=>data0_3 );
   I_22 : G_OUTPUT
      Port Map ( I=>data06(2), O=>data0_6 );
   I_23 : G_OUTPUT
      Port Map ( I=>data07(2), O=>data0_7 );
   I_24 : G_OUTPUT
      Port Map ( I=>data04(2), O=>data0_4 );
   I_30 : G_OUTPUT
      Port Map ( I=>data05(2), O=>data0_5 );

end SCHEMATIC;
