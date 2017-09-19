----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2017 19:15:09
-- Design Name: 
-- Module Name: ShiftRegister - Behavioral
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

entity ShiftRegister is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           CLK : in STD_LOGIC;
           nCLR : in STD_LOGIC;
           nOE : in STD_LOGIC_VECTOR (1 downto 0);
           SL : in STD_LOGIC;
           SR : in STD_LOGIC;
           ioQ_ALL : inout STD_LOGIC_VECTOR (7 downto 0);
           Qa : in STD_LOGIC;
           Qh : in STD_LOGIC);
end ShiftRegister;

architecture Behavioral of ShiftRegister is

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
     
signal S : STD_LOGIC_VECTOR(1 downto 0);
signal CLK : STD_LOGIC;
signal nCLR : STD_LOGIC;
signal Q_ALL : STD_LOGIC_VECTOR(7 downto 0);
signal OE12 : STD_LOGIC_VECTOR(1 downto 0);
signal Qa : STD_LOGIC;
signal Qh : STD_LOGIC;

TYPE Register_Cell_Array IS ARRAY (0 TO 7) OF Register_Cell;
-- да, это жеска

begin

    mapping: Register_Cell_Array(0) port map(S(0), not S(0), S(1), not S(1), CLK, nCLR, 
            Q_ALL(7), Q_ALL(1), OE12(1), Q_ALL(0));

end Behavioral;
