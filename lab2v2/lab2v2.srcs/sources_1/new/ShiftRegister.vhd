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
           Qa : out STD_LOGIC := '0';
           Qh : out STD_LOGIC := '0' );
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
           oQcurr : inout STD_LOGIC; 
           oQ : out STD_LOGIC );
end component;
     
--signal S : STD_LOGIC_VECTOR(1 downto 0);
--signal CLK : STD_LOGIC;
--signal nCLR : STD_LOGIC;
--signal ioQ_ALLbuf : STD_LOGIC_VECTOR(7 downto 0);
--signal OE12 : STD_LOGIC_VECTOR(1 downto 0);
--signal Qa : STD_LOGIC;
--signal Qh : STD_LOGIC;
signal Qbuf : STD_LOGIC_VECTOR(5 downto 0);

begin
            
    reg_cell0: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, SL, 
            ioQ_ALL(1), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(0), Qa);
            
    reg_cell1: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(0), 
            ioQ_ALL(2), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(1), Qbuf(0));
            
    reg_cell2: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(1), 
            ioQ_ALL(3), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(2), Qbuf(1));
            
    reg_cell3: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(2), 
            ioQ_ALL(4), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(3), Qbuf(2));
            
    reg_cell4: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(3), 
            ioQ_ALL(5), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(4), Qbuf(3));
            
    reg_cell5: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(4), 
            ioQ_ALL(6), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(5), Qbuf(4));
            
    reg_cell6: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(5), 
            ioQ_ALL(7), (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(6), Qbuf(5));
            
    reg_cell7: Register_Cell port map(S(0), not S(0), S(1), not S(1), CLK, not nCLR, ioQ_ALL(6), 
            SR, (not nOE(0)) and (not nOE(1) and (not (S(0) and S(1)))), ioQ_ALL(7), Qh);
                                         
end Behavioral;
