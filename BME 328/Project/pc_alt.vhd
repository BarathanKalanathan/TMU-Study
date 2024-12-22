library ieee;
use ieee.std_logic_1164.all;

entity pc_logic is
	port (clock, reset			:	in std_logic;
			s		:	out std_logic_vector (7 downto 0) := X"00");
end pc_logic;

architecture behavior of pc_logic is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10 ,s11 , s12, s13, s14, s15, s16, s17, s18, s19, s20);
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
					when s15=> y <= s16;
					when s16=> y <= s17;
					when s17=> y <= s18;
					when s18=> y <= s19;
					when s19=> y <= s20;
					when s20 =>
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
				when s6=> op <= X"08"; --acc or x2
				when s7=> op <= X"00"; --load X3
				when s8=> op <= X"07"; --acc and x3
				when s9=> op <= X"00"; --load R1 0
				when s10=> op <=X"07"; --and
				when s11=> op <=X"00"; --load X1
				when s12=> op <=X"02"; --add
				when s13=> op <=X"00"; --load Y1
				when s14 => op <= X"03"; --acc-Y1
				when s15 => op <= X"00"; --load X2
				when s16 => op <= X"02";--add
				when s17 => op <= X"00"; --load Y2
				when s18 => op <= X"03"; -- subtract
				when s19 => op <= X"0B"; --shift left
				when s20 => op <= X"0F"; --rest
			end case;
		end process;
		s <= op;
end behavior;