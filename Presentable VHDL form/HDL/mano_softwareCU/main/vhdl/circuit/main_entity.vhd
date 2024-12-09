--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY main IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          AC_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          ALU_out           : OUT std_logic_vector( 15 DOWNTO 0 );
          AR_out            : OUT std_logic_vector( 10 DOWNTO 0 );
          CU_MAP            : OUT std_logic_vector( 6 DOWNTO 0 );
          DR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          Mem_out           : OUT std_logic_vector( 15 DOWNTO 0 );
          PC_out            : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY main;
