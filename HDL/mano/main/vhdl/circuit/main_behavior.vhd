--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT Decoder_8
         PORT ( sel          : IN  std_logic_vector( 2 DOWNTO 0 );
                decoderOut_0 : OUT std_logic;
                decoderOut_1 : OUT std_logic;
                decoderOut_2 : OUT std_logic;
                decoderOut_3 : OUT std_logic;
                decoderOut_4 : OUT std_logic;
                decoderOut_5 : OUT std_logic;
                decoderOut_6 : OUT std_logic;
                decoderOut_7 : OUT std_logic );
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
         PORT ( address : IN  std_logic_vector( 11 DOWNTO 0 );
                clock   : IN  std_logic;
                dataIn  : IN  std_logic_vector( 15 DOWNTO 0 );
                oe      : IN  std_logic;
                tick    : IN  std_logic;
                we      : IN  std_logic;
                dataOut : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT T_counter
         PORT ( CLK               : IN  std_logic;
                En                : IN  std_logic;
                clear             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                T_out             : OUT std_logic_vector( 2 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT ALU
         PORT ( A                 : IN  std_logic_vector( 15 DOWNTO 0 );
                Add_mode          : IN  std_logic;
                B                 : IN  std_logic_vector( 15 DOWNTO 0 );
                Cin               : IN  std_logic;
                Mode              : IN  std_logic_vector( 1 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Res               : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT AC
         PORT ( ALU_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT PC
         PORT ( Bus_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT IR
         PORT ( Bus_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT TR
         PORT ( Bus_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT AR
         PORT ( Bus_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT DR
         PORT ( Bus_in            : IN  std_logic_vector( 15 DOWNTO 0 );
                CLK               : IN  std_logic;
                Clear             : IN  std_logic;
                Inc               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT IR_DCD
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                opc_in            : IN  std_logic_vector( 2 DOWNTO 0 );
                d0_Load           : OUT std_logic;
                d1_Store          : OUT std_logic;
                d2_ADD            : OUT std_logic;
                d3_AND            : OUT std_logic;
                d4_JUMP           : OUT std_logic;
                d5_BSA            : OUT std_logic;
                d6_ISZ            : OUT std_logic );
      END COMPONENT;

      COMPONENT Bus_controller
         PORT ( IR15              : IN  std_logic;
                d0                : IN  std_logic;
                d1                : IN  std_logic;
                d2                : IN  std_logic;
                d3                : IN  std_logic;
                d4                : IN  std_logic;
                d5                : IN  std_logic;
                d6                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t0                : IN  std_logic;
                t1                : IN  std_logic;
                t2                : IN  std_logic;
                t3                : IN  std_logic;
                t4                : IN  std_logic;
                t5                : IN  std_logic;
                t6                : IN  std_logic;
                s0                : OUT std_logic;
                s1                : OUT std_logic;
                s2                : OUT std_logic );
      END COMPONENT;

      COMPONENT Data_BUS
         PORT ( AC                : IN  std_logic_vector( 15 DOWNTO 0 );
                AR                : IN  std_logic_vector( 15 DOWNTO 0 );
                DR                : IN  std_logic_vector( 15 DOWNTO 0 );
                IR                : IN  std_logic_vector( 15 DOWNTO 0 );
                Mem               : IN  std_logic_vector( 15 DOWNTO 0 );
                PC                : IN  std_logic_vector( 15 DOWNTO 0 );
                TR                : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                s0                : IN  std_logic;
                s1                : IN  std_logic;
                s2                : IN  std_logic;
                Bus_out           : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Mem_controller
         PORT ( IR15              : IN  std_logic;
                d0                : IN  std_logic;
                d1                : IN  std_logic;
                d2                : IN  std_logic;
                d3                : IN  std_logic;
                d5                : IN  std_logic;
                d6                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t1                : IN  std_logic;
                t3                : IN  std_logic;
                t4                : IN  std_logic;
                t6                : IN  std_logic;
                R                 : OUT std_logic;
                W                 : OUT std_logic );
      END COMPONENT;

      COMPONENT PC_controller
         PORT ( d4                : IN  std_logic;
                d5                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t1                : IN  std_logic;
                t4                : IN  std_logic;
                t5                : IN  std_logic;
                L                 : OUT std_logic;
                plusplus          : OUT std_logic );
      END COMPONENT;

      COMPONENT IR_Controller
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t1                : IN  std_logic;
                L                 : OUT std_logic );
      END COMPONENT;

      COMPONENT AR_controller
         PORT ( IR15              : IN  std_logic;
                d5                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t0                : IN  std_logic;
                t2                : IN  std_logic;
                t3                : IN  std_logic;
                t4                : IN  std_logic;
                AR_L              : OUT std_logic;
                plusplus          : OUT std_logic );
      END COMPONENT;

      COMPONENT ALU_controller
         PORT ( d0                : IN  std_logic;
                d2                : IN  std_logic;
                d3                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t4                : IN  std_logic;
                t5                : IN  std_logic;
                add               : OUT std_logic;
                mode              : OUT std_logic_vector( 1 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT AC_controller
         PORT ( d0                : IN  std_logic;
                d2                : IN  std_logic;
                d3                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t5                : IN  std_logic;
                L                 : OUT std_logic );
      END COMPONENT;

      COMPONENT DR_Controller
         PORT ( d0                : IN  std_logic;
                d2                : IN  std_logic;
                d3                : IN  std_logic;
                d6                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                t4                : IN  std_logic;
                t5                : IN  std_logic;
                L                 : OUT std_logic;
                plusplus          : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus47 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_logisimBus52 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus56 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet55 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet59 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet60 : std_logic;
   SIGNAL s_logisimNet61 : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet16 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus47(0)  <= s_logisimNet1;
   s_logisimBus47(1)  <= s_logisimNet50;
   s_logisimBus47(10) <= s_logisimNet27;
   s_logisimBus47(11) <= s_logisimNet60;
   s_logisimBus47(2)  <= s_logisimNet26;
   s_logisimBus47(3)  <= s_logisimNet59;
   s_logisimBus47(4)  <= s_logisimNet42;
   s_logisimBus47(5)  <= s_logisimNet15;
   s_logisimBus47(6)  <= s_logisimNet58;
   s_logisimBus47(7)  <= s_logisimNet36;
   s_logisimBus47(8)  <= s_logisimNet2;
   s_logisimBus47(9)  <= s_logisimNet51;
   s_logisimNet1      <= s_logisimBus19(0);
   s_logisimNet15     <= s_logisimBus19(5);
   s_logisimNet2      <= s_logisimBus19(8);
   s_logisimNet26     <= s_logisimBus19(2);
   s_logisimNet27     <= s_logisimBus19(10);
   s_logisimNet36     <= s_logisimBus19(7);
   s_logisimNet42     <= s_logisimBus19(4);
   s_logisimNet50     <= s_logisimBus19(1);
   s_logisimNet51     <= s_logisimBus19(9);
   s_logisimNet58     <= s_logisimBus19(6);
   s_logisimNet59     <= s_logisimBus19(3);
   s_logisimNet60     <= s_logisimBus19(11);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet31 <= ST;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AC_out   <= s_logisimBus18(15 DOWNTO 0);
   ALU_out  <= s_logisimBus25(15 DOWNTO 0);
   AR_out   <= s_logisimBus19(15 DOWNTO 0);
   BUS_DATA <= s_logisimBus3(15 DOWNTO 0);
   DR_out   <= s_logisimBus52(15 DOWNTO 0);
   IR_out   <= s_logisimBus4(15 DOWNTO 0);
   Mem_out  <= s_logisimBus24(15 DOWNTO 0);
   PC_out   <= s_logisimBus7(15 DOWNTO 0);
   T        <= s_logisimBus30(2 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus56(15 DOWNTO 0)  <=  X"0000";


   -- Buffer
   s_logisimNet14 <= s_logisimNet43;

   -- NOT Gate
   s_logisimNet8 <=  NOT s_logisimNet21;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet9,
                 input2 => s_logisimNet57,
                 input3 => s_logisimNet37,
                 result => s_logisimNet43 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet57,
                 input2 => s_logisimNet37,
                 result => s_logisimNet32 );

   GATES_3 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet14,
                 input2 => s_logisimNet32,
                 result => s_logisimNet6 );

   GATES_4 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet46,
                 input2 => s_logisimNet43,
                 result => s_logisimNet12 );

   PLEXERS_5 : Decoder_8
      PORT MAP ( decoderOut_0 => s_logisimNet41,
                 decoderOut_1 => s_logisimNet28,
                 decoderOut_2 => s_logisimNet39,
                 decoderOut_3 => s_logisimNet48,
                 decoderOut_4 => s_logisimNet35,
                 decoderOut_5 => s_logisimNet54,
                 decoderOut_6 => s_logisimNet37,
                 decoderOut_7 => OPEN,
                 sel          => s_logisimBus30(2 DOWNTO 0) );

   ARITH_6 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet9,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus52(15 DOWNTO 0),
                 dataB         => s_logisimBus56(15 DOWNTO 0) );

   RAM_1 : RAMCONTENTS_RAM_1
      PORT MAP ( address => s_logisimBus47(11 DOWNTO 0),
                 clock   => logisimClockTree0(4),
                 dataIn  => s_logisimBus3(15 DOWNTO 0),
                 dataOut => s_logisimBus24(15 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree0(3),
                 we      => s_logisimNet21 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   T_counter_1 : T_counter
      PORT MAP ( CLK               => s_logisimNet16,
                 En                => s_logisimNet31,
                 T_out             => s_logisimBus30(2 DOWNTO 0),
                 clear             => s_logisimNet6,
                 logisimClockTree0 => logisimClockTree0 );

   ALU_1 : ALU
      PORT MAP ( A                 => s_logisimBus52(15 DOWNTO 0),
                 Add_mode          => '0',
                 B                 => s_logisimBus18(15 DOWNTO 0),
                 Cin               => '0',
                 Mode              => s_logisimBus33(1 DOWNTO 0),
                 Res               => s_logisimBus25(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   AC_1 : AC
      PORT MAP ( ALU_in            => s_logisimBus25(15 DOWNTO 0),
                 Bus_out           => s_logisimBus18(15 DOWNTO 0),
                 CLK               => s_logisimNet16,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => s_logisimNet34,
                 logisimClockTree0 => logisimClockTree0 );

   PC_1 : PC
      PORT MAP ( Bus_in            => s_logisimBus3(15 DOWNTO 0),
                 Bus_out           => s_logisimBus7(15 DOWNTO 0),
                 CLK               => s_logisimNet16,
                 Clear             => '0',
                 Inc               => s_logisimNet44,
                 Load              => s_logisimNet12,
                 logisimClockTree0 => logisimClockTree0 );

   IR_1 : IR
      PORT MAP ( Bus_in            => s_logisimBus3(15 DOWNTO 0),
                 Bus_out           => s_logisimBus4(15 DOWNTO 0),
                 CLK               => s_logisimNet16,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => s_logisimNet11,
                 logisimClockTree0 => logisimClockTree0 );

   TR_1 : TR
      PORT MAP ( Bus_in            => s_logisimBus3(15 DOWNTO 0),
                 Bus_out           => s_logisimBus10(15 DOWNTO 0),
                 CLK               => s_logisimNet16,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => '0',
                 logisimClockTree0 => logisimClockTree0 );

   AR_1 : AR
      PORT MAP ( Bus_in            => s_logisimBus3(15 DOWNTO 0),
                 Bus_out           => s_logisimBus19(15 DOWNTO 0),
                 CLK               => s_logisimNet16,
                 Clear             => '0',
                 Inc               => s_logisimNet0,
                 Load              => s_logisimNet53,
                 logisimClockTree0 => logisimClockTree0 );

   DR_1 : DR
      PORT MAP ( Bus_in            => s_logisimBus3(15 DOWNTO 0),
                 Bus_out           => s_logisimBus52(15 DOWNTO 0),
                 CLK               => s_logisimNet16,
                 Clear             => '0',
                 Inc               => s_logisimNet23,
                 Load              => s_logisimNet61,
                 logisimClockTree0 => logisimClockTree0 );

   IR_DCD_1 : IR_DCD
      PORT MAP ( d0_Load           => s_logisimNet55,
                 d1_Store          => s_logisimNet38,
                 d2_ADD            => s_logisimNet29,
                 d3_AND            => s_logisimNet13,
                 d4_JUMP           => s_logisimNet5,
                 d5_BSA            => s_logisimNet57,
                 d6_ISZ            => s_logisimNet40,
                 logisimClockTree0 => logisimClockTree0,
                 opc_in            => s_logisimBus4(14 DOWNTO 12) );

   Bus_controller_1 : Bus_controller
      PORT MAP ( IR15              => s_logisimBus4(15),
                 d0                => s_logisimNet55,
                 d1                => s_logisimNet38,
                 d2                => s_logisimNet29,
                 d3                => s_logisimNet13,
                 d4                => s_logisimNet5,
                 d5                => s_logisimNet57,
                 d6                => s_logisimNet40,
                 logisimClockTree0 => logisimClockTree0,
                 s0                => s_logisimNet45,
                 s1                => s_logisimNet20,
                 s2                => s_logisimNet49,
                 t0                => s_logisimNet41,
                 t1                => s_logisimNet28,
                 t2                => s_logisimNet39,
                 t3                => s_logisimNet48,
                 t4                => s_logisimNet35,
                 t5                => s_logisimNet54,
                 t6                => s_logisimNet37 );

   Data_BUS_1 : Data_BUS
      PORT MAP ( AC                => s_logisimBus18(15 DOWNTO 0),
                 AR                => s_logisimBus19(15 DOWNTO 0),
                 Bus_out           => s_logisimBus3(15 DOWNTO 0),
                 DR                => s_logisimBus52(15 DOWNTO 0),
                 IR                => s_logisimBus4(15 DOWNTO 0),
                 Mem               => s_logisimBus24(15 DOWNTO 0),
                 PC                => s_logisimBus7(15 DOWNTO 0),
                 TR                => s_logisimBus10(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 s0                => s_logisimNet45,
                 s1                => s_logisimNet20,
                 s2                => s_logisimNet49 );

   Mem_controller_1 : Mem_controller
      PORT MAP ( IR15              => s_logisimBus4(15),
                 R                 => OPEN,
                 W                 => s_logisimNet21,
                 d0                => s_logisimNet55,
                 d1                => s_logisimNet38,
                 d2                => s_logisimNet29,
                 d3                => s_logisimNet13,
                 d5                => s_logisimNet57,
                 d6                => s_logisimNet40,
                 logisimClockTree0 => logisimClockTree0,
                 t1                => s_logisimNet28,
                 t3                => s_logisimNet48,
                 t4                => s_logisimNet35,
                 t6                => s_logisimNet37 );

   PC_controller_1 : PC_controller
      PORT MAP ( L                 => s_logisimNet46,
                 d4                => s_logisimNet5,
                 d5                => s_logisimNet57,
                 logisimClockTree0 => logisimClockTree0,
                 plusplus          => s_logisimNet44,
                 t1                => s_logisimNet28,
                 t4                => s_logisimNet35,
                 t5                => s_logisimNet54 );

   IR_Controller_1 : IR_Controller
      PORT MAP ( L                 => s_logisimNet11,
                 logisimClockTree0 => logisimClockTree0,
                 t1                => s_logisimNet28 );

   AR_controller_1 : AR_controller
      PORT MAP ( AR_L              => s_logisimNet53,
                 IR15              => s_logisimBus4(15),
                 d5                => s_logisimNet57,
                 logisimClockTree0 => logisimClockTree0,
                 plusplus          => s_logisimNet0,
                 t0                => s_logisimNet41,
                 t2                => s_logisimNet39,
                 t3                => s_logisimNet48,
                 t4                => s_logisimNet35 );

   ALU_controller_1 : ALU_controller
      PORT MAP ( add               => OPEN,
                 d0                => s_logisimNet55,
                 d2                => s_logisimNet29,
                 d3                => s_logisimNet13,
                 logisimClockTree0 => logisimClockTree0,
                 mode              => s_logisimBus33(1 DOWNTO 0),
                 t4                => s_logisimNet35,
                 t5                => s_logisimNet54 );

   AC_controller_1 : AC_controller
      PORT MAP ( L                 => s_logisimNet34,
                 d0                => s_logisimNet55,
                 d2                => s_logisimNet29,
                 d3                => s_logisimNet13,
                 logisimClockTree0 => logisimClockTree0,
                 t5                => s_logisimNet54 );

   DR_Controller_1 : DR_Controller
      PORT MAP ( L                 => s_logisimNet61,
                 d0                => s_logisimNet55,
                 d2                => s_logisimNet29,
                 d3                => s_logisimNet13,
                 d6                => s_logisimNet40,
                 logisimClockTree0 => logisimClockTree0,
                 plusplus          => s_logisimNet23,
                 t4                => s_logisimNet35,
                 t5                => s_logisimNet54 );

END platformIndependent;
