----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2017 11:34:46
-- Design Name: 
-- Module Name: transcodeur - Behavioral
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

entity transcodeur is
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
end transcodeur;

architecture Behavioral of transcodeur is

    signal nb_points_s : integer;
begin
    Indic : process(lvl0, lvl1, lvl2, lvl3)
        begin
            case lvl0 is 
                when "00" => anode_gg <= "0111111"; -- Niveau haut
                when "01" => anode_gg <= "1111110"; -- Niveau médian
                when "10" => anode_gg <= "1110111"; -- Niveau bas == appui
                when others => anode_gg <= "0000001"; -- Affiche 0
            end case;
            case lvl1 is 
                when "00" => anode_g <= "0111111";
                when "01" => anode_g <= "1111110";
                when "10" => anode_g <= "1110111";
                when others => anode_g <= "0000001";
            end case;
            case lvl2 is 
                when "00" => anode_d <= "0111111";
                when "01" => anode_d <= "1111110";
                when "10" => anode_d <= "1110111";
                when others => anode_d <= "0000001";
            end case;
            case lvl3 is 
                when "00" => anode_dd <= "0111111";
                when "01" => anode_dd <= "1111110";
                when "10" => anode_dd <= "1110111";
                when others => anode_dd <= "0000001";
            end case;
        end process;
      nb_millier <= "0000001";
      nb_centaine <= "0000001";
      nb_dizaine <= "0000001";
      nb_unite <= "1001111";
      
