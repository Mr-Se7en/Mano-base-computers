--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY IR_Controller IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t1                : IN  std_logic;
          L                 : OUT std_logic );
END ENTITY IR_Controller;
