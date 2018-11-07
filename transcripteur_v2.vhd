----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2017 10:36:04
-- Design Name: 
-- Module Name: transcripteur_v2 - Behavioral
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

entity transcripteur_v2 is
    Port ( lvl0 : in STD_LOGIC_VECTOR(1 downto 0);
           lvl1 : in STD_LOGIC_VECTOR(1 downto 0);
           lvl2 : in STD_LOGIC_VECTOR(1 downto 0);
           lvl3 : in STD_LOGIC_VECTOR(1 downto 0);
           code : out STD_LOGIC_VECTOR(3 downto 0);
           start : out STD_LOGIC);
end transcripteur_v2;

architecture Behavioral of transcripteur_v2 is

    signal code_s : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    process(lvl0, lvl1, lvl2, lvl3)
        begin
            if (lvl0 = "10") then
                code_s(0) <= '1';
            else 
                code_s(0) <= '0';
            end if;
            if (lvl1 = "10") then
                code_s(1) <= '1';
            else 
                code_s(0) <= '0';
            end if;
            if (lvl2 = "10") then
                code_s(2) <= '1';
            else
                code_s(2) <= '0';
            end if;
            if (lvl3 = "10") then
                code_s(3) <= '1';
            else
                code_s(3) <= '0';
            end if;
            if (to_integer(unsigned(code_s)) > 1) then
                start <= '1';
            else 
                start <= '0';
            end if;
        end process;
        
    code <= code_s;

end Behavioral;
