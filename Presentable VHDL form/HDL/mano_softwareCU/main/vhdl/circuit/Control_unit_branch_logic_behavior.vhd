--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF Control_unit_branch_logic IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Bus3 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Net0 : std_logic;
   SIGNAL s_Net1 : std_logic;
   SIGNAL s_Net2 : std_logic;
   SIGNAL s_Net4 : std_logic;
   SIGNAL s_Net5 : std_logic;
   SIGNAL s_Net6 : std_logic;
   SIGNAL s_Net7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus3(1 DOWNTO 0) <= BR;
   s_Net4             <= test;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   SBR_L <= s_Net6;
   z0    <= s_Net2;
   z1    <= s_Bus3(1);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Bus3(0),
                 input2 => s_Bus3(1),
                 result => s_Net7 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "10" )
      PORT MAP ( input1 => s_Bus3(1),
                 input2 => s_Net4,
                 result => s_Net5 );

   GATES_3 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "100" )
      PORT MAP ( input1 => s_Bus3(1),
                 input2 => s_Bus3(0),
                 input3 => s_Net4,
                 result => s_Net6 );

   GATES_4 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net7,
                 input2 => s_Net5,
                 result => s_Net2 );


END platformIndependent;
