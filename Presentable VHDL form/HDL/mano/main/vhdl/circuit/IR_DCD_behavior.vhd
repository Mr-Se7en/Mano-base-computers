--==============================================================================
=========================================================================

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
   SIGNAL s_Bus0 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_Net1 : std_logic;
   SIGNAL s_Net2 : std_logic;
   SIGNAL s_Net3 : std_logic;
   SIGNAL s_Net4 : std_logic;
   SIGNAL s_Net5 : std_logic;
   SIGNAL s_Net6 : std_logic;
   SIGNAL s_Net7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Bus0(2 DOWNTO 0) <= opc_in;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   d0_Load  <= s_Net6;
   d1_Store <= s_Net5;
   d2_ADD   <= s_Net7;
   d3_AND   <= s_Net4;
   d4_JUMP  <= s_Net3;
   d5_BSA   <= s_Net2;
   d6_ISZ   <= s_Net1;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Decoder_8
      PORT MAP ( decoderOut_0 => s_Net6,
                 decoderOut_1 => s_Net5,
                 decoderOut_2 => s_Net7,
                 decoderOut_3 => s_Net4,
                 decoderOut_4 => s_Net3,
                 decoderOut_5 => s_Net2,
                 decoderOut_6 => s_Net1,
                 decoderOut_7 => OPEN,
                 sel          => s_Bus0(2 DOWNTO 0) );


END platformIndependent;
