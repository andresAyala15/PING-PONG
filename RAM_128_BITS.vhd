LIBRARY IEEE;
USE ieee.std_logic_1164.all;
---------------------------------------------------------
ENTITY RAM_128_BITS IS 
	PORT(
		clk			: IN STD_LOGIC;
		rst			: IN STD_LOGIC;
		VECTOR_IN	: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		VECTOR_OUT	:	OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
		);
END ENTITY RAM_128_BITS;
-----------------------------------------------------------
ARCHITECTURE FUNCTIONAL OF RAM_128_BITS IS 
 SIGNAL	en  : STD_LOGIC;


BEGIN

en<='1';

	RAM_0_15:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(15 DOWNTO 0),
			VECTOR_OUT 		=>VECTOR_OUT(15 DOWNTO 0)
		);
		
		
		RAM_16_31:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(31 DOWNTO 16),
			VECTOR_OUT 		=>VECTOR_OUT(31 DOWNTO 16)
		);
		
		RAM_32_47:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(47 DOWNTO 32),
			VECTOR_OUT 		=>VECTOR_OUT(47 DOWNTO 32)
		);
	RAM_48_63:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(63 DOWNTO 48),
			VECTOR_OUT 		=>VECTOR_OUT(63 DOWNTO 48)
		);
		RAM_64_79:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(79 DOWNTO 64),
			VECTOR_OUT 		=>VECTOR_OUT(79 DOWNTO 64)
		);
		RAM_80_95:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(95 DOWNTO 80),
			VECTOR_OUT 		=>VECTOR_OUT(95 DOWNTO 80)
		);
		RAM_96_111:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(111 DOWNTO 96),
			VECTOR_OUT 		=>VECTOR_OUT(111 DOWNTO 96)
		);
		RAM_112_127:ENTITY work.RAM_16_BITS
		PORT MAP(
			clk	=>clk,
			rst	=>rst,
			en 	=>en,
			VECTOR_IN 		=>VECTOR_IN(127 DOWNTO 112),
			VECTOR_OUT 		=>VECTOR_OUT(127 DOWNTO 112)
		);
		

END ARCHITECTURE FUNCTIONAL;