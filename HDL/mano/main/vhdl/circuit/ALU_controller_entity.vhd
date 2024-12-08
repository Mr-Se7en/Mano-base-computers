--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : ALU_controller                                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY ALU_controller IS
   PORT ( d0                : IN  std_logic;
          d2                : IN  std_logic;
          d3                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t4                : IN  std_logic;
          t5                : IN  std_logic;
          add               : OUT std_logic;
          mode              : OUT std_logic_vector( 1 DOWNTO 0 ) );
END ENTITY ALU_controller;
