--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY main IS
   PORT ( ST                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          AC_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          ALU_out           : OUT std_logic_vector( 15 DOWNTO 0 );
          AR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          BUS_DATA          : OUT std_logic_vector( 15 DOWNTO 0 );
          DR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          IR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          Mem_out           : OUT std_logic_vector( 15 DOWNTO 0 );
          PC_out            : OUT std_logic_vector( 15 DOWNTO 0 );
          T                 : OUT std_logic_vector( 2 DOWNTO 0 ) );
END ENTITY main;
