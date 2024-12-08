--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : PC                                                           ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF PC IS 

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
   SIGNAL s_logisimBus10 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus15(0)  <= s_logisimNet17;
   s_logisimBus15(1)  <= s_logisimNet2;
   s_logisimBus15(10) <= s_logisimNet22;
   s_logisimBus15(11) <= s_logisimNet1;
   s_logisimBus15(12) <= s_logisimNet1;
   s_logisimBus15(13) <= s_logisimNet1;
   s_logisimBus15(14) <= s_logisimNet1;
   s_logisimBus15(15) <= s_logisimNet1;
   s_logisimBus15(2)  <= s_logisimNet18;
   s_logisimBus15(3)  <= s_logisimNet3;
   s_logisimBus15(4)  <= s_logisimNet19;
   s_logisimBus15(5)  <= s_logisimNet4;
   s_logisimBus15(6)  <= s_logisimNet20;
   s_logisimBus15(7)  <= s_logisimNet5;
   s_logisimBus15(8)  <= s_logisimNet21;
   s_logisimBus15(9)  <= s_logisimNet6;
   s_logisimNet17     <= s_logisimBus0(0);
   s_logisimNet18     <= s_logisimBus0(2);
   s_logisimNet19     <= s_logisimBus0(4);
   s_logisimNet2      <= s_logisimBus0(1);
   s_logisimNet20     <= s_logisimBus0(6);
   s_logisimNet21     <= s_logisimBus0(8);
   s_logisimNet22     <= s_logisimBus0(10);
   s_logisimNet3      <= s_logisimBus0(3);
   s_logisimNet4      <= s_logisimBus0(5);
   s_logisimNet5      <= s_logisimBus0(7);
   s_logisimNet6      <= s_logisimBus0(9);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus10(10 DOWNTO 0) <= AR_in;
   s_logisimNet11              <= CLK;
   s_logisimNet13              <= Clear;
   s_logisimNet8               <= Load;
   s_logisimNet9               <= Inc;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   PC_out <= s_logisimBus15(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus16(10 DOWNTO 0)  <=  "000"&X"01";


   -- Constant
    s_logisimNet1  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet9,
                 result => s_logisimNet12 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 11 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus10(10 DOWNTO 0),
                 muxIn_1 => s_logisimBus7(10 DOWNTO 0),
                 muxOut  => s_logisimBus14(10 DOWNTO 0),
                 sel     => s_logisimNet9 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 12,
                    nrOfBits     => 11 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus16(10 DOWNTO 0),
                 dataB    => s_logisimBus0(10 DOWNTO 0),
                 result   => s_logisimBus7(10 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 11 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet12,
                 d           => s_logisimBus14(10 DOWNTO 0),
                 q           => s_logisimBus0(10 DOWNTO 0),
                 reset       => s_logisimNet13,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
