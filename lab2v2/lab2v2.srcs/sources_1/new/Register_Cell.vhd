----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2017 17:19:17
-- Design Name: 
-- Module Name: Register_Cell - Behavioral
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

entity Register_Cell is
    Port ( S0 : in STD_LOGIC;
           nS0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           nS1 : in STD_LOGIC;
           CLK : in STD_LOGIC;
           nCLR : in STD_LOGIC;
           iQleft : in STD_LOGIC;
           iQright : in STD_LOGIC;
           OE12 : in STD_LOGIC;
           oQcurr : inout STD_LOGIC );
end Register_Cell;

architecture Behavioral of Register_Cell is

component D_Trigger is 
         Port ( D : in STD_LOGIC;
                C : in STD_LOGIC;
                R : in STD_LOGIC;
                Q : out STD_LOGIC );
end component;
     
signal D: STD_LOGIC;
signal Q: STD_LOGIC;

begin
    
    D <= (S0 and nS1 and iQleft)
        or (nS0 and S1 and iQright)
        or (S0 and S1 and oQcurr)
        or (nS0 and nS1 and Q);

    DTrig: D_Trigger port map(D, CLK, nCLR, Q);
    
    calc_d_trigger: process(CLK, OE12)
              
--    variable ands: std_logic_vector(3 downto 0);            
    begin
        
--        ands(0) := S0 and nS1 and iQleft;
--        ands(1) := nS0 and S1 and iQright;
--        ands(2) := S0 and S1 and oQcurr;
--        ands(3) := nS0 and nS1 and Q;
        
--        D <= ands(0) or ands(1) or ands(2) or ands(3);
        
        if OE12 = '1' then
             oQcurr <= Q when not(nCLR = 1);
        end if;
            
    end process;    

end Behavioral;