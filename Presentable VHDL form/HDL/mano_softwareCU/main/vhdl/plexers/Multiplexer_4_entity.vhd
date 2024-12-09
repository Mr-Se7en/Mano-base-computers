--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Multiplexer_4 IS
   PORT ( enable  : IN  std_logic;
          muxIn_0 : IN  std_logic;
          muxIn_1 : IN  std_logic;
          muxIn_2 : IN  std_logic;
          muxIn_3 : IN  std_logic;
          sel     : IN  std_logic_vector( 1 DOWNTO 0 );
          muxOut  : OUT std_logic );
END ENTITY Multiplexer_4;
