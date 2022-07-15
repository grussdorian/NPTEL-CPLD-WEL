library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
--use work.GatesNew.all;

entity Full_Adder  is
  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end entity Full_Adder;
architecture Struct of Full_Adder is
  signal tC, tS, U, V: std_logic;
begin
  -- component instances
  ha: Half_Adder 
       port map (A => A, B => B, S => tS, C => tC);

--  -- propagate carry.  OLD FILE 
--  a1: AND_GATE_2 port map (A => tS, B => Cin, Y => V);
--  o1: OR_GATE_2  port map (A => V, B => tC, Y => Cout);
--
--  -- final sum.
--  x1: XOR_GATE_2 port map (A => tS, B => Cin, Y => S);

  -- propagate carry.
  a1: AND_GATE_2 port map (A => tS, B => Cin, s_out => V);
  o1: OR_GATE_2  port map (A => V, B => tC, s_out => Cout);

  -- final sum.
  x1: XOR_GATE_2 port map (A => tS, B => Cin, s_out => S);
  
  
end Struct;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;



entity fourBitAdder  is
  port (A3,A2,A1,A0, B3,B2,B1,B0, M: in std_logic; S3,S2,S1,S0, C_out: out std_logic);
end entity fourBitAdder;


architecture rippleCarry of fourBitAdder is
	
  component  Full_Adder  is
    port (A, B, Cin: in std_logic; S, Cout: out std_logic);
  end component;
	
  signal t1, t2, t3, v0, v1, v2, v3: std_logic;
  
  begin
  v0 <= M xor B0;
  v1 <= M xor B1;
  v2 <= M xor B2;
  v3 <= M xor B3;
  -- component instances
  fa0: Full_Adder
       port map (A => A0, B => v0, Cin => M,   S => S0, Cout => t1);
  fa1: Full_Adder
		 port map (A => A1, B => v1, Cin => t1,   S => S1, Cout => t2);
  fa2: Full_Adder
		 port map (A => A2, B => v2, Cin => t2,   S => S2, Cout => t3);
  fa3: Full_Adder
       port map (A => A3, B => v3, Cin => t3,   S => S3, Cout => C_out);
  
end rippleCarry;