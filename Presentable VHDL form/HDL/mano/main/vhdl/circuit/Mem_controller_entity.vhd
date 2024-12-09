--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Mem_controller IS
   PORT ( IR15              : IN  std_logic;
          d0                : IN  std_logic;
          d1                : IN  std_logic;
          d2                : IN  std_logic;
          d3                : IN  std_logic;
          d5                : IN  std_logic;
          d6                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t1                : IN  std_logic;
          t3                : IN  std_logic;
          t4                : IN  std_logic;
          t6                : IN  std_logic;
          R                 : OUT std_logic;
          W                 : OUT std_logic );
END ENTITY Mem_controller;
