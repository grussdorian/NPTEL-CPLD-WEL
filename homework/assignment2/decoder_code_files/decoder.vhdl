library ieee;
use ieee.std_logic_1164.all;
library work;

package Decoder is
  component TwoToFourDecoder is
   port (A1,A0,E: in std_logic; Y3,Y2,Y1,Y0: out std_logic);
  end component TwoToFourDecoder;
  
  component ThreeToEightDecoder is
   port (A2,A1,A0,E_out: in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
  end component ThreeToEightDecoder;
  
end package Decoder;

library ieee;
use ieee.std_logic_1164.all;
library work;

entity TwoToFourDecoder is
	 port (A1,A0,E: in std_logic; Y3,Y2,Y1,Y0: out std_logic);
end entity TwoToFourDecoder;


architecture Struct of TwoToFourDecoder is
  signal I3,I2,I1,I0: std_logic;
begin
  -- component instances
	I0 <= (not A0) and (not A1);
	I1 <= (A0) and (not A1);
	I2 <= (not A0) and (A1);
	I3 <= A0 and A1;
	
	Y0 <= E and I0;
	Y1 <= E and I1;
	Y2 <= E and I2;
	Y3 <= E and I3;
	
end Struct;


library ieee;
use ieee.std_logic_1164.all;
library work;

entity ThreeToEightDecoder is
	port (A2,A1,A0,E_out: in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
end entity ThreeToEightDecoder;


architecture Struct of ThreeToEightDecoder is
  signal I3,I2,I1,I0, temp1, temp2 : std_logic;
  component TwoToFourDecoder is
   port (A1,A0,E: in std_logic; Y3,Y2,Y1,Y0: out std_logic);
  end component;

begin
	temp1 <= (A2 and E_out);
   temp2 <= ((not A2) and E_out);
  -- component instances
	d1: TwoToFourDecoder port map (A1 => A1, A0 => A0 , E => temp1, Y3 => Y7, Y2 => Y6, Y1 => Y5, Y0 => Y4 );
	d2: TwoToFourDecoder port map (A1 => A1, A0 => A0 , E => temp2 ,  Y3 => Y3, Y2 => Y2, Y1 => Y1, Y0 => Y0  );
	
end Struct;

