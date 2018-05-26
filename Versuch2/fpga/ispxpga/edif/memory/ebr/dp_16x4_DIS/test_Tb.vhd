Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_Tb IS

        SIGNAL EDI(0)_i             : std_logic;
        SIGNAL Data(3)_i            : std_logic;
        SIGNAL Data(2)_i            : std_logic;
        SIGNAL Data(1)_i            : std_logic;
        SIGNAL Data(0)_i            : std_logic;
        SIGNAL WrAddress(3)_i       : std_logic;
        SIGNAL WrAddress(2)_i       : std_logic;
        SIGNAL WrAddress(1)_i       : std_logic;
        SIGNAL WrAddress(0)_i       : std_logic;
        SIGNAL RdAddress(3)_i       : std_logic;
        SIGNAL RdAddress(2)_i       : std_logic;
        SIGNAL RdAddress(1)_i       : std_logic;
        SIGNAL RdAddress(0)_i       : std_logic;
        SIGNAL RdClock_i            : std_logic;
        SIGNAL WrClock_i            : std_logic;
        SIGNAL RdEn_i               : std_logic;
        SIGNAL WrEn_i               : std_logic;
        SIGNAL EDO(0)_o             : std_logic;
        SIGNAL Q(3)_o               : std_logic;
        SIGNAL Q(2)_o               : std_logic;
        SIGNAL Q(1)_o               : std_logic;
        SIGNAL Q(0)_o               : std_logic;

END test_Tb;

ARCHITECTURE LATTICE_ARCH OF test_Tb IS
  COMPONENT test 
        PORT (
        EDI                 :IN    std_logic_vector(0 DOWNTO 0);
        EDO                 :OUT    std_logic_vector(0 DOWNTO 0);
        Q                   :OUT    std_logic_vector(3 DOWNTO 0);
        Data                :IN    std_logic_vector(3 DOWNTO 0);
        WrAddress           :IN    std_logic_vector(3 DOWNTO 0);
        RdAddress           :IN    std_logic_vector(3 DOWNTO 0);
        RdClock             :IN   std_logic;
        WrClock             :IN   std_logic;
        RdEn                :IN   std_logic;
        WrEn                :IN   std_logic);
  END COMPONENT;
END LATTICE_ARCH;

CONFIGURATION test_Tb_conf OF test_Tb IS
  FOR LATTICE_ARCH
  END FOR;
END  test_Tb_conf;

