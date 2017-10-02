----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2017 13:13:26
-- Design Name: 
-- Module Name: tb2file - Behavioral
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

entity tb2file is
--  Port ( );
end tb2file;

architecture Behavioral of tb2file is

 component lab1v6var1 is 
       Port ( nI : in STD_LOGIC_VECTOR (8 downto 0);
              nY : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   
signal inI: STD_LOGIC_VECTOR (8 downto 0);
signal outY: STD_LOGIC_VECTOR (3 downto 0);

constant ok : string(1 to 2) := "ok";
constant fail : string(1 to 4) := "fail";

file in_file : text open read_mode is "E:\Erick\Uni\7_sem\apvmis\lab1v6\lab1v6.srcs\resources\tb_in.txt";
file in_eth_file : text open read_mode is "E:\Erick\Uni\7_sem\apvmis\lab1v6\lab1v6.srcs\resources\tb_eth.txt";
file out_file : text open write_mode is "E:\Erick\Uni\7_sem\apvmis\lab1v6\lab1v6.srcs\resources\tb_out1.txt";
        
begin

    mapping: lab1v6var1 port map(inI, outY);
    
    process
        variable in_row, in_eth_row, out_row : line;
        variable in_int, in_eth_int: integer;
        
    begin
       
        while not endfile(in_file) loop
            -- read test data
            readline(in_file, in_row);
            read(in_row, in_int);
            
            -- read ethalon data
            readline(in_eth_file, in_eth_row);
            read(in_eth_row, in_eth_int);
            
            -- set signal
            inI <= std_logic_vector(to_unsigned(in_int, inI'length));
            
            -- check result
            if (in_eth_int = to_integer(unsigned(outY))) then
                write (out_row, ok);
            else  
                write (out_row, fail);
            end if;
            
            -- write to the out file
            writeline(out_file, out_row);
            
            
            -- write(out_row, to_integer(unsigned(outY)));
            wait for 1 ns;
        end loop;
        wait;
    end process;
    
end Behavioral;
