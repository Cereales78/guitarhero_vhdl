----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2017 11:46:13
-- Design Name: 
-- Module Name: assignateur_test - Behavioral
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

entity assignateur_test is
    Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
           clock : in STD_LOGIC;
           lvl1 : out STD_LOGIC_VECTOR (3 downto 0);
           lvl2 : out STD_LOGIC_VECTOR (3 downto 0);
           lvl3 : out STD_LOGIC_VECTOR (3 downto 0);
           lvl0 : out STD_LOGIC_VECTOR (3 downto 0));
    
end assignateur_test;

architecture Behavioral of Assignateur is

begin
    process(data, clock)
        begin
            if (rising_edge(clock)) then
                lvl0 <= data(10 downto 9);
                lvl1 <= data(7 downto 6);
                lvl2 <= data(4 downto 3);
                lvl3 <= data(1 downto 0);
            end if;
        end process;
    

end Behavioral;