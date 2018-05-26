-- VHDL model created from schematic clocktop.sch -- Dec 10 18:02:13 2000

LIBRARY vanmacro;
USE vanmacro.components.ALL;
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity CLOCKTOP is
      Port (    MUSA : Out   std_logic;
                MUSB : Out   std_logic;
                MUSC : Out   std_logic;
                MUSD : Out   std_logic;
                MUSE : Out   std_logic;
                MUSF : Out   std_logic;
                MUSG : Out   std_logic;
                MTSA : Out   std_logic;
                MTSB : Out   std_logic;
                MTSC : Out   std_logic;
                MTSD : Out   std_logic;
                MTSE : Out   std_logic;
                MTSF : Out   std_logic;
                MTSG : Out   std_logic;
                 HSA : Out   std_logic;
                 HSB : Out   std_logic;
                 HSC : Out   std_logic;
                 HSD : Out   std_logic;
                 HSE : Out   std_logic;
                 HSF : Out   std_logic;
                 HSG : Out   std_logic;
                 HSH : Out   std_logic;
                 HSJ : Out   std_logic;
                  PM : Out   std_logic;
                  AM : Out   std_logic;
               COLON : Out   std_logic;
              SYSCLK : In    std_logic;
                TEST : In    std_logic;
               nSLOW : In    std_logic;
               nFAST : In    std_logic;
               nHOLD : In    std_logic );
end CLOCKTOP;

architecture SCHEMATIC of CLOCKTOP is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal     N_66 : std_logic;
   signal     N_67 : std_logic;
   signal     N_68 : std_logic;
   signal     N_69 : std_logic;
   signal     N_70 : std_logic;
   signal     N_71 : std_logic;
   signal     N_72 : std_logic;
   signal     N_73 : std_logic;
   signal     N_59 : std_logic;
   signal     N_60 : std_logic;
   signal     N_61 : std_logic;
   signal     N_62 : std_logic;
   signal     N_63 : std_logic;
   signal     N_64 : std_logic;
   signal     N_65 : std_logic;
   signal     N_52 : std_logic;
   signal     N_45 : std_logic;
   signal      N_1 : std_logic;
   signal     N_14 : std_logic;
   signal     N_16 : std_logic;
   signal     N_17 : std_logic;
   signal     N_18 : std_logic;
   signal     N_19 : std_logic;
   signal     N_20 : std_logic;
   signal     N_21 : std_logic;
   signal     N_22 : std_logic;
   signal     N_23 : std_logic;
   signal     N_24 : std_logic;
   signal     N_25 : std_logic;
   signal     N_26 : std_logic;
   signal     N_27 : std_logic;
   signal     N_28 : std_logic;
   signal     N_29 : std_logic;
   signal     N_30 : std_logic;
   signal     N_31 : std_logic;
   signal     N_32 : std_logic;
   signal     N_33 : std_logic;
   signal     N_34 : std_logic;
   signal     N_35 : std_logic;
   signal     N_36 : std_logic;
   signal     N_37 : std_logic;
   signal     N_38 : std_logic;
   signal     N_39 : std_logic;

   component SECCNTR
      Port (     CLK : In    std_logic;
                HOLD : In    std_logic;
                COUT : Out   std_logic );
   end component;

   component PRESCLR
      Port (  SYSCLK : In    std_logic;
                TEST : In    std_logic;
                 HZ1 : Out   std_logic;
               HZ128 : Out   std_logic;
                HZ16 : Out   std_logic;
                 HZ8 : Out   std_logic );
   end component;

   component CONTROL
      Port (    FAST : In    std_logic;
                HOLD : In    std_logic;
                 HZ1 : In    std_logic;
               HZ128 : In    std_logic;
                HZ16 : In    std_logic;
                 HZ8 : In    std_logic;
                SLOW : In    std_logic;
             CLKPULSE : Out   std_logic;
             HOLDSEC : Out   std_logic;
              RSTCLK : Out   std_logic );
   end component;

   component MINUTES
      Port (     CIN : In    std_logic;
                 CLK : In    std_logic;
                 RST : In    std_logic;
                COUT : Out   std_logic;
                  MA : Out   std_logic;
                  MB : Out   std_logic;
                  MC : Out   std_logic;
                  MD : Out   std_logic;
                  ME : Out   std_logic;
                  MF : Out   std_logic;
                  MG : Out   std_logic;
                  TA : Out   std_logic;
                  TB : Out   std_logic;
                  TC : Out   std_logic;
                  TD : Out   std_logic;
                  TE : Out   std_logic;
                  TF : Out   std_logic;
                  TG : Out   std_logic );
   end component;

   component HOURS
      Port (     CIN : In    std_logic;
                 CLK : In    std_logic;
                 RST : In    std_logic;
                   A : Out   std_logic;
                   B : Out   std_logic;
                   C : Out   std_logic;
                COUT : Out   std_logic;
                   D : Out   std_logic;
                   E : Out   std_logic;
                   F : Out   std_logic;
                   G : Out   std_logic;
                   H : Out   std_logic;
                   J : Out   std_logic );
   end component;

