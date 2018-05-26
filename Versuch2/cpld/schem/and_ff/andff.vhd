-- VHDL model created from schematic andff.sch -- Sep 19 15:16:06 2000

LIBRARY vanmacro;
USE vanmacro.components.ALL;
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity ANDFF is
      Port ( input_1 : In    std_logic;
             input_2 : In    std_logic;
                 Clk : In    std_logic;
             output_q : Out   std_logic );
end ANDFF;

architecture SCHEMATIC of ANDFF is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_6 : std_logic;
   signal      N_7 : std_logic;
   signal      N_1 : std_logic;
   signal      N_4 : std_logic;
   signal      N_5 : std_logic;

begin

   I_1 : G_OUTPUT
      Port Map ( I=>N_6, O=>output_q );
   I_2 : G_INPUT
      Port Map ( I=>input_2, O=>N_4 );
   I_3 : G_INPUT
      Port Map ( I=>input_1, O=>N_1 );
   I_4 : G_CLKBUF
      Port Map ( I=>Clk, O=>N_5 );
   I_5 : G_D
      Port Map ( CLK=>N_5, D=>N_7, Q=>N_6 );
   I_6 : G_2AND
      Port Map ( A=>N_4, B=>N_1, Y=>N_7 );

end SCHEMATIC;
