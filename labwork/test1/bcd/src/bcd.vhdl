library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity bcd is
 port (A3,A2,A1,A0: in std_logic; Y: out std_logic);
end entity bcd;

architecture simple of bcd is

	signal t1,t2,t3,t4,B_bar: std_logic;
begin
	
	AND_GATE0: AND_2 port map(A=>A3,B=>A2,Y=>t1); 
	AND_GATE1: AND_2 port map(A=>A3,B=>A1,Y=>t2);
	INVERTER1: INVERTER port map(A=>A2,Y=>B_bar);
	AND_GATE2: AND_2 port map(A=>t2,B=>B_bar,Y=>t3); 
	
	OR_GATE0:  OR_2 port map(A=>t1,B=>t3,Y=>t4);
	INVERTER2: INVERTER port map(A=>t4,Y=>Y);

--	Y <= not (A3 and A2) or (A3 and (not A2) and A1);
end simple;