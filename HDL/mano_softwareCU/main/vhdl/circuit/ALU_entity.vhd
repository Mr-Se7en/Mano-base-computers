--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : ALU                                                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY ALU IS
   PORT ( A                 : IN  std_logic_vector( 15 DOWNTO 0 );
          ADD               : IN  std_logic;
          AND_PIN           : IN  std_logic;
          Add_mode          : IN  std_logic;
          B                 : IN  std_logic_vector( 15 DOWNTO 0 );
          COM               : IN  std_logic;
          Cin               : IN  std_logic;
          OR_pin            : IN  std_logic;
          T                 : IN  std_logic;
          XOR_pin           : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          Res               : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY ALU;
