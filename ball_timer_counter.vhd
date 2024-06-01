LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-------------------------------------------------
ENTITY ball_timer_counter IS
	GENERIC (	N				:		INTEGER	:= 4);
	PORT 	  (	clk			:		IN   STD_LOGIC;
					rst			:		IN   STD_LOGIC;
					ena			:		IN   STD_LOGIC;
					d				:		IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0) ;
					sel			:		IN STD_LOGIC_VECTOR(1 DOWNTO 0);
					max_tick 	:		OUT  STD_LOGIC;
					min_tick 	:  	OUT  STD_LOGIC;
					counter		:		OUT  STD_LOGIC_VECTOR (N-1 DOWNTO 0):= d );
END ENTITY;
--------------------------------------------------
ARCHITECTURE rt1 OF ball_timer_counter IS
	CONSTANT ONES 			:		UNSIGNED (N-1 DOWNTO 0):=	(OTHERS => '1');
	CONSTANT ZEROS			:		UNSIGNED (N-1 DOWNTO 0):=	(OTHERS => '0');
	-- SIGNAL count_s		:		INTEGER RANGE 0 to (2**N-1);
	
	SIGNAL count_s			:     UNSIGNED (N-1 DOWNTO 0);
	SIGNAL count_next 	:		UNSIGNED (N-1 DOWNTO 0);


BEGIN
	-- NEXT STATE LOGIC
	
	
	count_next <=	count_s -100000 			WHEN (sel ="10") ELSE
						count_s;
		PROCESS (clk,rst,d)
			VARIABLE temp	:	UNSIGNED (N-1 DOWNTO 0);
		BEGIN
			IF (rst='1') THEN
				temp:= unsigned(d);
		ELSIF (rising_edge(clk)) THEN
			IF (ena='1') THEN
				temp	:= count_next;
		END IF;
	END IF;
	counter  <=  STD_LOGIC_VECTOR(temp);
	count_s  <= temp;
	END PROCESS;
	
	-- OUTPUT LOGIC
	max_tick					<= 	'1' WHEN (count_s = ONES ) 	ELSE '0';
	min_tick					<= 	'1' WHEN (count_s = ZEROS) ELSE '0';

	

END ARCHITECTURE;