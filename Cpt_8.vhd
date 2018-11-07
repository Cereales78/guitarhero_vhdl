----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2017 11:04:28
-- Design Name: 
-- Module Name: Cpt_8 - Behavioral
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

entity Cpt_8 is
    Port ( ce : in STD_LOGIC;
           clock : in STD_LOGIC;
           raz : in STD_LOGIC;
           nb : out STD_LOGIC_VECTOR (2 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end Cpt_8;

architecture Behavioral of Cpt_8 is

    signal compteur : integer;
begin

    process(clock)
        begin
            if (rising_edge(clock)) then
                if (raz = '1') then
                    compteur <= 0;
                else 
                    if (ce = '1') then
                        compteur <= compteur + 1;
                    end if;
                end if;
                case compteur is
                    when 0 => AN <= "01111111";
                    when 1 => AN <= "10111111";
                    when 2 => AN <= "11011111";
                    when 3 => AN <= "11101111";
                    when 4 => AN <= "11110111";
                    when 5 => AN <= "11111011";
                    when 6 => AN <= "11111101";
                    when 7 => AN <= "11111110";
                    when others =>
                end case;
            end if;
        end process;

nb <= STD_LOGIC_VECTOR(to_unsigned(compteur,3));






 

end Behavioral;
