Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_Tb IS

        SIGNAL DataA_(15)_i         : std_logic;
        SIGNAL DataA_(14)_i         : std_logic;
        SIGNAL DataA_(13)_i         : std_logic;
        SIGNAL DataA_(12)_i         : std_logic;
        SIGNAL DataA_(11)_i         : std_logic;
        SIGNAL DataA_(10)_i         : std_logic;
        SIGNAL DataA_(9)_i          : std_logic;
        SIGNAL DataA_(8)_i          : std_logic;
        SIGNAL DataA_(7)_i          : std_logic;
        SIGNAL DataA_(6)_i          : std_logic;
        SIGNAL DataA_(5)_i          : std_logic;
        SIGNAL DataA_(4)_i          : std_logic;
        SIGNAL DataA_(3)_i          : std_logic;
        SIGNAL DataA_(2)_i          : std_logic;
        SIGNAL DataA_(1)_i          : std_logic;
        SIGNAL DataA_(0)_i          : std_logic;
        SIGNAL DataB_(15)_i         : std_logic;
        SIGNAL DataB_(14)_i         : std_logic;
        SIGNAL DataB_(13)_i         : std_logic;
        SIGNAL DataB_(12)_i         : std_logic;
        SIGNAL DataB_(11)_i         : std_logic;
        SIGNAL DataB_(10)_i         : std_logic;
        SIGNAL DataB_(9)_i          : std_logic;
        SIGNAL DataB_(8)_i          : std_logic;
        SIGNAL DataB_(7)_i          : std_logic;
        SIGNAL DataB_(6)_i          : std_logic;
        SIGNAL DataB_(5)_i          : std_logic;
        SIGNAL DataB_(4)_i          : std_logic;
        SIGNAL DataB_(3)_i          : std_logic;
        SIGNAL DataB_(2)_i          : std_logic;
        SIGNAL DataB_(1)_i          : std_logic;
        SIGNAL DataB_(0)_i          : std_logic;
        SIGNAL Result(31)_o         : std_logic;
        SIGNAL Result(30)_o         : std_logic;
        SIGNAL Result(29)_o         : std_logic;
        SIGNAL Result(28)_o         : std_logic;
        SIGNAL Result(27)_o         : std_logic;
        SIGNAL Result(26)_o         : std_logic;
        SIGNAL Result(25)_o         : std_logic;
        SIGNAL Result(24)_o         : std_logic;
        SIGNAL Result(23)_o         : std_logic;
        SIGNAL Result(22)_o         : std_logic;
        SIGNAL Result(21)_o         : std_logic;
        SIGNAL Result(20)_o         : std_logic;
        SIGNAL Result(19)_o         : std_logic;
        SIGNAL Result(18)_o         : std_logic;
        SIGNAL Result(17)_o         : std_logic;
        SIGNAL Result(16)_o         : std_logic;
        SIGNAL Result(15)_o         : std_logic;
        SIGNAL Result(14)_o         : std_logic;
        SIGNAL Result(13)_o         : std_logic;
        SIGNAL Result(12)_o         : std_logic;
        SIGNAL Result(11)_o         : std_logic;
        SIGNAL Result(10)_o         : std_logic;
        SIGNAL Result(9)_o          : std_logic;
        SIGNAL Result(8)_o          : std_logic;
        SIGNAL Result(7)_o          : std_logic;
        SIGNAL Result(6)_o          : std_logic;
        SIGNAL Result(5)_o          : std_logic;
        SIGNAL Result(4)_o          : std_logic;
        SIGNAL Result(3)_o          : std_logic;
        SIGNAL Result(2)_o          : std_logic;
        SIGNAL Result(1)_o          : std_logic;
        SIGNAL Result(0)_o          : std_logic;

END test_Tb;

ARCHITECTURE LATTICE_ARCH OF test_Tb IS
  COMPONENT test 
        PORT (
        Result              :OUT    std_logic_vector(31 DOWNTO 0);
        DataA_              :IN    std_logic_vector(15 DOWNTO 0);
        DataB_              :IN    std_logic_vector(15 DOWNTO 0));
  END COMPONENT;
END LATTICE_ARCH;

CONFIGURATION test_Tb_conf OF test_Tb IS
  FOR LATTICE_ARCH
  END FOR;
END  test_Tb_conf;

