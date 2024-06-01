LIBRARY IEEE;
USE ieee.std_logic_1164.all;
---------------------------------------------------------
ENTITY RAM_16_BITS IS 
	PORT(
		clk			: IN STD_LOGIC;
		rst			: IN STD_LOGIC;
		en			: IN STD_LOGIC;
		VECTOR_IN	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		VECTOR_OUT	:	OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
END ENTITY RAM_16_BITS;
-----------------------------------------------------------
ARCHITECTURE FUNCTIONAL OF RAM_16_BITS IS 
 
BEGIN


	RAM1:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(0),
			q 		=>VECTOR_OUT(0)
		);
		
		
		RAM2:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(1),
			q 		=>VECTOR_OUT(1)
		);
		
		RAM3:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(2),
			q 		=>VECTOR_OUT(2)
		);
	RAM4:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(3),
			q 		=>VECTOR_OUT(3)
		);
		RAM5:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(4),
			q 		=>VECTOR_OUT(4)
		);
		RAM6:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(5),
			q 		=>VECTOR_OUT(5)
		);
		RAM7:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(6),
			q 		=>VECTOR_OUT(6)
		);
		RAM8:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(7),
			q 		=>VECTOR_OUT(7)
		);
		RAM9:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(8),
			q 		=>VECTOR_OUT(8)
		);
		RAM10:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(9),
			q 		=>VECTOR_OUT(9)
		);
		RAM11:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(10),
			q 		=>VECTOR_OUT(10)
		);
		RAM12:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(11),
			q 		=>VECTOR_OUT(11)
		);
		RAM13:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(12),
			q 		=>VECTOR_OUT(12)
		);
		RAM14:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(13),
			q 		=>VECTOR_OUT(13)
		);
		RAM15:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(14),
			q 		=>VECTOR_OUT(14)
		);
		RAM16:ENTITY work.my_dff
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			d 		=>VECTOR_IN(15),
			q 		=>VECTOR_OUT(15)
		);

END ARCHITECTURE FUNCTIONAL;