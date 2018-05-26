Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_Tb IS

        SIGNAL Data(15)_i           : std_logic;
        SIGNAL Data(14)_i           : std_logic;
        SIGNAL Data(13)_i           : std_logic;
        SIGNAL Data(12)_i           : std_logic;
        SIGNAL Data(11)_i           : std_logic;
        SIGNAL Data(10)_i           : std_logic;
        SIGNAL Data(9)_i            : std_logic;
        SIGNAL Data(8)_i            : std_logic;
        SIGNAL Data(7)_i            : std_logic;
        SIGNAL Data(6)_i            : std_logic;
        SIGNAL Data(5)_i            : std_logic;
        SIGNAL Data(4)_i            : std_logic;
        SIGNAL Data(3)_i            : std_logic;
        SIGNAL Data(2)_i            : std_logic;
        SIGNAL Data(1)_i            : std_logic;
        SIGNAL Data(0)_i            : std_logic;
        SIGNAL Clock_i              : std_logic;
        SIGNAL Cnt_En_i             : std_logic;
        SIGNAL UpDown_i             : std_logic;
        SIGNAL Sclr_i               : std_logic;
        SIGNAL Q(15)_o              : std_logic;
        SIGNAL Q(14)_o              : std_logic;
        SIGNAL Q(13)_o              : std_logic;
        SIGNAL Q(12)_o              : std_logic;
        SIGNAL Q(11)_o              : std_logic;
        SIGNAL Q(10)_o              : std_logic;
        SIGNAL Q(9)_o               : std_logic;
        SIGNAL Q(8)_o               : std_logic;
        SIGNAL Q(7)_o               : std_logic;
        SIGNAL Q(6)_o               : std_logic;
        SIGNAL Q(5)_o               : std_logic;
        SIGNAL Q(4)_o               : std_logic;
        SIGNAL Q(3)_o               : std_logic;
        SIGNAL Q(2)_o               : std_logic;
        SIGNAL Q(1)_o               : std_logic;
        SIGNAL Q(0)_o               : std_logic;

END test_Tb;

ARCHITECTURE LATTICE_ARCH OF test_Tb IS
  COMPONENT test 
        PORT (
        Q                   :OUT    std_logic_vector(15 DOWNTO 0);
        Data                :IN    std_logic_vector(15 DOWNTO 0);
        Clock               :IN   std_logic;
        Cnt_En              :IN   std_logic;
        UpDown              :IN   std_logic;
        Sclr                :IN   std_logic);
  END COMPONENT;
END LATTICE_ARCH;

CONFIGURATION test_Tb_conf OF test_Tb IS
  FOR LATTICE_ARCH
  END FOR;
END  test_Tb_conf;

