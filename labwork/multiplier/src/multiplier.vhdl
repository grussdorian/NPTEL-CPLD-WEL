library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

package Multiplier_package is

	component multiplier is
		port (A: in std_logic_vector(3 downto 0); B: in std_logic_vector(2 downto 0); M: out std_logic_vector(6 downto 0));
	end component multiplier;

end package Multiplier_package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.Full_adder_package.all;

entity multiplier is
	port (A: in std_logic_vector(3 downto 0); B: in std_logic_vector(2 downto 0); M: out std_logic_vector(6 downto 0));
end entity multiplier;


architecture Struct of multiplier is

--signal p01,p02,p03 : std_logic;
	signal t: std_logic_vector(3 downto 0);
	signal p: std_logic_vector(11 downto 0);
	
  component OR_4 is
	   port (A, B, C, D: in std_logic; Y: out std_logic);
end component OR_4;

  component AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component AND_2;
  
  component fourBitAdder  is
  port (A3,A2,A1,A0, B3,B2,B1,B0, M: in std_logic; S3,S2,S1,S0, C_out: out std_logic);
  end component;

begin
	prod: for i in 0 to 2 generate
	
		prod2: for j in 0 to 3 generate
		
			rule1: if i = 0 and j = 0 generate
				P(0) <=A(0) and B(0);
				M(0) <= p(0);
			end generate rule1;
			
		  rule2: if i=0 nand j=0 generate
				p(i*4 + j )  <= B(i) and A(j);
			end generate rule2;
		end generate prod2;
	end generate prod;
	
	adder0: fourBitAdder port map (A3 => '0', B3 => p(7), A2 => p(3), B2=> p(6) , A1=>p(2), B1=> p(5), A0=>p(1) , B0 =>p(4), M => '0',
	S3=>t(3),S2=>t(2), S1=>t(1),S0=>M(1), C_out =>t(0));
	
	adder1: fourBitAdder port map (A3 => t(0), B3 => p(11), A2 => t(3), B2=> p(10) , A1=>t(2), B1=> p(9), A0=>t(1) , B0 =>p(8), M => '0',
	S3=>M(5),S2=>M(4), S1=>M(3),S0=>M(2), C_out =>M(6));

end Struct;