LIBRARY IEEE;
USE ieee.std_logic_1164.all;
---------------------------------------------------------
ENTITY ping_pong IS 
	PORT(	
		clk			: IN STD_LOGIC;
		rst			: IN STD_LOGIC;
--               ENTRADAS
		  CONTROLLER_1_UP		: IN STD_LOGIC;
		  CONTROLLER_1_DOWN	: IN STD_LOGIC;
		  CONTROLLER_2_UP		: IN STD_LOGIC;
		  CONTROLLER_2_DOWN	: IN STD_LOGIC;
		  START_1		 		: IN STD_LOGIC;
		  START_2				: IN STD_LOGIC;
		--	 SALIDAS
		--  Puntuacion 
		  SEG1			: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  SEG2			: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  SEG3			: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  SEG4			: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
--				matrx de leds 8x16
		NUMBER_COL			:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0);
		COL_OUT				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END ENTITY ping_pong;
-----------------------------------------------------------
ARCHITECTURE FUNCTIONAL OF ping_pong IS 
 SIGNAL	ram_to_led_matrix, exit_game  : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL	rst_ball, clk_racket, clk_ball, MAX,GOAL_1, GOAL_2,ENDD,GO  : STD_LOGIC;
 SIGNAL	racket_1, racket_2  : STD_LOGIC_VECTOR(7 DOWNTO 0);
 SIGNAL	SCORE_1, SCORE_2  : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL	colum_ball : STD_LOGIC_VECTOR(111 DOWNTO 0);
 SIGNAL X						:		 STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL		 Y						:		 STD_LOGIC_VECTOR(2 DOWNTO 0);	
  
BEGIN

exit_game<=racket_1 & colum_ball & racket_2;
----------------------------------timer_0.5_segundos------------------------
timer_rack: ENTITY work.univ_bin_counter
GENERIC MAP(N => 25)
	PORT MAP	  (clk			=> clk,
					rst			=>	rst,
					ena			=>	'1',
					syn_clr 		=>	'0',
					up				=>	'1',
					MAX			=>	"0010111010111100000000000",
					max_tick 	=> clk_racket
					);
					
CONTROLLER_1: ENTITY  work.RACKET_Controller_FSM 	
	PORT MAP	(	rst		 	 	=> rst,
				clk 					=>clk_racket,
				bot_up				=>CONTROLLER_1_UP,
				bot_down				=>CONTROLLER_1_DOWN,
				COL_OUT				=>racket_1
			);
			

			
CONTROLLER_2: ENTITY  work.RACKET_Controller_FSM 	
	PORT MAP	(	rst		 	 	=> rst,	
				clk 					=>clk_racket,
				bot_up				=>CONTROLLER_2_UP,
				bot_down				=>CONTROLLER_2_DOWN,
				COL_OUT				=>racket_2
			);

		
PRINT_BALL: ENTITY work.PRINT_BALL_Controller_FSM 
	PORT MAP  	(X						=>X,
			 Y						=>Y,	
			 POINT_1				=>GOAL_1,
			 ENDD     			=>ENDD,
			 GO					=>GO,
			 POINT_2				=>GOAL_2,
			 BALL_PRINTED		=>colum_ball
			);

GAME:	 ENTITY  work.BALL_Controller_FSM
PORT MAP 	(	rst		 	 		=> rst,
			clk_1 					=>	clk,
			START					=>	START_1 & START_2,
			RACKET_11				=>	racket_1,
			RACKET_22				=>	racket_2,
			X						=>X,
			Y						=>Y,
			ENDD     			=>ENDD,
			GO						=>GO,
			GOAL_11				=>GOAL_1,
			GOAL_22				=>GOAL_2,
			SCORE_1				=>SCORE_1,
			SCORE_2				=>SCORE_2
			);
RAM:ENTITY work.RAM_128_BITS 
	PORT MAP(
		clk			=>clk,
		rst			=>rst,
		VECTOR_IN	=>exit_game,
		VECTOR_OUT	=>ram_to_led_matrix
		);
	SCORE_player_1:ENTITY work.PRINT_SCORE
		PORT MAP(
		binM 		=>SCORE_1,
		sseg 		=>SEG1,
		sseg_2	=>SEG2
		);
		SCORE_player_2:ENTITY work.PRINT_SCORE
		PORT MAP(
		binM 		=>SCORE_2,
		sseg 		=>SEG3,
		sseg_2	=>SEG4);
		PRINT_MATRIX:ENTITY work.ledMatrix_Controller_FSM
		PORT MAP(
				rst		 	 		=>rst,
				clk 					=>clk,
				COLS_IN				=>ram_to_led_matrix,
				NUMBER_COL			=>NUMBER_COL,
				COL_OUT				=>COL_OUT);
END ARCHITECTURE FUNCTIONAL;