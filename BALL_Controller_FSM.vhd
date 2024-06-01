----------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------------
ENTITY  BALL_Controller_FSM IS	
	PORT 	(	rst		 	 		:  IN 	STD_LOGIC;
				clk_1 					:	IN 	STD_LOGIC;
				START					:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				RACKET_11				:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				RACKET_22				:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				X						:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
				Y						:	OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
				GO							:	OUT	STD_LOGIC;
				GOAL_11				:	OUT	STD_LOGIC;
				GOAL_22						:	OUT	STD_LOGIC;
				ENDD					:	OUT	STD_LOGIC;
				SCORE_1				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				SCORE_2				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
END ENTITY;
------------------------------------
ARCHITECTURE fsm OF BALL_Controller_FSM IS
SIGNAL rst_count,SEL_1,SEL_2, clk, max, rst_1,max_score_1,max_score_2			:	STD_LOGIC;
TYPE STATE IS (NOTHING, DOWN_RIGTH, DOWN_LEFT, UP_RIGTH, UP_LEFT ,GOAL_1,GOAL_2, FINISHED);
SIGNAL pr_state, nx_state	:	STATE ;
SIGNAL X_IN						:	STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Y_IN 					:	STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL X_SEL, Y_SEL,sel_t 			:	STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL temp_y					:  INTEGER;
SIGNAL score_int_1,score_int_2					:  INTEGER;
SIGNAL RACKET_1,	RACKET_2				:			STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL tim							:			STD_LOGIC_VECTOR(24 DOWNTO 0);

SIGNAL SCORE_11	,SCORE_22				:		STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
X<=X_IN;
Y<=Y_IN;

SCORE_1<=SCORE_11;
SCORE_2<=SCORE_22;

RACKET_1 <= RACKET_11(0)&RACKET_11(1) & RACKET_11(2) & RACKET_11(3) & RACKET_11(4) & RACKET_11(5) & RACKET_11(6) & RACKET_11(7);
RACKET_2  <= RACKET_22(0)&RACKET_22(1) & RACKET_22(2) & RACKET_22(3) & RACKET_22(4) & RACKET_22(5) & RACKET_22(6) & RACKET_22(7);
----------------------------------timer--------------------------------
timer: ENTITY work.univ_bin_counter
GENERIC MAP(N => 25)
	PORT MAP	  (clk			=> clk_1,
					rst			=>	rst,
					ena			=>	'1',
					syn_clr 		=>	'0',
					up				=>	'1',
					MAX			=>	tim,
					max_tick 	=> clk
									);
									
---------------------------------TIMER_CONTROLLER--------------------------------
timer_x: ENTITY work.ball_timer_counter
GENERIC MAP(N => 25)
PORT MAP	  (clk			=> clk,
				rst			=>rst,
				ena			=>'1',
				d				=>"0010111110001100000000000",
				sel			=>sel_t,
				counter		=>tim
				);
																		
----------------------------------timer_lose------------------------
timer_lose: ENTITY work.univ_bin_counter
GENERIC MAP(N => 27)
	PORT MAP	  (clk			=> clk_1,
					rst			=>rst,
					ena			=>	NOT(rst_1),
					syn_clr 		=>	'0',
					up				=>	'1',
					MAX			=>	"101111101011110000100000000",
					max_tick 	=> max
					);
--------------------------counter_x-------------------------------
POSITION_X: ENTITY work.ball_x_counter
PORT MAP	  (clk			=> clk,
				rst			=>rst_count,
				ena			=>'1',
				d				=>"1000",
				sel			=>X_SEL,
				counter		=>X_IN
				);

----------------------------counter_y-----------------------------
POSITION_Y: ENTITY work.ball_y_counter
PORT MAP	  (clk			=> clk,
				rst			=>rst_count,
				ena			=>'1',
				d				=>"100",
				sel			=>Y_SEL,
				counter		=>Y_IN
				);

----------------------------SCORE_1-----------------------------
FIRST_PLAYER: ENTITY work.score_counter
PORT MAP	  (clk			=>max ,
				rst			=>rst,
				ena			=>'1',
				sel			=>Sel_1,
				max_tick 	=>max_score_1,
				counter		=>SCORE_11
				);


----------------------------SCORE_2-----------------------------
SECOND_PLAYER: ENTITY work.score_counter
PORT MAP	  (clk			=> max,
				rst			=>rst,
				ena			=>'1',
				sel			=>SEl_2,
				max_tick 	=>max_score_2,
				counter		=>SCORE_22
				);				
				
				
--------------------SEQUENTIAL SECTION-----------------------------
PROCESS (rst, clk)
	BEGIN 
	IF(rst = '1')THEN
		pr_state	<= NOTHING;
		ELSIF (rising_edge (clk)) THEN 
		pr_state <=	nx_state;
	END IF;
END PROCESS;

-------------------COMBINATIONAL SECTION --------------------------
PROCESS(pr_state,nx_state,START,RACKET_1,RACKET_2, X_IN,Y_IN,temp_y,max,SCORE_11,SCORE_22,score_int_1,score_int_2,max_score_1,max_score_2)
BEGIN	
temp_y <= to_integer(unsigned(Y_IN));

CASE pr_state	IS
			
-----------------------------NOTHING------------------------------
WHEN NOTHING =>
GOAL_11 <='0';
GOAL_22 <='0';
GO	<='1';
sel_t <= "00";
rst_1<='1';
SEL_1<='0';
SEL_2<='0';
ENDD	<='0';
X_SEL			<="00";
Y_SEL			<="00";
rst_count	<= '0';
IF(START ="01" ) THEN 
nx_state<=DOWN_RIGTH;
ELSE
IF (START = "10") THEN 
nx_state<=UP_LEFT;
ELSE
nx_state<=NOTHING;
END IF;
END IF;
		
----------------------------DOWN_RIGTH------------------------------
WHEN DOWN_RIGTH =>
GOAL_11 <='0';
GOAL_22 <='0';
sel_t <= "00";
GO	<='0';
ENDD	<='0';
X_SEL	<="01";
rst_1<='1';
Y_SEL	<="01";
SEL_2<='0';
SEL_1<='0';
rst_count	<= '0';
IF(Y_IN = "110") THEN
		IF(X_IN = "1110") THEN 
				IF(RACKET_2(temp_y)='1') THEN 
						nx_state <= DOWN_LEFT;
				ELSE 
						--GOAL
						nx_state <= GOAL_2;
				END IF;

		ELSE 
				nx_state <= UP_RIGTH; 
		END IF;

ELSE
		IF(X_IN = "1110") THEN 
				IF(RACKET_2(temp_y)='1') THEN 
						nx_state <= DOWN_LEFT;
				ELSE 
						--GOAL
						nx_state <= GOAL_2;
				END IF;

		ELSE 
				nx_state <= DOWN_RIGTH; 
		END IF;


END IF;
		
---------------------------DOWN_LEFT------------------------------
WHEN DOWN_LEFT =>
X_SEL	<="10";
Y_SEL	<="01";
GOAL_11 <='0';
sel_t <= "00";
GO	<='0';
GOAL_22 <='0';
rst_1<='1';
ENDD	<='0';
SEL_2<='0';
SEL_1<='0';
rst_count	<= '0';
IF(Y_IN ="110") THEN
		IF(X_IN ="0001") THEN 
				IF(RACKET_1(temp_y)='1') THEN 
						nx_state <= DOWN_RIGTH;
				ELSE 
						--GOAL
						nx_state <= GOAL_1;
				END IF;

		ELSE 
				nx_state <= UP_LEFT; 
		END IF;

ELSE
		IF(X_IN ="0001") THEN 
				IF(RACKET_1(temp_y)='1') THEN

						nx_state <= DOWN_RIGTH;
				ELSE 
						--GOAL
						nx_state <= GOAL_1;
				END IF;

		ELSE 
				nx_state <= DOWN_LEFT; 
		END IF;


END IF;
------------------------------UP_RIGTH------------------------------
WHEN UP_RIGTH =>
X_SEL	<="01";
Y_SEL	<="10";
GO	<='0';
GOAL_11 <='0';
ENDD	<='0';
rst_1<='1';
GOAL_22 <='0';
sel_t <= "00";
SEL_2<='0';
SEL_1<='0';
rst_count	<= '0';
IF(Y_IN ="001") THEN
		IF(X_IN = "1110") THEN 
				IF(RACKET_2(temp_y)='1') THEN 

						nx_state <= UP_LEFT;
				ELSE 
						--GOAL
						nx_state <= GOAL_2;
				END IF;

		ELSE 

				nx_state <= DOWN_RIGTH; 
		END IF;

ELSE
		IF(X_IN = "1110") THEN 
				IF(RACKET_2(temp_y)='1') THEN

						nx_state <= UP_LEFT;
				ELSE 
						--GOAL
						nx_state <= GOAL_2;
				END IF;

		ELSE 
				nx_state <= UP_RIGTH; 
		END IF;


END IF;
		
------------------------------UP_LEFT------------------------------
WHEN UP_LEFT =>
X_SEL	<="10";
Y_SEL	<="10";
sel_t <= "00";
GO	<='0';
ENDD	<='0';
SEL_2<='0';
rst_1<='1';
GOAL_11 <='0';
GOAL_22 <='0';
SEL_1<='0';
rst_count	<= '0';

IF(Y_IN = "001") THEN
		IF(X_IN = "0001") THEN 
				IF(RACKET_1(temp_y)='1') THEN
						nx_state <= UP_RIGTH;
				ELSE 
						--GOAL
						nx_state <= GOAL_1;
				END IF;

		ELSE 
				nx_state <= DOWN_LEFT; 
		END IF;

ELSE
		IF(X_IN = "0001") THEN 
				IF(RACKET_1(temp_y)='1') THEN 
						nx_state <= UP_RIGTH;
				ELSE 
						--GOAL
						nx_state <= GOAL_1;
				END IF;

		ELSE 
				nx_state <= UP_LEFT; 
		END IF;

END IF;

------------------------------GOAL_1------------------------------
WHEN GOAL_1 =>
X_SEL	<="11";
Y_SEL	<="11";
ENDD	<='0';
sel_t <= "10";
GO	<='0';
rst_1<='0';
SEL_2<='1';
SEL_1<='0';
GOAL_11 <='1';
GOAL_22 <='0';
rst_count	<= '1';

IF (max_score_2 = '1') THEN
	nx_state <= FINISHED;
ELSE
	IF (START(1)= '1') THEN
	nx_state <= UP_LEFT;
	ELSE
	nx_state <= GOAL_1;
END IF;
END IF;


------------------------------GOAL_2------------------------------
WHEN GOAL_2 =>
sel_t <= "10";
X_SEL	<="11";
rst_1<='0';
Y_SEL	<="11";
SEL_2<='0';
SEL_1<='1';
GO	<='0';
ENDD	<='0';
GOAL_11 <='0';
GOAL_22 <='1';
rst_count	<= '1';
IF (max_score_1 = '1') THEN
	nx_state <= FINISHED;
ELSE
IF (START(0) = '1') THEN
	nx_state <= UP_RIGTH;
	ELSE
	nx_state <= GOAL_2;
END IF;
END IF;

------------------------------FINISHED------------------------------
WHEN FINISHED =>
sel_t <= "00";
X_SEL	<="11";
rst_1<='1';
GO	<='0';
Y_SEL	<="11";
SEL_2<='0';
ENDD	<='1';
SEL_1<='1';
GOAL_11 <='0';
GOAL_22 <='0';
rst_count	<= '0';
nx_state <= FINISHED; 


	END CASE;
END PROCESS;
END ARCHITECTURE fsm;