library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Arduino_Loop is
    Port (
        CLK : in STD_LOGIC;  -- Reloj
        RESET : in STD_LOGIC;  -- Reset
        LED : out STD_LOGIC_VECTOR (17 downto 2)  -- Pines de salida
    );
end Arduino_Loop;

architecture Behavioral of Arduino_Loop is
    signal j, k : integer range 2 to 19 := 2;  -- Contadores para los bucles
    signal delay_counter : integer range 0 to 249 := 0;  -- Contador para el retraso

begin

    process (CLK, RESET)
    begin
        if RESET = '1' then  -- Si se activa el reset, inicializa los contadores
            j <= 2;
            k <= 10;
            delay_counter <= 0;
            LED <= (others => '0');  -- Apaga todos los LEDs
        elsif rising_edge(CLK) then
            if delay_counter /= 249 then  -- Realiza el retraso
                delay_counter <= delay_counter + 1;
            else
                delay_counter <= 0;
                if j < 10 then  -- Primera secuencia de encendido y apagado de LEDs
                    LED(j) <= '0';
                    LED(k) <= '1';
                    if k < 18 then
                        k <= k + 1;
                    else
                        k <= 10;
                        j <= j + 1;
                    end if;
                elsif j >= 10 and j < 18 then  -- Segunda secuencia de encendido y apagado de LEDs
                    LED(j) <= '1';
                    LED(k) <= '0';
                    if k < 18 then
                        k <= k + 1;
                    else
                        k <= 10;
                        j <= j + 1;
                    end if;
                else  -- Si se completan todas las secuencias, reinicia los contadores
                    j <= 2;
                    k <= 10;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
