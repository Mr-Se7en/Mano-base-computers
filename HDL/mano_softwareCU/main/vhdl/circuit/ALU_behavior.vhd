--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : ALU                                                          ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF ALU IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT XOR_GATE_BUS_ONEHOT
         GENERIC ( BubblesMask : std_logic_vector;
                   NrOfBits    : INTEGER );
         PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT AND_GATE_BUS
         GENERIC ( BubblesMask : std_logic_vector;
                   NrOfBits    : INTEGER );
         PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT OR_GATE_BUS
         GENERIC ( BubblesMask : std_logic_vector;
                   NrOfBits    : INTEGER );
         PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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

      COMPONENT Multiplexer_bus_8
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_4 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_5 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_6 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_7 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 2 DOWNTO 0 );
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus11(15 DOWNTO 0) <= B;
   s_logisimBus4(15 DOWNTO 0)  <= A;
   s_logisimNet1               <= ADD;
   s_logisimNet12              <= COM;
   s_logisimNet13              <= AND_PIN;
   s_logisimNet16              <= Add_mode;
   s_logisimNet19              <= T;
   s_logisimNet3               <= OR_pin;
   s_logisimNet6               <= XOR_pin;
   s_logisimNet7               <= Cin;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Res <= s_logisimBus5(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Power
    s_logisimNet10  <=  '1';


   -- NOT Gate
   s_logisimBus18 <=  NOT s_logisimBus11;

   -- NOT Gate
   s_logisimBus9 <=  NOT s_logisimBus11;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : XOR_GATE_BUS_ONEHOT
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_logisimBus4(15 DOWNTO 0),
                 input2 => s_logisimBus11(15 DOWNTO 0),
                 result => s_logisimBus8(15 DOWNTO 0) );

   GATES_2 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_logisimBus4(15 DOWNTO 0),
                 input2 => s_logisimBus11(15 DOWNTO 0),
                 result => s_logisimBus17(15 DOWNTO 0) );

   GATES_3 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_logisimBus4(15 DOWNTO 0),
                 input2 => s_logisimBus11(15 DOWNTO 0),
                 result => s_logisimBus14(15 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus11(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus18(15 DOWNTO 0),
                 muxOut  => s_logisimBus2(15 DOWNTO 0),
                 sel     => s_logisimNet16 );

   PLEXERS_5 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 9,
                    nrOfSelectBits => 3 )
      PORT MAP ( address        => s_logisimBus15(2 DOWNTO 0),
                 enable         => s_logisimNet10,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_logisimNet13,
                 inputVector(1) => s_logisimNet3,
                 inputVector(2) => s_logisimNet1,
                 inputVector(3) => s_logisimNet19,
                 inputVector(4) => s_logisimNet6,
                 inputVector(5) => s_logisimNet12,
                 inputVector(6) => '0',
                 inputVector(7) => '0' );

   PLEXERS_6 : Multiplexer_bus_8
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus17(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus14(15 DOWNTO 0),
                 muxIn_2 => s_logisimBus0(15 DOWNTO 0),
                 muxIn_3 => s_logisimBus4(15 DOWNTO 0),
                 muxIn_4 => s_logisimBus8(15 DOWNTO 0),
                 muxIn_5 => s_logisimBus9(15 DOWNTO 0),
                 muxIn_6 => X"0000",
                 muxIn_7 => X"0000",
                 muxOut  => s_logisimBus5(15 DOWNTO 0),
                 sel     => s_logisimBus15(2 DOWNTO 0) );

   ARITH_7 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => s_logisimNet7,
                 carryOut => OPEN,
                 dataA    => s_logisimBus4(15 DOWNTO 0),
                 dataB    => s_logisimBus2(15 DOWNTO 0),
                 result   => s_logisimBus0(15 DOWNTO 0) );


END platformIndependent;
