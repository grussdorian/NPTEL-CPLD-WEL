library ieee;
use ieee.std_logic_1164.all;

entity scrabble is 
	port (Input: in std_logic_vector(3 downto 0);
			Y : out std_logic); 
end entity;
			
architecture beh of scrabble is
begin

process(Input)
begin
	if ((Input(3) = '0') and (Input(2) = '0') and (Input(1) = '0') and (Input(0) = '1')) or
	((Input(3) = '0') and (Input(2) = '0') and (Input(1) = '1') and (Input(0) = '0')) or
	((Input(3) = '1') and (Input(2) = '1') and (Input(1) = '0') and (Input(0) = '1')) or
	((Input(3) = '1') and (Input(2) = '1') and (Input(1) = '1') and (Input(0) = '0'))
	
	then	Y <= '1';
	
	else
	Y <= '0';
	
	end if;
end process;
	
end beh;