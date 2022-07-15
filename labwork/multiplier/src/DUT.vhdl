-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(6 downto 0);
       	output_vector: out std_logic_vector(6 downto 0));
end entity;

architecture DutWrap of DUT is
   component multiplier is
		port (A: in std_logic_vector(3 downto 0); B: in std_logic_vector(2 downto 0); M: out std_logic_vector(6 downto 0));
  end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: multiplier
			port map (
					-- order of inputs A3A2A1A0 B3B2B1B0 1111111
					A => input_vector(6 downto 3),
					B => input_vector(2 downto 0),
					
					M => output_vector(6 downto 0));
end DutWrap;

