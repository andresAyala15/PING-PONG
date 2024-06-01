-----------------------------------------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------------------------------------------------------------------------
ENTITY  PRINT_BALL_Controller_FSM IS	
	PORT 	(X						:	IN	 STD_LOGIC_VECTOR(3 DOWNTO 0);
			 Y						:	IN	 STD_LOGIC_VECTOR(2 DOWNTO 0);
			ENDD			:	IN	 STD_LOGIC;
			GO				:	IN	 STD_LOGIC;
			 POINT_1				:	IN	 STD_LOGIC;
			 POINT_2				:	IN	 STD_LOGIC;
			 BALL_PRINTED		: 	OUT STD_LOGIC_VECTOR(111 DOWNTO 0)
			);
END ENTITY;
---------------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF PRINT_BALL_Controller_FSM IS
SIGNAL  BALL_1, BALL_2,BALL_3 : STD_LOGIC_VECTOR(111 DOWNTO 0);
SIGNAL COL_1,COL_2,COL_3,COL_4,COL_5,COL_6,COL_7,COL_8,COL_9,COL_10,COL_11,COL_12,COL_13,COL_14, ZEROS: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Y_1, Y_2, Y_3, Y_4, Y_5, Y_6, Y_7, Y_8 :STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL TICK, CROSS: STD_LOGIC_VECTOR(55 DOWNTO 0);

BEGIN
Y_1	<= not "10000000";
Y_2	<= not "01000000";
Y_3	<= not "00100000";
Y_4	<=not  "00010000";
Y_5	<=not  "00001000";
Y_6	<= not "00000100";
Y_7	<= not "00000010";
Y_8	<=not "00000001";

ZEROS <= not "00000000";
CROSS <="01000010001001000001100000011000001001000100001010000001";
TICK	<="10000000010000000010000000010001000010100000010000000000";



PRINT : PROCESS(X,Y,ZEROS,Y_1, Y_2, Y_3, Y_4, Y_5, Y_6, Y_7, Y_8,COL_1,COL_2,COL_3,COL_4,COL_5,COL_6,COL_7,COL_8,COL_9,COL_10,COL_11,COL_12,COL_13,COL_14,CROSS, TICK,POINT_2,POINT_1, GO,ENDD)
BEGIN
IF(GO = '1') THEN 

					BALL_PRINTED<= not "0000000001111110010000011000100101001001001110010000000001111110100000011000000101111110000000001011111100000000";
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

ELSIF(ENDD = '1') THEN 
					BALL_PRINTED<= not"1111111110001001100010010000000011111110000011100001100000110000110000001111111000000000111111111100000101111110";
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

ELSIF(POINT_1 = '1') THEN 
BALL_PRINTED<= CROSS & TICK ;

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
ELSIF(POINT_2 = '1') THEN
BALL_PRINTED<= TICK &CROSS  ;


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
 
ELSE
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
BALL_PRINTED<=COL_1 & COL_2 & COL_3 & COL_4 & COL_5 & COL_6 & COL_7 & COL_8 & COL_9 & COL_10 & COL_11 & COL_12 & COL_13 & COL_14;
IF (Y = "000")  THEN
				IF(X ="0001")THEN
					COL_1<=Y_1;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_1;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_1;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_1;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_1;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_1;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_1;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_1;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_1;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_1;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_1;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_1;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_1;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_1;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

END IF;



ELSIF (Y ="001") THEN 

				IF(X ="0001")THEN
				COL_1<=Y_2;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_2;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_2;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_2;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_2;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_2;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_2;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_2;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_2;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_2;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_2;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_2;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_2;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_2;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
END IF;



ELSIF (Y ="010") THEN 

				IF(X ="0001")THEN
				COL_1<=Y_3;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_3;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_3;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_3;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_3;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_3;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_3;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_3;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_3;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_3;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_3;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_3;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_3;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_3;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

END IF;

ELSIF (Y ="011") THEN 

				IF(X ="0001")THEN
				COL_1<=Y_4;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_4;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_4;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_4;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_4;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_4;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_4;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_4;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_4;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_4;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_4;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_4;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_4;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_4;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

END IF;


ELSIF (Y= "100") THEN 

				IF(X ="0001")THEN
				COL_1<=Y_5;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_5;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_5;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_5;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_5;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_5;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_5;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_5;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_5;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_5;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_5;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_5;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_5;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_5;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

END IF;

ELSIF (Y ="101") THEN 

				IF(X ="0001")THEN
				COL_1<=Y_6;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_6;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_6;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_6;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_6;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_6;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_6;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_6;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_6;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_6;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_6;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_6;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_6;
					COL_14<=ZEROS;
								
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_6;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
END IF;


ELSIF (Y ="110") THEN 

				IF(X ="0001")THEN
				COL_1<=Y_7;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_7;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_7;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_7;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_7;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_7;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_7;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_7;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_7;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_7;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_7;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_7;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_7;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_7;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

END IF;



ELSE

				IF(X ="0001")THEN
				COL_1<=Y_8;
				COL_2<=ZEROS;
				COL_3<=ZEROS;
				COL_4<=ZEROS;
				COL_5<=ZEROS;
				COL_6<=ZEROS;
				COL_7<=ZEROS;
				COL_8<=ZEROS;
				COL_9<=ZEROS;
				COL_10<=ZEROS;
				COL_11<=ZEROS;
				COL_12<=ZEROS;
				COL_13<=ZEROS;
				COL_14<=ZEROS;

				ELSIF(X ="0010") THEN 
					
					COL_1<=ZEROS;
					COL_2<=Y_8;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=Y_8;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;


				ELSIF(X ="0100") THEN 
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=Y_8;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;



				ELSIF(X ="0101") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=Y_8;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="0110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=Y_8;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="0111") THEN 

				
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=Y_8;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1000") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=Y_8;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1001") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=Y_8;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1010") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=Y_8;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1011") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=Y_8;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

				ELSIF(X ="1100") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=Y_8;
					COL_13<=ZEROS;
					COL_14<=ZEROS;
				
				ELSIF(X ="1101") THEN 


					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=Y_8;
					COL_14<=ZEROS;
				
				ELSIF(X ="1110") THEN 

					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=Y_8;
					
				ELSE	
					COL_1<=ZEROS;
					COL_2<=ZEROS;
					COL_3<=ZEROS;
					COL_4<=ZEROS;
					COL_5<=ZEROS;
					COL_6<=ZEROS;
					COL_7<=ZEROS;
					COL_8<=ZEROS;
					COL_9<=ZEROS;
					COL_10<=ZEROS;
					COL_11<=ZEROS;
					COL_12<=ZEROS;
					COL_13<=ZEROS;
					COL_14<=ZEROS;

					
					
					
END IF;					
END IF;			
END IF;
END PROCESS PRINT;
					


END ARCHITECTURE;