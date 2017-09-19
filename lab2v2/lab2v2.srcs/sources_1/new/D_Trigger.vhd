----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2017 16:33:55
-- Design Name: 
-- Module Name: D_Trigger - Behavioral
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

entity D_Trigger is
    Port ( D : in STD_LOGIC;
           C : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_Trigger;

architecture Behavioral of D_Trigger is

begin
    
    process (C, R)
    begin
        Q <= '0';
        if R = '0' then
            Q <= '0';
        elsif rising_edge(C) then
            Q <= D;
        end if;
        
    end process;
        
end Behavioral;
