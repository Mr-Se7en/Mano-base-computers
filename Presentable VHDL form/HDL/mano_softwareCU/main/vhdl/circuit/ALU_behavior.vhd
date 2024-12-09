--==============================================================================
=========================================================================

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
   SIGNAL s_Bus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus15 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net19 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net7  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus11(15 DOWNTO 0) <= B;
   s_Bus4(15 DOWNTO 0)  <= A;
   s_Net1               <= ADD;
   s_Net12              <= COM;
   s_Net13              <= AND_PIN;
   s_Net16              <= Add_mode;
   s_Net19              <= T;
   s_Net3               <= OR_pin;
   s_Net6               <= XOR_pin;
   s_Net7               <= Cin;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Res <= s_Bus5(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Power
    s_Net10  <=  '1';


   -- NOT Gate
   s_Bus18 <=  NOT s_Bus11;

   -- NOT Gate
   s_Bus9 <=  NOT s_Bus11;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : XOR_GATE_BUS_ONEHOT
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_Bus4(15 DOWNTO 0),
                 input2 => s_Bus11(15 DOWNTO 0),
                 result => s_Bus8(15 DOWNTO 0) );

   GATES_2 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_Bus4(15 DOWNTO 0),
                 input2 => s_Bus11(15 DOWNTO 0),
                 result => s_Bus17(15 DOWNTO 0) );

   GATES_3 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_Bus4(15 DOWNTO 0),
                 input2 => s_Bus11(15 DOWNTO 0),
                 result => s_Bus14(15 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus11(15 DOWNTO 0),
                 muxIn_1 => s_Bus18(15 DOWNTO 0),
                 muxOut  => s_Bus2(15 DOWNTO 0),
                 sel     => s_Net16 );

   PLEXERS_5 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 9,
                    nrOfSelectBits => 3 )
      PORT MAP ( address        => s_Bus15(2 DOWNTO 0),
                 enable         => s_Net10,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_Net13,
                 inputVector(1) => s_Net3,
                 inputVector(2) => s_Net1,
                 inputVector(3) => s_Net19,
                 inputVector(4) => s_Net6,
                 inputVector(5) => s_Net12,
                 inputVector(6) => '0',
                 inputVector(7) => '0' );

   PLEXERS_6 : Multiplexer_bus_8
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus17(15 DOWNTO 0),
                 muxIn_1 => s_Bus14(15 DOWNTO 0),
                 muxIn_2 => s_Bus0(15 DOWNTO 0),
                 muxIn_3 => s_Bus4(15 DOWNTO 0),
                 muxIn_4 => s_Bus8(15 DOWNTO 0),
                 muxIn_5 => s_Bus9(15 DOWNTO 0),
                 muxIn_6 => X"0000",
                 muxIn_7 => X"0000",
                 muxOut  => s_Bus5(15 DOWNTO 0),
                 sel     => s_Bus15(2 DOWNTO 0) );

   ARITH_7 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => s_Net7,
                 carryOut => OPEN,
                 dataA    => s_Bus4(15 DOWNTO 0),
                 dataB    => s_Bus2(15 DOWNTO 0),
                 result   => s_Bus0(15 DOWNTO 0) );


END platformIndependent;
