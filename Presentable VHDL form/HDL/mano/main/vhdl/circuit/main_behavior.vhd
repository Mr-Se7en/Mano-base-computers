--==============================================================================
=========================================================================

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
   SIGNAL s_Bus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus24 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus30 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus33 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus47 : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Bus52 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus56 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Bus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Net0  : std_logic;
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net14 : std_logic;
   SIGNAL s_Net15 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net17 : std_logic;
   SIGNAL s_Net2  : std_logic;
   SIGNAL s_Net20 : std_logic;
   SIGNAL s_Net21 : std_logic;
   SIGNAL s_Net23 : std_logic;
   SIGNAL s_Net26 : std_logic;
   SIGNAL s_Net27 : std_logic;
   SIGNAL s_Net28 : std_logic;
   SIGNAL s_Net29 : std_logic;
   SIGNAL s_Net31 : std_logic;
   SIGNAL s_Net32 : std_logic;
   SIGNAL s_Net34 : std_logic;
   SIGNAL s_Net35 : std_logic;
   SIGNAL s_Net36 : std_logic;
   SIGNAL s_Net37 : std_logic;
   SIGNAL s_Net38 : std_logic;
   SIGNAL s_Net39 : std_logic;
   SIGNAL s_Net40 : std_logic;
   SIGNAL s_Net41 : std_logic;
   SIGNAL s_Net42 : std_logic;
   SIGNAL s_Net43 : std_logic;
   SIGNAL s_Net44 : std_logic;
   SIGNAL s_Net45 : std_logic;
   SIGNAL s_Net46 : std_logic;
   SIGNAL s_Net48 : std_logic;
   SIGNAL s_Net49 : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net50 : std_logic;
   SIGNAL s_Net51 : std_logic;
   SIGNAL s_Net53 : std_logic;
   SIGNAL s_Net54 : std_logic;
   SIGNAL s_Net55 : std_logic;
   SIGNAL s_Net57 : std_logic;
   SIGNAL s_Net58 : std_logic;
   SIGNAL s_Net59 : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net60 : std_logic;
   SIGNAL s_Net61 : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_Net16 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus47(0)  <= s_Net1;
   s_Bus47(1)  <= s_Net50;
   s_Bus47(10) <= s_Net27;
   s_Bus47(11) <= s_Net60;
   s_Bus47(2)  <= s_Net26;
   s_Bus47(3)  <= s_Net59;
   s_Bus47(4)  <= s_Net42;
   s_Bus47(5)  <= s_Net15;
   s_Bus47(6)  <= s_Net58;
   s_Bus47(7)  <= s_Net36;
   s_Bus47(8)  <= s_Net2;
   s_Bus47(9)  <= s_Net51;
   s_Net1      <= s_Bus19(0);
   s_Net15     <= s_Bus19(5);
   s_Net2      <= s_Bus19(8);
   s_Net26     <= s_Bus19(2);
   s_Net27     <= s_Bus19(10);
   s_Net36     <= s_Bus19(7);
   s_Net42     <= s_Bus19(4);
   s_Net50     <= s_Bus19(1);
   s_Net51     <= s_Bus19(9);
   s_Net58     <= s_Bus19(6);
   s_Net59     <= s_Bus19(3);
   s_Net60     <= s_Bus19(11);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Net31 <= ST;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   AC_out   <= s_Bus18(15 DOWNTO 0);
   ALU_out  <= s_Bus25(15 DOWNTO 0);
   AR_out   <= s_Bus19(15 DOWNTO 0);
   BUS_DATA <= s_Bus3(15 DOWNTO 0);
   DR_out   <= s_Bus52(15 DOWNTO 0);
   IR_out   <= s_Bus4(15 DOWNTO 0);
   Mem_out  <= s_Bus24(15 DOWNTO 0);
   PC_out   <= s_Bus7(15 DOWNTO 0);
   T        <= s_Bus30(2 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus56(15 DOWNTO 0)  <=  X"0000";


   -- Buffer
   s_Net14 <= s_Net43;

   -- NOT Gate
   s_Net8 <=  NOT s_Net21;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_Net9,
                 input2 => s_Net57,
                 input3 => s_Net37,
                 result => s_Net43 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net57,
                 input2 => s_Net37,
                 result => s_Net32 );

   GATES_3 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net14,
                 input2 => s_Net32,
                 result => s_Net6 );

   GATES_4 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net46,
                 input2 => s_Net43,
                 result => s_Net12 );

   PLEXERS_5 : Decoder_8
      PORT MAP ( decoderOut_0 => s_Net41,
                 decoderOut_1 => s_Net28,
                 decoderOut_2 => s_Net39,
                 decoderOut_3 => s_Net48,
                 decoderOut_4 => s_Net35,
                 decoderOut_5 => s_Net54,
                 decoderOut_6 => s_Net37,
                 decoderOut_7 => OPEN,
                 sel          => s_Bus30(2 DOWNTO 0) );

   ARITH_6 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_Net9,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_Bus52(15 DOWNTO 0),
                 dataB         => s_Bus56(15 DOWNTO 0) );

   RAM_1 : RAMCONTENTS_RAM_1
      PORT MAP ( address => s_Bus47(11 DOWNTO 0),
                 clock   => logisimClockTree0(4),
                 dataIn  => s_Bus3(15 DOWNTO 0),
                 dataOut => s_Bus24(15 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree0(3),
                 we      => s_Net21 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   T_counter_1 : T_counter
      PORT MAP ( CLK               => s_Net16,
                 En                => s_Net31,
                 T_out             => s_Bus30(2 DOWNTO 0),
                 clear             => s_Net6,
                 logisimClockTree0 => logisimClockTree0 );

   ALU_1 : ALU
      PORT MAP ( A                 => s_Bus52(15 DOWNTO 0),
                 Add_mode          => '0',
                 B                 => s_Bus18(15 DOWNTO 0),
                 Cin               => '0',
                 Mode              => s_Bus33(1 DOWNTO 0),
                 Res               => s_Bus25(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   AC_1 : AC
      PORT MAP ( ALU_in            => s_Bus25(15 DOWNTO 0),
                 Bus_out           => s_Bus18(15 DOWNTO 0),
                 CLK               => s_Net16,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => s_Net34,
                 logisimClockTree0 => logisimClockTree0 );

   PC_1 : PC
      PORT MAP ( Bus_in            => s_Bus3(15 DOWNTO 0),
                 Bus_out           => s_Bus7(15 DOWNTO 0),
                 CLK               => s_Net16,
                 Clear             => '0',
                 Inc               => s_Net44,
                 Load              => s_Net12,
                 logisimClockTree0 => logisimClockTree0 );

   IR_1 : IR
      PORT MAP ( Bus_in            => s_Bus3(15 DOWNTO 0),
                 Bus_out           => s_Bus4(15 DOWNTO 0),
                 CLK               => s_Net16,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => s_Net11,
                 logisimClockTree0 => logisimClockTree0 );

   TR_1 : TR
      PORT MAP ( Bus_in            => s_Bus3(15 DOWNTO 0),
                 Bus_out           => s_Bus10(15 DOWNTO 0),
                 CLK               => s_Net16,
                 Clear             => '0',
                 Inc               => '0',
                 Load              => '0',
                 logisimClockTree0 => logisimClockTree0 );

   AR_1 : AR
      PORT MAP ( Bus_in            => s_Bus3(15 DOWNTO 0),
                 Bus_out           => s_Bus19(15 DOWNTO 0),
                 CLK               => s_Net16,
                 Clear             => '0',
                 Inc               => s_Net0,
                 Load              => s_Net53,
                 logisimClockTree0 => logisimClockTree0 );

   DR_1 : DR
      PORT MAP ( Bus_in            => s_Bus3(15 DOWNTO 0),
                 Bus_out           => s_Bus52(15 DOWNTO 0),
                 CLK               => s_Net16,
                 Clear             => '0',
                 Inc               => s_Net23,
                 Load              => s_Net61,
                 logisimClockTree0 => logisimClockTree0 );

   IR_DCD_1 : IR_DCD
      PORT MAP ( d0_Load           => s_Net55,
                 d1_Store          => s_Net38,
                 d2_ADD            => s_Net29,
                 d3_AND            => s_Net13,
                 d4_JUMP           => s_Net5,
                 d5_BSA            => s_Net57,
                 d6_ISZ            => s_Net40,
                 logisimClockTree0 => logisimClockTree0,
                 opc_in            => s_Bus4(14 DOWNTO 12) );

   Bus_controller_1 : Bus_controller
      PORT MAP ( IR15              => s_Bus4(15),
                 d0                => s_Net55,
                 d1                => s_Net38,
                 d2                => s_Net29,
                 d3                => s_Net13,
                 d4                => s_Net5,
                 d5                => s_Net57,
                 d6                => s_Net40,
                 logisimClockTree0 => logisimClockTree0,
                 s0                => s_Net45,
                 s1                => s_Net20,
                 s2                => s_Net49,
                 t0                => s_Net41,
                 t1                => s_Net28,
                 t2                => s_Net39,
                 t3                => s_Net48,
                 t4                => s_Net35,
                 t5                => s_Net54,
                 t6                => s_Net37 );

   Data_BUS_1 : Data_BUS
      PORT MAP ( AC                => s_Bus18(15 DOWNTO 0),
                 AR                => s_Bus19(15 DOWNTO 0),
                 Bus_out           => s_Bus3(15 DOWNTO 0),
                 DR                => s_Bus52(15 DOWNTO 0),
                 IR                => s_Bus4(15 DOWNTO 0),
                 Mem               => s_Bus24(15 DOWNTO 0),
                 PC                => s_Bus7(15 DOWNTO 0),
                 TR                => s_Bus10(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 s0                => s_Net45,
                 s1                => s_Net20,
                 s2                => s_Net49 );

   Mem_controller_1 : Mem_controller
      PORT MAP ( IR15              => s_Bus4(15),
                 R                 => OPEN,
                 W                 => s_Net21,
                 d0                => s_Net55,
                 d1                => s_Net38,
                 d2                => s_Net29,
                 d3                => s_Net13,
                 d5                => s_Net57,
                 d6                => s_Net40,
                 logisimClockTree0 => logisimClockTree0,
                 t1                => s_Net28,
                 t3                => s_Net48,
                 t4                => s_Net35,
                 t6                => s_Net37 );

   PC_controller_1 : PC_controller
      PORT MAP ( L                 => s_Net46,
                 d4                => s_Net5,
                 d5                => s_Net57,
                 logisimClockTree0 => logisimClockTree0,
                 plusplus          => s_Net44,
                 t1                => s_Net28,
                 t4                => s_Net35,
                 t5                => s_Net54 );

   IR_Controller_1 : IR_Controller
      PORT MAP ( L                 => s_Net11,
                 logisimClockTree0 => logisimClockTree0,
                 t1                => s_Net28 );

   AR_controller_1 : AR_controller
      PORT MAP ( AR_L              => s_Net53,
                 IR15              => s_Bus4(15),
                 d5                => s_Net57,
                 logisimClockTree0 => logisimClockTree0,
                 plusplus          => s_Net0,
                 t0                => s_Net41,
                 t2                => s_Net39,
                 t3                => s_Net48,
                 t4                => s_Net35 );

   ALU_controller_1 : ALU_controller
      PORT MAP ( add               => OPEN,
                 d0                => s_Net55,
                 d2                => s_Net29,
                 d3                => s_Net13,
                 logisimClockTree0 => logisimClockTree0,
                 mode              => s_Bus33(1 DOWNTO 0),
                 t4                => s_Net35,
                 t5                => s_Net54 );

   AC_controller_1 : AC_controller
      PORT MAP ( L                 => s_Net34,
                 d0                => s_Net55,
                 d2                => s_Net29,
                 d3                => s_Net13,
                 logisimClockTree0 => logisimClockTree0,
                 t5                => s_Net54 );

   DR_Controller_1 : DR_Controller
      PORT MAP ( L                 => s_Net61,
                 d0                => s_Net55,
                 d2                => s_Net29,
                 d3                => s_Net13,
                 d6                => s_Net40,
                 logisimClockTree0 => logisimClockTree0,
                 plusplus          => s_Net23,
                 t4                => s_Net35,
                 t5                => s_Net54 );

END platformIndependent;
