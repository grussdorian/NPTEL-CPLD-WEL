library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Mux.all;
package BarrelShift is

component barrelShifter is
	port (X7, X6, X5, X4, X3, X2, X1, X0, b3,b2,b1,  L : in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
end component barrelShifter;

end package BarrelShift;

library ieee;
use ieee.std_logic_1164.all;
library work;
entity barrelShifter is
	port (X7, X6, X5, X4, X3, X2, X1,X0, b3,b2,b1,  L : in std_logic; Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
end entity barrelShifter;

architecture Struct of barrelShifter is

component EightMuxArray is
   port(X71,X70,X61,X60,X51,X50,X41,X40,X31,X30,X21,X20,X11,X10,X01,X00,
	S: in std_logic;
	Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0: out std_logic);
end component;
  
signal 
 t37,t36,t35,t34,t33,t32,t31,t30, t27,t26,t25,t24,t23,t22,t21,t20, t17,t16,t15,t14,t13,t12,t11,t10, t07,t06,t05,t04,t03,t02,t01,t00: std_logic;

begin

INV0: EightMuxArray port map (X71 => X0,X70 => X7,X61 => X1, X60 => X6,X51 => X2, X50 => X5,X41 => X3,X40 => X4,
					   X31 => X4, X30 => X3, X21 => X5, X20 => X2 ,X11 => X6, X10 => X1, X01 => X7, X00 => X0,
						S=>L, Y7=>t37,Y6=>t36,Y5=>t35,Y4=>t34,Y3=>t33,Y2=>t32,Y1=>t31,Y0=>t30); 

A2: EightMuxArray port map (X71 => '0',X70 => t37,X61 => '0', X60 => t36,X51 => '0', X50 => t35,X41 => '0',X40 => t34,
					   X31 => t37, X30 => t33, X21 => t36, X20 => t32 ,X11 => t35, X10 => t31, X01 => t34, X00 => t30,
						S=>b3, Y7=>t27,Y6=>t26,Y5=>t25,Y4=>t24,Y3=>t23,Y2=>t22,Y1=>t21,Y0=>t20);

A1: EightMuxArray port map (X71 => '0',X70 => t27,X61 => '0', X60 => t26, X51 => t27 , X50 => t25 ,X41 => t26,X40 => t24,
					   X31 => t25, X30 => t23, X21 => t24, X20 => t22 ,X11 => t23, X10 => t21, X01 => t22, X00 => t20,
						S=>b2, Y7=>t17,Y6=>t16,Y5=>t15,Y4=>t14,Y3=>t13,Y2=>t12,Y1=>t11,Y0=>t10);


A0: EightMuxArray port map (X71 => '0',X70 => t17,X61 => t17, X60 => t16, X51 => t16 , X50 => t15 ,X41 => t15,X40 => t14,
					   X31 => t14, X30 => t13, X21 => t13, X20 => t12 ,X11 => t12, X10 => t11, X01 => t11, X00 => t10,
						S=>b1, Y7=>t07,Y6=>t06,Y5=>t05,Y4=>t04,Y3=>t03,Y2=>t02,Y1=>t01,Y0=>t00);

						
INV1: EightMuxArray port map (X71 => t00,X70 => t07,X61 => t01, X60 => t06,X51 => t02, X50 => t05,X41 => t03,X40 => t04,
					   X31 => t04, X30 => t03, X21 => t05, X20 => t02 ,X11 => t06, X10 => t01, X01 => t07, X00 => t00,
						S=>L, Y7=>Y7,Y6=>Y6,Y5=>Y5,Y4=>Y4,Y3=>Y3,Y2=>Y2,Y1=>Y1,Y0=>Y0); 
						
						

end Struct;