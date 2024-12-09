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
   SIGNAL s_Bus0  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Bus1  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_Bus21 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus22 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Bus23 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus27 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Bus28 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Bus8  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net14 : std_logic;
   SIGNAL s_Net15 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net17 : std_logic;
   SIGNAL s_Net18 : std_logic;
   SIGNAL s_Net19 : std_logic;
   SIGNAL s_Net2  : std_logic;
   SIGNAL s_Net20 : std_logic;
   SIGNAL s_Net24 : std_logic;
   SIGNAL s_Net25 : std_logic;
   SIGNAL s_Net26 : std_logic;
   SIGNAL s_Net29 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net30 : std_logic;
   SIGNAL s_Net31 : std_logic;
   SIGNAL s_Net32 : std_logic;
   SIGNAL s_Net33 : std_logic;
   SIGNAL s_Net34 : std_logic;
   SIGNAL s_Net35 : std_logic;
   SIGNAL s_Net36 : std_logic;
   SIGNAL s_Net37 : std_logic;
   SIGNAL s_Net38 : std_logic;
   SIGNAL s_Net39 : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net40 : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus22(0)  <= s_Net10;
   s_Bus22(1)  <= s_Net37;
   s_Bus22(10) <= s_Net15;
   s_Bus22(11) <= s_Net40;
   s_Bus22(2)  <= s_Net11;
   s_Bus22(3)  <= s_Net36;
   s_Bus22(4)  <= s_Net12;
   s_Bus22(5)  <= s_Net38;
   s_Bus22(6)  <= s_Net13;
   s_Bus22(7)  <= s_Net35;
   s_Bus22(8)  <= s_Net14;
   s_Bus22(9)  <= s_Net39;
   s_Bus23(0)  <= s_Net32;
   s_Bus23(1)  <= s_Net4;
   s_Bus23(10) <= s_Net31;
   s_Bus23(11) <= s_Net7;
   s_Bus23(12) <= s_Net24;
   s_Bus23(13) <= s_Net25;
   s_Bus23(14) <= s_Net26;
   s_Bus23(15) <= s_Net17;
   s_Bus23(2)  <= s_Net33;
   s_Bus23(3)  <= s_Net3;
   s_Bus23(4)  <= s_Net34;
   s_Bus23(5)  <= s_Net5;
   s_Bus23(6)  <= s_Net30;
   s_Bus23(7)  <= s_Net2;
   s_Bus23(8)  <= s_Net29;
   s_Bus23(9)  <= s_Net6;
   s_Net10     <= s_Bus21(0);
   s_Net11     <= s_Bus21(2);
   s_Net12     <= s_Bus21(4);
   s_Net13     <= s_Bus21(6);
   s_Net14     <= s_Bus21(8);
   s_Net15     <= s_Bus21(10);
   s_Net17     <= s_Bus1(3);
   s_Net2      <= s_Bus0(7);
   s_Net24     <= s_Bus1(0);
   s_Net25     <= s_Bus1(1);
   s_Net26     <= s_Bus1(2);
   s_Net29     <= s_Bus0(8);
   s_Net3      <= s_Bus0(3);
   s_Net30     <= s_Bus0(6);
   s_Net31     <= s_Bus0(10);
   s_Net32     <= s_Bus0(0);
   s_Net33     <= s_Bus0(2);
   s_Net34     <= s_Bus0(4);
   s_Net35     <= s_Bus21(7);
   s_Net36     <= s_Bus21(3);
   s_Net37     <= s_Bus21(1);
   s_Net38     <= s_Bus21(5);
   s_Net39     <= s_Bus21(9);
   s_Net4      <= s_Bus0(1);
   s_Net40     <= s_Bus21(11);
   s_Net5      <= s_Bus0(5);
   s_Net6      <= s_Bus0(9);
   s_Net7      <= s_Bus0(11);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus21(15 DOWNTO 0) <= Bus_in;
   s_Net16              <= Inc;
   s_Net18              <= CLK;
   s_Net20              <= Clear;
   s_Net9               <= Load;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Bus_out <= s_Bus23(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus28(11 DOWNTO 0)  <=  X"001";


   -- Constant
    s_Bus1(3 DOWNTO 0)  <=  X"0";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net9,
                 input2 => s_Net16,
                 result => s_Net19 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 12 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus22(11 DOWNTO 0),
                 muxIn_1 => s_Bus8(11 DOWNTO 0),
                 muxOut  => s_Bus27(11 DOWNTO 0),
                 sel     => s_Net16 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 13,
                    nrOfBits     => 12 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus28(11 DOWNTO 0),
                 dataB    => s_Bus0(11 DOWNTO 0),
                 result   => s_Bus8(11 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 12 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net19,
                 d           => s_Bus27(11 DOWNTO 0),
                 q           => s_Bus0(11 DOWNTO 0),
                 reset       => s_Net20,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
