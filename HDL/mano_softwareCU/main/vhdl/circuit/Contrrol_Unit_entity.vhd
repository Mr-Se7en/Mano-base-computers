--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : Contrrol_Unit                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Contrrol_Unit IS
   PORT ( AC_Sign           : IN  std_logic;
          AC_Zero           : IN  std_logic;
          CLK               : IN  std_logic;
          DR_15             : IN  std_logic;
          DR_MAP            : IN  std_logic_vector( 6 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          ACTDR             : OUT std_logic;
          ADD               : OUT std_logic;
          ALU_AND           : OUT std_logic;
          ALU_OR            : OUT std_logic;
          ALU_XOR           : OUT std_logic;
          ARTPC             : OUT std_logic;
          CLRAC             : OUT std_logic;
          COM               : OUT std_logic;
          DRTAC             : OUT std_logic;
          DRTAR             : OUT std_logic;
          INCAC             : OUT std_logic;
          INCDR             : OUT std_logic;
          INCPC             : OUT std_logic;
          PCTAR             : OUT std_logic;
          PCTDR             : OUT std_logic;
          READ              : OUT std_logic;
          SHL               : OUT std_logic;
          SHR               : OUT std_logic;
          SUB               : OUT std_logic;
          WRITE             : OUT std_logic );
END ENTITY Contrrol_Unit;
