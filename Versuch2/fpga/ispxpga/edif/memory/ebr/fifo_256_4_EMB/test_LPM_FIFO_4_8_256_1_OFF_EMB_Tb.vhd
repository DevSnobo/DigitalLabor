Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb IS

        SIGNAL EDI(0)_i             : std_logic;
        SIGNAL Data(3)_i            : std_logic;
        SIGNAL Data(2)_i            : std_logic;
        SIGNAL Data(1)_i            : std_logic;
        SIGNAL Data(0)_i            : std_logic;
        SIGNAL Clock_i              : std_logic;
        SIGNAL WrReq_i              : std_logic;
        SIGNAL RdReq_i              : std_logic;
        SIGNAL Aclr_i               : std_logic;
        SIGNAL EDO(0)_o             : std_logic;
        SIGNAL Q(3)_o               : std_logic;
        SIGNAL Q(2)_o               : std_logic;
        SIGNAL Q(1)_o               : std_logic;
        SIGNAL Q(0)_o               : std_logic;
        SIGNAL UsedW(7)_o           : std_logic;
        SIGNAL UsedW(6)_o           : std_logic;
        SIGNAL UsedW(5)_o           : std_logic;
        SIGNAL UsedW(4)_o           : std_logic;
        SIGNAL UsedW(3)_o           : std_logic;
        SIGNAL UsedW(2)_o           : std_logic;
        SIGNAL UsedW(1)_o           : std_logic;
        SIGNAL UsedW(0)_o           : std_logic;
        SIGNAL Full_o               : std_logic;
        SIGNAL Empty_o              : std_logic;

END test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb;

ARCHITECTURE LATTICE_ARCH OF test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb IS
  COMPONENT test_LPM_FIFO_4_8_256_1_OFF_EMB 
        PORT (
        EDI                 :IN    std_logic_vector(0 DOWNTO 0);
        EDO                 :OUT    std_logic_vector(0 DOWNTO 0);
        Data                :IN    std_logic_vector(3 DOWNTO 0);
        Q                   :OUT    std_logic_vector(3 DOWNTO 0);
        UsedW               :OUT    std_logic_vector(7 DOWNTO 0);
        Clock               :IN   std_logic;
        WrReq               :IN   std_logic;
        RdReq               :IN   std_logic;
        Aclr                :IN   std_logic;
        Full                :OUT   std_logic;
        Empty               :OUT   std_logic);
  END COMPONENT;
END LATTICE_ARCH;

CONFIGURATION test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb_conf OF test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb IS
  FOR LATTICE_ARCH
  END FOR;
END  test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb_conf;

