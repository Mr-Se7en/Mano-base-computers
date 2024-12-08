--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : AR_controller                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY AR_controller IS
   PORT ( IR15              : IN  std_logic;
          d5                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t0                : IN  std_logic;
          t2                : IN  std_logic;
          t3                : IN  std_logic;
          t4                : IN  std_logic;
          AR_L              : OUT std_logic;
          plusplus          : OUT std_logic );
END ENTITY AR_controller;
