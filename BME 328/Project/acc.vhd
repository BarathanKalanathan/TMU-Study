library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity acc is
	port (d	:	in unsigned (7 downto 0);
			shl_acc, shr_acc, clock, reset	:	in std_logic;
			q	:	out unsigned  (7 downto 0));
end acc;

architecture behavior of acc is
signal store_signal	:	unsigned (7 downto 0) := (others => '0');
begin
	process (shl_acc, clock, reset, shr_acc, d)
	begin
		if reset = '0' then
			store_signal <= "00000000";
		elsif ((reset='1') and (rising_edge(clock))) then
			store_signal <= d;
			if shl_acc ='1' then
				store_signal <= store_signal sll 1;
			end if;
			if shr_acc = '1' then
				store_signal <= store_signal srl 1;
			end if;
		end if;
	end process;
	q <= store_signal;
end behavior;