--    AFFICHAGE_POINTS : process(nb_points)
--        begin
--            nb_points_s <= to_integer(unsigned(nb_points));
--            --Traitement des milliers
--            if (nb_points_s < 1000) then
--                nb_millier <= "0000001"; -- affiche 0
--            else
--                if (nb_points_s < 2000) then
--                    nb_millier <= "1001111"; -- affiche 1
--                    nb_points_s <= nb_points_s - 1000;
--                else
--                    if (nb_points_s < 3000) then
--                        nb_millier <= "0010010"; -- affiche 2
--                        nb_points_s <= nb_points_s - 2000;
--                    else
--                        if (nb_points_s < 4000) then
--                            nb_millier <= "0000110"; -- affiche 3
--                            nb_points_s <= nb_points_s - 3000;
--                        else
--                            if (nb_points_s < 5000) then
--                                nb_millier <= "1001100"; -- affiche 4
--                                nb_points_s <= nb_points_s - 4000;
--                            else
--                                if (nb_points_s < 6000) then
--                                    nb_millier <= "0100100"; -- affiche 5
--                                    nb_points_s <= nb_points_s - 5000;
--                                else
--                                    if (nb_points_s < 7000) then
--                                        nb_millier <= "0100000"; -- affiche 6
--                                        nb_points_s <= nb_points_s - 6000;
--                                    else
--                                        if (nb_points_s < 8000) then
--                                            nb_millier <= "0001111"; -- affiche 7
--                                            nb_points_s <= nb_points_s - 7000;
--                                        else
--                                            if (nb_points_s < 9000) then
--                                                nb_millier <= "0000000"; -- affiche 8
--                                                nb_points_s <= nb_points_s - 8000;
--                                            else
--                                                nb_millier <= "0000100"; -- affiche 9
--                                                nb_points_s <= nb_points_s - 9000;
--                                            end if;
--                                        end if;
--                                    end if;
--                                end if;
--                            end if;
--                        end if;
--                    end if;
--                end if;
--            end if;
--            -- Traitement centaines
--            if (nb_points_s < 100) then
--                nb_centaine <= "0000001"; -- affiche 0
--            else
--                if (nb_points_s < 200) then
--                    nb_centaine <= "1001111"; -- affiche 1
--                    nb_points_s <= nb_points_s - 100;
--                else
--                    if (nb_points_s < 300) then
--                        nb_centaine <= "0010010"; -- affiche 2
--                        nb_points_s <= nb_points_s - 200;
--                    else
--                        if (nb_points_s < 400) then
--                            nb_centaine <= "0000110"; -- affiche 3
--                            nb_points_s <= nb_points_s - 300;
--                        else
--                            if (nb_points_s < 500) then
--                                nb_centaine <= "1001100"; -- affiche 4
--                                nb_points_s <= nb_points_s - 400;
--                            else
--                                if (nb_points_s < 600) then
--                                    nb_centaine <= "0100100"; -- affiche 5
--                                    nb_points_s <= nb_points_s - 500;
--                                else
--                                    if (nb_points_s < 700) then
--                                        nb_centaine <= "0100000"; -- affiche 6
--                                        nb_points_s <= nb_points_s - 600;
--                                    else
--                                        if (nb_points_s < 800) then
--                                            nb_centaine <= "0001111"; -- affiche 7
--                                            nb_points_s <= nb_points_s - 700;
--                                        else
--                                            if (nb_points_s < 900) then
--                                                nb_centaine <= "0000000"; -- affiche 8
--                                                nb_points_s <= nb_points_s - 800;
--                                            else
--                                                nb_centaine <= "0000100"; -- affiche 9
--                                                nb_points_s <= nb_points_s - 900;
--                                            end if;
--                                        end if;
--                                    end if;
--                                end if;
--                            end if;
--                        end if;
--                    end if;
--                end if;
--            end if;
--            -- Traitement des dizaines
--            if (nb_points_s < 10) then
--                nb_dizaine <= "0000001"; -- affiche 0
--            else
--                if (nb_points_s < 20) then
--                    nb_dizaine <= "1001111"; -- affiche 1
--                    nb_points_s <= nb_points_s - 10;
--                else
--                    if (nb_points_s < 30) then
--                        nb_dizaine <= "0010010"; -- affiche 2
--                        nb_points_s <= nb_points_s - 20;
--                    else
--                        if (nb_points_s < 40) then
--                            nb_dizaine <= "0000110"; -- affiche 3
--                            nb_points_s <= nb_points_s - 30;
--                        else
--                            if (nb_points_s < 50) then
--                                nb_dizaine <= "1001100"; -- affiche 4
--                                nb_points_s <= nb_points_s - 40;
--                            else
--                                if (nb_points_s < 60) then
--                                    nb_dizaine <= "0100100"; -- affiche 5
--                                    nb_points_s <= nb_points_s - 50;
--                                else
--                                    if (nb_points_s < 70) then
--                                        nb_dizaine <= "0100000"; -- affiche 6
--                                        nb_points_s <= nb_points_s - 60;
--                                    else
--                                        if (nb_points_s < 80) then
--                                            nb_dizaine <= "0001111"; -- affiche 7
--                                            nb_points_s <= nb_points_s - 70;
--                                        else
--                                            if (nb_points_s < 90) then
--                                                nb_dizaine <= "0000000"; -- affiche 8
--                                                nb_points_s <= nb_points_s - 80;
--                                            else
--                                                nb_dizaine <= "0000100"; -- affiche 9
--                                                nb_points_s <= nb_points_s - 90;
--                                            end if;
--                                        end if;
--                                    end if;
--                                end if;
--                            end if;
--                        end if;
--                    end if;
--                end if;
--            end if;
--            -- Traitement des unités
--            case nb_points_s is
--                when 0 => nb_unite <= "0000001"; -- affiche 0
--                when 1 => nb_unite <= "1001111"; -- affiche 1
--                when 2 => nb_unite <= "0010010"; -- affiche 2
--                when 3 => nb_unite <= "0000110"; -- affiche 3
--                when 4 => nb_unite <= "1001100"; -- affiche 4
--                when 5 => nb_unite <= "0100100"; -- affiche 5
--                when 6 => nb_unite <= "0100000"; -- affiche 6
--                when 7 => nb_unite <= "0001111"; -- affiche 7
--                when 8 => nb_unite <= "0000000"; -- affiche 8
--                when 9 => nb_unite <= "0000100"; -- affiche 9
--                when others => nb_unite <= "0000001"; -- affiche 0
--            end case;
--        end process;

end Behavioral;
