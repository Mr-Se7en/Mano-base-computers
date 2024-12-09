--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF XOR_GATE_BUS_ONEHOT IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_realInput1 : std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
   SIGNAL s_realInput2 : std_logic_vector( (NrOfBits - 1) DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- Here the bubbles are processed                                             --
   --------------------------------------------------------------------------------
   s_realInput1 <= input1 WHEN BubblesMask(0) = '0' ELSE NOT(input1);
   s_realInput2 <= input2 WHEN BubblesMask(1) = '0' ELSE NOT(input2);

   --------------------------------------------------------------------------------
   -- Here the functionality is defined                                          --
   --------------------------------------------------------------------------------
   genBits : FOR n IN (NrOfBits-1) DOWNTO 0 GENERATE
      result(n) <= (s_realInput1(n) AND  NOT (s_realInput2(n))) OR 
                   ( NOT (s_realInput1(n)) AND s_realInput2(n));
   END GENERATE GenBits;


END platformIndependent;
