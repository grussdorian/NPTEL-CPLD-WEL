library ieee;
use ieee.std_logic_1164.all;
library work;

package Mux is
  component TwoXOneMux is
   port (I0,I1,S0: in std_logic; S_out: out std_logic);
  end component TwoXOneMux;
  
  component FourXOneMux is
   port (I0,I1,I2,I3,S0,S1: in std_logic; S_out: out std_logic);
  end component FourXOneMux;
  
  component FourXFourMux is
   port (D3,D2,D1,D0, C3,C2,C1,C0, B3,B2,B1,B0, A3,A2,A1,A0, S0,S1: in std_logic; S3_out, S2_out, S1_out, S0_out: out std_logic);
  end component FourXFourMux;
  
end package Mux;

library ieee;
use ieee.std_logic_1164.all;
library work;
entity TwoXOneMux is
	port (I0, I1, S0: in std_logic; S_out: out std_logic);
end entity TwoXOneMux;

architecture Struct of TwoXOneMux is
  signal t1,t2: std_logic;
begin
  -- component instances
	t1 <= I0 and (not S0);
	t2 <= I1 and s0;
	S_out <= t1 or t2;
end Struct;


library ieee;
use ieee.std_logic_1164.all;
library work;

entity FourXOneMux is
	port (I0,I1,I2,I3,S0,S1: in std_logic; S_out: out std_logic);
end entity FourXOneMux;

architecture Struct of FourXOneMux is
  signal u1,u2: std_logic;
  
  component TwoXOneMux is
	port (I0,I1,S0: in std_logic; S_out: out std_logic);
  end component;

begin
  -- component instances
  m20: TwoXOneMux port map(I0 => I0, I1 => I1, S0 => S0, S_out => u1);
  m21: TwoXOneMux port map(I0 => I2, I1 => I3, S0 => S0, S_out => u2);
  m22: TwoXOneMux port map(I0 => u1, I1 => u2, S0 => S1, S_out => S_out);
  
end Struct;






library ieee;
use ieee.std_logic_1164.all;
library work;

entity FourXFourMux is
   port (D3,D2,D1,D0, C3,C2,C1,C0, B3,B2,B1,B0, A3,A2,A1,A0, S0,S1: in std_logic; S3_out, S2_out, S1_out, S0_out: out std_logic);
end entity FourXFourMux;

architecture Struct of FourXFourMux is
  component FourXOneMux is
   port (I0,I1,I2,I3,S0,S1: in std_logic; S_out: out std_logic);
  end component;

begin
  -- component instances
  m40: FourXOneMux port map(I0 => A0, I1 => B0,  I2 => C0 , I3 => D0, S0 => S0, S1 => S1, S_out => S0_out);
  m41: FourXOneMux port map(I0 => A1, I1 => B1,  I2 => C1 , I3 => D1, S0 => S0, S1 => S1, S_out => S1_out);
  m42: FourXOneMux port map(I0 => A2, I1 => B2,  I2 => C2 , I3 => D2, S0 => S0, S1 => S1, S_out => S2_out);
  m43: FourXOneMux port map(I0 => A3, I1 => B3,  I2 => C3 , I3 => D3, S0 => S0, S1 => S1, S_out => S3_out);
  
end Struct;
