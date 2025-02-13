LIBRARY ieee;
USE ieee.std_logic_1164.all ;
ENTITY seg7 IS
    PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           leds : OUT STD_LOGIC_VECTOR(0 TO 6)) ;
 END seg7;
 ARCHITECTURE Behavior OF seg7 IS
 BEGIN
     PROCESS (bcd)
     BEGIN
			
        CASE bcd IS        --   abcdef g
            
				WHEN "0000"
                          => leds <= "0000001";
            WHEN "0001"
                          => leds <= "1001111";
            WHEN "0010"
                          => leds <= "0010010";
            WHEN "0011"
                          => leds <= "0000110";
            WHEN "0100"
                          => leds <= "1001100";
            WHEN "0101"
                          => leds <= "0100100";
            WHEN "0110"
                          => leds <= "0100000";
            WHEN "0111"
                          => leds <= "0001111";
            WHEN "1000"
                          => leds <= "0000000";
            WHEN "1001"
                          => leds <= "0001100";
            WHEN OTHERS => leds <= "-------";
        END CASE;
     END PROCESS;
	  END Behavior;
	  
