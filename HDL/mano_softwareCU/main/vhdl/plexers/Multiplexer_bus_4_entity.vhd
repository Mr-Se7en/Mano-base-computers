--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : Multiplexer_bus_4                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Multiplexer_bus_4 IS
   GENERIC ( nrOfBits : INTEGER );
   PORT ( enable  : IN  std_logic;
          muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          sel     : IN  std_logic_vector( 1 DOWNTO 0 );
          muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
END ENTITY Multiplexer_bus_4;
