-- VHDL model created from schematic top.sch -- Nov 05 10:29:44 1999

LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity TOP is
      Port (     rst : In    std_logic;
                 clk : In    std_logic;
                 wen : In    std_logic;
                out0 : Out   std_logic;
                 csn : In    std_logic;
                out1 : Out   std_logic;
                out2 : Out   std_logic;
                out3 : Out   std_logic;
                end0 : InOut std_logic;
                end1 : InOut std_logic;
                end2 : InOut std_logic;
                end3 : InOut std_logic );
end TOP;

architecture SCHEMATIC of TOP is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      N_5 : std_logic;
   signal      N_6 : std_logic;
   signal     aeqb : std_logic;
   signal     endi : std_logic_vector (3 downto 0);
   signal        q : std_logic_vector (3 downto 0);
   signal     endo : std_logic_vector (3 downto 0);

   component BUSIFC
      Port (     clk : In    std_logic;
                 csn : In    std_logic;
                endi : In    std_logic_vector (3 downto 0);
                 rst : In    std_logic;
                 wen : In    std_logic;
                endo : Out   std_logic_vector (3 downto 0) );
   end component;

   component COUNTER
      Port (     clk : In    std_logic;
                  ld : In    std_logic;
                 rst : In    std_logic;
               count : Out   std_logic_vector (3 downto 0) );
   end component;

   component COMPARE
      Port (       a : In    std_logic_vector (3 downto 0);
                   b : In    std_logic_vector (3 downto 0);
                aeqb : Out   std_logic );
   end component;

begin

   I_24 : G_INV
      Port Map ( A=>N_3, YN=>N_1 );
   I_25 : G_2NOR
      Port Map ( A=>N_1, B=>N_2, YN=>N_6 );
   I_26 : G_BIDIR
      Port Map ( I=>endo(0), OE=>N_6, O=>end0, FBK=>endi(0) );
   I_27 : G_BIDIR
      Port Map ( I=>endo(1), OE=>N_6, O=>end1, FBK=>endi(1) );
   I_28 : G_BIDIR
      Port Map ( I=>endo(2), OE=>N_6, O=>end2, FBK=>endi(2) );
   I_29 : G_BIDIR
      Port Map ( I=>endo(3), OE=>N_6, O=>end3, FBK=>endi(3) );
   I_30 : BUSIFC
      Port Map ( clk=>N_5, csn=>N_2, endi(3 downto 0)=>endi(3 downto 0),
                 rst=>N_4, wen=>N_3, endo(3 downto 0)=>endo(3 downto 0) );
   I_31 : COUNTER
      Port Map ( clk=>N_5, ld=>aeqb, rst=>N_4,
                 count(3 downto 0)=>q(3 downto 0) );
   I_32 : G_OUTPUT
      Port Map ( I=>q(0), O=>out0 );
   I_33 : G_OUTPUT
      Port Map ( I=>q(1), O=>out1 );
   I_34 : G_OUTPUT
      Port Map ( I=>q(2), O=>out2 );
   I_35 : G_OUTPUT
      Port Map ( I=>q(3), O=>out3 );
   I_36 : G_INPUT
      Port Map ( I=>csn, O=>N_2 );
   I_37 : G_INPUT
      Port Map ( I=>wen, O=>N_3 );
   I_38 : G_INPUT
      Port Map ( I=>rst, O=>N_4 );
   I_39 : G_CLKBUF
      Port Map ( I=>clk, O=>N_5 );
   I_40 : COMPARE
      Port Map ( a(3 downto 0)=>q(3 downto 0),
                 b(3 downto 0)=>endo(3 downto 0), aeqb=>aeqb );

end SCHEMATIC;
