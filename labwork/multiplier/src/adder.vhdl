library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Decoder.all;

package FullAdderUsingDecoder is
  component fullAdder is
   port (A,B,C_in: in std_logic; S,C_out: out std_logic);
  end component fullAdder;
end package FullAdderUsingDecoder;

library ieee;
use ieee.std_logic_1164.all;
library work;
entity fullAdder is
	 port (A,B,C_in: in std_logic; S,C_out: out std_logic);
end entity fullAdder;


architecture Struct of fullAdder is
  signal E,m7,m6,m5,m4,m3,m2,m1,m0: std_logic;
  
  component ThreeToEightDecoder is
   port (A2,A1,A0,E_out: in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
  end component;
  
begin
--	E <= E and E;
  -- component instances
	tte_decoder: ThreeToEightDecoder port map(A2 => C_in, A1 => B, A0 => A, E_out => '1',
	Y7=>m7,Y6=>m6,Y5=>m5,Y4=>m4,Y3=>m3,Y2=>m2,Y1=>m1,Y0=>m0);
	
	S <= m1 or m2 or m4 or m7;
	C_out <= m3 or m5 or m6 or m7;
	
end Struct;