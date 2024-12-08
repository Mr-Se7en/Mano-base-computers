--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : CAR                                                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY CAR IS
   PORT ( CAR_in            : IN  std_logic_vector( 6 DOWNTO 0 );
          CLK               : IN  std_logic;
          Load              : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          CAR_out           : OUT std_logic_vector( 6 DOWNTO 0 ) );
END ENTITY CAR;
