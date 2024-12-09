--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF Mem_controller IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_5_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Net0  : std_logic;
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net14 : std_logic;
   SIGNAL s_Net15 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net17 : std_logic;
   SIGNAL s_Net18 : std_logic;
   SIGNAL s_Net19 : std_logic;
   SIGNAL s_Net2  : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Net0  <= t6;
   s_Net1  <= t4;
   s_Net11 <= t1;
   s_Net12 <= d3;
   s_Net13 <= d2;
   s_Net14 <= d5;
   s_Net15 <= d6;
   s_Net17 <= d0;
   s_Net18 <= d1;
   s_Net3  <= t3;
   s_Net4  <= IR15;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   R <= s_Net19;
   W <= s_Net8;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net1,
                 input2 => s_Net17,
                 result => s_Net7 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net18,
                 input2 => s_Net1,
                 result => s_Net16 );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net14,
                 input2 => s_Net1,
                 result => s_Net6 );

   GATES_4 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net15,
                 input2 => s_Net0,
                 result => s_Net10 );

   GATES_5 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net1,
                 input2 => s_Net12,
                 result => s_Net9 );

   GATES_6 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net1,
                 input2 => s_Net13,
                 result => s_Net2 );

   GATES_7 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net3,
                 input2 => s_Net4,
                 result => s_Net5 );

   GATES_8 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_Net16,
                 input2 => s_Net10,
                 input3 => s_Net6,
                 result => s_Net8 );

   GATES_9 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_Net2,
                 input2 => s_Net11,
                 input3 => s_Net9,
                 input4 => s_Net5,
                 input5 => s_Net7,
                 result => s_Net19 );


END platformIndependent;
