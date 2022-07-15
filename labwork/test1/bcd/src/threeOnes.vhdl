library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity threeOnes is
 port (A3,A2,A1,A0: in std_logic; Y: out std_logic);
end entity threeOnes;

architecture simple of threeOnes is

	signal t1,t2,t3,t4,t5,t6,t7,t8: std_logic;
begin
	x0: XOR_2 port map (A=>A0,B=>A1,Y=>t1);
	x1: XOR_2 port map (A=>A2, B=>A3, Y =>t2);
	
	AND_GATE0: AND_2 port map(A=>A3,B=>A2,Y=>t3); 
	AND_GATE1: AND_2 port map(A=>A1,B=>A0,Y=>t4);	
	
	AND_GATE2: AND_2 port map(A=>t3,B=>t1,Y=>t5); 
	AND_GATE3: AND_2 port map(A=>t2,B=>t4,Y=>t6);	
	
	OR_GATE0:  OR_2 port map(A=>t5,B=>t6,Y=>Y);

end simple;