--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF DR_Controller IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Net0  : std_logic;
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
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
   s_Net0  <= t4;
   s_Net10 <= t5;
   s_Net4  <= d6;
   s_Net7  <= d0;
   s_Net8  <= d2;
   s_Net9  <= d3;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   L        <= s_Net11;
   plusplus <= s_Net1;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net0,
                 input2 => s_Net7,
                 result => s_Net5 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net8,
                 input2 => s_Net0,
                 result => s_Net3 );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net9,
                 input2 => s_Net0,
                 result => s_Net2 );

   GATES_4 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net4,
                 input2 => s_Net0,
                 result => s_Net6 );

   GATES_5 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net4,
                 input2 => s_Net10,
                 result => s_Net1 );

   GATES_6 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_Net5,
                 input2 => s_Net3,
                 input3 => s_Net2,
                 input4 => s_Net6,
                 result => s_Net11 );


END platformIndependent;
