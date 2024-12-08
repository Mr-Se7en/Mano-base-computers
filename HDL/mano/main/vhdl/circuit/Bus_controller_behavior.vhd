--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : Bus_controller                                               ==
--==                                                                          ==
--==============================================================================

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
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet12 <= d0;
   s_logisimNet15 <= d5;
   s_logisimNet2  <= d6;
   s_logisimNet21 <= d1;
   s_logisimNet22 <= d2;
   s_logisimNet23 <= d4;
   s_logisimNet24 <= t3;
   s_logisimNet26 <= d3;
   s_logisimNet28 <= t5;
   s_logisimNet29 <= IR15;
   s_logisimNet3  <= t4;
   s_logisimNet4  <= t1;
   s_logisimNet5  <= t0;
   s_logisimNet7  <= t6;
   s_logisimNet9  <= t2;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   s0 <= s_logisimNet30;
   s1 <= s_logisimNet31;
   s2 <= s_logisimNet27;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_11_INPUTS
      GENERIC MAP ( BubblesMask => "111"&X"FF" )
      PORT MAP ( input1  => s_logisimNet14,
                 input10 => s_logisimNet18,
                 input11 => s_logisimNet20,
                 input2  => s_logisimNet6,
                 input3  => s_logisimNet5,
                 input4  => s_logisimNet8,
                 input5  => s_logisimNet4,
                 input6  => s_logisimNet13,
                 input7  => s_logisimNet9,
                 input8  => s_logisimNet11,
                 input9  => s_logisimNet0,
                 result  => s_logisimNet25 );

   GATES_2 : AND_GATE_11_INPUTS
      GENERIC MAP ( BubblesMask => "111"&X"FF" )
      PORT MAP ( input1  => s_logisimNet14,
                 input10 => s_logisimNet20,
                 input11 => s_logisimNet1,
                 input2  => s_logisimNet18,
                 input3  => s_logisimNet0,
                 input4  => s_logisimNet8,
                 input5  => s_logisimNet11,
                 input6  => s_logisimNet13,
                 input7  => s_logisimNet19,
                 input8  => s_logisimNet10,
                 input9  => s_logisimNet4,
                 result  => s_logisimNet17 );

   GATES_3 : AND_GATE_10_INPUTS
      GENERIC MAP ( BubblesMask => "11"&X"FF" )
      PORT MAP ( input1  => s_logisimNet14,
                 input10 => s_logisimNet1,
                 input2  => s_logisimNet13,
                 input3  => s_logisimNet4,
                 input4  => s_logisimNet6,
                 input5  => s_logisimNet5,
                 input6  => s_logisimNet0,
                 input7  => s_logisimNet19,
                 input8  => s_logisimNet11,
                 input9  => s_logisimNet18,
                 result  => s_logisimNet16 );

   GATES_4 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet9,
                 input2 => s_logisimNet10,
                 input3 => s_logisimNet20,
                 input4 => s_logisimNet8,
                 input5 => s_logisimNet16,
                 result => s_logisimNet30 );

   GATES_5 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet10,
                 input2 => s_logisimNet1,
                 input3 => s_logisimNet19,
                 input4 => s_logisimNet25,
                 result => s_logisimNet31 );

   GATES_6 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet9,
                 input3 => s_logisimNet6,
                 input4 => s_logisimNet17,
                 result => s_logisimNet27 );

   GATES_7 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet2,
                 input2 => s_logisimNet3,
                 result => s_logisimNet13 );

   GATES_8 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet2,
                 input2 => s_logisimNet7,
                 result => s_logisimNet1 );

   GATES_9 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet24,
                 input2 => s_logisimNet29,
                 result => s_logisimNet0 );

   GATES_10 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet12,
                 result => s_logisimNet11 );

   GATES_11 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet21,
                 result => s_logisimNet10 );

   GATES_12 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet28,
                 input2 => s_logisimNet12,
                 result => s_logisimNet19 );

   GATES_13 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimNet3,
                 result => s_logisimNet14 );

   GATES_14 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet26,
                 input2 => s_logisimNet3,
                 result => s_logisimNet18 );

   GATES_15 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet23,
                 input2 => s_logisimNet3,
                 result => s_logisimNet8 );

   GATES_16 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet15,
                 input2 => s_logisimNet3,
                 result => s_logisimNet6 );

   GATES_17 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet15,
                 input2 => s_logisimNet12,
                 result => s_logisimNet20 );


END platformIndependent;
