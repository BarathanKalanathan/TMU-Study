library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rc is
port (d 						:	in unsigned(7 downto 0);
		ld_rc, dec_rc,clk	:	in std_logic;
		q						:	out unsigned (7 downto 0));
end rc;

architecture behavior of rc is
signal d_signal, q_signal	:	unsigned (7 downto 0);
begin
	d_signal <= d;
	process (clk,ld_rc, dec_rc)
	begin
		if (clk'EVENT and clk='1') then
			if ld_rc='1' then
				q_signal <= d_signal;
			elsif dec_rc='1' then
				q_signal <= q_signal-1;
			end if;
		end if;
	end process;
	q <= q_signal;
end behavior;