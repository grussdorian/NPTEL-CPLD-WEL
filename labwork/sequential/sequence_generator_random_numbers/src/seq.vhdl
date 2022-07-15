library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq is
	port( 
			reset,clock:in std_logic;
			outp: out std_logic_vector(2 downto 0)
		 );
end seq;

architecture bhv of seq is
---------------Define state type here-----------------------------
type state is (s0,s1,s2,s3,s4,s5,s6,s7); -- Fill other states here

---------------Define signals of state type-----------------------
signal y_present,y_next: state:=s0;

begin

	clock_proc:process(clock,reset)
	begin
		if(clock='1' and clock' event) then
			if(reset='1') then
				y_present<= s6;
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
			y_next<= s6;-- Fill the code here
		when s1=>
			y_next<= s3;-- Fill the code here
		when s2=>
			y_next<= s0;-- Fill the code here
		when s3=>
			y_next<= s5;-- Fill the code here
		when s4=>
			y_next<= s2;-- Fill the code here
		when s5=>
			y_next<= s4;-- Fill the code here
		when s6=>
			y_next<= s7;-- Fill the code here
		when s7=>
			y_next<= s1;-- Fill the code here
		when others=>
			y_next<= s6;
		end case;
	end process state_transition_proc;
		
	output_proc:process(y_present)
	begin
		case y_present is
			when s1=>
				outp<="001";
			when s3=>
				outp<="011";
			when s5=>
				outp<="101";
			when s7=>
				outp<="111";
			when s2=>
				outp<="010";
			when s4=>
				outp<="100";
			when s6=>
				outp<="110";
			when s0=>
				outp<="000";
			when others=>
				outp<="110";
			end case;
	end process output_proc;
	
end architecture bhv;