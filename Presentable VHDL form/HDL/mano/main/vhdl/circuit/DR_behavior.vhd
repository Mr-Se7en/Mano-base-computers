--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF DR IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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
   SIGNAL s_Bus0 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus1 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus8 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus9 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Net3 : std_logic;
   SIGNAL s_Net4 : std_logic;
   SIGNAL s_Net5 : std_logic;
   SIGNAL s_Net6 : std_logic;
   SIGNAL s_Net7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus8(15 DOWNTO 0) <= Bus_in;
   s_Net3              <= Load;
   s_Net4              <= Inc;
   s_Net5              <= Clear;
   s_Net7              <= CLK;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Bus_out <= s_Bus0(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus9(15 DOWNTO 0)  <=  X"0001";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net3,
                 input2 => s_Net4,
                 result => s_Net6 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus8(15 DOWNTO 0),
                 muxIn_1 => s_Bus2(15 DOWNTO 0),
                 muxOut  => s_Bus1(15 DOWNTO 0),
                 sel     => s_Net4 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus9(15 DOWNTO 0),
                 dataB    => s_Bus0(15 DOWNTO 0),
                 result   => s_Bus2(15 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net6,
                 d           => s_Bus1(15 DOWNTO 0),
                 q           => s_Bus0(15 DOWNTO 0),
                 reset       => s_Net5,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
