--------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
--------------------------------------------------------------------------
ENTITY  ledMatrix_Controller_FSM IS	
	PORT 	(	rst		 	 		:  IN 	STD_LOGIC;
				clk 					:	IN 	STD_LOGIC;
				COLS_IN				:	IN		STD_LOGIC_VECTOR(127 DOWNTO 0);
				NUMBER_COL			:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0);
				COL_OUT				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
END ENTITY;
----------------------------------------
ARCHITECTURE fsm OF ledMatrix_Controller_FSM IS

TYPE STATE IS (COL_A, COL_B, COL_C, COL_D, COL_E, COL_F, COL_G, COL_H, COL_I, COL_J, COL_K, COL_L, COL_M, COL_N, COL_O, COL_P );
SIGNAL pr_state, nx_state	:	STATE ;
 SIGNAL	COL_0, COL_1, COL_2, COL_3, COL_4, COL_5, COL_6, COL_7, COL_8, COL_9, COL_10, COL_11, COL_12, COL_13, COL_14, COL_15  : STD_LOGIC_VECTOR(7 DOWNTO 0);
 SIGNAL	REFRESH  : STD_LOGIC;
BEGIN
COL_0		<=	COLS_IN(127 DOWNTO 120);
COL_1		<=	COLS_IN(119 DOWNTO 112);
COL_2		<=	COLS_IN(111 DOWNTO 104);
COL_3		<=	COLS_IN(103 DOWNTO 96);
COL_4		<=	COLS_IN(95 	DOWNTO 88);
COL_5		<=	COLS_IN(87 	DOWNTO 80);
COL_6		<=	COLS_IN(79 	DOWNTO 72);
COL_7		<=	COLS_IN(71 	DOWNTO 64);
COL_8		<=	COLS_IN(63 	DOWNTO 56);
COL_9		<=	COLS_IN(55 	DOWNTO 48);
COL_10	<=	COLS_IN(47 	DOWNTO 40);
COL_11	<=	COLS_IN(39	DOWNTO 32);
COL_12	<=	COLS_IN(31 	DOWNTO 24);
COL_13	<=	COLS_IN(23 	DOWNTO 16);
COL_14	<=	COLS_IN(15 	DOWNTO 8);
COL_15	<=	COLS_IN(7 	DOWNTO 0);

------------------------SEQUENTIAL SECTION-----------------------------
PROCESS (rst, clk)
	BEGIN 
	IF(rst = '1')THEN
		pr_state	<= COL_A;
		ELSIF (rising_edge (clk)) THEN 
		pr_state <=	nx_state;
	END IF;
END PROCESS;
----------------------------------REFRESH_30HZ------------------------
REFRESH_30HZ: ENTITY work.univ_bin_counter
GENERIC MAP(N => 17)
	PORT MAP	  (clk			=> clk,
					rst			=>	rst,
					ena			=>	'1',
					syn_clr 		=>	'0',
					up				=>	'1',
					MAX			=>	"01000011010100000",
					max_tick 	=> REFRESH
					);
-----------------------COMBINATIONAL SECTION --------------------------
PROCESS(REFRESH,pr_state,COL_0, COL_1, COL_2, COL_3, COL_4, COL_5, COL_6, COL_7, COL_8, COL_9, COL_10, COL_11, COL_12, COL_13, COL_14, COL_15 )
BEGIN	
CASE pr_state	IS
			
----------------------------------COL_A--------------------------------
WHEN COL_A =>

NUMBER_COL 	<=not"0111111111111111";
COL_OUT		<=	COL_0; 
IF(REFRESH ='1') THEN 
nx_state <= COL_B;
ELSE
nx_state <= COL_A;
END IF;
		
----------------------------------COL_B-------------------------------
WHEN COL_B =>

NUMBER_COL 	<=not "1011111111111111";
COL_OUT		<=	COL_1; 


IF(REFRESH ='1') THEN 
nx_state <= COL_C;
ELSE
nx_state <= COL_B;
END IF;

----------------------------------COL_C--------------------------------
WHEN COL_C =>

NUMBER_COL 	<= not "1101111111111111";
COL_OUT		<=	COL_2; 


