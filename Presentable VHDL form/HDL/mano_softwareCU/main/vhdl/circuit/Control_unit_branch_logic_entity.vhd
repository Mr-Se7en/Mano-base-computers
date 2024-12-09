--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Control_unit_branch_logic IS
   PORT ( BR                : IN  std_logic_vector( 1 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          test              : IN  std_logic;
          SBR_L             : OUT std_logic;
          z0                : OUT std_logic;
          z1                : OUT std_logic );
END ENTITY Control_unit_branch_logic;
