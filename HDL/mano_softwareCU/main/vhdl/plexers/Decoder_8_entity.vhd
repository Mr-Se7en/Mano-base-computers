--==============================================================================
=========================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Decoder_8 IS
   PORT ( sel          : IN  std_logic_vector( 2 DOWNTO 0 );
          decoderOut_0 : OUT std_logic;
          decoderOut_1 : OUT std_logic;
          decoderOut_2 : OUT std_logic;
          decoderOut_3 : OUT std_logic;
          decoderOut_4 : OUT std_logic;
          decoderOut_5 : OUT std_logic;
          decoderOut_6 : OUT std_logic;
          decoderOut_7 : OUT std_logic );
END ENTITY Decoder_8;
