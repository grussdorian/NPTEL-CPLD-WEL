-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component ThreeToEightDecoder  is
   port (A2,A1,A0,E_out: in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
	end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: ThreeToEightDecoder
			port map (
					-- order of inputs A3A2A1A0 B3B2B1B0 M C_out S3S2S1S0 11111
				
					A2 => input_vector(3),
					A1 => input_vector(2),
					A0 => input_vector(1),
					E_out  => input_vector(0),
					
					Y7 => output_vector(7),
					Y6 => output_vector(6),
					Y5 => output_vector(5),
					Y4 => output_vector(4),
					Y3 => output_vector(3),
					Y2 => output_vector(2),
					Y1 => output_vector(1),
					Y0 => output_vector(0));
end DutWrap;

