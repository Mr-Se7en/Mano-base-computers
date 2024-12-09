--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF CAR IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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
   SIGNAL s_Bus1 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus3 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Net0 : std_logic;
   SIGNAL s_Net2 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus3(6 DOWNTO 0) <= CAR_in;
   s_Net0             <= Load;
   s_Net2             <= CLK;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   CAR_out <= s_Bus1(6 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   MEMORY_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 7 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_Net0,
                 d           => s_Bus3(6 DOWNTO 0),
                 q           => s_Bus1(6 DOWNTO 0),
                 reset       => '0',
                 tick        => logisimClockTree0(2) );


END platformIndependent;
