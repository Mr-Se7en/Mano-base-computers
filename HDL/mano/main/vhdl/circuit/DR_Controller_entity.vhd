--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : DR_Controller                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY DR_Controller IS
   PORT ( d0                : IN  std_logic;
          d2                : IN  std_logic;
          d3                : IN  std_logic;
          d6                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t4                : IN  std_logic;
          t5                : IN  std_logic;
          L                 : OUT std_logic;
          plusplus          : OUT std_logic );
END ENTITY DR_Controller;
