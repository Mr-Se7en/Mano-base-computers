--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
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
   SIGNAL s_logisimBus0  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_logisimBus40 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus21(0)  <= s_logisimNet10;
   s_logisimBus21(1)  <= s_logisimNet36;
   s_logisimBus21(10) <= s_logisimNet15;
   s_logisimBus21(11) <= s_logisimNet39;
   s_logisimBus21(2)  <= s_logisimNet11;
   s_logisimBus21(3)  <= s_logisimNet35;
   s_logisimBus21(4)  <= s_logisimNet12;
   s_logisimBus21(5)  <= s_logisimNet37;
   s_logisimBus21(6)  <= s_logisimNet13;
   s_logisimBus21(7)  <= s_logisimNet34;
   s_logisimBus21(8)  <= s_logisimNet14;
   s_logisimBus21(9)  <= s_logisimNet38;
   s_logisimBus26(0)  <= s_logisimNet31;
   s_logisimBus26(1)  <= s_logisimNet4;
   s_logisimBus26(10) <= s_logisimNet30;
   s_logisimBus26(11) <= s_logisimNet7;
   s_logisimBus26(12) <= s_logisimNet22;
   s_logisimBus26(13) <= s_logisimNet23;
   s_logisimBus26(14) <= s_logisimNet24;
   s_logisimBus26(15) <= s_logisimNet17;
   s_logisimBus26(2)  <= s_logisimNet32;
   s_logisimBus26(3)  <= s_logisimNet3;
   s_logisimBus26(4)  <= s_logisimNet33;
   s_logisimBus26(5)  <= s_logisimNet5;
   s_logisimBus26(6)  <= s_logisimNet29;
   s_logisimBus26(7)  <= s_logisimNet2;
   s_logisimBus26(8)  <= s_logisimNet28;
   s_logisimBus26(9)  <= s_logisimNet6;
   s_logisimNet10     <= s_logisimBus40(0);
   s_logisimNet11     <= s_logisimBus40(2);
   s_logisimNet12     <= s_logisimBus40(4);
   s_logisimNet13     <= s_logisimBus40(6);
   s_logisimNet14     <= s_logisimBus40(8);
   s_logisimNet15     <= s_logisimBus40(10);
   s_logisimNet17     <= s_logisimBus1(3);
   s_logisimNet2      <= s_logisimBus0(7);
   s_logisimNet22     <= s_logisimBus1(0);
   s_logisimNet23     <= s_logisimBus1(1);
   s_logisimNet24     <= s_logisimBus1(2);
   s_logisimNet28     <= s_logisimBus0(8);
   s_logisimNet29     <= s_logisimBus0(6);
   s_logisimNet3      <= s_logisimBus0(3);
   s_logisimNet30     <= s_logisimBus0(10);
   s_logisimNet31     <= s_logisimBus0(0);
   s_logisimNet32     <= s_logisimBus0(2);
   s_logisimNet33     <= s_logisimBus0(4);
   s_logisimNet34     <= s_logisimBus40(7);
   s_logisimNet35     <= s_logisimBus40(3);
   s_logisimNet36     <= s_logisimBus40(1);
   s_logisimNet37     <= s_logisimBus40(5);
   s_logisimNet38     <= s_logisimBus40(9);
   s_logisimNet39     <= s_logisimBus40(11);
   s_logisimNet4      <= s_logisimBus0(1);
   s_logisimNet5      <= s_logisimBus0(5);
   s_logisimNet6      <= s_logisimBus0(9);
   s_logisimNet7      <= s_logisimBus0(11);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus40(15 DOWNTO 0) <= Bus_in;
   s_logisimNet16              <= Inc;
   s_logisimNet18              <= CLK;
   s_logisimNet20              <= Clear;
   s_logisimNet9               <= Load;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Bus_out <= s_logisimBus26(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus27(11 DOWNTO 0)  <=  X"001";


   -- Constant
    s_logisimBus1(3 DOWNTO 0)  <=  X"0";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet9,
                 input2 => s_logisimNet16,
                 result => s_logisimNet19 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 12 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus21(11 DOWNTO 0),
                 muxIn_1 => s_logisimBus8(11 DOWNTO 0),
                 muxOut  => s_logisimBus25(11 DOWNTO 0),
                 sel     => s_logisimNet16 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 13,
                    nrOfBits     => 12 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus27(11 DOWNTO 0),
                 dataB    => s_logisimBus0(11 DOWNTO 0),
                 result   => s_logisimBus8(11 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 12 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet19,
                 d           => s_logisimBus25(11 DOWNTO 0),
                 q           => s_logisimBus0(11 DOWNTO 0),
                 reset       => s_logisimNet20,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
