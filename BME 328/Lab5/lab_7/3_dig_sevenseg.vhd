library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
ENTITY seven_seg_decoder IS
		PORT (D			:IN std_logic_vector (7 downto 0);
				ones			:OUT std_logic_vector (1 to 7);
				tens			:out std_logic_vector (1 to 7);
				hunds			:out std_logic_vector (1 to 7));
END seven_seg_decoder;
ARCHITECTURE behavior OF seven_seg_decoder IS
SIGNAL A		:	real := D;
begin
	process (A)
				CASE A[0] IS
					WHEN "0000" => ones <= "0000001";
					WHEN "0001" => ones <= "1001111";
					WHEN "0010" => ones<= "0010010";
					WHEN "0011" => ones<= "0000110";
					WHEN "0100" => ones<= "1001100";
					WHEN "0101" => ones<= "0100100";
					WHEN "0110" => ones<= "0100000";
					WHEN "0111" => ones <= "0001111";
					when "1000" => ones <= "0000000";
					when "1001" => ones <= "0000100";
					WHEN OTHERS => S <= "-------";
				END CASE;
		END PROCESS;
END behavior;	