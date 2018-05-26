Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB_Tb IS

        SIGNAL EDI(3)_i             : std_logic;
        SIGNAL EDI(2)_i             : std_logic;
        SIGNAL EDI(1)_i             : std_logic;
        SIGNAL EDI(0)_i             : std_logic;
        SIGNAL Data(31)_i           : std_logic;
        SIGNAL Data(30)_i           : std_logic;
        SIGNAL Data(29)_i           : std_logic;
        SIGNAL Data(28)_i           : std_logic;
        SIGNAL Data(27)_i           : std_logic;
        SIGNAL Data(26)_i           : std_logic;
        SIGNAL Data(25)_i           : std_logic;
        SIGNAL Data(24)_i           : std_logic;
        SIGNAL Data(23)_i           : std_logic;
        SIGNAL Data(22)_i           : std_logic;
        SIGNAL Data(21)_i           : std_logic;
        SIGNAL Data(20)_i           : std_logic;
        SIGNAL Data(19)_i           : std_logic;
        SIGNAL Data(18)_i           : std_logic;
        SIGNAL Data(17)_i           : std_logic;
        SIGNAL Data(16)_i           : std_logic;
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
        SIGNAL WrAddress(9)_i       : std_logic;
        SIGNAL WrAddress(8)_i       : std_logic;
        SIGNAL WrAddress(7)_i       : std_logic;
        SIGNAL WrAddress(6)_i       : std_logic;
        SIGNAL WrAddress(5)_i       : std_logic;
        SIGNAL WrAddress(4)_i       : std_logic;
        SIGNAL WrAddress(3)_i       : std_logic;
        SIGNAL WrAddress(2)_i       : std_logic;
        SIGNAL WrAddress(1)_i       : std_logic;
        SIGNAL WrAddress(0)_i       : std_logic;
        SIGNAL RdAddress(9)_i       : std_logic;
        SIGNAL RdAddress(8)_i       : std_logic;
        SIGNAL RdAddress(7)_i       : std_logic;
        SIGNAL RdAddress(6)_i       : std_logic;
        SIGNAL RdAddress(5)_i       : std_logic;
        SIGNAL RdAddress(4)_i       : std_logic;
        SIGNAL RdAddress(3)_i       : std_logic;
        SIGNAL RdAddress(2)_i       : std_logic;
        SIGNAL RdAddress(1)_i       : std_logic;
        SIGNAL RdAddress(0)_i       : std_logic;
        SIGNAL RdClock_i            : std_logic;
        SIGNAL WrClock_i            : std_logic;
        SIGNAL RdEn_i               : std_logic;
        SIGNAL WrEn_i               : std_logic;
        SIGNAL EDO(3)_o             : std_logic;
        SIGNAL EDO(2)_o             : std_logic;
        SIGNAL EDO(1)_o             : std_logic;
        SIGNAL EDO(0)_o             : std_logic;
        SIGNAL Q(31)_o              : std_logic;
        SIGNAL Q(30)_o              : std_logic;
        SIGNAL Q(29)_o              : std_logic;
        SIGNAL Q(28)_o              : std_logic;
        SIGNAL Q(27)_o              : std_logic;
        SIGNAL Q(26)_o              : std_logic;
        SIGNAL Q(25)_o              : std_logic;
        SIGNAL Q(24)_o              : std_logic;
        SIGNAL Q(23)_o              : std_logic;
        SIGNAL Q(22)_o              : std_logic;
        SIGNAL Q(21)_o              : std_logic;
        SIGNAL Q(20)_o              : std_logic;
        SIGNAL Q(19)_o              : std_logic;
        SIGNAL Q(18)_o              : std_logic;
        SIGNAL Q(17)_o              : std_logic;
        SIGNAL Q(16)_o              : std_logic;
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

END test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB_Tb;

ARCHITECTURE LATTICE_ARCH OF test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB_Tb IS
  COMPONENT test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB 
        PORT (
        EDI                 :IN    std_logic_vector(3 DOWNTO 0);
        EDO                 :OUT    std_logic_vector(3 DOWNTO 0);
        Q                   :OUT    std_logic_vector(31 DOWNTO 0);
        Data                :IN    std_logic_vector(31 DOWNTO 0);
        WrAddress           :IN    std_logic_vector(9 DOWNTO 0);
        RdAddress           :IN    std_logic_vector(9 DOWNTO 0);
        RdClock             :IN   std_logic;
        WrClock             :IN   std_logic;
        RdEn                :IN   std_logic;
        WrEn                :IN   std_logic);
  END COMPONENT;
END LATTICE_ARCH;

CONFIGURATION test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB_Tb_conf OF test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB_Tb IS
  FOR LATTICE_ARCH
  END FOR;
END  test_LPM_RAM_DP_32_10_1024_REGISTERED_REGISTERED_UNREGISTERED_UNREGISTERED_4_UNUSED_EMB_Tb_conf;

