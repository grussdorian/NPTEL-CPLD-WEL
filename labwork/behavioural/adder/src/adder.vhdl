library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity adder is 
	port (A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0); M: in std_logic;
			S : out std_logic_vector(4 downto 0)); 
end entity;
					
			
architecture beh of adder is
	
	function add(A: std_logic_vector	:= "0000";B: std_logic_vector := "0000";M: std_logic := '0') return std_logic_vector is
		variable c: std_logic_vector(4 downto 0);	variable B_new: std_logic_vector(3 downto 0); variable T: std_logic_vector(4 downto 0);
		begin

			for i in 0 to 3 loop
				B_new(i) := B(i) xor M;
			end loop;
				
			c(0) := M;

			for i in 0 to 3 loop

					T(i) := A(i) xor B_new(i) xor C(i);
					c(i+1) := (((A(i) xor B_new(i)) and c(i)) or (A(i) and B_new(i)));
		 
		end loop;
		T(4) := c(4); 
		return T;
	end function add;
	
begin

	process(A,B,M)
	begin
	S <= add(A,B,M);
	end process;

end beh;