library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity students is
	port( inp:in std_logic_vector(4 downto 0);
			reset,clock:in std_logic;
			outp: out std_logic
		 );
end students;

architecture bhv of students is
---------------Define state type here-----------------------------
type state0 is (s0,s1,s2,s3); -- Fill other states here
type state1 is (s0,s1,s2,s3);

---------------Define signals of state type-----------------------

signal y_present0,y_next0: state0:=s0;
signal y_present1,y_next1: state1:=s0;
 signal outp0: std_logic := '0';
 signal outp1: std_logic := '0';
begin

	clock_proc:process(clock,reset)
	begin
		if(clock='1' and clock' event) then
			if(reset='1') then
				y_present0<= s0;
				y_present1<= s0;
				--Y_next<= rst;
			else
			-- Fill the code here
				Y_present0<=Y_next0;
				Y_present1<=Y_next1;
			end if;
		end if;
	end process clock_proc;

-- __________________________________________________ FSM 0


	state_transition_proc0:process(inp,y_present0)
	begin
		case y_present0 is
		when s0=>
			if(unsigned(inp)=2) then --b has been detected
				y_next0<= s1;-- Fill the code here
			else
				y_next0 <= s0;
			end if;
		when s1=>
			if(unsigned(inp)=15) then --bo has been detected
				y_next0<= s2;-- Fill the code here
			else
				y_next0 <= s1;
			end if;
		when s2=>
			if(unsigned(inp)=13) then --bom has been detected
				y_next0<= s3;-- Fill the code here
			else
				y_next0 <= s2;
			end if;
		when s3=>
			if(unsigned(inp)=2) then --bomb has been detected
				y_next0<= s1;-- Fill the code here
			else
				y_next0 <= s3;
			end if;
		end case;
	end process state_transition_proc0;
		
		
	output_proc0:process(y_present0, inp)
	begin
		case y_present0 is
			when s3=>
			if (unsigned(inp)=2) then
				outp0<='1';
			else
				outp0<='0';
			end if;
			when others=>
				outp0<='0';
			end case;
	end process output_proc0;
	
	
	-- _____________________________________ FSM 1
	
state_transition_proc1:process(inp,y_present1)
	begin
		case y_present1 is
		when s0=>
			if(unsigned(inp)=7) then --g has been detected
				y_next1<= s1;-- Fill the code here
			else
				y_next1 <= s0;
			end if;
		when s1=>
			if(unsigned(inp)=21) then --bo has been detected
				y_next1<= s2;-- Fill the code here
			else
				y_next1 <= s1;
			end if;
		when s2=>
			if(unsigned(inp)=14) then --bom has been detected
				y_next1<= s3;-- Fill the code here
			else
				y_next1 <= s2;
			end if;
		when s3=>
			if(unsigned(inp)=7) then --bomb has been detected
				y_next1<= s1;-- Fill the code here
			else
				y_next1 <= s3;
			end if;
		end case;
	end process state_transition_proc1;
		
		
	output_proc1:process(y_present1, inp)
	begin
		case y_present1 is
			when s2=>
			if (unsigned(inp)=14) then
				outp1<='1';
			else
				outp1<='0';
			end if;
			when others=>
				outp1<='0';
			end case;
	end process output_proc1;

	-- FINAL OUTPUT PROCESS
	
	output_final:process(outp1,outp0)
	begin
		outp <= outp1 or outp0;
	end process output_final;
		
	
	
	
end architecture bhv;