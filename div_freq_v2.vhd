----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.12.2017 22:34:55
-- Design Name: 
-- Module Name: div_freq_v2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity div_freq_v2 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_game : out STD_LOGIC;
           ce_anode : out STD_LOGIC;
           ce_rom : out STD_LOGIC);
end div_freq_v2;

architecture Behavioral of div_freq_v2 is
    signal cpt_game : integer;
    signal cpt_anode : integer;
    signal cpt_rom : integer;
    
begin
    process (clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_game <= 0;
                    cpt_anode <= 0;
                    cpt_rom <= 0;
                else
                    -- 100Hz
                    if (cpt_game = 999999) then
                        cpt_game <= 0;
                        ce_game <= '1';
                    else 
                        cpt_game <= cpt_game + 1;
                        ce_game <= '0';
                    end if;
                    -- 3kHz
                    if (cpt_anode = 33332) then
                        cpt_anode <= 0;
                        ce_anode <= '1';
                    else
                        cpt_anode <= cpt_anode + 1;
                        ce_anode <= '0';
                    end if;
                    -- 1Hz
                    if (cpt_rom = 99999999) then
                        cpt_rom <= 0;
                        ce_rom <= '1';
                     else
                        cpt_rom <= cpt_rom + 1;
                        ce_rom <= '1';
                    end if;                            
                end if;
            end if;
    end process;

end Behavioral;
