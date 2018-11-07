----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2017 09:45:40
-- Design Name: 
-- Module Name: cpt_rom - Behavioral
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

entity cpt_rom is
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           reset : in STD_LOGIC;
           commande : out STD_LOGIC_VECTOR (15 downto 0));
end cpt_rom;

architecture Behavioral of cpt_rom is
signal cpt : integer;

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt <= 0;
                else
                    if (cpt < 12) then
                        if (ce = '1') then
                            cpt <= cpt + 1;
                        end if;
                    else
                        cpt <= 0;
                    end if;
                end if;
            end if;
        end process;

    commande <= STD_LOGIC_VECTOR(to_unsigned(cpt, 16));
    
end Behavioral;
