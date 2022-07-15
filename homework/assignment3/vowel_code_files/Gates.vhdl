library ieee;
use ieee.std_logic_1164.all;
library work;

package Gates is
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;


  component AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component AND_2;
  
  component AND_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
  end component AND_4;

  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND_2;

  component OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component OR_2;

  component OR_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
  end component OR_4;
  
  component NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NOR_2;

  component XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XOR_2;

  component XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XNOR_2;

  component HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
  end component HALF_ADDER;

  
  component AND_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
  end component AND_GATE_2;

  component XOR_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
  end component XOR_GATE_2;

  component OR_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
  end component OR_GATE_2;



end package Gates;


-- __________________________________________________



library ieee;
use ieee.std_logic_1164.all;
library work;

entity XOR_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
end entity XOR_GATE_2;


library ieee;
use ieee.std_logic_1164.all;
library work;

entity OR_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
end entity OR_GATE_2;


library ieee;
use ieee.std_logic_1164.all;
library work;

entity AND_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
end entity AND_GATE_2;


architecture Struct of XOR_GATE_2 is
  signal s1, s2, s3: std_logic;
   component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end component;
begin
  -- component instances
  n1: NAND_2 
		 port map (A => A, B => B, Y => s1);
  n2: NAND_2 
       port map (A => A, B => s1, Y => s2);

  n3: NAND_2 
       port map (A => s1, B => B, Y => s3);

  n4: NAND_2 
       port map (A => s2, B => s3, Y => s_out);
end Struct;


architecture Struct of AND_GATE_2 is
  signal s1: std_logic;
  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end component;
begin
  -- component instances
  n5: NAND_2 
		 port map (A => A, B => B, Y => s1);
  n6: NAND_2 
       port map (A => s1, B => s1, Y => s_out);
end Struct;


architecture Struct of OR_GATE_2 is
  signal s1,s2: std_logic;
    component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end component;
begin
  -- component instances
  n7: NAND_2 
		 port map (A => A, B => A, Y => s1);
  n8: NAND_2 
       port map (A => B, B => B, Y => s2);
  n9: NAND_2
		 port map (A => s1, B => s2, Y => s_out);
end Struct;


-- ___________________________________________________

library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
   port (A: in std_logic; Y: out std_logic);
end entity INVERTER;

architecture Equations of INVERTER is
begin
   Y <= not A;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity AND_2;

architecture Equations of AND_2 is
begin
   Y <= A and B;
end Equations;
  

-- ***********

library ieee;
use ieee.std_logic_1164.all;
entity AND_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
end entity AND_4;

architecture Equations of AND_4 is
begin
   Y <= A and B and C and D;
end Equations;


library ieee;
use ieee.std_logic_1164.all;
entity OR_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
end entity OR_4;

architecture Equations of OR_4 is
begin
   Y <= A or B or C or D;
end Equations;

-- *************  
  
library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NAND_2;

architecture Equations of NAND_2 is
begin
   Y <= not (A and B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity OR_2;

architecture Equations of OR_2 is
begin
   Y <= A or B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NOR_2;

architecture Equations of NOR_2 is
begin
   Y <= not (A or B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XOR_2;

architecture Equations of XOR_2 is
begin
   Y <= A xor B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XNOR_2;

architecture Equations of XNOR_2 is
begin
   Y <= not (A xor B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
library work;
--use work.GatesNew.all;
entity HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
end entity HALF_ADDER;


architecture Equations of HALF_ADDER is
	signal tC, tS, U, V: std_logic;
	  component XOR_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
end component;
 component AND_GATE_2 is
	port (A, B: in std_logic; s_out: out std_logic);
end component;
begin
--   S <= (A xor B); 
--   C <= (A and B);
	-- instantiating XOR gate and AND gate required for Half adder
	
	 x1: XOR_GATE_2 
		 port map (A => A, B => B, s_out => S);
	 a1: AND_GATE_2
		 port map (A => A, B => B, s_out => C);

end Equations;
  
