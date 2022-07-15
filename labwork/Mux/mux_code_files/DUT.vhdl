-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(17 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
   component FourXFourMux  is
  port (D3,D2,D1,D0, C3,C2,C1,C0, B3,B2,B1,B0, A3,A2,A1,A0, S0,S1: in std_logic; S3_out, S2_out, S1_out, S0_out: out std_logic);
	end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: FourXFourMux
			port map (
					-- order of inputs A3A2A1A0 B3B2B1B0 M C_out S3S2S1S0 11111
					
					D3 => input_vector(17),
					D2 => input_vector(16),
					D1 => input_vector(15),
					D0 => input_vector(14),
					
					C3 => input_vector(13),
					C2 => input_vector(12),
					C1 => input_vector(11),
					C0 => input_vector(10),
					
					B3 => input_vector(9),
					B2 => input_vector(8),
					B1 => input_vector(7),
					B0 => input_vector(6),
					
					A3 => input_vector(5),
					A2 => input_vector(4),
					A1 => input_vector(3),
					A0 => input_vector(2),
					
					S1 => input_vector(1),
					S0 => input_vector(0),
					
					S3_out => output_vector(3),
					S2_out => output_vector(2),
					S1_out => output_vector(1),
					S0_out => output_vector(0));
end DutWrap;

