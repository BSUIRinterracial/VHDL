----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2017 16:35:14
-- Design Name: 
-- Module Name: D_Trigger_td - Behavioral
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

entity D_Trigger_td is
--  Port ( );
end D_Trigger_td;

architecture Behavioral of D_Trigger_td is

component D_Trigger is 
         Port ( D : in STD_LOGIC;
               notS : in STD_LOGIC;
               C : in STD_LOGIC;
               notR : in STD_LOGIC;
               Q : out STD_LOGIC; 
               notQ : out STD_LOGIC);
end component;
     
signal D: STD_LOGIC;
signal notS: STD_LOGIC;
signal C: STD_LOGIC;
signal notR: STD_LOGIC;
signal Q: STD_LOGIC;
signal notQ: STD_LOGIC;
    
begin

    mapping: D_Trigger port map(D, notS, C, notR, Q, notQ);
    process
    begin
     
        D <= '0';
        C <= '0';
        notR <= '1';
        notS <= '1';
        
        wait for 1 ns;
        D <= '1';
        wait for 1 ns;
        C <= '1';
        wait for 1 ns;
        D <= '0';
        wait for 1 ns;
        c <= '0';
        wait for 1 ns;
        c <= '1';
        wait for 5 ns;
        
        notR <= '0';
        wait for 1 ns;
        C <= '0';
        wait for 1 ns;
        D <= '1';
        wait for 1 ns;
        C <= '1';
        wait for 1 ns;
        D <= '0';
        C <= '0';
        wait for 1 ns;
        C <= '1';
        wait for 5 ns;
        
        notR <= '1';
        notS <= '0';
        C <= '0';
        wait for 1 ns;
        D <= '1';
        wait for 1 ns;
        C <= '1';
        wait for 1 ns;
        D <= '0';
        C <= '0';
        wait for 1 ns;
        C <= '1';
        wait for 5 ns;
        
        notR <= '0';
        notS <= '0';
        C <= '0';
        wait for 1 ns;
        D <= '1';
        wait for 1 ns;
        C <= '1';
        wait for 1 ns;
        D <= '0';
        C <= '0';
        wait for 1 ns;
        C <= '1';
        wait for 1 ns;
        
    end process;

end Behavioral;
