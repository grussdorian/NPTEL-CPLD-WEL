-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(11 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component barrelShifter  is
  port (X7, X6, X5, X4, X3, X2, X1, X0, b3,b2,b1,  L : in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
	end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: barrelShifter
			port map (
					-- order of inputs A3A2A1A0 B3B2B1B0 M C_out S3S2S1S0 11111
					
					L => input_vector(11),
					
					B3 => input_vector(10),
					B2 => input_vector(9),
					B1 => input_vector(8),
					
					X7 => input_vector(7),
					X6 => input_vector(6),
					X5 => input_vector(5),
					X4 => input_vector(4),
					X3 => input_vector(3),
					X2 => input_vector(2),
					X1 => input_vector(1),
					X0 => input_vector(0),
					
					Y7 => output_vector(7),
					Y6 => output_vector(6),
					Y5 => output_vector(5),
					Y4 => output_vector(4),
					Y3 => output_vector(3),
					Y2 => output_vector(2),
					Y1 => output_vector(1),
					Y0 => output_vector(0));
end DutWrap;

