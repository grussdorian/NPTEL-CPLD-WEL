library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(17 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
component MUX_4X1_4Bit is 
	port (In4, In3, In2, In1: in std_logic_vector(3 downto 0); S2, S1: in std_logic;
			Y : out std_logic_vector(3 downto 0)); 
end component;
	
begin  

add_instance: MUX_4X1_4Bit
			port map (
					In4 => input_vector(17 downto 14),
					In3 => input_vector(13 downto 10),
					In2 => input_vector(9 downto 6),
					In1 => input_vector(5 downto 2),
					S2 => input_vector(1),
	         	S1 => input_vector(0),
					Y => output_vector(3 downto 0));

end DutWrap;