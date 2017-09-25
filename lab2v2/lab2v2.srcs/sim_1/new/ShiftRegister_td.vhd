----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2017 08:29:34
-- Design Name: 
-- Module Name: ShiftRegister_td - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftRegister_td is
--  Port ( );   
end ShiftRegister_td;

architecture Behavioral of ShiftRegister_td is

component ShiftRegister is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           CLK : in STD_LOGIC;
           nCLR : in STD_LOGIC;
           nOE : in STD_LOGIC_VECTOR (1 downto 0);
           SL : in STD_LOGIC;
           SR : in STD_LOGIC;
           ioQ_ALL : inout STD_LOGIC_VECTOR (7 downto 0);
           Qa : out STD_LOGIC;
           Qh : out STD_LOGIC );
end component;

signal S : STD_LOGIC_VECTOR (1 downto 0);
signal CLK : STD_LOGIC;
signal nCLR : STD_LOGIC;
signal nOE : STD_LOGIC_VECTOR (1 downto 0);
signal SR : STD_LOGIC;
signal SL : STD_LOGIC;
signal ioQ_ALL : STD_LOGIC_VECTOR (7 downto 0);
signal Qa : STD_LOGIC;
signal Qh : STD_LOGIC;
signal shit: STD_LOGIC_VECTOR (3 downto 0);

begin

    mapping: ShiftRegister port map(S, CLK, nCLR, nOE, SR, SL, ioQ_ALL, Qa, Qh);      

    process
    begin
        
        -- init start values
        Qa <= 'Z';
        Qh <= 'Z';
        CLK <= '0';
        S <= "00";
        nOE <= "11"; -- output must be disable before the load action
        nCLR <= '0';      
        ioQ_ALL <= "ZZZZZZZZ";

        SL <= '1';
        SR <= '0';
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        -- S0 = S1 = 1; - load mode
        -- loop for test LOAD
        ioQ_ALL <= "00110001";
