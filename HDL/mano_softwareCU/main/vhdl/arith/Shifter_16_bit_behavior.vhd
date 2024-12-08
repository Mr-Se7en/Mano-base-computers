--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : Shifter_16_bit                                               ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Shifter_16_bit IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_stage0Result  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_stage0ShiftIn : std_logic;
   SIGNAL s_stage1Result  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_stage1ShiftIn : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_stage2Result  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_stage2ShiftIn : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_stage3Result  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_stage3ShiftIn : std_logic_vector( 7 DOWNTO 0 );

BEGIN
   --------------------------------------------------------------------------------
   -- ShifterMode represents when:                                               --
   -- 0 : Logical Shift Left                                                     --
   -- 1 : Rotate Left                                                            --
   -- 2 :                                                                        --
   -- Logical Shift Right                                                        --
   -- 3 : Arithmetic Shift Right                                                 --
   -- 4 : Rotate Right                                                           --
   --------------------------------------------------------------------------------

   --------------------------------------------------------------------------------
   -- Stage 0 of the binary shift tree is defined here                           --
   --------------------------------------------------------------------------------
   s_stage0ShiftIn <= dataA(15) WHEN shifterMode = 1 OR shifterMode = 3 ELSE
                      dataA(0) WHEN shifterMode = 4 ELSE '0';

   s_stage0Result  <= dataA
                         WHEN shiftAmount(0) = '0' ELSE
                      dataA(14 DOWNTO 0)&s_stage0ShiftIn
                         WHEN shifterMode = 0 OR shifterMode = 1 ELSE
                      s_stage0ShiftIn&dataA( 15 DOWNTO 1 );

   --------------------------------------------------------------------------------
   -- Stage 1 of the binary shift tree is defined here                           --
   --------------------------------------------------------------------------------
   s_stage1ShiftIn <= s_stage0Result( 15 DOWNTO 14 ) WHEN shifterMode = 1 ELSE
                      (OTHERS => s_stage0Result(0)) WHEN shifterMode = 3 ELSE
                      s_stage0Result( 1 DOWNTO 0 ) WHEN shifterMode = 4 ELSE
                      (OTHERS => '0');

   s_stage1Result  <= s_stage0Result
                         WHEN shiftAmount(1) = '0' ELSE
                      s_stage0Result( 13 DOWNTO 0 )&s_stage1ShiftIn
                         WHEN shifterMode = 0 OR shifterMode = 1 ELSE
                      s_stage1ShiftIn&s_stage0Result( 15 DOWNTO 2 );

   --------------------------------------------------------------------------------
   -- Stage 2 of the binary shift tree is defined here                           --
   --------------------------------------------------------------------------------
   s_stage2ShiftIn <= s_stage1Result( 15 DOWNTO 12 ) WHEN shifterMode = 1 ELSE
                      (OTHERS => s_stage1Result(1)) WHEN shifterMode = 3 ELSE
                      s_stage1Result( 3 DOWNTO 0 ) WHEN shifterMode = 4 ELSE
                      (OTHERS => '0');

   s_stage2Result  <= s_stage1Result
                         WHEN shiftAmount(2) = '0' ELSE
                      s_stage1Result( 11 DOWNTO 0 )&s_stage2ShiftIn
                         WHEN shifterMode = 0 OR shifterMode = 1 ELSE
                      s_stage2ShiftIn&s_stage1Result( 15 DOWNTO 4 );

   --------------------------------------------------------------------------------
   -- Stage 3 of the binary shift tree is defined here                           --
   --------------------------------------------------------------------------------
   s_stage3ShiftIn <= s_stage2Result( 15 DOWNTO 8 ) WHEN shifterMode = 1 ELSE
                      (OTHERS => s_stage2Result(2)) WHEN shifterMode = 3 ELSE
                      s_stage2Result( 7 DOWNTO 0 ) WHEN shifterMode = 4 ELSE
                      (OTHERS => '0');

   s_stage3Result  <= s_stage2Result
                         WHEN shiftAmount(3) = '0' ELSE
                      s_stage2Result( 7 DOWNTO 0 )&s_stage3ShiftIn
                         WHEN shifterMode = 0 OR shifterMode = 1 ELSE
                      s_stage3ShiftIn&s_stage2Result( 15 DOWNTO 8 );

   --------------------------------------------------------------------------------
   -- The result is assigned here                                                --
   --------------------------------------------------------------------------------
   result <= s_stage3Result;

END platformIndependent;
