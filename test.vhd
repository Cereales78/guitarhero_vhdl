----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2017 11:57:00
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           JA : inout STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           s7gments : out STD_LOGIC_VECTOR (6 downto 0));
end test;

architecture Behavioral of test is
    component div_freq_v2
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_game : out STD_LOGIC;
           ce_anode : out STD_LOGIC;
           ce_rom : out STD_LOGIC);
    end component;
    
    signal ce_game : STD_LOGIC;
    signal ce_anode : STD_LOGIC;
    signal ce_rom : STD_LOGIC;
    
    component cpt_rom
        PORT ( clock : in STD_LOGIC;
               ce : in STD_LOGIC;
               reset : in STD_LOGIC;
               commande : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal commande : STD_LOGIC_VECTOR (15 downto 0);
    
    component ROM 
        Port ( commande : in STD_LOGIC_VECTOR (15 downto 0);
               clock : in STD_LOGIC;
               data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal data : STD_LOGIC_VECTOR(15 downto 0);
    
    component PWM 
        Port ( idata : in STD_LOGIC_VECTOR(10 downto 0);
               CE : in STD_LOGIC;
               reset : in STD_LOGIC;
               clock : in STD_LOGIC;
               odata : out STD_LOGIC);
    end component;
    
    component decoder
        Port ( clk : in STD_LOGIC;
               Row : in STD_LOGIC_VECTOR(3 downto 0);
               Code : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal code : STD_LOGIC_VECTOR(3 downto 0);
    component compteur_30 
        Port ( clock : in STD_LOGIC;
               ce : in STD_LOGIC;
               cpt : out STD_LOGIC_VECTOR (4 downto 0);
               start : in STD_LOGIC;
               stop : in STD_LOGIC;
               reset : in STD_LOGIC);
    end component;
    
    signal cpt : STD_LOGIC_VECTOR(4 downto 0);
    
    component correct_bof_rate 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               cpt : in STD_LOGIC_VECTOR(4 downto 0);
               code_a_appuye : in STD_LOGIC_VECTOR(3 downto 0);
               bouton : in STD_LOGIC_VECTOR(3 downto 0);
               stop : out STD_LOGIC;
               indicateur : out STD_LOGIC_VECTOR(1 downto 0);
               tempo : in STD_LOGIC);
    end component;
    
    signal stop : STD_LOGIC;
    signal indicateur : STD_LOGIC_VECTOR(1 downto 0);
    
    component compteur_de_points 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               nb_points : out STD_LOGIC_VECTOR (9 downto 0);
               indicateur : in STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    signal nb_points : STD_LOGIC_VECTOR (9 downto 0);
    
    component Assignateur 
        Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
               clock : in STD_LOGIC;
               lvl1 : out STD_LOGIC_VECTOR (1 downto 0);
               lvl2 : out STD_LOGIC_VECTOR (1 downto 0);
               lvl3 : out STD_LOGIC_VECTOR (1 downto 0);
               lvl0 : out STD_LOGIC_VECTOR (1 downto 0);
               data_son : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal lvl1 : STD_LOGIC_VECTOR(1 downto 0);
    signal lvl2 : STD_LOGIC_VECTOR(1 downto 0);
    signal lvl3 : STD_LOGIC_VECTOR(1 downto 0);
    signal lvl0 : STD_LOGIC_VECTOR(1 downto 0);
    signal data_son : STD_LOGIC_VECTOR (7 downto 0);
    
    component transcripteur_v2 
        Port ( lvl0 : in STD_LOGIC_VECTOR(1 downto 0);
               lvl1 : in STD_LOGIC_VECTOR(1 downto 0);
               lvl2 : in STD_LOGIC_VECTOR(1 downto 0);
               lvl3 : in STD_LOGIC_VECTOR(1 downto 0);
               code : out STD_LOGIC_VECTOR(3 downto 0);
               start : out STD_LOGIC);
    end component;
    
    signal code_a_appuye : STD_LOGIC_VECTOR(3 downto 0);
    signal start : STD_LOGIC;
    
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
    
    signal nb_millier : STD_LOGIC_VECTOR (6 downto 0);
    signal nb_centaine : STD_LOGIC_VECTOR (6 downto 0);
    signal nb_dizaine : STD_LOGIC_VECTOR (6 downto 0);
    signal nb_unite : STD_LOGIC_VECTOR (6 downto 0);
    signal anode_gg : STD_LOGIC_VECTOR (6 downto 0);
    signal anode_g : STD_LOGIC_VECTOR (6 downto 0);
    signal anode_d : STD_LOGIC_VECTOR (6 downto 0);
    signal anode_dd : STD_LOGIC_VECTOR (6 downto 0);
    
    component cpt_8 
        Port ( ce : in STD_LOGIC;
               clock : in STD_LOGIC;
               raz : in STD_LOGIC;
               nb : out STD_LOGIC_VECTOR (2 downto 0);
               AN : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal nb : STD_LOGIC_VECTOR (2 downto 0);
    
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
    
    signal segments : STD_LOGIC_VECTOR (6 downto 0);
  
begin
    
    inst0 : decoder PORT MAP
    ( clk => clock,
      Row => JA(7 downto 4),
      code => code);
    inst1 : div_freq_v2 PORT MAP
    ( clock => clock,
      reset => reset,
      ce_rom => ce_rom,
      ce_game => ce_game,
      ce_anode => ce_anode);
     inst2 : correct_bof_rate PORT MAP
     ( clock => clock,
       reset => reset, 
       cpt => cpt,
       code_a_appuye => code_a_appuye,
       bouton => code,
       stop => stop,
       indicateur => indicateur,
       tempo => start);
     inst3 : compteur_30 PORT MAP
     ( clock => clock,
       ce => ce_game,
       cpt => cpt,
       start => start,
       stop => stop,
       reset => reset);
 --    inst4 : compteur_de_points PORT MAP
 --    ( clock => clock,
 --      reset => reset,
 --      nb_points => nb_points,
 --      indicateur => indicateur);
     nb_points <= "0000000001";
     inst5 : transcripteur_v2 PORT MAP
     ( lvl0 => lvl0,
       lvl1 => lvl1,
       lvl2 => lvl2,
       lvl3 => lvl3,
       code => code_a_appuye);
     inst6 : Assignateur PORT MAP
    ( data => data,
       clock => clock,
       lvl1 => lvl1,
       lvl2 => lvl2,
       lvl3 => lvl3,
       lvl0 => lvl0);
     inst7 : ROM PORT MAP
     ( commande => commande,
       clock => clock,
       data => data);
     inst8 : cpt_rom PORT MAP
     ( clock => clock,
       reset => reset,
       ce => ce_rom,
       commande => commande); 
     inst9 : cpt_8 PORT MAP
     ( ce => ce_anode,
       clock => clock,
       raz => reset,
       nb => nb,
       AN => AN);
     inst10 : mux8 PORT MAP
     ( clock => clock,
       reset => reset,
       in1 => anode_gg,
       in2 => anode_g,
       in3 => anode_d,
       in4 => anode_dd,
       in5 => nb_millier,
       in6 => nb_centaine,
       in7 => nb_dizaine,
       in8 => nb_unite,
       segments => s7gments,
       cpt => nb);
    inst12 : transcodeur PORT MAP
    ( nb_points => nb_points,
      lvl0 => lvl0,
      lvl1 => lvl1,
      lvl2 => lvl2,
      lvl3 => lvl3,
      nb_millier => nb_millier,
      nb_centaine => nb_centaine,
      nb_dizaine => nb_dizaine,
      nb_unite => nb_unite,
      anode_gg => anode_gg,
      anode_g => anode_g,
      anode_d => anode_d,
      anode_dd => anode_dd);       

     
        

end Behavioral;
