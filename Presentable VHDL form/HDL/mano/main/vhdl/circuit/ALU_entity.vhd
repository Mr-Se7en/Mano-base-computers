--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY ALU IS
   PORT ( A                 : IN  std_logic_vector( 15 DOWNTO 0 );
          Add_mode          : IN  std_logic;
          B                 : IN  std_logic_vector( 15 DOWNTO 0 );
          Cin               : IN  std_logic;
          Mode              : IN  std_logic_vector( 1 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          Res               : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY ALU;
