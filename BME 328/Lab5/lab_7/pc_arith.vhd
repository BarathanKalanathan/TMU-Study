library ieee;
use ieee.std_logic_1164.all;

entity pc_arith is
	port (clock, reset			:	in std_logic;
			s		:	out std_logic_vector (7 downto 0) := X"00";
			current : out std_logic_vector (3 downto 0));
end pc_arith;

architecture behavior of pc_arith is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10 ,s11 , s12, s13, s14, s15);
	signal y : state_type;
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
					when s13=> y <= s14;
					when s14=> y <= s15;
					when s15 =>
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
				when s2=> op <=X"07"; --and
				when s3=> op <=X"00"; --load X1
				when s4=> op <=X"02"; --add
				when s5=> op <=X"04"; --inc
				when s6 => op <= X"00"; --load X2
				when s7 => op <= X"02"; --add
				when s8 => op <= X"04";--inc
				when s9 => op <= X"00"; --load X3
				when s10 => op <= X"02"; -- add
				when s11 => op <= X"04"; --inc
				when s12 => op <= X"00"; --load X4
				when s13 => op <= X"02"; --add
				when s14 => op <= X"04"; --inc
				when s15 => op <= X"0F"; --rest
			end case;
			
			case y is
				when s0 => current <= X"0";
				when s1 => current <= X"1";
				when s2 => current <= X"2";
				when s3 => current <= X"3";
				when s4 => current <= X"4";
				when s5 => current <= X"5";
				when s6 => current <= X"6";
				when s7 => current <= X"7";
				when s8 => current <= X"8";
				when s9 => current <= X"9";
				when s10 => current <= X"A";
				when s11 => current <= X"B";
				when s12 => current <= X"C";
				when s13 => current <= X"D";
				when s14 => current <= X"E";
				when s15 => current <= X"F";
			end case;
		end process;
		s <= op;
end behavior;