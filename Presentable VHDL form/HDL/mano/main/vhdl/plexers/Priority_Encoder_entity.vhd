--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Priority_Encoder IS
   GENERIC ( nrOfInputBits  : INTEGER;
             nrOfSelectBits : INTEGER );
   PORT ( enable      : IN  std_logic;
          inputVector : IN  std_logic_vector( (nrOfInputBits - 1) DOWNTO 0 );
          address     : OUT std_logic_vector( (nrOfSelectBits - 1) DOWNTO 0 );
          enableOut   : OUT std_logic;
          groupSelect : OUT std_logic );
END ENTITY Priority_Encoder;
