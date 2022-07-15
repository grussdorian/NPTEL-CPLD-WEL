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
type state2 is (s0,s1,s2,s3,s4,s5,s6);
type state3 is (s0,s1,s2,s3,s4,s5);
type state4 is (rst,s1,s2,s3,s4,s5,s6,s7);



---------------Define signals of state type-----------------------

signal y_present0,y_next0: state0:=s0;
signal y_present1,y_next1: state1:=s0;
signal y_present2,y_next2: state2:=s0;
signal y_present3,y_next3: state3:=s0;
signal y_present4,y_next4: state4:=rst;

 signal outp0: std_logic := '0';
 signal outp1: std_logic := '0';
 signal outp2: std_logic := '0';
 signal outp3: std_logic := '0';
 signal outp4: std_logic := '0';
 
begin

	clock_proc:process(clock,reset)
	begin
		if(clock='1' and clock' event) then
			if(reset='1') then
				y_present0<= s0;
				y_present1<= s0;
				y_present2<= s0;
				y_present3<= s0;
				y_present4<= rst;
				
				--Y_next<= rst;
			else
			-- Fill the code here
				Y_present0<=Y_next0;
				Y_present1<=Y_next1;
				Y_present2<=Y_next2;
				Y_present3<=Y_next3;
				Y_present4<=Y_next4;
				
			end if;
		end if;
	end process clock_proc;

-- __________________________________________________ FSM 0 "bomb"


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
	
	
	-- _____________________________________ FSM 1		"gun"
	
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
			if(unsigned(inp)=21) then --gu has been detected
				y_next1<= s2;-- Fill the code here
			else
				y_next1 <= s1;
			end if;
		when s2=>
			if(unsigned(inp)=14) then --gun has been detected
				y_next1<= s3;-- Fill the code here
			else
				y_next1 <= s2;
			end if;
		when s3=>
			if(unsigned(inp)=7) then --g has been detected
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
	
	
	-- _____________________________________ FSM 2 "terror"

	state_transition_proc2:process(inp,y_present2)
	begin
		case y_present2 is
		when s0=>
			if(unsigned(inp)=20) then --t has been detected
				y_next2<= s1;-- Fill the code here
			else
				y_next2 <= s0;
			end if;
		when s1=>
			if(unsigned(inp)=5) then --te has been detected
				y_next2<= s2;-- Fill the code here
			else
				y_next2 <= s1;
			end if;
		when s2=>
			if(unsigned(inp)=18) then --ter has been detected
				y_next2<= s3;-- Fill the code here
			else
				y_next2 <= s2;
			end if;
		when s3=>
			if(unsigned(inp)=18) then --terr has been detected
				y_next2<= s4;-- Fill the code here
			else
				y_next2 <= s3;
			end if;
		when s4=>
			if(unsigned(inp)=15) then --terro has been detected
				y_next2<= s5;-- Fill the code here
			else
				y_next2 <= s4;
			end if;
		when s5=>
			if(unsigned(inp)=18) then --terror has been detected
				y_next2<= s6;-- Fill the code here
			else
				y_next2 <= s5;
			end if;
		when s6=>
			if(unsigned(inp)=20) then --t has been detected
				y_next2<= s1;-- Fill the code here
			else
				y_next2 <= s6;
			end if;	
		end case;
	end process state_transition_proc2;
		
		
	output_proc2:process(y_present2, inp)
	begin
		case y_present2 is
			when s5=>
			if (unsigned(inp)=18) then
				outp2<='1';
			else
				outp2<='0';
			end if;
			when others=>
				outp2<='0';
			end case;
	end process output_proc2;
		
	-- _____________________________________ FSM 3
	
	state_transition_proc3:process(inp,y_present3)
	begin
		case y_present3 is
		when s0=>
			if(unsigned(inp)=11) then --t has been detected
				y_next3<= s1;-- Fill the code here
			else
				y_next3 <= s0;
			end if;
		when s1=>
			if(unsigned(inp)=14) then --te has been detected
				y_next3<= s2;-- Fill the code here
			else
				y_next3 <= s1;
			end if;
		when s2=>
			if(unsigned(inp)=9) then --ter has been detected
				y_next3<= s3;-- Fill the code here
			else
				y_next3 <= s2;
			end if;
		when s3=>
			if(unsigned(inp)=6) then --terr has been detected
				y_next3<= s4;-- Fill the code here
			else
				y_next3 <= s3;
			end if;
		when s4=>
			if(unsigned(inp)=5) then --terro has been detected
				y_next3<= s5;-- Fill the code here
			else
				y_next3 <= s4;
			end if;
		when s5=>
			if(unsigned(inp)=11) then --terror has been detected
				y_next3<= s1;-- Fill the code here
			else
				y_next3 <= s5;
			end if;
		end case;
	end process state_transition_proc3;
		
		
	output_proc3:process(y_present3, inp)
	begin
		case y_present3 is
			when s4=>
			if (unsigned(inp)=5) then
				outp3<='1';
			else
				outp3<='0';
			end if;
			when others=>
				outp3<='0';
			end case;
	end process output_proc3;
	
	-- _____________________________________ FSM 4
	


	state_transition_proc4:process(inp,y_present4)
	begin
		case y_present4 is
		when rst=>
			if(unsigned(inp)=19) then --s has been detected
				y_next4<= s1;-- Fill the code here
			else
				y_next4 <= rst;
			end if;
		when s1=>
			if(unsigned(inp)=20) then --st has been detected
				y_next4<= s2;-- Fill the code here
			else
				y_next4 <= s1;
			end if;
		when s2=>
			if(unsigned(inp)=21) then --stu has been detected
				y_next4<= s3;-- Fill the code here
			else
				y_next4 <= s2;
			end if;
		when s3=>
			if(unsigned(inp)=4) then --stud has been detected
				y_next4<= s4;-- Fill the code here
			else
				y_next4<= s3;
			end if;
		when s4=>
			if(unsigned(inp)=5) then --stude has been detected
				y_next4<= s5;-- Fill the code here
			else
				y_next4 <= s4;
			end if;
		when s5=>
			if(unsigned(inp)=14) then --studen has been detected
				y_next4<= s6;-- Fill the code here
			else
				y_next4 <= s5;
			end if;
		when s6=>
			if(unsigned(inp)=20) then --stduent has been detected
				y_next4<= s7;-- Fill the code here
			else
				y_next4 <= s6;
			end if;
		when s7=>
			if(unsigned(inp)=19) then --students has been detected
				y_next4<= s1;-- Fill the code here
			else
				y_next4 <= s7;		
				end if;
		end case;
	end process state_transition_proc4;
		
		
	output_proc4:process(y_present4, inp)
	begin
		case y_present4 is
			when s7=>
			if (unsigned(inp)=19) then
				outp4<='1';
			else
				outp4<='0';
			end if;
			when others=>
				outp4<='0';
			end case;
	end process output_proc4;
	
	

	-- ____________________________________FINAL OUTPUT PROCESS
	
	output_final:process(outp0,outp1,outp2,outp3,outp4)
	begin
		outp <= outp0 or outp1 or outp2 or outp3 or outp4;
	end process output_final;
		
	
end architecture bhv;