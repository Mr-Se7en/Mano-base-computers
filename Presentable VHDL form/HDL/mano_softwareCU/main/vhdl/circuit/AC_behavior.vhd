--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF AC IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE_4_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT Priority_Encoder
         GENERIC ( nrOfInputBits  : INTEGER;
                   nrOfSelectBits : INTEGER );
         PORT ( enable      : IN  std_logic;
                inputVector : IN  std_logic_vector( (nrOfInputBits - 1) DOWNTO 0 );
                address     : OUT std_logic_vector( (nrOfSelectBits - 1) DOWNTO 0 );
                enableOut   : OUT std_logic;
                groupSelect : OUT std_logic );
      END COMPONENT;

      COMPONENT Multiplexer_bus_4
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
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

      COMPONENT Shifter_16_bit
         GENERIC ( shifterMode : INTEGER );
         PORT ( dataA       : IN  std_logic_vector( 15 DOWNTO 0 );
                shiftAmount : IN  std_logic_vector( 3 DOWNTO 0 );
                result      : OUT std_logic_vector( 15 DOWNTO 0 ) );
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
   SIGNAL s_Bus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus1  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus13 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus14 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_Bus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus13(15 DOWNTO 0) <= ALU_in;
   s_Net11              <= SHL;
   s_Net12              <= Clear;
   s_Net4               <= SHR;
   s_Net7               <= Inc;
   s_Net8               <= Load;
   s_Net9               <= CLK;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AC_out <= s_Bus0(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Power
    s_Net3  <=  '1';


   -- Constant
    s_Bus16(15 DOWNTO 0)  <=  X"0001";


   -- Constant
    s_Bus14(3 DOWNTO 0)  <=  X"1";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_Net8,
                 input2 => s_Net7,
                 input3 => s_Net11,
                 input4 => s_Net4,
                 result => s_Net10 );

   PLEXERS_2 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 4,
                    nrOfSelectBits => 2 )
      PORT MAP ( address        => s_Bus1(1 DOWNTO 0),
                 enable         => s_Net3,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_Net8,
                 inputVector(1) => s_Net7,
                 inputVector(2) => s_Net11,
                 inputVector(3) => s_Net4 );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus13(15 DOWNTO 0),
                 muxIn_1 => s_Bus2(15 DOWNTO 0),
                 muxIn_2 => s_Bus6(15 DOWNTO 0),
                 muxIn_3 => s_Bus5(15 DOWNTO 0),
                 muxOut  => s_Bus15(15 DOWNTO 0),
                 sel     => s_Bus1(1 DOWNTO 0) );

   ARITH_4 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus16(15 DOWNTO 0),
                 dataB    => s_Bus0(15 DOWNTO 0),
                 result   => s_Bus2(15 DOWNTO 0) );

   ARITH_5 : Shifter_16_bit
      GENERIC MAP ( shifterMode => 0 )
      PORT MAP ( dataA       => s_Bus0(15 DOWNTO 0),
                 result      => s_Bus6(15 DOWNTO 0),
                 shiftAmount => s_Bus14(3 DOWNTO 0) );

   ARITH_6 : Shifter_16_bit
      GENERIC MAP ( shifterMode => 2 )
      PORT MAP ( dataA       => X"0000",
                 result      => s_Bus5(15 DOWNTO 0),
                 shiftAmount => s_Bus14(3 DOWNTO 0) );

   MEMORY_7 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net10,
                 d           => s_Bus15(15 DOWNTO 0),
                 q           => s_Bus0(15 DOWNTO 0),
                 reset       => s_Net12,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
