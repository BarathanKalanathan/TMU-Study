library ieee;
use ieee.std_logic_1164.all;

entity Counter is
    port (C1rn, E, C1kn : in std_logic;
             STUDENT_ID :  out std_logic_vector (3 downto 0);
	Q : out std_logic_vector (0 to 2));
end Counter;

architecture Behavior of Counter is
     signal Qreg : std_logic_vector (0 to 2);
begin
    process (C1rn, C1kn)
    begin
         if (C1rn = '1') then
             Qreg <= "000";
         elsif (C1kn 'event and C1kn = '0') then
             if E = '1' then
                 Qreg (0) <= not Qreg (2);
                 Qreg (1) <= Qreg (0);
                 Qreg (2) <= Qreg (1);
             else
                 Qreg <= Qreg;
             end if;
         end if;
                              -- the last 6 digits of my student ID are 121734
                              -- modify the next case statement
										--the last 6 digits of your student ID based on the
										--corresponding states of the Barathan counter.
case Qreg is
when "000" => STUDENT_ID <=  "0001";
when "100" => STUDENT_ID <=  "0010";
when "110" => STUDENT_ID <=  "0001";
when "111" => STUDENT_ID <=  "0111";
when "011" => STUDENT_ID <=  "0011";
when "001" => STUDENT_ID <=  "0100";
when others => STUDENT_ID <= "----"; 
end case;
end process;
Q <= Qreg;
End Behavior;
