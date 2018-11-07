----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2017 16:32:42
-- Design Name: 
-- Module Name: ROM - Behavioral
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

entity ROM is
    Port ( commande : in STD_LOGIC_VECTOR (15 downto 0);
           clock : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
end ROM;

architecture Behavioral of ROM is
    type rom_type is array (11 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
    constant memory : rom_type := (
    "0000101010101011", "0100101010101011", "1000101010101011", "1100101010101011",
    "0001101010101011", "0100101010101011", "1001101010101011", "1100101010101011",
    "0010101010101011", "0100101010101011", "1001101010101011", "1100101010101011");

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                data <= memory(to_integer(unsigned(commande)));
            end if;
        end process;
end Behavioral;
