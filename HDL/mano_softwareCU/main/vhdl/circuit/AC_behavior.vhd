--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : AC                                                           ==
--==                                                                          ==
--==============================================================================

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
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus13(15 DOWNTO 0) <= ALU_in;
   s_logisimNet11              <= SHL;
   s_logisimNet12              <= Clear;
   s_logisimNet4               <= SHR;
   s_logisimNet7               <= Inc;
   s_logisimNet8               <= Load;
   s_logisimNet9               <= CLK;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AC_out <= s_logisimBus0(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Power
    s_logisimNet3  <=  '1';


   -- Constant
    s_logisimBus16(15 DOWNTO 0)  <=  X"0001";


   -- Constant
    s_logisimBus14(3 DOWNTO 0)  <=  X"1";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet7,
                 input3 => s_logisimNet11,
                 input4 => s_logisimNet4,
                 result => s_logisimNet10 );

   PLEXERS_2 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 4,
                    nrOfSelectBits => 2 )
      PORT MAP ( address        => s_logisimBus1(1 DOWNTO 0),
                 enable         => s_logisimNet3,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_logisimNet8,
                 inputVector(1) => s_logisimNet7,
                 inputVector(2) => s_logisimNet11,
                 inputVector(3) => s_logisimNet4 );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus13(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus2(15 DOWNTO 0),
                 muxIn_2 => s_logisimBus6(15 DOWNTO 0),
                 muxIn_3 => s_logisimBus5(15 DOWNTO 0),
                 muxOut  => s_logisimBus15(15 DOWNTO 0),
                 sel     => s_logisimBus1(1 DOWNTO 0) );

   ARITH_4 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus16(15 DOWNTO 0),
                 dataB    => s_logisimBus0(15 DOWNTO 0),
                 result   => s_logisimBus2(15 DOWNTO 0) );

   ARITH_5 : Shifter_16_bit
      GENERIC MAP ( shifterMode => 0 )
      PORT MAP ( dataA       => s_logisimBus0(15 DOWNTO 0),
                 result      => s_logisimBus6(15 DOWNTO 0),
                 shiftAmount => s_logisimBus14(3 DOWNTO 0) );

   ARITH_6 : Shifter_16_bit
      GENERIC MAP ( shifterMode => 2 )
      PORT MAP ( dataA       => X"0000",
                 result      => s_logisimBus5(15 DOWNTO 0),
                 shiftAmount => s_logisimBus14(3 DOWNTO 0) );

   MEMORY_7 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet10,
                 d           => s_logisimBus15(15 DOWNTO 0),
                 q           => s_logisimBus0(15 DOWNTO 0),
                 reset       => s_logisimNet12,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
