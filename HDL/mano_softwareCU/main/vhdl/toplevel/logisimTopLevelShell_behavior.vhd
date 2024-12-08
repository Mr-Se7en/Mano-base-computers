--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

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
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                AC_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                ALU_out           : OUT std_logic_vector( 15 DOWNTO 0 );
                AR_out            : OUT std_logic_vector( 10 DOWNTO 0 );
                CU_MAP            : OUT std_logic_vector( 6 DOWNTO 0 );
                DR_out            : OUT std_logic_vector( 15 DOWNTO 0 );
                Mem_out           : OUT std_logic_vector( 15 DOWNTO 0 );
                PC_out            : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_AC_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_ALU_out           : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_AR_out            : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_CU_MAP            : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_DR_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Mem_out           : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_PC_out            : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_fpgaTick          : std_logic;
   SIGNAL s_logisimClockTree0 : std_logic_vector( 4 DOWNTO 0 );

BEGIN

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
                 CU_MAP            => s_CU_MAP,
                 DR_out            => s_DR_out,
                 Mem_out           => s_Mem_out,
                 PC_out            => s_PC_out,
                 logisimClockTree0 => s_logisimClockTree0 );
END platformIndependent;
