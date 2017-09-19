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
use IEEE.STD_LOGIC_ARITH.ALL;

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
        case conv_integer(unsigned(nI)) is 
        when 511 => nY <= "1111"; 
        when 0 to 255 => nY <= "0110"; 
        when 256 to 383 => nY <= "0111"; 
        when 384 to 447 => nY <= "1000"; 
        when 448 to 479 => nY <= "1001"; 
        when 480 to 495 => nY <= "1010"; 
        when 496 to 503 => nY <= "1011"; 
        when 504 to 507 => nY <= "1100"; 
        when 508 to 509 => nY <= "1101"; 
        when 510 => nY <= "1110"; 
        when others => nY <= "0000"; 
        end case; 
    end process;

end Behavioral;
