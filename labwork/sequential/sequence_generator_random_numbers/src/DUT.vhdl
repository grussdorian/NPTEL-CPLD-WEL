library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(1 downto 0);
       	output_vector: out std_logic_vector(2 downto 0));
end entity;

architecture DutWrap of DUT is
component seq is 
	port( 
			reset,clock:in std_logic;
			outp: out std_logic_vector(2 downto 0)
		 );
end component seq;	
begin  

seq_instance: seq
			port map (
					reset => input_vector(1),
					clock => input_vector(0),
					outp => output_vector(2 downto 0)
					);
end DutWrap;