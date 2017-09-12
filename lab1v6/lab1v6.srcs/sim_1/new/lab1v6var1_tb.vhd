----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.09.2017 15:31:34
-- Design Name: 
-- Module Name: lab1v6var1_tb - Behavioral
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

entity lab1v6var1_tb is
end lab1v6var1_tb;

architecture Behavioral of lab1v6var1_tb is
    component lab1v6var1 is 
        Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
               nY : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
signal nI: STD_LOGIC_VECTOR (8 downto 0);
signal nY: STD_LOGIC_VECTOR (3 downto 0);
    
begin

    mapping: lab1v6var1 port map(nI, nY);
    process
    begin
    
        nI <= "111111111"; 
        wait for 1 ns; 
        nI <= "0--------"; 
        wait for 1 ns; 
        nI <= "10-------"; 
        wait for 1 ns; 
        nI <= "110------"; 
        wait for 1 ns; 
        nI <= "1110-----"; 
        wait for 1 ns; 
        nI <= "11110----"; 
        wait for 1 ns; 
        nI <= "111110---"; 
        wait for 1 ns; 
        nI <= "1111110--"; 
        wait for 1 ns; 
        nI <= "11111110-"; 
        wait for 1 ns; 
        nI <= "111111110"; 
        wait for 1 ns;
        
    end process;

end Behavioral;
