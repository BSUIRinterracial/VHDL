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

begin

    mapping: ShiftRegister port map(S, CLK, nCLR, nOE, SR, SL, ioQ_ALL, Qa, Qh);      

    process
    begin
        
        -- init start values
        CLK <= '0';
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
        S(0) <= '1';
        S(1) <= '1';
        SL <= '1';
        SR <= '0';
        ioQ_ALL <= "01101010";
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        nOE <= "00"; -- output enable 
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        -- S0 = 0, S1 = 1; - left shift mode
        S(0) <= '0';
        S(1) <= '1';
        ioQ_ALL <= "ZZZZZZZZ";
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        -- S0 = 1, S1 = 0; - right shift mode
        S(0) <= '1';
        S(1) <= '0';
        ioQ_ALL <= "ZZZZZZZZ";
          
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        -- S0 = 0, S1 = 0; - hold mode
        S(0) <= '0';
        S(1) <= '0'; 
        
        wait for 1 ns;
        CLK <= not CLK;    
        wait for 1 ns;
        CLK <= not CLK;
        
        -- S0 = -, S1 = -, CLK = const; - still hold mode...
        
        wait for 1 ns;
        S(0) <= '1';   
        wait for 1 ns;
        S(1) <= '1';
        wait for 1 ns;
        S(1) <= '0';     
        wait for 1 ns;
           
    end process;
     
end Behavioral;
