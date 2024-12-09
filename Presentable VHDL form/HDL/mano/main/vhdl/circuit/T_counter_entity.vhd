--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY T_counter IS
   PORT ( CLK               : IN  std_logic;
          En                : IN  std_logic;
          clear             : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          T_out             : OUT std_logic_vector( 2 DOWNTO 0 ) );
END ENTITY T_counter;
