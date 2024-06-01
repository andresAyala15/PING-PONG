LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY ping_pong_tb IS
END ENTITY ping_pong_tb;
-------------------------------------
ARCHITECTURE testbench OF ping_pong_tb IS
--	SIGNAL	clk_tb			:  STD_LOGIC:='0';
	SIGNAL	rst_tb			:  STD_LOGIC:='0';
--               ENTRADAS

	SIGNAL	CONTROLLER_1_UP_tb		:  STD_LOGIC:='0';
	SIGNAL	CONTROLLER_1_DOWN_tb	:  STD_LOGIC:='0';
	SIGNAL	CONTROLLER_2_UP_tb		:  STD_LOGIC:='0';
	SIGNAL	  CONTROLLER_2_DOWN_tb	:  STD_LOGIC:='0';
	SIGNAL	  START_1_tb		 		:  STD_LOGIC:='0';
	SIGNAL	  START_2_tb				:  STD_LOGIC:='0';

--	 SALIDAS
--          Puntuacion 
		SIGNAL  SEG1_tb			:  STD_LOGIC_VECTOR(6 DOWNTO 0);
		 SIGNAL  SEG2_tb			:  STD_LOGIC_VECTOR(6 DOWNTO 0);
		  SIGNAL SEG3_tb			:  STD_LOGIC_VECTOR(6 DOWNTO 0);
		  SIGNAL SEG4_tb			:  STD_LOGIC_VECTOR(6 DOWNTO 0);
--				matrx de leds 8x16
		SIGNAL NUMBER_COL_tb			:	STD_LOGIC_VECTOR(15 DOWNTO 0);
		SIGNAL COL_OUT_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);								
	
BEGIN
	--CLOCK GENERATION:------------------------
	--clk_tb <= not clk_tb after 10ns; -- 50MHz clock generation
	--RESET GENERATION:------------------------
	--rst_tb <= '0' after 150ns;
	
	DUT:	ENTITY work.ping_pong
	PORT MAP(	clk  =>  clk_tb,		
		rst			=>rst_tb,

		  CONTROLLER_1_UP	=>CONTROLLER_1_UP_tb,
		  CONTROLLER_1_DOWN	=>CONTROLLER_1_DOWN_tb,
		  CONTROLLER_2_UP	=>CONTROLLER_2_UP_tb,
		  CONTROLLER_2_DOWN	=>CONTROLLER_2_DOWN_tb,
		  START_1		=>START_1_tb,
		  START_2		=>START_2_tb,

		  SEG1			=>SEG1_tb,
		  SEG2			=>SEG2_tb,
		  SEG3			=>SEG3_tb,
		  SEG4			=>SEG4_tb,

		NUMBER_COL		=>NUMBER_COL_tb,
		COL_OUT			=>COL_OUT_tb


);


END ARCHITECTURE testbench;