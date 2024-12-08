--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : mano_softwareCU                                              ==
--== Component : Multiplexer_bus_4                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Multiplexer_bus_4 IS 

BEGIN

   makeMux : PROCESS(enable,
                     muxIn_0,
                     muxIn_1,
                     muxIn_2,
                     muxIn_3,
                     sel) IS
   BEGIN
      IF (enable = '0') THEN
         muxOut <= (OTHERS => '0');
                        ELSE
         CASE (sel) IS
            WHEN "00" => muxOut <= muxIn_0;
            WHEN "01" => muxOut <= muxIn_1;
            WHEN "10" => muxOut <= muxIn_2;
            WHEN OTHERS  => muxOut <= muxIn_3;
         END CASE;
      END IF;
   END PROCESS makeMux;

END platformIndependent;
