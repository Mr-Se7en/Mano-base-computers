--==============================================================================
=========================================================================

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
   SIGNAL s_Bus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus20 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus3  : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus36 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus4  : std_logic_vector( 10 DOWNTO 0 );
   SIGNAL s_Bus41 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net17 : std_logic;
   SIGNAL s_Net18 : std_logic;
   SIGNAL s_Net19 : std_logic;
   SIGNAL s_Net21 : std_logic;
   SIGNAL s_Net22 : std_logic;
   SIGNAL s_Net23 : std_logic;
   SIGNAL s_Net24 : std_logic;
   SIGNAL s_Net25 : std_logic;
   SIGNAL s_Net26 : std_logic;
   SIGNAL s_Net27 : std_logic;
   SIGNAL s_Net28 : std_logic;
   SIGNAL s_Net29 : std_logic;
   SIGNAL s_Net30 : std_logic;
   SIGNAL s_Net31 : std_logic;
   SIGNAL s_Net32 : std_logic;
   SIGNAL s_Net33 : std_logic;
   SIGNAL s_Net34 : std_logic;
   SIGNAL s_Net35 : std_logic;
   SIGNAL s_Net37 : std_logic;
   SIGNAL s_Net38 : std_logic;
   SIGNAL s_Net39 : std_logic;
   SIGNAL s_Net40 : std_logic;
   SIGNAL s_Net42 : std_logic;
   SIGNAL s_Net43 : std_logic;
   SIGNAL s_Net44 : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_Net42 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus3(0) <= s_Net1;
   s_Bus3(1) <= s_Net1;
   s_Bus3(2) <= s_Net1;
   s_Bus3(3) <= s_Net19;
   s_Bus3(4) <= s_Net44;
   s_Bus3(5) <= s_Net32;
   s_Bus3(6) <= s_Net12;
   s_Net12   <= s_Bus0(14);
   s_Net19   <= s_Bus0(11);
   s_Net32   <= s_Bus0(13);
   s_Net44   <= s_Bus0(12);

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AC_out  <= s_Bus2(15 DOWNTO 0);
   ALU_out <= s_Bus14(15 DOWNTO 0);
   AR_out  <= s_Bus4(10 DOWNTO 0);
   CU_MAP  <= s_Bus3(6 DOWNTO 0);
   DR_out  <= s_Bus0(15 DOWNTO 0);
   Mem_out <= s_Bus15(15 DOWNTO 0);
   PC_out  <= s_Bus6(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Power
    s_Net23  <=  '1';


   -- Constant
    s_Bus41(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_Net1  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_Net8,
                 input2 => s_Net16,
                 input3 => s_Net17,
                 result => s_Net9 );

   GATES_2 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net29,
                 input2 => s_Net21,
                 result => s_Net7 );

   GATES_3 : OR_GATE_7_INPUTS
      GENERIC MAP ( BubblesMask => "000"&X"0" )
      PORT MAP ( input1 => s_Net21,
                 input2 => s_Net29,
                 input3 => s_Net40,
                 input4 => s_Net38,
                 input5 => s_Net34,
                 input6 => s_Net33,
                 input7 => s_Net27,
                 result => s_Net10 );

   GATES_4 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net43,
                 input2 => s_Net25,
                 result => s_Net24 );

   PLEXERS_5 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 4,
                    nrOfSelectBits => 2 )
      PORT MAP ( address        => s_Bus20(1 DOWNTO 0),
                 enable         => s_Net23,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_Net17,
                 inputVector(1) => s_Net8,
                 inputVector(2) => s_Net16,
                 inputVector(3) => '0' );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus6(15 DOWNTO 0),
                 muxIn_1 => s_Bus15(15 DOWNTO 0),
                 muxIn_2 => s_Bus2(15 DOWNTO 0),
                 muxIn_3 => X"0000",
                 muxOut  => s_Bus36(15 DOWNTO 0),
                 sel     => s_Bus20(1 DOWNTO 0) );

   PLEXERS_7 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus6(15 DOWNTO 0),
                 muxIn_1 => s_Bus0(15 DOWNTO 0),
                 muxOut  => s_Bus11(15 DOWNTO 0),
                 sel     => s_Net43 );

   ARITH_8 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_Net35,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_Bus41(15 DOWNTO 0),
                 dataB         => s_Bus2(15 DOWNTO 0) );

   RAM_1 : RAMCONTENTS_RAM_1
      PORT MAP ( address => s_Bus4(10 DOWNTO 0),
                 clock   => logisimClockTree0(4),
                 dataIn  => s_Bus0(15 DOWNTO 0),
                 dataOut => s_Bus15(15 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree0(3),
                 we      => s_Net30 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   DR_1 : DR
      PORT MAP ( Bus_in            => s_Bus36(15 DOWNTO 0),
                 CLK               => s_Net42,
                 Clear             => '0',
                 DR_out            => s_Bus0(15 DOWNTO 0),
                 Inc               => s_Net5,
                 Load              => s_Net9,
                 logisimClockTree0 => logisimClockTree0 );

   ALU_1 : ALU
      PORT MAP ( A                 => s_Bus0(15 DOWNTO 0),
                 ADD               => s_Net7,
                 AND_PIN           => s_Net38,
                 Add_mode          => s_Net21,
                 B                 => s_Bus2(15 DOWNTO 0),
                 COM               => s_Net33,
                 Cin               => s_Net21,
                 OR_pin            => s_Net40,
                 Res               => s_Bus14(15 DOWNTO 0),
                 T                 => s_Net27,
                 XOR_pin           => s_Net34,
                 logisimClockTree0 => logisimClockTree0 );

   AC_1 : AC
      PORT MAP ( AC_out            => s_Bus2(15 DOWNTO 0),
                 ALU_in            => s_Bus14(15 DOWNTO 0),
                 CLK               => s_Net42,
                 Clear             => s_Net13,
                 Inc               => s_Net31,
                 Load              => s_Net10,
                 SHL               => s_Net37,
                 SHR               => s_Net28,
                 logisimClockTree0 => logisimClockTree0 );

   Contrrol_Unit_1 : Contrrol_Unit
      PORT MAP ( ACTDR             => s_Net16,
                 AC_Sign           => s_Bus2(15),
                 AC_Zero           => s_Net35,
                 ADD               => s_Net29,
                 ALU_AND           => s_Net38,
                 ALU_OR            => s_Net40,
                 ALU_XOR           => s_Net34,
                 ARTPC             => s_Net18,
                 CLK               => s_Net42,
                 CLRAC             => s_Net13,
                 COM               => s_Net33,
                 DRTAC             => s_Net27,
                 DRTAR             => s_Net43,
                 DR_15             => s_Bus0(15),
                 DR_MAP            => s_Bus3(6 DOWNTO 0),
                 INCAC             => s_Net31,
                 INCDR             => s_Net5,
                 INCPC             => s_Net39,
                 PCTAR             => s_Net25,
                 PCTDR             => s_Net17,
                 READ              => s_Net8,
                 SHL               => s_Net37,
                 SHR               => s_Net28,
                 SUB               => s_Net21,
                 WRITE             => s_Net30,
                 logisimClockTree0 => logisimClockTree0 );

   AR_1 : AR
      PORT MAP ( AR_in             => s_Bus11(15 DOWNTO 0),
                 AR_out            => s_Bus4(10 DOWNTO 0),
                 CLK               => s_Net42,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => s_Net24,
                 logisimClockTree0 => logisimClockTree0 );

   PC_1 : PC
      PORT MAP ( AR_in             => s_Bus4(10 DOWNTO 0),
                 CLK               => s_Net42,
                 Clear             => '0',
                 Inc               => s_Net39,
                 Load              => s_Net18,
                 PC_out            => s_Bus6(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
