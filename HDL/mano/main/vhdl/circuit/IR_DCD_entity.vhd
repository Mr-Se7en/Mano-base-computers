--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : IR_DCD                                                       ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY IR_DCD IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          opc_in            : IN  std_logic_vector( 2 DOWNTO 0 );
          d0_Load           : OUT std_logic;
          d1_Store          : OUT std_logic;
          d2_ADD            : OUT std_logic;
          d3_AND            : OUT std_logic;
          d4_JUMP           : OUT std_logic;
          d5_BSA            : OUT std_logic;
          d6_ISZ            : OUT std_logic );
END ENTITY IR_DCD;
