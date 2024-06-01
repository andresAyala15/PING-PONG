--------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
--------------------------------------------------------------------------
ENTITY  RACKET_Controller_FSM IS	
	PORT 	(	rst		 	 		:  IN 	STD_LOGIC;
				clk 					:	IN 	STD_LOGIC;
				bot_up				:	IN		STD_LOGIC;
				bot_down				:	IN		STD_LOGIC;
				COL_OUT				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
END ENTITY;
----------------------------------------
ARCHITECTURE fsm OF RACKET_Controller_FSM IS

TYPE STATE IS (STATE_0, DOWN_0, DOWN_1, DOWN_2, UP_0, UP_1 );
SIGNAL pr_state, nx_state	:	STATE ;

BEGIN



------------------------SEQUENTIAL SECTION-----------------------------
PROCESS (rst, clk)
	BEGIN 
	IF(rst = '1')THEN
		pr_state	<= STATE_0;
		ELSIF (rising_edge (clk)) THEN 
		pr_state <=	nx_state;
	END IF;
END PROCESS;

-----------------------COMBINATIONAL SECTION --------------------------
PROCESS(pr_state,bot_up,bot_down)
BEGIN	
CASE pr_state	IS
			
----------------------------------STATE_0------------------------------
WHEN STATE_0 =>

COL_OUT 	<= "00111000";

IF(bot_up ='1') THEN 
nx_state <= UP_0;
ELSIF (bot_down ='1' ) THEN
nx_state <= DOWN_0;
ELSE
nx_state<=STATE_0;
END IF;
		
----------------------------------DOWN_0------------------------------
WHEN DOWN_0 =>

COL_OUT 	<= "00011100";

IF(bot_up ='1') THEN 
nx_state <= STATE_0;
ELSIF (bot_down ='1' ) THEN
nx_state <= DOWN_1;
ELSE
nx_state<=DOWN_0;
END IF;
		
----------------------------------DOWN_1------------------------------
WHEN DOWN_1 =>

COL_OUT 	<= "00001110";

IF(bot_up ='1') THEN 
nx_state <= DOWN_0;
ELSIF (bot_down ='1' ) THEN
nx_state <= DOWN_2;
ELSE
nx_state<=DOWN_1;
END IF;
		
----------------------------------DOWN_2------------------------------
WHEN DOWN_2 =>

COL_OUT 	<= "00000111";

IF(bot_up ='1') THEN 
nx_state <= DOWN_1;
ELSIF (bot_down ='1' ) THEN
nx_state <= DOWN_2;
ELSE
nx_state<=DOWN_2;
END IF;
		
----------------------------------UP_0------------------------------
WHEN UP_0 =>

COL_OUT 	<= "01110000";

IF(bot_up ='1') THEN 
nx_state <= UP_1;
ELSIF (bot_down ='1' ) THEN
nx_state <= STATE_0;
ELSE
nx_state<=UP_0;
END IF;
		
----------------------------------UP_1-------------------------------
WHEN UP_1 =>

COL_OUT 	<= "11100000";

IF(bot_up ='1') THEN 
nx_state <= UP_1;
ELSIF (bot_down ='1' ) THEN
nx_state <= UP_0;
ELSE
nx_state<=UP_1;
END IF;
		

	END CASE;
END PROCESS;
END ARCHITECTURE fsm;