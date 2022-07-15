-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component bcd  is
 port (A3,A2,A1,A0: in std_logic; Y: out std_logic);
	end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: bcd
			port map (
					-- order of inputs A3A2A1A0 B3B2B1B0 M C_out S3S2S1S0 11111
					
					A3 => input_vector(3),
					A2 => input_vector(2),
					A1 => input_vector(1),
					A0 => input_vector(0),

					Y=> output_vector(0));

end DutWrap;

