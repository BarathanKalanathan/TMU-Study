library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity alu is
port( a, b			:	in std_logic_vector (7 downto 0);
		alu_opcode	:	in std_logic_vector (3 downto 0);
		output_bus	:	out std_logic_vector (7 downto 0));
end alu;

architecture behavior of alu is
	signal alu_result	:	std_logic_vector (7 downto 0);
	begin
	process (a, b, alu_opcode)
	begin
		case (alu_opcode) is
			when "0000" => alu_result <= b;
			when "0001" => alu_result <= b;
			when "0010" => alu_result <= a+b;
			when "0011" => alu_result <= a-b;
			when "0100" => alu_result <= b+1;
			when "0101" => alu_result <= b-1;
			when "0110" => alu_result <= b;
			when "0111" => alu_result <= a and b;
			when "1000" => alu_result <= a or b;
			when "1001" => alu_result <= a xor b;
			when "1010" => alu_result <= a nand b;
			when "1011" => alu_result <= b;
			when "1100" => alu_result <= b;
			when "1101" => alu_result <= b;
			when "1110" => alu_result <= b;
			when "1111" => alu_result <= b;
		end case;
	end process;
	output_bus <= alu_result;
end behavior;