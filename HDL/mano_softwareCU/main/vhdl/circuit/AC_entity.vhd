--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : AC                                                           ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY AC IS
   PORT ( ALU_in            : IN  std_logic_vector( 15 DOWNTO 0 );
          CLK               : IN  std_logic;
          Clear             : IN  std_logic;
          Inc               : IN  std_logic;
          Load              : IN  std_logic;
          SHL               : IN  std_logic;
          SHR               : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          AC_out            : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY AC;
