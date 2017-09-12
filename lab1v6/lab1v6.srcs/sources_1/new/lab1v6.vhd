----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.09.2017 11:08:31
-- Design Name: 
-- Module Name: lab1v6 - Behavioral
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

entity lab1v6 is
    Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
           nY : out STD_LOGIC_VECTOR (3 downto 0));
end lab1v6;

architecture Behavioral of lab1v6 is

begin
main_logic: process 
    
     variable v: std_ulogic_vector(13 downto 0);
     begin
        
        wait for 30 ns;
             
        v(13) := not (nI(7) and nI(8));
        
        v(0)  := ( (not nI(0)) and nI(1) and nI(3) and nI(5) and v(13) );
        v(1)  := ( (not nI(2))  and nI(3) and nI(5) and v(13)  );
        v(2)  := ( (not nI(4)) and nI(5) and v(13) );
        v(3)  := ( (not nI(6)) and v(13)  );
        v(4)  := ( not nI(8) );
        
        wait for 30 ns;
        nY(0) <= not ( v(0) or v(1) or v(2) or v(3) or v(4) ) ;
        wait for 30 ns;   
        
        v(5)  := ( (not nI(1)) and nI(3) and nI(4) and v(13) );
        v(6)  := ( (not nI(2)) and nI(3) and nI(4) and v(13) );
        v(7)  := ( (not nI(5)) and v(13) );
        v(8)  := ( (not nI(6)) and v(13) );
       
        nY(1) <= not ( v(5) or v(6) or v(7) or v(8) );
        wait for 30 ns;   
        
        v(9)  := ( (not nI(3)) and v(13) );
        v(10) := ( (not nI(4)) and v(13) );
        v(11) := ( (not nI(5)) and v(13) );
        v(12) := ( (not nI(6)) and v(13) );
        
        nY(2) <= not ( v(9) or v(10) or v(11) or v(12) );
        wait for 30 ns;
        
        nY(3) <= v(13);  
        wait for 30 ns;
        
--        case a is 
--        when "000" => y <= x(0); 
--        when "001" => y <= x(1); 
--        when "010" => y <= x(2); 
--        when "011" => y <= x(3); 
--        when "100" => y <= x(4); 
--        when "101" => y <= x(5); 
--        when "110" => y <= x(6); 
--        when "111" => y <= x(7); 
--        when others => y <= '0'; 
--        end case; 

    end process;
    
end Behavioral;
