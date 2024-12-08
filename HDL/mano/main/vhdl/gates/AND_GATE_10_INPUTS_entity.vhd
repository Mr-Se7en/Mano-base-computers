--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : AND_GATE_10_INPUTS                                           ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY AND_GATE_10_INPUTS IS
   GENERIC ( BubblesMask : std_logic_vector );
   PORT ( input1  : IN  std_logic;
          input10 : IN  std_logic;
          input2  : IN  std_logic;
          input3  : IN  std_logic;
          input4  : IN  std_logic;
          input5  : IN  std_logic;
          input6  : IN  std_logic;
          input7  : IN  std_logic;
          input8  : IN  std_logic;
          input9  : IN  std_logic;
          result  : OUT std_logic );
END ENTITY AND_GATE_10_INPUTS;
