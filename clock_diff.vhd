----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2017 10:00:34
-- Design Name: 
-- Module Name: clock_diff - Behavioral
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

entity clock_diff is
    Port ( clock : in STD_LOGIC;
           ce_rom : out STD_LOGIC;
           ce_affichage : out STD_LOGIC;
           ce_game : out STD_LOGIC;
           ce_perception : out STD_LOGIC);
end clock_diff;

architecture Behavioral of clock_diff is

begin


end Behavioral;
