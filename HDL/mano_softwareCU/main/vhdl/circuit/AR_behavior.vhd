--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : AR                                                           ==
--==                                                                          ==
--==============================================================================

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
   SIGNAL s_logisimBus0  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus20(0)  <= s_logisimNet5;
   s_logisimBus20(1)  <= s_logisimNet6;
   s_logisimBus20(10) <= s_logisimNet14;
   s_logisimBus20(2)  <= s_logisimNet7;
   s_logisimBus20(3)  <= s_logisimNet4;
   s_logisimBus20(4)  <= s_logisimNet8;
   s_logisimBus20(5)  <= s_logisimNet9;
   s_logisimBus20(6)  <= s_logisimNet10;
   s_logisimBus20(7)  <= s_logisimNet11;
   s_logisimBus20(8)  <= s_logisimNet12;
   s_logisimBus20(9)  <= s_logisimNet13;
   s_logisimNet10     <= s_logisimBus19(6);
   s_logisimNet11     <= s_logisimBus19(7);
   s_logisimNet12     <= s_logisimBus19(8);
   s_logisimNet13     <= s_logisimBus19(9);
   s_logisimNet14     <= s_logisimBus19(10);
   s_logisimNet4      <= s_logisimBus19(3);
   s_logisimNet5      <= s_logisimBus19(0);
   s_logisimNet6      <= s_logisimBus19(1);
   s_logisimNet7      <= s_logisimBus19(2);
   s_logisimNet8      <= s_logisimBus19(4);
   s_logisimNet9      <= s_logisimBus19(5);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus19(15 DOWNTO 0) <= AR_in;
   s_logisimNet15              <= Inc;
   s_logisimNet16              <= Clear;
   s_logisimNet18              <= CLK;
   s_logisimNet3               <= Load;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AR_out <= s_logisimBus0(10 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus21(10 DOWNTO 0)  <=  "000"&X"01";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet15,
                 result => s_logisimNet17 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 11 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus20(10 DOWNTO 0),
                 muxIn_1 => s_logisimBus2(10 DOWNTO 0),
                 muxOut  => s_logisimBus1(10 DOWNTO 0),
                 sel     => s_logisimNet15 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 12,
                    nrOfBits     => 11 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus21(10 DOWNTO 0),
                 dataB    => s_logisimBus0(10 DOWNTO 0),
                 result   => s_logisimBus2(10 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 11 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet17,
                 d           => s_logisimBus1(10 DOWNTO 0),
                 q           => s_logisimBus0(10 DOWNTO 0),
                 reset       => s_logisimNet16,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