IF(REFRESH ='1') THEN 
nx_state <= COL_D;
ELSE
nx_state <= COL_C;
END IF;
		
----------------------------------COL_D--------------------------------
WHEN COL_D =>


NUMBER_COL 	<=not  "1110111111111111";
COL_OUT		<=	COL_3; 

IF(REFRESH ='1') THEN 
nx_state <= COL_E;
ELSE
nx_state <= COL_D;
END IF;
		
----------------------------------COL_E--------------------------------
WHEN COL_E =>

NUMBER_COL 	<= not "1111011111111111";
COL_OUT		<=	COL_4; 

IF(REFRESH ='1') THEN 
nx_state <= COL_F;
ELSE
nx_state <= COL_E;
END IF;
		
----------------------------------COL_F--------------------------------
WHEN COL_F =>

NUMBER_COL 	<= not "1111101111111111";
COL_OUT		<=	COL_5;  

IF(REFRESH ='1') THEN 
nx_state <= COL_G;
ELSE
nx_state <= COL_F;
END IF;

----------------------------------COL_G--------------------------------
WHEN COL_G =>

NUMBER_COL 	<=not  "1111110111111111";
COL_OUT		<=	COL_6;

IF(REFRESH ='1') THEN 
nx_state <= COL_H;
ELSE
nx_state <= COL_G;
END IF;
		
----------------------------------COL_H--------------------------------
WHEN COL_H =>

NUMBER_COL 	<= not"1111111011111111";
COL_OUT		<=	COL_7;

IF(REFRESH ='1') THEN 
nx_state <= COL_I;
ELSE
nx_state <= COL_H;
END IF;
			
----------------------------------COL_I--------------------------------
WHEN COL_I =>

NUMBER_COL 	<=not "1111111101111111";
COL_OUT		<=	COL_8;

IF(REFRESH ='1') THEN 
nx_state <= COL_J;
ELSE
nx_state <= COL_I;
END IF;
		
----------------------------------COL_J-------------------------------
WHEN COL_J =>

NUMBER_COL 	<=not "1111111110111111";
COL_OUT		<=	COL_9;

IF(REFRESH ='1') THEN 
nx_state <= COL_K;
ELSE
nx_state <= COL_J;
END IF;

----------------------------------COL_K--------------------------------
WHEN COL_K =>


NUMBER_COL 	<=not "1111111111011111";
COL_OUT		<=	COL_10;


IF(REFRESH ='1') THEN 
nx_state <= COL_L;
ELSE
nx_state <= COL_K;
END IF;
		
----------------------------------COL_L--------------------------------
WHEN COL_L =>


NUMBER_COL 	<= not"1111111111101111";
COL_OUT		<=	COL_11;

IF(REFRESH ='1') THEN 
nx_state <= COL_M;
ELSE
nx_state <= COL_L;
END IF;		
		
----------------------------------COL_M--------------------------------
WHEN COL_M =>

NUMBER_COL 	<= not "1111111111110111";
COL_OUT		<=	COL_12;


IF(REFRESH ='1') THEN 
nx_state <= COL_N;
ELSE
nx_state <= COL_M;
END IF;
		
----------------------------------COL_N--------------------------------
WHEN COL_N =>

NUMBER_COL 	<=not "1111111111111011";
COL_OUT		<=	COL_13;

IF(REFRESH ='1') THEN 
nx_state <= COL_O;
ELSE
nx_state <= COL_N;
END IF;

----------------------------------COL_O--------------------------------
WHEN COL_O =>

NUMBER_COL 	<= not "1111111111111101";
COL_OUT		<=	COL_14;

IF(REFRESH ='1') THEN 
nx_state <= COL_P;
ELSE
nx_state <= COL_O;
END IF;

----------------------------------COL_P--------------------------------
WHEN COL_P =>

NUMBER_COL 	<= not "1111111111111110";
COL_OUT		<=	COL_15;

IF(REFRESH ='1') THEN 
nx_state <= COL_A;
ELSE
nx_state <= COL_P;
END IF;

	END CASE;
END PROCESS;
END ARCHITECTURE fsm;