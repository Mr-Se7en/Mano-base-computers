--==============================================================================
=========================================================================

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
   SIGNAL s_Bus14 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus17 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus19 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus29 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus30 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus33 : std_logic_vector( 19 DOWNTO 0 );
   SIGNAL s_Bus39 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus45 : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus46 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus55 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus6  : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_Bus62 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Bus63 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus64 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Net0  : std_logic;
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net11 : std_logic;
   SIGNAL s_Net12 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net15 : std_logic;
   SIGNAL s_Net16 : std_logic;
   SIGNAL s_Net18 : std_logic;
   SIGNAL s_Net2  : std_logic;
   SIGNAL s_Net20 : std_logic;
   SIGNAL s_Net21 : std_logic;
   SIGNAL s_Net22 : std_logic;
   SIGNAL s_Net23 : std_logic;
   SIGNAL s_Net24 : std_logic;
   SIGNAL s_Net25 : std_logic;
   SIGNAL s_Net26 : std_logic;
   SIGNAL s_Net27 : std_logic;
   SIGNAL s_Net28 : std_logic;
   SIGNAL s_Net3  : std_logic;
   SIGNAL s_Net31 : std_logic;
   SIGNAL s_Net32 : std_logic;
   SIGNAL s_Net34 : std_logic;
   SIGNAL s_Net35 : std_logic;
   SIGNAL s_Net36 : std_logic;
   SIGNAL s_Net37 : std_logic;
   SIGNAL s_Net38 : std_logic;
   SIGNAL s_Net4  : std_logic;
   SIGNAL s_Net40 : std_logic;
   SIGNAL s_Net41 : std_logic;
   SIGNAL s_Net42 : std_logic;
   SIGNAL s_Net43 : std_logic;
   SIGNAL s_Net44 : std_logic;
   SIGNAL s_Net47 : std_logic;
   SIGNAL s_Net48 : std_logic;
   SIGNAL s_Net49 : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net50 : std_logic;
   SIGNAL s_Net51 : std_logic;
   SIGNAL s_Net52 : std_logic;
   SIGNAL s_Net53 : std_logic;
   SIGNAL s_Net54 : std_logic;
   SIGNAL s_Net56 : std_logic;
   SIGNAL s_Net57 : std_logic;
   SIGNAL s_Net58 : std_logic;
   SIGNAL s_Net59 : std_logic;
   SIGNAL s_Net60 : std_logic;
   SIGNAL s_Net61 : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus19(0) <= s_Net44;
   s_Bus19(1) <= s_Net56;
   s_Bus19(2) <= s_Net32;
   s_Bus19(3) <= s_Net8;
   s_Bus19(4) <= s_Net28;
   s_Bus19(5) <= s_Net36;
   s_Bus19(6) <= s_Net16;
   s_Bus39(0) <= s_Net4;
   s_Bus39(1) <= s_Net23;
   s_Bus39(2) <= s_Net22;
   s_Bus55(0) <= s_Net52;
   s_Bus55(1) <= s_Net31;
   s_Bus55(2) <= s_Net18;
   s_Bus62(0) <= s_Net35;
   s_Bus62(1) <= s_Net3;
   s_Bus62(2) <= s_Net51;
   s_Bus63(0) <= s_Net34;
   s_Bus63(1) <= s_Net5;
   s_Bus64(0) <= s_Net61;
   s_Bus64(1) <= s_Net57;
   s_Net16    <= s_Bus33(6);
   s_Net18    <= s_Bus33(19);
   s_Net22    <= s_Bus33(16);
   s_Net23    <= s_Bus33(15);
   s_Net28    <= s_Bus33(4);
   s_Net3     <= s_Bus33(12);
   s_Net31    <= s_Bus33(18);
   s_Net32    <= s_Bus33(2);
   s_Net34    <= s_Bus33(7);
   s_Net35    <= s_Bus33(11);
   s_Net36    <= s_Bus33(5);
   s_Net4     <= s_Bus33(14);
   s_Net44    <= s_Bus33(0);
   s_Net5     <= s_Bus33(8);
   s_Net51    <= s_Bus33(13);
   s_Net52    <= s_Bus33(17);
   s_Net56    <= s_Bus33(1);
   s_Net57    <= s_Bus33(10);
   s_Net61    <= s_Bus33(9);
   s_Net8     <= s_Bus33(3);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus14(6 DOWNTO 0) <= DR_MAP;
   s_Net12             <= CLK;
   s_Net15             <= DR_15;
   s_Net25             <= AC_Sign;
   s_Net9              <= AC_Zero;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   ACTDR   <= s_Net38;
   ADD     <= s_Net49;
   ALU_AND <= s_Net27;
   ALU_OR  <= s_Net21;
   ALU_XOR <= s_Net10;
   ARTPC   <= s_Net24;
   CLRAC   <= s_Net20;
   COM     <= s_Net58;
   DRTAC   <= s_Net1;
   DRTAR   <= s_Net37;
   INCAC   <= s_Net26;
   INCDR   <= s_Net60;
   INCPC   <= s_Net42;
   PCTAR   <= s_Net59;
   PCTDR   <= s_Net54;
   READ    <= s_Net2;
   SHL     <= s_Net41;
   SHR     <= s_Net13;
   SUB     <= s_Net50;
   WRITE   <= s_Net53;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus45(6 DOWNTO 0)  <=  "000"&X"1";


   -- Constant
    s_Net48  <=  '1';


   -- Constant
    s_Net47  <=  '1';


   -- ROM: ROM_1
   WITH (s_Bus17) SELECT s_Bus33 <=
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
                 muxIn_0 => s_Net48,
                 muxIn_1 => s_Net15,
                 muxIn_2 => s_Net25,
                 muxIn_3 => s_Net9,
                 muxOut  => s_Net40,
                 sel     => s_Bus64(1 DOWNTO 0) );

   PLEXERS_2 : Decoder_8
      PORT MAP ( decoderOut_0 => OPEN,
                 decoderOut_1 => s_Net49,
                 decoderOut_2 => s_Net20,
                 decoderOut_3 => s_Net26,
                 decoderOut_4 => s_Net1,
                 decoderOut_5 => s_Net37,
                 decoderOut_6 => s_Net59,
                 decoderOut_7 => s_Net53,
                 sel          => s_Bus55(2 DOWNTO 0) );

   PLEXERS_3 : Decoder_8
      PORT MAP ( decoderOut_0 => OPEN,
                 decoderOut_1 => s_Net50,
                 decoderOut_2 => s_Net21,
                 decoderOut_3 => s_Net27,
                 decoderOut_4 => s_Net2,
                 decoderOut_5 => s_Net38,
                 decoderOut_6 => s_Net60,
                 decoderOut_7 => s_Net54,
                 sel          => s_Bus39(2 DOWNTO 0) );

   PLEXERS_4 : Decoder_8
      PORT MAP ( decoderOut_0 => OPEN,
                 decoderOut_1 => s_Net10,
                 decoderOut_2 => s_Net58,
                 decoderOut_3 => s_Net41,
                 decoderOut_4 => s_Net13,
                 decoderOut_5 => s_Net42,
                 decoderOut_6 => s_Net24,
                 decoderOut_7 => s_Net7,
                 sel          => s_Bus62(2 DOWNTO 0) );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 7 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_Bus6(6 DOWNTO 0),
                 muxIn_1 => s_Bus19(6 DOWNTO 0),
                 muxIn_2 => s_Bus29(6 DOWNTO 0),
                 muxIn_3 => s_Bus14(6 DOWNTO 0),
                 muxOut  => s_Bus30(6 DOWNTO 0),
                 sel     => s_Bus46(1 DOWNTO 0) );

   ARITH_6 : Adder
      GENERIC MAP ( extendedBits => 8,
                    nrOfBits     => 7 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_Bus17(6 DOWNTO 0),
                 dataB    => s_Bus45(6 DOWNTO 0),
                 result   => s_Bus6(6 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   CAR_1 : CAR
      PORT MAP ( CAR_in            => s_Bus30(6 DOWNTO 0),
                 CAR_out           => s_Bus17(6 DOWNTO 0),
                 CLK               => s_Net12,
                 Load              => s_Net47,
                 logisimClockTree0 => logisimClockTree0 );

   SBR_1 : SBR
      PORT MAP ( CLK               => s_Net12,
                 Load              => s_Net11,
                 SBR_in            => s_Bus6(6 DOWNTO 0),
                 SBR_out           => s_Bus29(6 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   Control_unit_branch_logic_1 : Control_unit_branch_logic
      PORT MAP ( BR                => s_Bus63(1 DOWNTO 0),
                 SBR_L             => s_Net11,
                 logisimClockTree0 => logisimClockTree0,
                 test              => s_Net40,
                 z0                => s_Bus46(0),
                 z1                => s_Bus46(1) );

END platformIndependent;
