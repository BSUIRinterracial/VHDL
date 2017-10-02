----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2017 16:01:34
-- Design Name: 
-- Module Name: tb2file_var2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use std.textio.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb2file_var2 is
--  Port ( );
end tb2file_var2;

architecture Behavioral of tb2file_var2 is

component lab1v6var1 is 
       Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
              nY : out STD_LOGIC_VECTOR (3 downto 0));
end component;
   
component lab1v6var2 is 
       Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
              nY : out STD_LOGIC_VECTOR (3 downto 0));
end component;  
    
signal inI_var1, inI_var2: STD_LOGIC_VECTOR (8 downto 0);
signal outY_var1, outY_var2: STD_LOGIC_VECTOR (3 downto 0);

constant ok : string(1 to 2) := "ok";
constant fail : string(1 to 4) := "fail";

file in_file : text open read_mode is "E:\Erick\Uni\7_sem\apvmis\lab1v6\lab1v6.srcs\resources\tb_in.txt";
file out_file : text open write_mode is "E:\Erick\Uni\7_sem\apvmis\lab1v6\lab1v6.srcs\resources\tb_out2.txt";

begin
    
    mapping_var1: lab1v6var1 port map(inI_var1, outY_var1);
    mapping_var2: lab1v6var2 port map(inI_var2, outY_var2);
    
    process
            variable in_row, in_eth_row, out_row : line;
            variable in_int, in_eth_int: integer;
            
    begin
        
        while not endfile(in_file) loop
            -- read test data
            readline(in_file, in_row);
            read(in_row, in_int);
            
            -- get ethalon data
            inI_var2 <= std_logic_vector(to_unsigned(in_int, inI_var2'length));
            
            -- get verifiable data 
            inI_var1 <= std_logic_vector(to_unsigned(in_int, inI_var1'length));
            
            -- check result
            if (to_integer(unsigned(outY_var1)) = to_integer(unsigned(outY_var2)))
            then
                write (out_row, ok);
            else  
                write (out_row, fail);
            end if;
            
            -- write to the out file
            writeline(out_file, out_row);
            
            wait for 1 ns;
        end loop;
        wait;
        
    end process;
end Behavioral;
