library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
component adder is 
	port (A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0); M: in std_logic;
			S : out std_logic_vector(4 downto 0));
end component adder;	
begin  

adder_instance: adder
			port map (
					A => input_vector(8 downto 5),
					B => input_vector(4 downto 1),
					M => input_vector(0),
					
					S => output_vector(4 downto 0)
					);
end DutWrap;