----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2017 10:07:10
-- Design Name: 
-- Module Name: clavier_hero_top_lvl - Behavioral
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

entity clavier_hero_top_lvl is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           sept_segments : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (7 downto 0);
           row : in STD_LOGIC_VECTOR (3 downto 0));
end clavier_hero_top_lvl;

architecture Behavioral of clavier_hero_top_lvl is

    component Freq_Divider
        PORT (Clock : in STD_LOGIC;
              reset : in STD_LOGIC;
              ROM_7SEG : out STD_LOGIC;
              ce_game : out STD_LOGIC;
              ce_affiche : out STD_LOGIC;
              ce_perception : out STD_LOGIC);
    end component;
    
    component cpt_rom
        PORT ( clock : in STD_LOGIC;
               ce : in STD_LOGIC;
               reset : in STD_LOGIC;
               commande : out STD_LOGIC_VECTOR (9 downto 0));
    end component;
    
    component ROM 
        Port ( commande : in STD_LOGIC_VECTOR (15 downto 0);
               clock : in STD_LOGIC;
               data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component PWM 
        Port ( idata : in STD_LOGIC_VECTOR(10 downto 0);
               CE : in STD_LOGIC;
               reset : in STD_LOGIC;
               clock : in STD_LOGIC;
               odata : out STD_LOGIC);
    end component;
    
    component decoder
        Port ( clock : in STD_LOGIC;
               Row : in STD_LOGIC_VECTOR(3 downto 0);
               Code : in STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component compteur_30 
        Port ( clock : in STD_LOGIC;
               ce : in STD_LOGIC;
               cpt : out STD_LOGIC_VECTOR (4 downto 0);
               start : in STD_LOGIC;
               stop : in STD_LOGIC;
               reset : in STD_LOGIC);
    end component;
    
    component correct_bof_rate 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               cpt : in STD_LOGIC_VECTOR(5 downto 0);
               code_a_appuye : in STD_LOGIC_VECTOR(3 downto 0);
               bouton : in STD_LOGIC_VECTOR(3 downto 0);
               stop : out STD_LOGIC;
               indicateur : out STD_LOGIC_VECTOR(1 downto 0);
               tempo : in STD_LOGIC);
    end component;
    
    component compteur_de_points 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               nb_points : out STD_LOGIC_VECTOR (9 downto 0);
               indicateur : in STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component Assignateur 
        Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
               clock : in STD_LOGIC;
               lvl1 : out STD_LOGIC_VECTOR (1 downto 0);
               lvl2 : out STD_LOGIC_VECTOR (1 downto 0);
               lvl3 : out STD_LOGIC_VECTOR (1 downto 0);
               lvl0 : out STD_LOGIC_VECTOR (1 downto 0);
               data_son : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component transcripteur_v2 
        Port ( lvl0 : in STD_LOGIC_VECTOR(1 downto 0);
               lvl1 : in STD_LOGIC_VECTOR(1 downto 0);
               lvl2 : in STD_LOGIC_VECTOR(1 downto 0);
               lvl3 : in STD_LOGIC_VECTOR(1 downto 0);
               code : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component transcodeur 
        Port ( nb_points : in STD_LOGIC_VECTOR (9 downto 0);
               lvl0 : in STD_LOGIC_VECTOR (1 downto 0);
               lvl1 : in STD_LOGIC_VECTOR (1 downto 0);
               lvl2 : in STD_LOGIC_VECTOR (1 downto 0);
               lvl3 : in STD_LOGIC_VECTOR (1 downto 0);
               nb_millier : out STD_LOGIC_VECTOR (6 downto 0);
               nb_centaine : out STD_LOGIC_VECTOR (6 downto 0);
               nb_dizaine : out STD_LOGIC_VECTOR (6 downto 0);
               nb_unite : out STD_LOGIC_VECTOR (6 downto 0);
               anode_gg : out STD_LOGIC_VECTOR (6 downto 0);
               anode_g : out STD_LOGIC_VECTOR (6 downto 0);
               anode_d : out STD_LOGIC_VECTOR (6 downto 0);
               anode_dd : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component cpt_8 
        Port ( ce : in STD_LOGIC;
               clock : in STD_LOGIC;
               raz : in STD_LOGIC;
               nb : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component mux8
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
    end component;
    
begin

    
        
    

end Behavioral;
