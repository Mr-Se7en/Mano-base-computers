--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF ALU IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Bus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus9  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net8  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus3(15 DOWNTO 0) <= A;
   s_Bus6(15 DOWNTO 0) <= B;
   s_Bus9(1 DOWNTO 0)  <= Mode;
   s_Net5              <= Cin;
   s_Net8              <= Add_mode;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Res <= s_Bus4(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_Bus10 <=  NOT s_Bus6;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_Bus3(15 DOWNTO 0),
                 input2 => s_Bus6(15 DOWNTO 0),
                 result => s_Bus1(15 DOWNTO 0) );

   GATES_2 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 16 )
      PORT MAP ( input1 => s_Bus3(15 DOWNTO 0),
                 input2 => s_Bus6(15 DOWNTO 0),
                 result => s_Bus7(15 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus6(15 DOWNTO 0),
                 muxIn_1 => s_Bus10(15 DOWNTO 0),
                 muxOut  => s_Bus2(15 DOWNTO 0),
                 sel     => s_Net8 );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus1(15 DOWNTO 0),
                 muxIn_1 => s_Bus7(15 DOWNTO 0),
                 muxIn_2 => s_Bus0(15 DOWNTO 0),
                 muxIn_3 => s_Bus3(15 DOWNTO 0),
                 muxOut  => s_Bus4(15 DOWNTO 0),
                 sel     => s_Bus9(1 DOWNTO 0) );

   ARITH_5 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => s_Net5,
                 carryOut => OPEN,
                 dataA    => s_Bus3(15 DOWNTO 0),
                 dataB    => s_Bus2(15 DOWNTO 0),
                 result   => s_Bus0(15 DOWNTO 0) );


END platformIndependent;