--        for i in 0 to 255 loop
            for i2 in 0 to 15 loop
                shit <= std_logic_vector(to_unsigned(i2, shit'length));
                wait for 1 ns;                
                SL <= shit(0);
                SR <= shit(1);
                nOE(0) <= shit(2);
                nOE(1) <= shit(3);
                S(0) <= '1';
                S(1) <= '1';
--                ioQ_ALL <= std_logic_vector(to_unsigned(I, ioQ_ALL'length));
                
                ioQ_ALL <= "00110001";
                ioQ_ALL(0) <= shit(0);
                ioQ_ALL(1) <= shit(0);
                ioQ_ALL(2) <= shit(0);
                ioQ_ALL(3) <= shit(0);                                                         
                              
                                              
                
                wait for 1 ns;
                CLK <= not CLK;    
                wait for 1 ns;
                CLK <= not CLK;
                
                -- output mode
                nOE <= "00";
                S <= "00";
                ioQ_ALL <= "ZZZZZZZZ";
                
                wait for 1 ns;
                                
            end loop;
            
            
            shit <= "0000";
            wait for 10 ns;    
            -- loop for SHIFT MODES
            for i in 0 to 3 loop
            
                shit <= std_logic_vector(to_unsigned(i, shit'length));
                
                S(0) <= '0';
                S(1) <= '1';
                
                SL <= shit(0);
                SR <= shit(1); 
                
                wait for 1 ns;
                CLK <= not CLK;    
                wait for 1 ns;
                CLK <= not CLK;
                
                wait for 1 ns;
                CLK <= not CLK;    
                wait for 1 ns;
                CLK <= not CLK;
                
                S(0) <= '1';
                S(1) <= '0';
                
                wait for 1 ns;
                CLK <= not CLK;    
                wait for 1 ns;
                CLK <= not CLK;
               
                wait for 1 ns;
                CLK <= not CLK;    
                wait for 1 ns;
                CLK <= not CLK;
                
                wait for 1 ns;
                CLK <= not CLK;    
                wait for 1 ns;
                CLK <= not CLK;
                
            end loop;
            
--        end loop;  
        
        -- loop for HOLD mode part 1
        S <= "00";
        nOE <= "00";
        shit <= "0000";
        wait for 10 ns;
        for i in 0 to 7 loop
            shit <= std_logic_vector(to_unsigned(i, shit'length));
            CLK <= shit(0);
            SL <= shit(1);
            SR <= shit(2);
            wait for 1 ns;
        end loop;
        
        CLK <= '0';
        shit <= "0000";
        for i in 0 to 15 loop
            S(0) <= shit(0);
            S(1) <= shit(1);
            SL <= shit(2);
            SR <= shit(3);
            wait for 1 ns;
        end loop;
        
        wait for 10 ns;
                
        --nCLR <= '0';
        shit <= "0000";
        -- check load + clear
        for i in 0 to 15 loop
                
            S(0) <= '1';
            S(1) <= '1';
            ioQ_ALL <= "01010101";
            wait for 1 ns;
            CLK <= not CLK;    
            wait for 1 ns;
            CLK <= not CLK; 
            ioQ_ALL <= "ZZZZZZZZ"; 
            shit <= std_logic_vector(to_unsigned(i, shit'length));
            
            nOE(0) <= shit(0);
            nOE(1) <= shit(1);
            SL <= shit(2);
            SR <= shit(3);
            
            nCLR <= '1';         
            wait for 1 ns;
            nCLR <= '0';
            
            S <= "00";
            nOE <= "00";
            wait for 1 ns;
            
        end loop;
        
        wait for 10 ns;
        
        shit <= "0000";
        nCLR <= '1';   
        -- check shift + clear
        for i in 0 to 3 loop
            
            shit <= std_logic_vector(to_unsigned(i, shit'length));
                        
            S(0) <= '0';
            S(1) <= '1';
            
            SL <= shit(0);
            SR <= shit(1); 
            
            wait for 1 ns;
            CLK <= not CLK;    
            wait for 1 ns;
            CLK <= not CLK;
            
            wait for 1 ns;
            CLK <= not CLK;    
            wait for 1 ns;
            CLK <= not CLK;
            
            S(0) <= '1';
            S(1) <= '0';
            
            wait for 1 ns;
            CLK <= not CLK;    
            wait for 1 ns;
            CLK <= not CLK;
           
            wait for 1 ns;
            CLK <= not CLK;    
            wait for 1 ns;
            CLK <= not CLK;
            
            wait for 1 ns;
            CLK <= not CLK;    
            wait for 1 ns;
            CLK <= not CLK;
            
        end loop;
        
      wait;  
        
--        ioQ_ALL <= "01101011";
--        nOE <= "00"; -- output enable 
        
--        wait for 1 ns;
--        CLK <= not CLK;    
--        wait for 1 ns;
--        CLK <= not CLK;
        
        
--        wait for 1 ns;
----        CLK <= not CLK;    
--        S(0) <= '0';    
--        S(1) <= '1';
--        wait for 1 ns;
----        CLK <= not CLK;
        
--        -- S0 = 0, S1 = 1; - left shift mode
----        S(0) <= '0';
----        S(1) <= '1';
--        ioQ_ALL <= "ZZZZZZZZ";
--        Qa <= 'Z';
--        Qh <= 'Z';
        
--        wait for 1 ns;
--        CLK <= not CLK;    
--        wait for 1 ns;
--        CLK <= not CLK;
        
--        -- S0 = 1, S1 = 0; - right shift mode
--        S(0) <= '1';
--        S(1) <= '0';
--        ioQ_ALL <= "ZZZZZZZZ";
--        Qa <= 'Z';
--        Qh <= 'Z';  
       
--        wait for 1 ns;
--        CLK <= not CLK;    
--        wait for 1 ns;
--        CLK <= not CLK;
        
--        -- S0 = 0, S1 = 0; - hold mode
--        S(0) <= '0';
--        S(1) <= '0'; 
        
--        wait for 1 ns;
--        CLK <= not CLK;    
--        wait for 1 ns;
--        CLK <= not CLK;
        
--        -- S0 = -, S1 = -, CLK = const; - still hold mode...
        
--        wait for 1 ns;
--        S(0) <= '1';   
--        wait for 1 ns;
--        S(1) <= '1';
--        nOE <= "11";        -- try 
--        ioQ_ALL <= "10011101";

--        wait for 1 ns;
--        CLK <= not CLK;    
--        wait for 1 ns;
--        CLK <= not CLK;

        
--        S(1) <= '0';     
--        wait for 1 ns;
--        ioQ_ALL <= "ZZZZZZZZ";
--        wait for 1 ns;
--        S(0) <= '0';    
        
    end process;
     
end Behavioral;
