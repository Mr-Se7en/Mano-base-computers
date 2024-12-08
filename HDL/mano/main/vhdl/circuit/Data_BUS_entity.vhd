--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : Data_BUS                                                     ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Data_BUS IS
   PORT ( AC                : IN  std_logic_vector( 15 DOWNTO 0 );
          AR                : IN  std_logic_vector( 15 DOWNTO 0 );
          DR                : IN  std_logic_vector( 15 DOWNTO 0 );
          IR                : IN  std_logic_vector( 15 DOWNTO 0 );
          Mem               : IN  std_logic_vector( 15 DOWNTO 0 );
          PC                : IN  std_logic_vector( 15 DOWNTO 0 );
          TR                : IN  std_logic_vector( 15 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          s0                : IN  std_logic;
          s1                : IN  std_logic;
          s2                : IN  std_logic;
          Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY Data_BUS;
