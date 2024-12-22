library ieee;
use ieee.std_logic_1164.all;

entity lab4b is
port(
			S			: in 			std_logic_vector(3 downto 0);
			L			: out			std_logic_vector(3 downto 0)
			);
		end lab4b;
		
architecture Behavior of lab4b is
begin

			L(3) <= '0';
			
			L(2) <= (not S(2) and not S(1) and not S(0)) or (not S(3) and S(2) and S(1) and not S(0));
			
			L(1) <= (not S(3) and S(2) and not S(0)) or (not S(3) and S(2) and S(1));
			
			L(0) <= (not S(3) and S(1)) or (not S(3) and not S(2) and not S(0)) or (not S(3) and S(2) and S(0));
			
end Behavior;
