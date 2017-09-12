----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2017 10:54:20
-- Design Name: 
-- Module Name: lab1v6var2 - Behavioral
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

entity lab1v6var2 is
    Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
           nY : out STD_LOGIC_VECTOR (3 downto 0));
end lab1v6var2;

architecture Behavioral of lab1v6var2 is

begin

main_logic: process(nI)
    
     begin
        case nI is 
        when "111111111" => nY <= "1111"; 
        when "0--------" => nY <= "0110"; 
        when "10-------" => nY <= "0111"; 
        when "110------" => nY <= "1000"; 
        when "1110-----" => nY <= "1001"; 
        when "11110----" => nY <= "1010"; 
        when "111110---" => nY <= "1101"; 
        when "1111110--" => nY <= "0011"; 
        when "11111110-" => nY <= "1011"; 
        when "111111110" => nY <= "0111"; 
        when others => nY <= "0000"; 
        end case; 
    end process;

end Behavioral;
