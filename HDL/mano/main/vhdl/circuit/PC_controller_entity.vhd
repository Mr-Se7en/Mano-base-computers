--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : PC_controller                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY PC_controller IS
   PORT ( d4                : IN  std_logic;
          d5                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t1                : IN  std_logic;
          t4                : IN  std_logic;
          t5                : IN  std_logic;
          L                 : OUT std_logic;
          plusplus          : OUT std_logic );
END ENTITY PC_controller;
