--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY AND_GATE_BUS IS
   GENERIC ( BubblesMask : std_logic_vector;
             NrOfBits    : INTEGER );
   PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
          input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
          result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
END ENTITY AND_GATE_BUS;
