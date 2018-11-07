----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2017 15:09:53
-- Design Name: 
-- Module Name: Assignateur - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Coupe les données de la ROM en deux : une partie pour le son, l'autre pour afficher 
-- les indications

entity Assignateur is
    Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
           clock : in STD_LOGIC;
           lvl1 : out STD_LOGIC_VECTOR (1 downto 0);
           lvl2 : out STD_LOGIC_VECTOR (1 downto 0);
           lvl3 : out STD_LOGIC_VECTOR (1 downto 0);
           lvl0 : out STD_LOGIC_VECTOR (1 downto 0);
           data_son : out STD_LOGIC_VECTOR (7 downto 0));
end Assignateur;

architecture Behavioral of Assignateur is

    signal commande : STD_LOGIC_VECTOR(1 downto 0);
begin
    process(data)
        begin
            commande <= data(15 downto 14);
            data_son <= data(7 downto 0);
        end process;
        
    process(commande)
        begin
            case commande is 
                when "00" => lvl0 <= data(13 downto 12);
                when "01" => lvl1 <= data(13 downto 12);
                when "10" => lvl2 <= data(13 downto 12);
                when "11" => lvl3 <= data(13 downto 12);
                when others => 
            end case;
        end process;

end Behavioral;
