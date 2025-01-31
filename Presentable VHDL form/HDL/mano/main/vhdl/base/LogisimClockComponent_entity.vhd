--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY LogisimClockComponent IS
   GENERIC ( highTicks : INTEGER;
             lowTicks  : INTEGER;
             nrOfBits  : INTEGER;
             phase     : INTEGER );
   PORT ( clockTick   : IN  std_logic;
          globalClock : IN  std_logic;
          clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
END ENTITY LogisimClockComponent;
