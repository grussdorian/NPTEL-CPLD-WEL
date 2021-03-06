library ieee;
use ieee.std_logic_1164.all;

entity decoder is 
	port (Input: in std_logic_vector(3 downto 0);
			Y : out std_logic_vector(7 downto 0)); 
end entity;
			
architecture beh of decoder is
begin

process(Input)
begin
		case Input is
      when "0001" =>
        Y <= "00000001";
		when "0011" =>
        Y <= "00000010";
		when "0101" =>
        Y <= "00000100";
		when "0111" =>
        Y <= "00001000";
		when "1001" =>
        Y <= "00010000";
		when "1011" =>
        Y <= "00100000";
		when "1101" =>
        Y <= "01000000";
		when "1111" =>
        Y <= "10000000";		  
	   when others =>
        Y <= "00000000";
    end case;
end process;

end beh;