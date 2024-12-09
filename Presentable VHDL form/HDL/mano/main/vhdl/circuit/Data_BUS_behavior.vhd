--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF Data_BUS IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Bus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus6  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net3  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus0(15 DOWNTO 0) <= Mem;
   s_Bus1(15 DOWNTO 0) <= AR;
   s_Bus2(15 DOWNTO 0) <= TR;
   s_Bus4(15 DOWNTO 0) <= DR;
   s_Bus5(15 DOWNTO 0) <= PC;
   s_Bus6(0)           <= s0;
   s_Bus6(1)           <= s1;
   s_Bus6(2)           <= s2;
   s_Bus7(15 DOWNTO 0) <= AC;
   s_Bus9(15 DOWNTO 0) <= IR;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Bus_out <= s_Bus8(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_8
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus0(15 DOWNTO 0),
                 muxIn_1 => s_Bus1(15 DOWNTO 0),
                 muxIn_2 => s_Bus4(15 DOWNTO 0),
                 muxIn_3 => s_Bus7(15 DOWNTO 0),
                 muxIn_4 => s_Bus5(15 DOWNTO 0),
                 muxIn_5 => s_Bus9(15 DOWNTO 0),
                 muxIn_6 => s_Bus2(15 DOWNTO 0),
                 muxIn_7 => X"0000",
                 muxOut  => s_Bus8(15 DOWNTO 0),
                 sel     => s_Bus6(2 DOWNTO 0) );


END platformIndependent;
