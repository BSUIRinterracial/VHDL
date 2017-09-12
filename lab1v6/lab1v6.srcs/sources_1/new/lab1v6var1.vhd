----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.09.2017 14:17:25
-- Design Name: 
-- Module Name: lab1v6var1 - Behavioral
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

entity lab1v6var1 is
    Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
           nY : out STD_LOGIC_VECTOR (3 downto 0));
end lab1v6var1;

architecture Behavioral of lab1v6var1 is

begin

    nY(0)  <= not ( ( (not nI(0)) and nI(1) and nI(3) and nI(5) and (nI(7) and nI(8)) )
            or ( (not nI(2))  and nI(3) and nI(5) and (nI(7) and nI(8)) )
            or ( (not nI(4)) and nI(5) and (nI(7) and nI(8)) )
            or ( (not nI(6)) and (nI(7) and nI(8)) )
            or ( not nI(8) ) );
        
    nY(1)  <= not ( ( (not nI(1)) and nI(3) and nI(4) and (nI(7) and nI(8)) )
            or ( (not nI(2)) and nI(3) and nI(4) and (nI(7) and nI(8)) )
            or ( (not nI(5)) and (nI(7) and nI(8)) )
            or ( (not nI(6)) and (nI(7) and nI(8)) ) );  
        
    nY(2)  <= not ( ( (not nI(3)) and (nI(7) and nI(8)) )
            or ( (not nI(4)) and (nI(7) and nI(8)) )
            or ( (not nI(5)) and (nI(7) and nI(8)) )
            or ( (not nI(6)) and (nI(7) and nI(8)) ) );
        
    nY(3) <= nI(7) and nI(8);  

end Behavioral;
