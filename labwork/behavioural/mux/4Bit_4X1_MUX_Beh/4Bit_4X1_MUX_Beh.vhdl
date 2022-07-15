library ieee;
use ieee.std_logic_1164.all;

entity MUX_4X1_4Bit is 
	port (In4, In3, In2, In1: in std_logic_vector(3 downto 0); S2, S1: in std_logic;
			Y : out std_logic_vector(3 downto 0)); 
end entity;
			
architecture beh of MUX_4X1_4Bit is
begin

process(S2, S1, In4, In3, In2, In1)
begin
	if (S2 = '1') and (S1 = '1') then
	Y <= In4;
	elsif (S2 = '1') and (S1 = '0') then
	Y <= In3;
	elsif (S2 = '0') and (S1 = '1') then
	Y <= In2;
	else
	Y <= In1;
	end if;
end process;

--Y <= (In4 and S2 and S1) or (In3 and S2 and not S1) or (In2 and not S2 and S1) or (In1 and not S2 and not S1);
--Error Input is 4bits and Select lines are 1 bit	
end beh;