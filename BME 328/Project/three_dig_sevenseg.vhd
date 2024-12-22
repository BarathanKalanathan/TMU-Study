library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
ENTITY three_dig_sevenseg IS
		PORT (D			:IN std_logic_vector (7 downto 0);
				state		:in std_logic_vector (3 downto 0);
				d_one		:OUT std_logic_vector (1 to 7);
				d_two		:out std_logic_vector (1 to 7);
				currentstate	:	out std_logic_vector (1 to 7));
END three_dig_sevenseg;
ARCHITECTURE behavior OF three_dig_sevenseg IS
begin
	process (D)
	begin
				CASE D(3 downto 0) IS
					WHEN "0000" => d_one <= "0000001";
					WHEN "0001" => d_one <= "1001111";
					WHEN "0010" => d_one<= "0010010";
					WHEN "0011" => d_one<= "0000110";
					WHEN "0100" => d_one<= "1001100";
					WHEN "0101" => d_one<= "0100100";
					WHEN "0110" => d_one<= "0100000";
					WHEN "0111" => d_one <= "0001111";
					when "1000" => d_one <= "0000000";
					when "1001" => d_one <= "0000100";
					when "1010" => d_one <= "0000010";
					when "1011" => d_one <= "1100000";
					when "1100" => d_one <= "0110001";
					when "1101" => d_one <= "1000010";
					when "1110" => d_one <= "0110000";
					when "1111" => d_one <= "0111000";
					WHEN OTHERS => d_one <= "-------";
				END CASE;
				
				case D(7 downto 4) is
					WHEN "0000" => d_two<= "0000001";
					WHEN "0001" => d_two <= "1001111";
					WHEN "0010" => d_two<= "0010010";
					WHEN "0011" => d_two<= "0000110";
					WHEN "0100" => d_two<= "1001100";
					WHEN "0101" => d_two<= "0100100";
					WHEN "0110" => d_two<= "0100000";
					WHEN "0111" => d_two <= "0001111";
					when "1000" => d_two <= "0000000";
					when "1001" => d_two <= "0000100";
					when "1010" => d_two <= "0000010";
					when "1011" => d_two <= "1100000";
					when "1100" => d_two <= "0110001";
					when "1101" => d_two <= "1000010";
					when "1110" => d_two <= "0110000";
					when "1111" => d_two <= "0111000";
					WHEN OTHERS => d_two <= "-------";
				end case;
				
				case state is
					WHEN "0000" => currentstate<= "0000001";
					WHEN "0001" => currentstate<= "1001111";
					WHEN "0010" => currentstate<= "0010010";
					WHEN "0011" => currentstate<= "0000110";
					WHEN "0100" => currentstate<= "1001100";
					WHEN "0101" => currentstate<= "0100100";
					WHEN "0110" => currentstate<= "0100000";
					WHEN "0111" => currentstate <= "0001111";
					when "1000" => currentstate <= "0000000";
					when "1001" => currentstate <= "0000100";
					when "1010" => currentstate <= "0000010";
					when "1011" => currentstate <= "1100000";
					when "1100" => currentstate <= "0110001";
					when "1101" => currentstate <= "1000010";
					when "1110" => currentstate <= "0110000";
					when "1111" => currentstate <= "0111000";
					WHEN OTHERS => currentstate <= "-------";
				end case;
		END PROCESS;
END behavior;	