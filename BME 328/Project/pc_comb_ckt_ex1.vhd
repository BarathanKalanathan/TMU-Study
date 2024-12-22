library ieee;
use ieee.std_logic_1164.all;

entity pc_comb_ckt_ex1 is
	port (clock, reset	:	in std_logic;
			rc	:	in		std_logic_vector (7 downto 0);
			z	:	out	std_logic_vector (3 downto 0);
			ld_r1, ld_rc, dec_rc, shl_acc, shr_acc	:	out std_logic);
end pc_comb_ckt_ex1;

architecture behavior of pc_comb_ckt_ex1 is
type state_type is (s0, s1,s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13);
signal y	:	state_type;
signal control_signal	:	std_logic_vector (8 downto 0);
signal op					:	std_logic_vector (7 downto 0) := X"00";
begin 
	process (reset,clock)
	begin
		if reset='0' then
			y <= s0;
		elsif (clock'EVENt and clock='1') then
			case y is
				when s0=> y <= s1;
				when s1=> y <= s2;
				when s2=> y <= s3;
				when s3=> y <= s4;
				when s4=> y <= s5;
				when s5=> y <= s6;
				when s6=> y <= s7;
				when s7=> y <= s8;
				when s8=> y <= s9;
				when s9=> y <= s10;
				when s10=> y <= s11;
				when s11=> y <= s12;
				when s12=> y <= s13;
				when s13 =>
					if (reset ='0') then
						y <= s0;
					end if;
			end case;
		end if;
	end process;
	process (y)
	begin
		case y is
			when s0=> op <= X"0F"; --rest
			when s1=> op <= X"00"; --load R1 0
			when s2=> op <= X"07"; --and
			when s3=> op <= X"00"; --load X1
			when s4=> op <= X"02"; --add
			when s5=> op <= X"00"; --load X2
			when s6=> op <= X"02"; --add
			when s7=> op <= X"00"; --load X3
			when s8=> op <= X"02"; --add
			when s9=> op <= X"00"; --load X4
			when s10=> op <=X"02"; --add
			when s11=> op <=X"0C"; --SRA
			when s12=> op <=X"0C"; --SRA
			when s13=> op <=X"0F"; --rest
		end case;
		case op is
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