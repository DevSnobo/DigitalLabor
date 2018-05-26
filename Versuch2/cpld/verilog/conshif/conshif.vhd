-- VHDL model created from schematic conshif.sch -- Dec 12 16:31:58 2000

LIBRARY vanmacro;
USE vanmacro.components.ALL;
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity CONSHIF is
      Port (     clk : In    std_logic;
                  ld : In    std_logic;
                  a2 : In    std_logic;
                  c0 : Out   std_logic;
                  c2 : Out   std_logic;
                  c1 : Out   std_logic;
                  a0 : In    std_logic;
                  a1 : In    std_logic;
                  a3 : In    std_logic;
                  d3 : Out   std_logic;
                  d2 : Out   std_logic;
                  d1 : Out   std_logic;
                  d0 : Out   std_logic;
                xrst : In    std_logic );
end CONSHIF;

architecture SCHEMATIC of CONSHIF is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_8 : std_logic;
   signal      N_7 : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      N_6 : std_logic;
   signal        c : std_logic_vector (2 downto 0);
   signal        a : std_logic_vector (3 downto 0);
   signal        d : std_logic_vector (3 downto 0);

   component LOGIC1
      Port (      d0 : In    std_logic;
                  d1 : In    std_logic;
                  d2 : In    std_logic;
                  d3 : In    std_logic;
                  b1 : Out   std_logic );
   end component;

   component COUNT
      Port (     clk : In    std_logic;
                 rst : In    std_logic;
                   c : Out   std_logic_vector (2 downto 0) );
   end component;

   component SHIFT
      Port (       a : In    std_logic_vector (3 downto 0);
                 clk : In    std_logic;
                  ld : In    std_logic;
                 rst : In    std_logic;
                   d : Out   std_logic_vector (3 downto 0) );
   end component;

begin

   I35 : G_2OR
      Port Map ( A=>ld, B=>xrst, Y=>N_7 );
   I34 : G_DC
      Port Map ( C=>ld, CLK=>N_8, D=>VCC, Q=>N_2 );
   I29 : G_DC
      Port Map ( C=>N_7, CLK=>N_2, D=>c(2), Q=>N_3 );
   I30 : G_DC
      Port Map ( C=>N_7, CLK=>N_2, D=>c(1), Q=>N_4 );
   I28 : G_DC
      Port Map ( C=>N_7, CLK=>N_2, D=>c(0), Q=>N_6 );
   I18 : G_OUTPUT
      Port Map ( I=>d(2), O=>d2 );
   I19 : G_OUTPUT
      Port Map ( I=>d(1), O=>d1 );
   I20 : G_OUTPUT
      Port Map ( I=>d(0), O=>d0 );
   I17 : G_OUTPUT
      Port Map ( I=>d(3), O=>d3 );
   I25 : G_OUTPUT
      Port Map ( I=>N_3, O=>c2 );
   I26 : G_OUTPUT
      Port Map ( I=>N_4, O=>c1 );
   I27 : G_OUTPUT
      Port Map ( I=>N_6, O=>c0 );
   I21 : G_INPUT
      Port Map ( I=>a0, O=>a(0) );
   I22 : G_INPUT
      Port Map ( I=>a2, O=>a(2) );
   I23 : G_INPUT
      Port Map ( I=>a1, O=>a(1) );
   I24 : G_INPUT
      Port Map ( I=>a3, O=>a(3) );
   I13 : LOGIC1
      Port Map ( d0=>d(0), d1=>d(1), d2=>d(2), d3=>d(3), b1=>N_8 );
   I16 : COUNT
      Port Map ( clk=>clk, rst=>N_7, c(2 downto 0)=>c(2 downto 0) );
   I4 : SHIFT
      Port Map ( a(3 downto 0)=>a(3 downto 0), clk=>clk, ld=>ld,
                 rst=>xrst, d(3 downto 0)=>d(3 downto 0) );

end SCHEMATIC;
