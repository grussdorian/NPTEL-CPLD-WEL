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
  
  component EightMuxArray is
   port(X71,X70,X61,X60,X51,X50,X41,X40,X31,X30,X21,X20,X11,X10,X01,X00,
	S7,S6,S5,S4,S3,S2,S1,S0: in std_logic;
	Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
  end component EightMuxArray;
  
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

library ieee;
use ieee.std_logic_1164.all;
library work;
entity EightMuxArray is
   port(X71,X70,X61,X60,X51,X50,X41,X40,X31,X30,X21,X20,X11,X10,X01,X00,S: in std_logic;
	Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
end entity EightMuxArray;

architecture Struct of EightMuxArray is

component TwoXOneMux is
	port (I0,I1,S0: in std_logic; S_out: out std_logic);
  end component;
begin

TT1M_7: TwoXOneMux port map (I1=>X71,I0=>X70, S0 => S,S_out=>Y7);
TT1M_6: TwoXOneMux port map (I1=>X61,I0=>X60,S0 => S,S_out=>Y6);
TT1M_5: TwoXOneMux port map (I1=>X51,I0=>X50,S0 => S,S_out=>Y5);
TT1M_4: TwoXOneMux port map (I1=>X41,I0=>X40,S0 => S,S_out=>Y4);
TT1M_3: TwoXOneMux port map (I1=>X31,I0=>X30,S0 => S,S_out=>Y3);
TT1M_2: TwoXOneMux port map (I1=>X21,I0=>X20,S0 => S,S_out=>Y2);
TT1M_1: TwoXOneMux port map (I1=>X11,I0=>X10,S0 => S,S_out=>Y1);
TT1M_0: TwoXOneMux port map (I1=>X01,I0=>X00,S0 => S,S_out=>Y0);

end Struct;