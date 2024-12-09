--==============================================================================
=========================================================================

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
   SIGNAL s_Bus0  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus10 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus14 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus16 : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus7  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net17 : std_logic;
   SIGNAL s_Net18 : std_logic;
   SIGNAL s_Net19 : std_logic;
   SIGNAL s_Net2  : std_logic;
   SIGNAL s_Net20 : std_logic;
   SIGNAL s_Net21 : std_logic;
   SIGNAL s_Net22 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus15(0)  <= s_Net17;
   s_Bus15(1)  <= s_Net2;
   s_Bus15(10) <= s_Net22;
   s_Bus15(11) <= s_Net1;
   s_Bus15(12) <= s_Net1;
   s_Bus15(13) <= s_Net1;
   s_Bus15(14) <= s_Net1;
   s_Bus15(15) <= s_Net1;
   s_Bus15(2)  <= s_Net18;
   s_Bus15(3)  <= s_Net3;
   s_Bus15(4)  <= s_Net19;
   s_Bus15(5)  <= s_Net4;
   s_Bus15(6)  <= s_Net20;
   s_Bus15(7)  <= s_Net5;
   s_Bus15(8)  <= s_Net21;
   s_Bus15(9)  <= s_Net6;
   s_Net17     <= s_Bus0(0);
   s_Net18     <= s_Bus0(2);
   s_Net19     <= s_Bus0(4);
   s_Net2      <= s_Bus0(1);
   s_Net20     <= s_Bus0(6);
   s_Net21     <= s_Bus0(8);
   s_Net22     <= s_Bus0(10);
   s_Net3      <= s_Bus0(3);
   s_Net4      <= s_Bus0(5);
   s_Net5      <= s_Bus0(7);
   s_Net6      <= s_Bus0(9);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus10(10 DOWNTO 0) <= AR_in;
   s_Net11              <= CLK;
   s_Net13              <= Clear;
   s_Net8               <= Load;
   s_Net9               <= Inc;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   PC_out <= s_Bus15(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus16(10 DOWNTO 0)  <=  "000"&X"01";


   -- Constant
    s_Net1  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net8,
                 input2 => s_Net9,
                 result => s_Net12 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 11 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus10(10 DOWNTO 0),
                 muxIn_1 => s_Bus7(10 DOWNTO 0),
                 muxOut  => s_Bus14(10 DOWNTO 0),
                 sel     => s_Net9 );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 12,
                    nrOfBits     => 11 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus16(10 DOWNTO 0),
                 dataB    => s_Bus0(10 DOWNTO 0),
                 result   => s_Bus7(10 DOWNTO 0) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 11 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net12,
                 d           => s_Bus14(10 DOWNTO 0),
                 q           => s_Bus0(10 DOWNTO 0),
                 reset       => s_Net13,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
