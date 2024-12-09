--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Bus_controller IS
   PORT ( IR15              : IN  std_logic;
          d0                : IN  std_logic;
          d1                : IN  std_logic;
          d2                : IN  std_logic;
          d3                : IN  std_logic;
          d4                : IN  std_logic;
          d5                : IN  std_logic;
          d6                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          t0                : IN  std_logic;
          t1                : IN  std_logic;
          t2                : IN  std_logic;
          t3                : IN  std_logic;
          t4                : IN  std_logic;
          t5                : IN  std_logic;
          t6                : IN  std_logic;
          s0                : OUT std_logic;
          s1                : OUT std_logic;
          s2                : OUT std_logic );
END ENTITY Bus_controller;
