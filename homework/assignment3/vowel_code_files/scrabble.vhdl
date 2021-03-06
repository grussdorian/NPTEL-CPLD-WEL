library ieee;
use ieee.std_logic_1164.all;
library work;

package Scrabble_package is

  component scrabble is
   port (X3,X2,X1,X0: in std_logic; Y: out std_logic);
  end component Scrabble;
  
end package Scrabble_package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity scrabble is
	port (X3,X2,X1,X0: in std_logic; Y: out std_logic);
end entity scrabble;

architecture Struct of scrabble is
  signal X3_bar,X2_bar,X1_bar,X0_bar, p3,p2,p1,p0: std_logic;
  component OR_4 is
		port (A,B,C,D: in std_logic; Y: out std_logic);
  end component;

  component AND_4 is
		port (A,B,C,D: in std_logic; Y: out std_logic);
  end component;
  
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  
begin
  -- component instances
	inv0: INVERTER port map(A=>X0, Y=> X0_bar);
	inv1: INVERTER port map(A=>X1, Y=> X1_bar);
	inv2: INVERTER port map(A=>X2, Y=> X2_bar);
	inv3: INVERTER port map(A=>X3, Y=> X3_bar);
	
	and_4_0: AND_4 port map(A => X0, B => X1_bar, C =>X2_bar, D => X3_bar,  Y => p0);
	and_4_1: AND_4 port map(A => X0_bar, B => X1, C =>X2_bar, D => X3_bar,  Y => p1);
	and_4_2: AND_4 port map(A => X0, B => X1_bar, C =>X2, D => X3,  Y => p2);
	and_4_3: AND_4 port map(A => X0_bar, B => X1, C =>X2, D => X3,  Y => p3);
	
	or_4_0: OR_4 port map(A => p0, B => p1, C => p2, D => p3, Y => Y );
	
end Struct;