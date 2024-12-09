--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF AR IS 

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
   SIGNAL s_Bus0  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus1  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus20 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus21 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net14 : std_logic;
   SIGNAL s_Net15 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net17 : std_logic;
   SIGNAL s_Net18 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus20(0)  <= s_Net5;
   s_Bus20(1)  <= s_Net6;
   s_Bus20(10) <= s_Net14;
   s_Bus20(2)  <= s_Net7;
   s_Bus20(3)  <= s_Net4;
   s_Bus20(4)  <= s_Net8;
   s_Bus20(5)  <= s_Net9;
   s_Bus20(6)  <= s_Net10;
   s_Bus20(7)  <= s_Net11;
   s_Bus20(8)  <= s_Net12;
   s_Bus20(9)  <= s_Net13;
   s_Net10     <= s_Bus19(6);
   s_Net11     <= s_Bus19(7);
   s_Net12     <= s_Bus19(8);
   s_Net13     <= s_Bus19(9);
   s_Net14     <= s_Bus19(10);
   s_Net4      <= s_Bus19(3);
   s_Net5      <= s_Bus19(0);
   s_Net6      <= s_Bus19(1);
   s_Net7      <= s_Bus19(2);
   s_Net8      <= s_Bus19(4);
   s_Net9      <= s_Bus19(5);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus19(15 DOWNTO 0) <= AR_in;
   s_Net15              <= Inc;
   s_Net16              <= Clear;
   s_Net18              <= CLK;
   s_Net3               <= Load;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AR_out <= s_Bus0(10 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus21(10 DOWNTO 0)  <=  "000"&X"01";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net3,
                 input2 => s_Net15,
                 result => s_Net17 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 11 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus20(10 DOWNTO 0),
                 muxIn_1 => s_Bus2(10 DOWNTO 0),
                 muxOut  => s_Bus1(10 DOWNTO 0),
                 sel     => s_Net15 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 12,
                    nrOfBits     => 11 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus21(10 DOWNTO 0),
                 dataB    => s_Bus0(10 DOWNTO 0),
                 result   => s_Bus2(10 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 11 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net17,
                 d           => s_Bus1(10 DOWNTO 0),
                 q           => s_Bus0(10 DOWNTO 0),
                 reset       => s_Net16,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
