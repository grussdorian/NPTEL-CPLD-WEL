library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq is
	port( 
			reset,clock:in std_logic;
			outp: out std_logic_vector(3 downto 0)
		 );
end seq;

architecture bhv of seq is
---------------Define state type here-----------------------------
type state is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15); -- Fill other states here

---------------Define signals of state type-----------------------
signal y_present,y_next: state:=s0;

begin

	clock_proc:process(clock,reset)
	begin
		if(clock='1' and clock' event) then
			if(reset='1') then
				y_present<= s1;
			else
			-- Fill the code here
				Y_present<=Y_next;
			end if;
		end if;
	end process clock_proc;


	state_transition_proc:process(y_present)
	begin
		case y_present is
		when s0=>
			y_next<= s1;-- Fill the code here
		when s1=>
			y_next<= s3;-- Fill the code here
		when s3=>
			y_next<= s5;-- Fill the code here
		when s5=>
			y_next<= s7;-- Fill the code here
		when s7=>
			y_next<= s9;-- Fill the code here
		when s9=>
			y_next<= s11;-- Fill the code here
		when s11=>
			y_next<= s13;-- Fill the code here
		when s13=>
			y_next<= s15;-- Fill the code here
		when s15=>
			y_next<= s1;-- Fill the code here
		when others=>
			y_next<= s1;
		end case;
	end process state_transition_proc;
		
	output_proc:process(y_present)
	begin
		case y_present is
			when s1=>
				outp<="0001";
			when s3=>
				outp<="0011";
			when s5=>
				outp<="0101";
			when s7=>
				outp<="0111";
			when s9=>
				outp<="1001";
			when s11=>
				outp<="1011";
			when s13=>
				outp<="1101";
			when s15=>
				outp<="1111";
			when others=>
				outp<="0001";
			end case;
	end process output_proc;
	
end architecture bhv;