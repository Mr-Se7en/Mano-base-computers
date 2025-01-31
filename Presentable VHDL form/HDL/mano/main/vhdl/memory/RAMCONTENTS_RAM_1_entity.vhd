--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY RAMCONTENTS_RAM_1 IS
   PORT ( address : IN  std_logic_vector( 11 DOWNTO 0 );
          clock   : IN  std_logic;
          dataIn  : IN  std_logic_vector( 15 DOWNTO 0 );
          oe      : IN  std_logic;
          tick    : IN  std_logic;
          we      : IN  std_logic;
          dataOut : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY RAMCONTENTS_RAM_1;