begin

   U41 : G_BUFB
      Port Map ( AN=>N_66, Y=>N_69 );
   U40 : G_BUFB
      Port Map ( AN=>N_67, Y=>N_70 );
   U39 : G_BUFB
      Port Map ( AN=>N_68, Y=>N_71 );
   U9 : SECCNTR
      Port Map ( CLK=>N_64, HOLD=>N_63, COUT=>N_45 );
   U11 : G_INV
      Port Map ( A=>N_52, YN=>N_25 );
   U10 : G_DC
      Port Map ( C=>N_65, CLK=>N_16, D=>N_25, Q=>N_52 );
   U37 : G_OUTPUT
      Port Map ( I=>N_62, O=>COLON );
   U36 : G_OUTPUT
      Port Map ( I=>N_18, O=>MUSA );
   U13 : G_OUTPUT
      Port Map ( I=>N_52, O=>PM );
   U12 : G_OUTPUT
      Port Map ( I=>N_25, O=>AM );
   U15 : G_OUTPUT
      Port Map ( I=>N_22, O=>HSH );
   U14 : G_OUTPUT
      Port Map ( I=>N_19, O=>HSJ );
   U19 : G_OUTPUT
      Port Map ( I=>N_1, O=>HSD );
   U22 : G_OUTPUT
      Port Map ( I=>N_27, O=>HSA );
   U21 : G_OUTPUT
      Port Map ( I=>N_31, O=>HSB );
   U20 : G_OUTPUT
      Port Map ( I=>N_35, O=>HSC );
   U18 : G_OUTPUT
      Port Map ( I=>N_34, O=>HSE );
   U17 : G_OUTPUT
      Port Map ( I=>N_30, O=>HSF );
   U16 : G_OUTPUT
      Port Map ( I=>N_26, O=>HSG );
   U29 : G_OUTPUT
      Port Map ( I=>N_38, O=>MTSA );
   U28 : G_OUTPUT
      Port Map ( I=>N_36, O=>MTSB );
   U27 : G_OUTPUT
      Port Map ( I=>N_32, O=>MTSC );
   U26 : G_OUTPUT
      Port Map ( I=>N_28, O=>MTSD );
   U25 : G_OUTPUT
      Port Map ( I=>N_23, O=>MTSE );
   U24 : G_OUTPUT
      Port Map ( I=>N_20, O=>MTSF );
   U23 : G_OUTPUT
      Port Map ( I=>N_17, O=>MTSG );
   U33 : G_OUTPUT
      Port Map ( I=>N_29, O=>MUSD );
   U35 : G_OUTPUT
      Port Map ( I=>N_21, O=>MUSB );
   U34 : G_OUTPUT
      Port Map ( I=>N_24, O=>MUSC );
   U32 : G_OUTPUT
      Port Map ( I=>N_33, O=>MUSE );
   U31 : G_OUTPUT
      Port Map ( I=>N_37, O=>MUSF );
   U30 : G_OUTPUT
      Port Map ( I=>N_39, O=>MUSG );
   U1 : G_CLKBUF
      Port Map ( I=>SYSCLK, O=>N_72 );
   U4 : G_INPUT
      Port Map ( I=>nHOLD, O=>N_68 );
   U3 : G_INPUT
      Port Map ( I=>nSLOW, O=>N_66 );
   U2 : G_INPUT
      Port Map ( I=>nFAST, O=>N_67 );
   U38 : G_INPUT
      Port Map ( I=>TEST, O=>N_73 );
   U5 : PRESCLR
      Port Map ( SYSCLK=>N_72, TEST=>N_73, HZ1=>N_62, HZ128=>N_59,
                 HZ16=>N_60, HZ8=>N_61 );
   U6 : CONTROL
      Port Map ( FAST=>N_70, HOLD=>N_71, HZ1=>N_62, HZ128=>N_59,
                 HZ16=>N_60, HZ8=>N_61, SLOW=>N_69, CLKPULSE=>N_64,
                 HOLDSEC=>N_63, RSTCLK=>N_65 );
   U8 : MINUTES
      Port Map ( CIN=>N_45, CLK=>N_64, RST=>N_65, COUT=>N_14, MA=>N_18,
                 MB=>N_21, MC=>N_24, MD=>N_29, ME=>N_33, MF=>N_37,
                 MG=>N_39, TA=>N_38, TB=>N_36, TC=>N_32, TD=>N_28,
                 TE=>N_23, TF=>N_20, TG=>N_17 );
   U7 : HOURS
      Port Map ( CIN=>N_14, CLK=>N_64, RST=>N_65, A=>N_27, B=>N_31,
                 C=>N_35, COUT=>N_16, D=>N_1, E=>N_34, F=>N_30, G=>N_26,
                 H=>N_22, J=>N_19 );

end SCHEMATIC;
