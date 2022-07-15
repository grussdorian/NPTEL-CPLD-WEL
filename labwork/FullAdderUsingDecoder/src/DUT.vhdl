-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(1 downto 0));
end entity;

architecture DutWrap of DUT is
   component fullAdder is
   port (A,B,C_in: in std_logic; S,C_out: out std_logic);
  end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: fullAdder
			port map (
					-- order of inputs A3A2A1A0 B3B2B1B0 M C_out S3S2S1S0 11111
				
					C_in => input_vector(0),
					B => input_vector(1),
					A => input_vector(2),
					
					S => output_vector(1),
					C_out => output_vector(0));
end DutWrap;

