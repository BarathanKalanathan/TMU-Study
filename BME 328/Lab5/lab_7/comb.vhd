library ieee;
use ieee.std_logic_1164.all;

entity comb is
	port (s		:	in std_logic_vector (7 downto 0);
			rc		:	in std_logic_vector (7 downto 0);
			z						:	out std_logic_vector (3 downto 0);
			ld_r1, ld_rc, dec_rc, shl_acc, shr_acc	:	out std_logic);
end comb;

architecture behavior of comb is
signal control_signal : std_logic_vector(8 downto 0);
begin
	process (s)
	begin
		case s is
			when X"00" => control_signal <= "000010000"; --ldr1
			when X"01" => control_signal <= "000100000"; --ldrc
			when X"02" => control_signal <= "000000010"; --adda
			when X"03" => control_signal <= "000000011"; --suba
			when X"04" => control_signal <= "000000100"; --inca
			when X"05" => control_signal <= "000000011"; --deca
			when X"06" => control_signal <= "001000000"; --dec_rc
			when X"07" => control_signal <= "000000111"; --anda
			when X"08" => control_signal <= "000001000"; --ora
			when X"09" => control_signal <= "000001001"; --xora
			when X"0A" => control_signal <= "000001010"; --nanda
			when X"0B" => control_signal <= "010000000"; --sla
			when X"0C" => control_signal <= "100000000"; --sra
			when X"0D" => control_signal <= "000000000"; --bneq
			when others => control_signal <= "000000000"; --rest
		end case;
	end process;
	
	z <= control_signal(3 downto 0);
	ld_r1 <= control_signal(4);
	ld_rc <= control_signal(5);
	dec_rc <= control_signal(6);
	shl_acc <= control_signal(7);
	shr_acc <= control_signal(8);
end behavior;