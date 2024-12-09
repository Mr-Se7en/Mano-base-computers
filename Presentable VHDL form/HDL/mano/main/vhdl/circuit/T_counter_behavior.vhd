--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF T_counter IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
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

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT REGISTER_FLIP_FLOP
         GENERIC ( invertClock : INTEGER;
                   nrOfBits    : INTEGER );
         PORT ( clock       : IN  std_logic;
                clockEnable : IN  std_logic;
                d           : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                reset       : IN  std_logic;
                tick        : IN  std_logic;
                q           : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Bus2  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus3  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus7  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Net0  : std_logic;
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Net0 <= clear;
   s_Net4 <= En;
   s_Net6 <= CLK;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   T_out <= s_Bus2(2 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus7(2 DOWNTO 0)  <=  "001";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net0,
                 input2 => s_Net5,
                 result => s_Net1 );

   GATES_2 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_Bus2(0),
                 input2 => s_Bus2(1),
                 input3 => s_Bus2(2),
                 result => s_Net5 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 4,
                    nrOfBits     => 3 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus7(2 DOWNTO 0),
                 dataB    => s_Bus2(2 DOWNTO 0),
                 result   => s_Bus3(2 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 1,
                    nrOfBits    => 3 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net4,
                 d           => s_Bus3(2 DOWNTO 0),
                 q           => s_Bus2(2 DOWNTO 0),
                 reset       => s_Net1,
                 tick        => logisimClockTree0(3) );


END platformIndependent;
