library ieee;
use ieee.std_logic_1164.all;

entity pc_comb_ckt_ex2 is
	port(clock, resetn		:	in std_logic;
			RC						:	in std_logic_vector (7 downto 0);
			z						:	out std_logic_vector (3 downto 0);
			dec_rc, ld_r1, ld_rc, shl_acc, shr_acc	:	out std_logic);
end pc_comb_ckt_ex2;

architecture behavior of pc_comb_ckt_ex2 is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
	signal y : state_type;
	signal control_signal : std_logic_vector (8 downto 0);
	signal op : std_logic_vector (7 downto 0) := X"00";
	begin
		process (clock, resetn)
		begin
			if (resetn = '0') then
				y <= s0;
			elsif (clock'EVENT and clock='1') then
				case y is
					when s0 => y <= s1;
					when s1 => y <= s2;
					when s2 => y <= s3;
					when s3 => y <= s4;
					when s4 => y <= s5;
					when s5 => y <= s6;
					when s6 => y <= s7;
					when s7 => y <= s8;
					when s8=>
						if (RC /= X"00") then
							y <= s8;
						else
							y <= s9;
						end if;
					when s9 =>
						if (resetn = '0') then
							y <= s0;
						end if;
				end case;
			end if;
		end process;
		
		process (y)
		begin
			case y is
				when s0 => op <= X"0F"; --rest
				when s1 => op <= X"01"; --load rc 5
				when s2 => op <= X"0F"; --rest
				when s3 => op <= X"00"; --load rl 0
				when s4 => op <= X"0F"; --rest
				when s5 => op <= X"07"; --and
				when s6 => op <= X"00"; --load rl x
				when s7 => op <= X"0F"; --rest
				when s8 => op <= X"0D"; --dec_rc, result=result+x
				when s9 => op <= X"0F"; --when loop is done, rest
			end case;
			
			case op is
				when X"00" => control_signal <= "000010000"; --ldr1
				when X"01" => control_signal <= "000100000"; --ldrc
				when X"02" => control_signal <= "000000010"; --adda
				when X"03" => control_signal <= "000000011"; --suba
				when X"04" => control_signal <= "000000100"; --inca
				when X"05" => control_signal <= "000000101"; --deca
				when X"06" => control_signal <= "001000000"; --dec_rc
				when X"07" => control_signal <= "000000111"; --anda
				when X"08" => control_signal <= "000001000"; --ora
				when X"09" => control_signal <= "000001001"; --xora
				when X"0A" => control_signal <= "000001010"; --nanda
				when X"0B" => control_signal <= "010000000"; --sla
				when X"0C" => control_signal <= "100000000"; --sra
				when X"0D" => control_signal <= "001000010"; --bneq
				when others => control_signal<= "000000000"; --rest
			end case;
		end process;
		
		z <= control_signal(3 downto 0);
		ld_r1 <= control_signal(4);
		ld_rc <=control_signal(5);
		dec_rc <= control_signal(6);
		shl_acc <= control_signal(7);
		shr_acc <= control_signal(8);
end Behavior;