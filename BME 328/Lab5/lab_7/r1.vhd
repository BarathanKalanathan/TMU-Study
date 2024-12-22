library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity r1 is
port (d					:	in unsigned (7 downto 0);
		ld_r1,clk	:	in std_logic;
		q					:	out unsigned (7 downto 0));
end r1;

architecture behavior of r1 is
signal d_signal, q_signal	:	unsigned (7 downto 0);
begin
	d_signal <= d;
	process (ld_r1)
	begin
		if (clk'EVENT and clk='1') then
			if ld_r1 = '1' then
				q_signal <= d_signal;
			end if;
		end if;
	end process;
	q<=q_signal;
end behavior;