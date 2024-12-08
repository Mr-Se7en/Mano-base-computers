--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : Contrrol_Unit                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Contrrol_Unit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_4
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic;
                muxIn_1 : IN  std_logic;
                muxIn_2 : IN  std_logic;
                muxIn_3 : IN  std_logic;
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
                muxOut  : OUT std_logic );
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

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT CAR
         PORT ( CAR_in            : IN  std_logic_vector( 6 DOWNTO 0 );
                CLK               : IN  std_logic;
                Load              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                CAR_out           : OUT std_logic_vector( 6 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT SBR
         PORT ( CLK               : IN  std_logic;
                Load              : IN  std_logic;
                SBR_in            : IN  std_logic_vector( 6 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                SBR_out           : OUT std_logic_vector( 6 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Control_unit_branch_logic
         PORT ( BR                : IN  std_logic_vector( 1 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                test              : IN  std_logic;
                SBR_L             : OUT std_logic;
                z0                : OUT std_logic;
                z1                : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus14 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 19 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus45 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus46 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus55 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_logisimBus62 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus63 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus64 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet56 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet59 : std_logic;
   SIGNAL s_logisimNet60 : std_logic;
   SIGNAL s_logisimNet61 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus19(0) <= s_logisimNet44;
   s_logisimBus19(1) <= s_logisimNet56;
   s_logisimBus19(2) <= s_logisimNet32;
   s_logisimBus19(3) <= s_logisimNet8;
   s_logisimBus19(4) <= s_logisimNet28;
   s_logisimBus19(5) <= s_logisimNet36;
   s_logisimBus19(6) <= s_logisimNet16;
   s_logisimBus39(0) <= s_logisimNet4;
   s_logisimBus39(1) <= s_logisimNet23;
   s_logisimBus39(2) <= s_logisimNet22;
   s_logisimBus55(0) <= s_logisimNet52;
   s_logisimBus55(1) <= s_logisimNet31;
   s_logisimBus55(2) <= s_logisimNet18;
   s_logisimBus62(0) <= s_logisimNet35;
   s_logisimBus62(1) <= s_logisimNet3;
   s_logisimBus62(2) <= s_logisimNet51;
   s_logisimBus63(0) <= s_logisimNet34;
   s_logisimBus63(1) <= s_logisimNet5;
   s_logisimBus64(0) <= s_logisimNet61;
   s_logisimBus64(1) <= s_logisimNet57;
   s_logisimNet16    <= s_logisimBus33(6);
   s_logisimNet18    <= s_logisimBus33(19);
   s_logisimNet22    <= s_logisimBus33(16);
   s_logisimNet23    <= s_logisimBus33(15);
   s_logisimNet28    <= s_logisimBus33(4);
   s_logisimNet3     <= s_logisimBus33(12);
   s_logisimNet31    <= s_logisimBus33(18);
   s_logisimNet32    <= s_logisimBus33(2);
   s_logisimNet34    <= s_logisimBus33(7);
   s_logisimNet35    <= s_logisimBus33(11);
   s_logisimNet36    <= s_logisimBus33(5);
   s_logisimNet4     <= s_logisimBus33(14);
   s_logisimNet44    <= s_logisimBus33(0);
   s_logisimNet5     <= s_logisimBus33(8);
   s_logisimNet51    <= s_logisimBus33(13);
   s_logisimNet52    <= s_logisimBus33(17);
   s_logisimNet56    <= s_logisimBus33(1);
   s_logisimNet57    <= s_logisimBus33(10);
   s_logisimNet61    <= s_logisimBus33(9);
   s_logisimNet8     <= s_logisimBus33(3);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus14(6 DOWNTO 0) <= DR_MAP;
   s_logisimNet12             <= CLK;
   s_logisimNet15             <= DR_15;
   s_logisimNet25             <= AC_Sign;
   s_logisimNet9              <= AC_Zero;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   ACTDR   <= s_logisimNet38;
   ADD     <= s_logisimNet49;
   ALU_AND <= s_logisimNet27;
   ALU_OR  <= s_logisimNet21;
   ALU_XOR <= s_logisimNet10;
   ARTPC   <= s_logisimNet24;
   CLRAC   <= s_logisimNet20;
   COM     <= s_logisimNet58;
   DRTAC   <= s_logisimNet1;
   DRTAR   <= s_logisimNet37;
   INCAC   <= s_logisimNet26;
   INCDR   <= s_logisimNet60;
   INCPC   <= s_logisimNet42;
   PCTAR   <= s_logisimNet59;
   PCTDR   <= s_logisimNet54;
   READ    <= s_logisimNet2;
   SHL     <= s_logisimNet41;
   SHR     <= s_logisimNet13;
   SUB     <= s_logisimNet50;
   WRITE   <= s_logisimNet53;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus45(6 DOWNTO 0)  <=  "000"&X"1";


   -- Constant
    s_logisimNet48  <=  '1';


   -- Constant
    s_logisimNet47  <=  '1';


   -- ROM: ROM_1
   WITH (s_logisimBus17) SELECT s_logisimBus33 <=
      X"002D3" WHEN "000"&X"0",
      X"002D3" WHEN "100"&X"0",
      X"10002" WHEN "000"&X"1",
      X"10042" WHEN "100"&X"1",
      X"20050" WHEN "000"&X"2",
      X"80050" WHEN "100"&X"2",
      X"00050" WHEN "000"&X"3",
      X"0040A" WHEN "000"&X"8",
      X"00050" WHEN "000"&X"9",
      X"002D3" WHEN "000"&X"A",
      X"03050" WHEN "000"&X"B",
      X"002D3" WHEN "001"&X"0",
      X"C0051" WHEN "101"&X"0",
      X"14012" WHEN "001"&X"1",
      X"12852" WHEN "101"&X"1",
      X"E0050" WHEN "001"&X"2",
      X"A0180" WHEN "101"&X"2",
      X"00050" WHEN "001"&X"3",
      X"10055" WHEN "101"&X"3",
      X"A0100" WHEN "101"&X"4",
      X"002D3" WHEN "001"&X"8",
      X"2001A" WHEN "001"&X"9",
      X"9401B" WHEN "001"&X"A",
      X"E0050" WHEN "001"&X"B",
      X"002D3" WHEN "010"&X"0",
      X"10022" WHEN "010"&X"1",
      X"0C050" WHEN "010"&X"2",
      X"00050" WHEN "010"&X"3",
      X"002D3" WHEN "010"&X"8",
      X"03050" WHEN "010"&X"9",
      X"002D3" WHEN "011"&X"0",
      X"1C032" WHEN "011"&X"1",
      X"E0033" WHEN "011"&X"2",
      X"10034" WHEN "011"&X"3",
      X"18035" WHEN "011"&X"4",
      X"A0036" WHEN "011"&X"5",
      X"03050" WHEN "011"&X"6",
      X"002D3" WHEN "011"&X"8",
      X"1003A" WHEN "011"&X"9",
      X"1803B" WHEN "011"&X"A",
      X"9403C" WHEN "011"&X"B",
      X"9463D" WHEN "011"&X"C",
      X"E0050" WHEN "011"&X"D",
      X"00000" WHEN OTHERS;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_4
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet48,
                 muxIn_1 => s_logisimNet15,
                 muxIn_2 => s_logisimNet25,
                 muxIn_3 => s_logisimNet9,
                 muxOut  => s_logisimNet40,
                 sel     => s_logisimBus64(1 DOWNTO 0) );

   PLEXERS_2 : Decoder_8
      PORT MAP ( decoderOut_0 => OPEN,
                 decoderOut_1 => s_logisimNet49,
                 decoderOut_2 => s_logisimNet20,
                 decoderOut_3 => s_logisimNet26,
                 decoderOut_4 => s_logisimNet1,
                 decoderOut_5 => s_logisimNet37,
                 decoderOut_6 => s_logisimNet59,
                 decoderOut_7 => s_logisimNet53,
                 sel          => s_logisimBus55(2 DOWNTO 0) );

   PLEXERS_3 : Decoder_8
      PORT MAP ( decoderOut_0 => OPEN,
                 decoderOut_1 => s_logisimNet50,
                 decoderOut_2 => s_logisimNet21,
                 decoderOut_3 => s_logisimNet27,
                 decoderOut_4 => s_logisimNet2,
                 decoderOut_5 => s_logisimNet38,
                 decoderOut_6 => s_logisimNet60,
                 decoderOut_7 => s_logisimNet54,
                 sel          => s_logisimBus39(2 DOWNTO 0) );

   PLEXERS_4 : Decoder_8
      PORT MAP ( decoderOut_0 => OPEN,
                 decoderOut_1 => s_logisimNet10,
                 decoderOut_2 => s_logisimNet58,
                 decoderOut_3 => s_logisimNet41,
                 decoderOut_4 => s_logisimNet13,
                 decoderOut_5 => s_logisimNet42,
                 decoderOut_6 => s_logisimNet24,
                 decoderOut_7 => s_logisimNet7,
                 sel          => s_logisimBus62(2 DOWNTO 0) );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 7 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus6(6 DOWNTO 0),
                 muxIn_1 => s_logisimBus19(6 DOWNTO 0),
                 muxIn_2 => s_logisimBus29(6 DOWNTO 0),
                 muxIn_3 => s_logisimBus14(6 DOWNTO 0),
                 muxOut  => s_logisimBus30(6 DOWNTO 0),
                 sel     => s_logisimBus46(1 DOWNTO 0) );

   ARITH_6 : Adder
      GENERIC MAP ( extendedBits => 8,
                    nrOfBits     => 7 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus17(6 DOWNTO 0),
                 dataB    => s_logisimBus45(6 DOWNTO 0),
                 result   => s_logisimBus6(6 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   CAR_1 : CAR
      PORT MAP ( CAR_in            => s_logisimBus30(6 DOWNTO 0),
                 CAR_out           => s_logisimBus17(6 DOWNTO 0),
                 CLK               => s_logisimNet12,
                 Load              => s_logisimNet47,
                 logisimClockTree0 => logisimClockTree0 );

   SBR_1 : SBR
      PORT MAP ( CLK               => s_logisimNet12,
                 Load              => s_logisimNet11,
                 SBR_in            => s_logisimBus6(6 DOWNTO 0),
                 SBR_out           => s_logisimBus29(6 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   Control_unit_branch_logic_1 : Control_unit_branch_logic
      PORT MAP ( BR                => s_logisimBus63(1 DOWNTO 0),
                 SBR_L             => s_logisimNet11,
                 logisimClockTree0 => logisimClockTree0,
                 test              => s_logisimNet40,
                 z0                => s_logisimBus46(0),
                 z1                => s_logisimBus46(1) );

END platformIndependent;
