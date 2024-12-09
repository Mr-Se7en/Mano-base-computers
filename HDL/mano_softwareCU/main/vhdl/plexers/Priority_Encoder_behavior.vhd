--==============================================================================
=========================================================================

ARCHITECTURE platformIndependent OF Priority_Encoder IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_address       : std_logic_vector( 5 DOWNTO 0 );
   SIGNAL s_inIsZero      : std_logic;
   SIGNAL s_selectVector0 : std_logic_vector( 63 DOWNTO 0 );
   SIGNAL s_selectVector1 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_selectVector2 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_selectVector3 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_selectVector4 : std_logic_vector( 3 DOWNTO 0 );

BEGIN

   -- Output Signals
   groupSelect <= NOT(s_inIsZero) AND enable;
   enableOut   <= s_inIsZero AND enable;
   address     <= (OTHERS => '0') WHEN enable = '0' ELSE
                  s_address(nrOfSelectBits-1 DOWNTO 0);

   -- Control Signals
   s_inIsZero  <= '1' WHEN inputVector = std_logic_vector(to_unsigned(0,nrOfInputBits)) ELSE '0';

   -- Processes
   makeAddr : PROCESS(inputVector, s_selectVector0, s_selectVector1, s_selectVector2, s_selectVector3, s_selectVector4) IS
   BEGIN
      s_selectVector0(63 DOWNTO nrOfInputBits)  <= (OTHERS => '0');
      s_selectVector0(nrOfInputBits-1 DOWNTO 0) <= inputVector;
      IF (s_selectVector0(63 DOWNTO 32) = X"00000000") THEN s_address(5)      <= '0';
                                                            s_selectVector1 <= s_selectVector0(31 DOWNTO 0);
                                                       ELSE s_address(5)      <= '1';
                                                            s_selectVector1 <= s_selectVector0(63 DOWNTO 32);
      END IF;
      IF (s_selectVector1(31 DOWNTO 16) = X"0000") THEN s_address(4)      <= '0';
                                                        s_selectVector2 <= s_selectVector1(15 DOWNTO 0);
                                                   ELSE s_address(4)      <= '1';
                                                        s_selectVector2 <= s_selectVector1(31 DOWNTO 16);
      END IF;
      IF (s_selectVector2(15 DOWNTO 8) = X"00") THEN s_address(3)      <= '0';
                                                     s_selectVector3 <= s_selectVector2(7 DOWNTO 0);
                                                ELSE s_address(3)      <= '1';
                                                     s_selectVector3 <= s_selectVector2(15 DOWNTO 8);
      END IF;
      IF (s_selectVector3(7 DOWNTO 4) = X"0") THEN s_address(2)      <= '0';
                                                   s_selectVector4 <= s_selectVector3(3 DOWNTO 0);
                                              ELSE s_address(2)      <= '1';
                                                   s_selectVector4 <= s_selectVector3(7 DOWNTO 4);
      END IF;
      IF (s_selectVector4(3 DOWNTO 2) = "00") THEN s_address(1) <= '0';
                                                   s_address(0) <= s_selectVector4(1);
                                              ELSE s_address(1) <= '1';
                                                   s_address(0) <= s_selectVector4(3);
      END IF;
   END PROCESS makeAddr;

END platformIndependent;
