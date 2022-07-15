library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity div is
 port (A3,A2,A1,A0: in std_logic; Y: out std_logic);
end entity div;

architecture simple of div is

	signal t1,t2,t3,t4,t5,t6,t7,t8: std_logic;
begin
	x0: XOR_2 port map (A=>A0,B=>A1,Y=>t1);
	x1: XOR_2 port map (A=>A2, B=>A3, Y =>t2);
	
	n0: XNOR_2 port map (A=>A0,B=>A1, Y =>t3);
	n1: XNOR_2 port map (A=>A2, B=>A3, Y => t4);
	
	AND_GATE0: AND_2 port map(A=>t1,B=>t2,Y=>t5); 
	AND_GATE1: AND_2 port map(A=>t3,B=>t4,Y=>t6);	
	
	OR_GATE0:  OR_2 port map(A=>t5,B=>t6,Y=>Y);

end simple;