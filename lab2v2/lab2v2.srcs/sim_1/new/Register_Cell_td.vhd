----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2017 17:20:10
-- Design Name: 
-- Module Name: Register_Cell_td - Behavioral
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

entity Register_Cell_td is
--  Port ( );
end Register_Cell_td;

architecture Behavioral of Register_Cell_td is

component Register_Cell is
    Port ( S0 : in STD_LOGIC;
           nS0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           nS1 : in STD_LOGIC;
           CLK : in STD_LOGIC;
           nCLR : in STD_LOGIC;
           iQleft : in STD_LOGIC;
           iQright : in STD_LOGIC;
           OE12 : in STD_LOGIC;
           oQcurr : inout STD_LOGIC; 
           oQ : out STD_LOGIC );
end component;
     
signal S0 : STD_LOGIC;
signal nS0 : STD_LOGIC;
signal S1 : STD_LOGIC;
signal nS1 : STD_LOGIC;
signal CLK : STD_LOGIC;
signal nCLR : STD_LOGIC;
signal iQleft : STD_LOGIC;
signal iQright : STD_LOGIC;
signal OE12 : STD_LOGIC;
signal oQcurr : STD_LOGIC;
signal oQ : STD_LOGIC;    
begin

    mapping: Register_Cell port map(S0, nS0, S1, nS1, CLK, nCLR, 
            iQleft, iQright, OE12, oQcurr, oQ);
            
    process
    begin
     
        CLK <= '0';
        OE12 <= '1';
        nCLR <= '1';
        
        oQcurr <= 'Z';
        
        S0 <= '0';
        nS0 <= '1';
        S1 <= '0';
        nS1 <= '1';  -- 00 - hold state
        
        iQleft <= '0';
        iQright <= '0';
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '0';
        iQright <= '1';
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '1';
        iQright <= '0';
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '1';
        iQright <= '1';
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
                
     -------------------------------
                
        S0 <= '1';
        nS0 <= '0';
        S1 <= '0';
        nS1 <= '1';  -- 01 - shift right state
        
        iQleft <= '0';
        iQright <= '0'; 
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '0';
        iQright <= '1'; -- should get 0;
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;

        iQleft <= '1';
        iQright <= '0'; -- should get 1
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '1';
        iQright <= '1'; -- should get 0;
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        
                
     -------------------------------
                
        S0 <= '0';
        nS0 <= '1';
        S1 <= '1';
        nS1 <= '0';  -- 10 - shift left state
        
        iQleft <= '0';
        iQright <= '0'; 
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '0';
        iQright <= '1'; -- should get 0;
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;

        iQleft <= '1';
        iQright <= '0'; -- should get 1
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        iQleft <= '1';
        iQright <= '1'; -- should get 0;
                
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
    ---------------------------------
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        OE12 <= '0';   -- set output disable before load
        
        S0 <= '1';
        nS0 <= '0';
        S1 <= '1';
        nS1 <= '0';  -- 11 - load state      
            
        oQcurr <= '0';
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
                
        oQcurr <= '1';
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;

       end process;

end Behavioral;
