--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF AND_GATE_11_INPUTS IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_realInput1  : std_logic;
   SIGNAL s_realInput10 : std_logic;
   SIGNAL s_realInput11 : std_logic;
   SIGNAL s_realInput2  : std_logic;
   SIGNAL s_realInput3  : std_logic;
   SIGNAL s_realInput4  : std_logic;
   SIGNAL s_realInput5  : std_logic;
   SIGNAL s_realInput6  : std_logic;
   SIGNAL s_realInput7  : std_logic;
   SIGNAL s_realInput8  : std_logic;
   SIGNAL s_realInput9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here the bubbles are processed                                             --
   --------------------------------------------------------------------------------
   s_realInput1 <= input1 WHEN BubblesMask(0) = '0' ELSE NOT(input1);
   s_realInput2 <= input2 WHEN BubblesMask(1) = '0' ELSE NOT(input2);
   s_realInput3 <= input3 WHEN BubblesMask(2) = '0' ELSE NOT(input3);
   s_realInput4 <= input4 WHEN BubblesMask(3) = '0' ELSE NOT(input4);
   s_realInput5 <= input5 WHEN BubblesMask(4) = '0' ELSE NOT(input5);
   s_realInput6 <= input6 WHEN BubblesMask(5) = '0' ELSE NOT(input6);
   s_realInput7 <= input7 WHEN BubblesMask(6) = '0' ELSE NOT(input7);
   s_realInput8 <= input8 WHEN BubblesMask(7) = '0' ELSE NOT(input8);
   s_realInput9 <= input9 WHEN BubblesMask(8) = '0' ELSE NOT(input9);
   s_realInput10 <= input10 WHEN BubblesMask(9) = '0' ELSE NOT(input10);
   s_realInput11 <= input11 WHEN BubblesMask(10) = '0' ELSE NOT(input11);

   --------------------------------------------------------------------------------
   -- Here the functionality is defined                                          --
   --------------------------------------------------------------------------------
   result <= s_realInput1 AND 
             s_realInput2 AND 
             s_realInput3 AND 
             s_realInput4 AND 
             s_realInput5 AND 
             s_realInput6 AND 
             s_realInput7 AND 
             s_realInput8 AND 
             s_realInput9 AND 
             s_realInput10 AND 
             s_realInput11;

END platformIndependent;
