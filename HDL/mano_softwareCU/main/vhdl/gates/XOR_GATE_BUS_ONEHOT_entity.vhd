--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : XOR_GATE_BUS_ONEHOT                                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY XOR_GATE_BUS_ONEHOT IS
   GENERIC ( BubblesMask : std_logic_vector;
             NrOfBits    : INTEGER );
   PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
          input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
          result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
END ENTITY XOR_GATE_BUS_ONEHOT;
