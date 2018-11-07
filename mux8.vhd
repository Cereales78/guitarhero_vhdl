----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2017 11:14:15
-- Design Name: 
-- Module Name: mux8 - Behavioral
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

entity mux8 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           in1 : in STD_LOGIC_VECTOR (6 downto 0);
           in2 : in STD_LOGIC_VECTOR (6 downto 0);
           in3 : in STD_LOGIC_VECTOR (6 downto 0);
           in4 : in STD_LOGIC_VECTOR (6 downto 0);
           in5 : in STD_LOGIC_VECTOR (6 downto 0);
           in6 : in STD_LOGIC_VECTOR (6 downto 0);
           in7 : in STD_LOGIC_VECTOR (6 downto 0);
           in8 : in STD_LOGIC_VECTOR (6 downto 0);
           segments : out STD_LOGIC_VECTOR (6 downto 0);
           cpt : in STD_LOGIC_VECTOR (2 downto 0));
end mux8;

architecture Behavioral of mux8 is

begin
    process(cpt)
        begin
           case cpt is 
                when "000" => segments <= in1 ; 
                when "001" => segments <= in2 ;
                when "010" => segments <= in3 ;
                when "011" => segments <= in4 ;
                when "100" => segments <= in5 ;
                when "101" => segments <= in6 ;
                when "110" => segments <= in7 ;
                when "111" => segments <= in8 ;
                when others => segments <= "0000001" ;
             end case;
        end process;

end Behavioral;
