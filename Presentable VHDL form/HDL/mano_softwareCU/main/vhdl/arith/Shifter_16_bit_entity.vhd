--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Shifter_16_bit IS
   GENERIC ( shifterMode : INTEGER );
   PORT ( dataA       : IN  std_logic_vector( 15 DOWNTO 0 );
          shiftAmount : IN  std_logic_vector( 3 DOWNTO 0 );
          result      : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY Shifter_16_bit;
