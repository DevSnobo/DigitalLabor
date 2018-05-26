-- VHDL model created from schematic p5_top.sch -- Dec 15 15:46:16 2000

LIBRARY vanmacro;
USE vanmacro.components.ALL;
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity P5_TOP is
      Port (      a3 : In    std_logic;
                  a2 : In    std_logic;
                  a1 : In    std_logic;
                  a0 : In    std_logic;
                  b3 : In    std_logic;
                  b2 : In    std_logic;
                  b1 : In    std_logic;
                  b0 : In    std_logic;
                 clk : In    std_logic;
                 mac : In    std_logic;
                 q_0 : Out   std_logic;
                 q_1 : Out   std_logic;
                 q_2 : Out   std_logic;
                 q_3 : Out   std_logic;
                 q_4 : Out   std_logic;
                 q_5 : Out   std_logic;
                 q_6 : Out   std_logic;
                 q_7 : Out   std_logic;
             ext_reset : In    std_logic );
end P5_TOP;

architecture SCHEMATIC of P5_TOP is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal       Q3 : std_logic_vector (3 downto 0);
   signal       Q2 : std_logic_vector (3 downto 0);
   signal       Q1 : std_logic_vector (3 downto 0);
   signal       Q0 : std_logic_vector (3 downto 0);
   signal        A : std_logic_vector (3 downto 0);
   signal       Q7 : std_logic_vector (3 downto 0);
   signal       Q6 : std_logic_vector (3 downto 0);
   signal       Q5 : std_logic_vector (3 downto 0);
   signal       Q4 : std_logic_vector (3 downto 0);
   signal        B : std_logic_vector (3 downto 0);

   component PREP5
      Port (       a : In    std_logic_vector (3 downto 0);
                   b : In    std_logic_vector (3 downto 0);
                 clk : In    std_logic;
                 mac : In    std_logic;
                 rst : In    std_logic;
                   q : Out   std_logic_vector (7 downto 0) );
   end component;

begin

   I_2 : G_CLKBUF
      Port Map ( I=>clk, O=>N_1 );
   I_11 : G_INPUT
      Port Map ( I=>ext_reset, O=>N_2 );
   I_12 : G_INPUT
      Port Map ( I=>mac, O=>N_3 );
   I_3 : G_INPUT
      Port Map ( I=>b0, O=>B(0) );
   I_4 : G_INPUT
      Port Map ( I=>b1, O=>B(1) );
   I_5 : G_INPUT
      Port Map ( I=>b2, O=>B(2) );
   I_6 : G_INPUT
      Port Map ( I=>b3, O=>B(3) );
   I_7 : G_INPUT
      Port Map ( I=>a0, O=>A(0) );
   I_8 : G_INPUT
      Port Map ( I=>a1, O=>A(1) );
   I_9 : G_INPUT
      Port Map ( I=>a2, O=>A(2) );
   I_10 : G_INPUT
      Port Map ( I=>a3, O=>A(3) );
   I_13 : G_OUTPUT
      Port Map ( I=>Q0(3), O=>q_0 );
   I_14 : G_OUTPUT
      Port Map ( I=>Q1(3), O=>q_1 );
   I_15 : G_OUTPUT
      Port Map ( I=>Q2(3), O=>q_2 );
   I_16 : G_OUTPUT
      Port Map ( I=>Q3(3), O=>q_3 );
   I_17 : G_OUTPUT
      Port Map ( I=>Q4(3), O=>q_4 );
   I_18 : G_OUTPUT
      Port Map ( I=>Q5(3), O=>q_5 );
   I_19 : G_OUTPUT
      Port Map ( I=>Q6(3), O=>q_6 );
   I_20 : G_OUTPUT
      Port Map ( I=>Q7(3), O=>q_7 );
   prep5_3 : PREP5
      Port Map ( a(0)=>A(0), a(1)=>A(1), a(2)=>A(2), a(3)=>A(3),
                 b(0)=>B(0), b(1)=>B(1), b(2)=>B(2), b(3)=>B(3),
                 clk=>N_1, mac=>N_3, rst=>N_2, q(0)=>Q0(3), q(1)=>Q1(3),
                 q(2)=>Q2(3), q(3)=>Q3(3), q(4)=>Q4(3), q(5)=>Q5(3),
                 q(6)=>Q6(3), q(7)=>Q7(3) );
   prep5_2 : PREP5
      Port Map ( a(0)=>Q0(2), a(1)=>Q1(2), a(2)=>Q2(2), a(3)=>Q3(2),
                 b(0)=>Q4(2), b(1)=>Q5(2), b(2)=>Q6(2), b(3)=>Q7(2),
                 clk=>N_1, mac=>N_3, rst=>N_2, q(0)=>Q0(2), q(1)=>Q1(2),
                 q(2)=>Q2(2), q(3)=>Q3(2), q(4)=>Q4(2), q(5)=>Q5(2),
                 q(6)=>Q6(2), q(7)=>Q7(2) );
   prep5_1 : PREP5
      Port Map ( a(0)=>Q0(1), a(1)=>Q1(1), a(2)=>Q2(1), a(3)=>Q3(1),
                 b(0)=>Q4(1), b(1)=>Q5(1), b(2)=>Q6(1), b(3)=>Q7(1),
                 clk=>N_1, mac=>N_3, rst=>N_2, q(0)=>Q0(1), q(1)=>Q1(1),
                 q(2)=>Q2(1), q(3)=>Q3(1), q(4)=>Q4(1), q(5)=>Q5(1),
                 q(6)=>Q6(1), q(7)=>Q7(1) );
   prep5_0 : PREP5
      Port Map ( a(0)=>Q0(0), a(1)=>Q1(0), a(2)=>Q2(0), a(3)=>Q3(0),
                 b(0)=>Q4(0), b(1)=>Q5(0), b(2)=>Q6(0), b(3)=>Q7(0),
                 clk=>N_1, mac=>N_3, rst=>N_2, q(0)=>Q0(0), q(1)=>Q1(0),
                 q(2)=>Q2(0), q(3)=>Q3(0), q(4)=>Q4(0), q(5)=>Q5(0),
                 q(6)=>Q6(0), q(7)=>Q7(0) );

end SCHEMATIC;
