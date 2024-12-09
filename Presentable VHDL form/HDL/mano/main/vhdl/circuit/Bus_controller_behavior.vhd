--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF Bus_controller IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE_11_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1  : IN  std_logic;
                input10 : IN  std_logic;
                input11 : IN  std_logic;
                input2  : IN  std_logic;
                input3  : IN  std_logic;
                input4  : IN  std_logic;
                input5  : IN  std_logic;
                input6  : IN  std_logic;
                input7  : IN  std_logic;
                input8  : IN  std_logic;
                input9  : IN  std_logic;
                result  : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE_10_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1  : IN  std_logic;
                input10 : IN  std_logic;
                input2  : IN  std_logic;
                input3  : IN  std_logic;
                input4  : IN  std_logic;
                input5  : IN  std_logic;
                input6  : IN  std_logic;
                input7  : IN  std_logic;
                input8  : IN  std_logic;
                input9  : IN  std_logic;
                result  : OUT std_logic );
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

      COMPONENT OR_GATE_4_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
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
   SIGNAL s_Net20 : std_logic;
   SIGNAL s_Net21 : std_logic;
   SIGNAL s_Net22 : std_logic;
   SIGNAL s_Net23 : std_logic;
   SIGNAL s_Net24 : std_logic;
   SIGNAL s_Net25 : std_logic;
   SIGNAL s_Net26 : std_logic;
   SIGNAL s_Net27 : std_logic;
   SIGNAL s_Net28 : std_logic;
   SIGNAL s_Net29 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net30 : std_logic;
   SIGNAL s_Net31 : std_logic;
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
   s_Net12 <= d0;
   s_Net15 <= d5;
   s_Net2  <= d6;
   s_Net21 <= d1;
   s_Net22 <= d2;
   s_Net23 <= d4;
   s_Net24 <= t3;
   s_Net26 <= d3;
   s_Net28 <= t5;
   s_Net29 <= IR15;
   s_Net3  <= t4;
   s_Net4  <= t1;
   s_Net5  <= t0;
   s_Net7  <= t6;
   s_Net9  <= t2;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   s0 <= s_Net30;
   s1 <= s_Net31;
   s2 <= s_Net27;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_11_INPUTS
      GENERIC MAP ( BubblesMask => "111"&X"FF" )
      PORT MAP ( input1  => s_Net14,
                 input10 => s_Net18,
                 input11 => s_Net20,
                 input2  => s_Net6,
                 input3  => s_Net5,
                 input4  => s_Net8,
                 input5  => s_Net4,
                 input6  => s_Net13,
                 input7  => s_Net9,
                 input8  => s_Net11,
                 input9  => s_Net0,
                 result  => s_Net25 );

   GATES_2 : AND_GATE_11_INPUTS
      GENERIC MAP ( BubblesMask => "111"&X"FF" )
      PORT MAP ( input1  => s_Net14,
                 input10 => s_Net20,
                 input11 => s_Net1,
                 input2  => s_Net18,
                 input3  => s_Net0,
                 input4  => s_Net8,
                 input5  => s_Net11,
                 input6  => s_Net13,
                 input7  => s_Net19,
                 input8  => s_Net10,
                 input9  => s_Net4,
                 result  => s_Net17 );

   GATES_3 : AND_GATE_10_INPUTS
      GENERIC MAP ( BubblesMask => "11"&X"FF" )
      PORT MAP ( input1  => s_Net14,
                 input10 => s_Net1,
                 input2  => s_Net13,
                 input3  => s_Net4,
                 input4  => s_Net6,
                 input5  => s_Net5,
                 input6  => s_Net0,
                 input7  => s_Net19,
                 input8  => s_Net11,
                 input9  => s_Net18,
                 result  => s_Net16 );

   GATES_4 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_Net9,
                 input2 => s_Net10,
                 input3 => s_Net20,
                 input4 => s_Net8,
                 input5 => s_Net16,
                 result => s_Net30 );

   GATES_5 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_Net10,
                 input2 => s_Net1,
                 input3 => s_Net19,
                 input4 => s_Net25,
                 result => s_Net31 );

   GATES_6 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_Net5,
                 input2 => s_Net9,
                 input3 => s_Net6,
                 input4 => s_Net17,
                 result => s_Net27 );

   GATES_7 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net2,
                 input2 => s_Net3,
                 result => s_Net13 );

   GATES_8 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net2,
                 input2 => s_Net7,
                 result => s_Net1 );

   GATES_9 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net24,
                 input2 => s_Net29,
                 result => s_Net0 );

   GATES_10 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net3,
                 input2 => s_Net12,
                 result => s_Net11 );

   GATES_11 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net3,
                 input2 => s_Net21,
                 result => s_Net10 );

   GATES_12 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net28,
                 input2 => s_Net12,
                 result => s_Net19 );

   GATES_13 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net22,
                 input2 => s_Net3,
                 result => s_Net14 );

   GATES_14 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net26,
                 input2 => s_Net3,
                 result => s_Net18 );

   GATES_15 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net23,
                 input2 => s_Net3,
                 result => s_Net8 );

   GATES_16 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net15,
                 input2 => s_Net3,
                 result => s_Net6 );

   GATES_17 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net15,
                 input2 => s_Net12,
                 result => s_Net20 );


END platformIndependent;
