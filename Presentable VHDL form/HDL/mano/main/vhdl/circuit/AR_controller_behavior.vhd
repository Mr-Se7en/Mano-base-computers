--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF AR_controller IS 

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
   SIGNAL s_Net0 : std_logic;
   SIGNAL s_Net1 : std_logic;
   SIGNAL s_Net2 : std_logic;
   SIGNAL s_Net3 : std_logic;
   SIGNAL s_Net4 : std_logic;
   SIGNAL s_Net5 : std_logic;
   SIGNAL s_Net6 : std_logic;
   SIGNAL s_Net7 : std_logic;
   SIGNAL s_Net8 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Net0 <= t2;
   s_Net1 <= t3;
   s_Net2 <= IR15;
   s_Net4 <= t4;
   s_Net6 <= t0;
   s_Net8 <= d5;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AR_L     <= s_Net5;
   plusplus <= s_Net7;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net1,
                 input2 => s_Net2,
                 result => s_Net3 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net4,
                 input2 => s_Net8,
                 result => s_Net7 );

   GATES_3 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => '0',
                 input2 => s_Net6,
                 input3 => s_Net0,
                 input4 => s_Net3,
                 result => s_Net5 );


END platformIndependent;
