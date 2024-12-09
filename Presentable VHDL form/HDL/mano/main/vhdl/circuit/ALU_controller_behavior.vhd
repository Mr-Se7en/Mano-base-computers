--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF ALU_controller IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

      COMPONENT AND_GATE_BUS
         GENERIC ( BubblesMask : std_logic_vector;
                   NrOfBits    : INTEGER );
         PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT OR_GATE_BUS
         GENERIC ( BubblesMask : std_logic_vector;
                   NrOfBits    : INTEGER );
         PORT ( input1 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                input2 : IN  std_logic_vector( (NrOfBits - 1) DOWNTO 0 );
                result : OUT std_logic_vector( (NrOfBits - 1) DOWNTO 0 ) );
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Bus11 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus12 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus15 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus3  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Bus4  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Net0  : std_logic;
   SIGNAL s_Net1  : std_logic;
   SIGNAL s_Net10 : std_logic;
   SIGNAL s_Net13 : std_logic;
   SIGNAL s_Net14 : std_logic;
   SIGNAL s_Net2  : std_logic;
   SIGNAL s_Net5  : std_logic;
   SIGNAL s_Net6  : std_logic;
   SIGNAL s_Net7  : std_logic;
   SIGNAL s_Net8  : std_logic;
   SIGNAL s_Net9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_Bus15(0) <= s_Net7;
   s_Bus15(1) <= s_Net7;
   s_Bus4(0)  <= s_Net8;
   s_Bus4(1)  <= s_Net8;

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_Net1  <= t4;
   s_Net10 <= d0;
   s_Net14 <= d3;
   s_Net5  <= t5;
   s_Net9  <= d2;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   add  <= '0';
   mode <= s_Bus12(1 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_Bus11(1 DOWNTO 0)  <=  "10";


   -- Power
    s_Net13  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net5,
                 input2 => s_Net10,
                 result => s_Net2 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net9,
                 input2 => s_Net5,
                 result => s_Net6 );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net1,
                 input2 => s_Net9,
                 result => s_Net7 );

   GATES_4 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net14,
                 input2 => s_Net1,
                 result => s_Net8 );

   GATES_5 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_Net7,
                 input2 => s_Net6,
                 result => s_Net0 );

   GATES_6 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 2 )
      PORT MAP ( input1 => s_Bus15(1 DOWNTO 0),
                 input2 => s_Bus11(1 DOWNTO 0),
                 result => s_Bus3(1 DOWNTO 0) );

   GATES_7 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask => "00",
                    NrOfBits    => 2 )
      PORT MAP ( input1 => s_Bus4(1 DOWNTO 0),
                 input2 => s_Bus3(1 DOWNTO 0),
                 result => OPEN );

   PLEXERS_8 : Priority_Encoder
      GENERIC MAP ( nrOfInputBits  => 4,
                    nrOfSelectBits => 2 )
      PORT MAP ( address        => s_Bus12(1 DOWNTO 0),
                 enable         => s_Net13,
                 enableOut      => OPEN,
                 groupSelect    => OPEN,
                 inputVector(0) => s_Net8,
                 inputVector(1) => '0',
                 inputVector(2) => s_Net0,
                 inputVector(3) => s_Net2 );


END platformIndependent;
