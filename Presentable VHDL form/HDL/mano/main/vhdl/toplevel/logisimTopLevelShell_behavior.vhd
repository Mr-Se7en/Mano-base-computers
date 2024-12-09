--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT logisimTickGenerator
         GENERIC ( nrOfBits    : INTEGER;
                   reloadValue : INTEGER );
         PORT ( FPGAClock : IN  std_logic;
                FPGATick  : OUT std_logic );
      END COMPONENT;

      COMPONENT LogisimClockComponent
         GENERIC ( highTicks : INTEGER;
                   lowTicks  : INTEGER;
                   nrOfBits  : INTEGER;
                   phase     : INTEGER );
         PORT ( clockTick   : IN  std_logic;
                globalClock : IN  std_logic;
                clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT main
         PORT ( ST                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                AC_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                ALU_out           : OUT std_logic_vector( 15 DOWNTO 0 );
                AR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                BUS_DATA          : OUT std_logic_vector( 15 DOWNTO 0 );
                DR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                IR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                Mem_out           : OUT std_logic_vector( 15 DOWNTO 0 );
                PC_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                T                 : OUT std_logic_vector( 2 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_AC_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_ALU_out           : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_AR_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_BUS_DATA          : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_DR_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_IR_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Mem_out           : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_PC_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_ST                : std_logic;
   SIGNAL s_T                 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_fpgaTick          : std_logic;
   SIGNAL s_logisimClockTree0 : std_logic_vector( 4 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   s_ST <= '0';

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 26,
                    reloadValue => 50000000 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 1,
                    lowTicks  => 1,
                    nrOfBits  => 1,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : main
      PORT MAP ( AC_out            => s_AC_out,
                 ALU_out           => s_ALU_out,
                 AR_out            => s_AR_out,
                 BUS_DATA          => s_BUS_DATA,
                 DR_out            => s_DR_out,
                 IR_out            => s_IR_out,
                 Mem_out           => s_Mem_out,
                 PC_out            => s_PC_out,
                 ST                => s_ST,
                 T                 => s_T,
                 logisimClockTree0 => s_logisimClockTree0 );
END platformIndependent;
