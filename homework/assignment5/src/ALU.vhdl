library ieee;
use ieee.std_logic_1164.all;


entity alu_beh is
port (A: in std_logic_vector(3 downto 0);
B: in std_logic_vector(3 downto 0);
sel: in std_logic_vector(1 downto 0);
op: out std_logic_vector(5 downto 0)
);
end alu_beh;


architecture a1 of alu_beh is

	
	function xoring(A: in std_logic_vector(3 downto 0) :="0000"; B: in std_logic_vector(3 downto 0):="0000")
	return std_logic_vector is
	variable T: std_logic_vector(3 downto 0):=(others =>'0');
	begin
		for i in 0 to 3 loop
				T(i) := A(i) xor B(i);
		end loop;
		return T;
	end function xoring;
	

	function sub(A: std_logic_vector	:= "0000";B: std_logic_vector := "0000") return std_logic is
		variable c: std_logic_vector(4 downto 0);
		variable B_new: std_logic_vector(3 downto 0);
		variable T: std_logic_vector(3 downto 0);
		begin
		--	A_new := "0000" & A;
		--	B_temp := "0000" & B;
			for i in 0 to 3 loop
				B_new(i) := not (B(i));
			end loop;
				
			c(0) := '1';

			for i in 0 to 3 loop
					T(i) := A(i) xor B_new(i) xor c(i);
					c(i+1) := (((A(i) xor B_new(i)) and c(i)) or (A(i) and B_new(i)));
		 	end loop;

--		T(4) := c(4);
--		T(5) := '0';
--		T(6) := '0';
--		T(7) := '0';
		
		return c(4);
	end function sub;


	function equal(A: std_logic_vector	:= "0000";B: std_logic_vector := "0000") return std_logic_vector is
		variable T: std_logic_vector(3 downto 0) := "0000";
	begin
		for i in 0 to 3 loop
			T(i) := A(i) xor B(i);
		end loop;
		
		if T = "0000"
		then 
			return "00" & A;
		else
			return "000000";
		end if;
		
	end function equal;
	
	
	
		
	
	function max(A: std_logic_vector	:= "0000"; B: std_logic_vector := "0000") return std_logic_vector is
		variable T: std_logic := '0';
		variable E: std_logic_vector(5 downto 0) := "000000";
	begin
		E := equal(A,B);
		T := sub(A,B);
			if E /= "000000"
			then 
				return "000000";
			else
				if T='1'
				then
					return ("00" & A);
				else
					return ("00" & B);
				end if;
			end if;
	end function max;
	
	
	function complement(A: std_logic_vector:= "0000") return std_logic_vector is
		variable A_bar: std_logic_vector(3 downto 0) := "0000";
	begin
		for i in 0 to 3 loop
			A_bar(i) := not A(i);
		end loop;
		
		return "00" & A_bar;
	end function complement;


	function anding(A: std_logic_vector:= "0000";B: std_logic_vector:="0000") return std_logic_vector is
		variable A_and_B: std_logic_vector(3 downto 0) := "0000";
	begin
		for i in 0 to 3 loop
			A_and_B(i) := B(i) and A(i);
		end loop;
		return  "00" & A_and_B;
	end function anding;
	
	
	function mul(A: in std_logic_vector(3 downto 0) :="0000")
	return std_logic_vector is
	variable T: std_logic_vector(7 downto 0):=(others =>'0');
	begin
		for i in 1 to 4 loop
				T(i) := A(i-1);
		end loop;
		T(7 downto 5) := "000";
		T(0) := '0';
		return T;
	end function mul;
	
	begin
	alu : process( A, B, sel )
	begin
		case sel is
			when "00" =>
				op <= max(A,B);
			when "01" =>
				op <= anding(A,B);
			when "10" =>
				op <= complement(A);
			when others =>
				op <= equal(A,B);
		end case;
	end process ; --alu
end a1 ; -- a1