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
           oQcurr : inout STD_LOGIC );
end component;
     
signal S0 : STD_LOGIC;
signal nS0 : STD_LOGIC;
signal S1 : STD_LOGIC;
signal nS1 : STD_LOGIC;
signal CLK : STD_LOGIC;
signal nCLK : STD_LOGIC;
signal iQleft : STD_LOGIC;
signal iQright : STD_LOGIC;
signal OE12 : STD_LOGIC;
signal oQcurr : STD_LOGIC;
    
begin

    mapping: Register_Cell port map(S0, nS0, S1, nS1, CLK, nCLK, 
            iQleft, iQright, OE12, oQcurr);
    process
    begin
     
        
              
    end process;

end Behavioral;
