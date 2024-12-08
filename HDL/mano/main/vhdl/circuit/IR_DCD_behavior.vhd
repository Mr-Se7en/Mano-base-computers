--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano                                                         ==
--== Component : IR_DCD                                                       ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF IR_DCD IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(2 DOWNTO 0) <= opc_in;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   d0_Load  <= s_logisimNet6;
   d1_Store <= s_logisimNet5;
   d2_ADD   <= s_logisimNet7;
   d3_AND   <= s_logisimNet4;
   d4_JUMP  <= s_logisimNet3;
   d5_BSA   <= s_logisimNet2;
   d6_ISZ   <= s_logisimNet1;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Decoder_8
      PORT MAP ( decoderOut_0 => s_logisimNet6,
                 decoderOut_1 => s_logisimNet5,
                 decoderOut_2 => s_logisimNet7,
                 decoderOut_3 => s_logisimNet4,
                 decoderOut_4 => s_logisimNet3,
                 decoderOut_5 => s_logisimNet2,
                 decoderOut_6 => s_logisimNet1,
                 decoderOut_7 => OPEN,
                 sel          => s_logisimBus0(2 DOWNTO 0) );


END platformIndependent;
