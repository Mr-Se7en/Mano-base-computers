--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_7_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                input6 : IN  std_logic;
                input7 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT Priority_Encoder
         GENERIC ( nrOfInputBits  : INTEGER;
                   nrOfSelectBits : INTEGER );
         PORT ( enable      : IN  std_logic;
                inputVector : IN  std_logic_vector( (nrOfInputBits - 1) DOWNTO 0 );
                address     : OUT std_logic_vector( (nrOfSelectBits - 1) DOWNTO 0 );
                enableOut   : OUT std_logic;
                groupSelect : OUT std_logic );
      END COMPONENT;

      COMPONENT Multiplexer_bus_4
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Comparator
         GENERIC ( nrOfBits       : INTEGER;
                   twosComplement : INTEGER );
         PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                aEqualsB      : OUT std_logic;
                aGreaterThanB : OUT std_logic;
                aLessThanB    : OUT std_logic );
      END COMPONENT;

      COMPONENT RAMCONTENTS_RAM_1
         PORT ( address : IN  std_logic_vector( 10 DOWNTO 0 );
                clock   : IN  std_logic;
                dataIn  : IN  std_logic_vector( 15 DOWNTO 0 );
                oe      : IN  std_logic;
                tick    : IN  std_logic;
                we      : IN  std_logic;
                dataOut : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT DR
         PORT ( Bus_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                DR_out            : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT ALU
         PORT ( A                 : IN  std_logic_vector( 15 DOWNTO 0 );
                ADD               : IN  std_logic;
                AND_PIN           : IN  std_logic;
                Add_mode          : IN  std_logic;
                B                 : IN  std_logic_vector( 15 DOWNTO 0 );
                COM               : IN  std_logic;
                Cin               : IN  std_logic;
                OR_pin            : IN  std_logic;
                T                 : IN  std_logic;
                XOR_pin           : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Res               : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT AC
         PORT ( ALU_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                SHL               : IN  std_logic;
                SHR               : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                AC_out            : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Contrrol_Unit
         PORT ( AC_Sign           : IN  std_logic;
                AC_Zero           : IN  std_logic;
                CLK               : IN  std_logic;
                DR_15             : IN  std_logic;
                DR_MAP            : IN  std_logic_vector( 6 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                ACTDR             : OUT std_logic;
                ADD               : OUT std_logic;
                ALU_AND           : OUT std_logic;
                ALU_OR            : OUT std_logic;
                ALU_XOR           : OUT std_logic;
                ARTPC             : OUT std_logic;
                CLRAC             : OUT std_logic;
                COM               : OUT std_logic;
                DRTAC             : OUT std_logic;
                DRTAR             : OUT std_logic;
                INCAC             : OUT std_logic;
                INCDR             : OUT std_logic;
                INCPC             : OUT std_logic;
                PCTAR             : OUT std_logic;
                PCTDR             : OUT std_logic;
                READ              : OUT std_logic;
                SHL               : OUT std_logic;
                SHR               : OUT std_logic;
                SUB               : OUT std_logic;
                WRITE             : OUT std_logic );
      END COMPONENT;

      COMPONENT AR
         PORT ( AR_in             : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                AR_out            : OUT std_logic_vector( 10 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT PC
         PORT ( AR_in             : IN  std_logic_vector( 10 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                PC_out            : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_logisimBus41 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet42 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus3(0) <= s_logisimNet1;
   s_logisimBus3(1) <= s_logisimNet1;
   s_logisimBus3(2) <= s_logisimNet1;
   s_logisimBus3(3) <= s_logisimNet19;
   s_logisimBus3(4) <= s_logisimNet44;
   s_logisimBus3(5) <= s_logisimNet32;
   s_logisimBus3(6) <= s_logisimNet12;
   s_logisimNet12   <= s_logisimBus0(14);
   s_logisimNet19   <= s_logisimBus0(11);
   s_logisimNet32   <= s_logisimBus0(13);
   s_logisimNet44   <= s_logisimBus0(12);

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AC_out  <= s_logisimBus2(15 DOWNTO 0);
   ALU_out <= s_logisimBus14(15 DOWNTO 0);
   AR_out  <= s_logisimBus4(10 DOWNTO 0);
   CU_MAP  <= s_logisimBus3(6 DOWNTO 0);
   DR_out  <= s_logisimBus0(15 DOWNTO 0);
   Mem_out <= s_logisimBus15(15 DOWNTO 0);
   PC_out  <= s_logisimBus6(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Power
    s_logisimNet23  <=  '1';


   -- Constant
    s_logisimBus41(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimNet1  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet16,
                 input3 => s_logisimNet17,
                 result => s_logisimNet9 );

   GATES_2 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet29,
                 input2 => s_logisimNet21,
                 result => s_logisimNet7 );

   GATES_3 : OR_GATE_7_INPUTS
      GENERIC MAP ( BubblesMask => "000"&X"0" )
      PORT MAP ( input1 => s_logisimNet21,
                 input2 => s_logisimNet29,
                 input3 => s_logisimNet40,
                 input4 => s_logisimNet38,
                 input5 => s_logisimNet34,
                 input6 => s_logisimNet33,
                 input7 => s_logisimNet27,
                 result => s_logisimNet10 );

   GATES_4 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet43,
                 input2 => s_logisimNet25,
                 result => s_logisimNet24 );

   PLEXERS_5 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 4,
                    nrOfSelectBits => 2 )
      PORT MAP ( address        => s_logisimBus20(1 DOWNTO 0),
                 enable         => s_logisimNet23,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_logisimNet17,
                 inputVector(1) => s_logisimNet8,
                 inputVector(2) => s_logisimNet16,
                 inputVector(3) => '0' );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus6(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus15(15 DOWNTO 0),
                 muxIn_2 => s_logisimBus2(15 DOWNTO 0),
                 muxIn_3 => X"0000",
                 muxOut  => s_logisimBus36(15 DOWNTO 0),
                 sel     => s_logisimBus20(1 DOWNTO 0) );

   PLEXERS_7 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus6(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus0(15 DOWNTO 0),
                 muxOut  => s_logisimBus11(15 DOWNTO 0),
                 sel     => s_logisimNet43 );

   ARITH_8 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet35,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus41(15 DOWNTO 0),
                 dataB         => s_logisimBus2(15 DOWNTO 0) );

   RAM_1 : RAMCONTENTS_RAM_1
      PORT MAP ( address => s_logisimBus4(10 DOWNTO 0),
                 clock   => logisimClockTree0(4),
                 dataIn  => s_logisimBus0(15 DOWNTO 0),
                 dataOut => s_logisimBus15(15 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree0(3),
                 we      => s_logisimNet30 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   DR_1 : DR
      PORT MAP ( Bus_in            => s_logisimBus36(15 DOWNTO 0),
                 CLK               => s_logisimNet42,
                 Clear             => '0',
                 DR_out            => s_logisimBus0(15 DOWNTO 0),
                 Inc               => s_logisimNet5,
                 Load              => s_logisimNet9,
                 logisimClockTree0 => logisimClockTree0 );

   ALU_1 : ALU
      PORT MAP ( A                 => s_logisimBus0(15 DOWNTO 0),
                 ADD               => s_logisimNet7,
                 AND_PIN           => s_logisimNet38,
                 Add_mode          => s_logisimNet21,
                 B                 => s_logisimBus2(15 DOWNTO 0),
                 COM               => s_logisimNet33,
                 Cin               => s_logisimNet21,
                 OR_pin            => s_logisimNet40,
                 Res               => s_logisimBus14(15 DOWNTO 0),
                 T                 => s_logisimNet27,
                 XOR_pin           => s_logisimNet34,
                 logisimClockTree0 => logisimClockTree0 );

   AC_1 : AC
      PORT MAP ( AC_out            => s_logisimBus2(15 DOWNTO 0),
                 ALU_in            => s_logisimBus14(15 DOWNTO 0),
                 CLK               => s_logisimNet42,
                 Clear             => s_logisimNet13,
                 Inc               => s_logisimNet31,
                 Load              => s_logisimNet10,
                 SHL               => s_logisimNet37,
                 SHR               => s_logisimNet28,
                 logisimClockTree0 => logisimClockTree0 );

   Contrrol_Unit_1 : Contrrol_Unit
      PORT MAP ( ACTDR             => s_logisimNet16,
                 AC_Sign           => s_logisimBus2(15),
                 AC_Zero           => s_logisimNet35,
                 ADD               => s_logisimNet29,
                 ALU_AND           => s_logisimNet38,
                 ALU_OR            => s_logisimNet40,
                 ALU_XOR           => s_logisimNet34,
                 ARTPC             => s_logisimNet18,
                 CLK               => s_logisimNet42,
                 CLRAC             => s_logisimNet13,
                 COM               => s_logisimNet33,
                 DRTAC             => s_logisimNet27,
                 DRTAR             => s_logisimNet43,
                 DR_15             => s_logisimBus0(15),
                 DR_MAP            => s_logisimBus3(6 DOWNTO 0),
                 INCAC             => s_logisimNet31,
                 INCDR             => s_logisimNet5,
                 INCPC             => s_logisimNet39,
                 PCTAR             => s_logisimNet25,
                 PCTDR             => s_logisimNet17,
                 READ              => s_logisimNet8,
                 SHL               => s_logisimNet37,
                 SHR               => s_logisimNet28,
                 SUB               => s_logisimNet21,
                 WRITE             => s_logisimNet30,
                 logisimClockTree0 => logisimClockTree0 );

   AR_1 : AR
      PORT MAP ( AR_in             => s_logisimBus11(15 DOWNTO 0),
                 AR_out            => s_logisimBus4(10 DOWNTO 0),
                 CLK               => s_logisimNet42,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => s_logisimNet24,
                 logisimClockTree0 => logisimClockTree0 );

   PC_1 : PC
      PORT MAP ( AR_in             => s_logisimBus4(10 DOWNTO 0),
                 CLK               => s_logisimNet42,
                 Clear             => '0',
                 Inc               => s_logisimNet39,
                 Load              => s_logisimNet18,
                 PC_out            => s_logisimBus6(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
