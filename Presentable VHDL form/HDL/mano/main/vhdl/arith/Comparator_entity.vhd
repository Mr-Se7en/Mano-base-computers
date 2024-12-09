--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Comparator IS
   GENERIC ( nrOfBits       : INTEGER;
             twosComplement : INTEGER );
   PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          aEqualsB      : OUT std_logic;
          aGreaterThanB : OUT std_logic;
          aLessThanB    : OUT std_logic );
END ENTITY Comparator;
