library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
component scrabble is 
	port (Input: in std_logic_vector(3 downto 0);
			Y : out std_logic); 
end component;
	
begin  

add_instance: scrabble
			port map (
					Input(3) => input_vector(3),
					Input(2) => input_vector(2),
					Input(1) => input_vector(1),
					Input(0) => input_vector(0),
					Y => output_vector(0));

end DutWrap;