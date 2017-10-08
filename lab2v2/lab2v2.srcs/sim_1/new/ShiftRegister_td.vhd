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
use std.textio.all;

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
signal buffer_sig: STD_LOGIC_VECTOR (3 downto 0) := "0000";

signal Qa_from_file, Qh_from_file : STD_LOGIC_VECTOR (1 downto 1);

constant ok : string(1 to 2) := "ok";
constant fail : string(1 to 4) := "fail";

file in_file : text open read_mode is "E:\Erick\Uni\7_sem\apvmis\lab2v2\lab2v2.srcs\resources\tb_eth_in.txt";

procedure VARIFY_RESULT (
    signal Qall : STD_LOGIC_VECTOR(7 downto 0);
    signal Qa : STD_LOGIC;
    signal Qh : STD_LOGIC
    ) is
    
    variable row : line;        
    variable tmp_Qall_int, tmp_Qa_int, tmp_Qh_int : integer;
    variable tmp_Qall_v : STD_LOGIC_VECTOR(7 downto 0);
    variable tmp_Qa_v, tmp_Qh_v : STD_LOGIC_VECTOR(0 downto 0);
    
begin

    readline(in_file, row);  
          
    read(row, tmp_Qall_int);
    if tmp_Qall_int = -1 then 
        tmp_Qall_v := "ZZZZZZZZ";
    else  
        tmp_Qall_v := std_logic_vector(to_unsigned(tmp_Qall_int, tmp_Qall_v'length));
    end if;
    
    read(row, tmp_Qa_int);
    tmp_Qa_v := std_logic_vector(to_unsigned(tmp_Qa_int, tmp_Qa_v'length));
    read(row, tmp_Qh_int);
    tmp_Qh_v := std_logic_vector(to_unsigned(tmp_Qh_int, tmp_Qh_v'length));
    
    if (tmp_Qa_v(0) = Qa) 
        and (tmp_Qh_v(0) = Qh)
        and (tmp_Qall_v = Qall)
    then
        -- it's OK
        report "It's OK" severity note;
    else 
        report "Error occured" severity error;           
        report "Expected values:   " & std_logic'image(tmp_Qall_v(7)) & std_logic'image(tmp_Qall_v(6)) & std_logic'image(tmp_Qall_v(5))
                & std_logic'image(tmp_Qall_v(4)) & std_logic'image(tmp_Qall_v(3)) & std_logic'image(tmp_Qall_v(2))
                & std_logic'image(tmp_Qall_v(1)) & std_logic'image(tmp_Qall_v(0)) 
                & ", " & std_logic'image(tmp_Qa_v(0)) & ", " & std_logic'image(tmp_Qh_v(0)) severity error;
                
        report "Varifiable values: " & std_logic'image(Qall(7)) & std_logic'image(Qall(6)) & std_logic'image(Qall(5))
                & std_logic'image(Qall(4)) & std_logic'image(Qall(3)) & std_logic'image(Qall(2))
                & std_logic'image(Qall(1)) & std_logic'image(Qall(0)) 
                & ", " & std_logic'image(Qa) & ", " & std_logic'image(Qh) severity error;

    end if;
    
    --wait for 1 ns;           -- Wait is OK here.
end VARIFY_RESULT;

begin

    mapping: ShiftRegister port map(S, CLK, nCLR, nOE, SR, SL, ioQ_ALL, Qa, Qh);      

    process
        variable in_eth_row, row_out : line;
        variable in_Qall, in_Qh, in_Qa : integer;  
         
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
        VARIFY_RESULT(ioQ_all, Qa, Qh); 
        
        wait for 1 ns;
        CLK <= not CLK;
        VARIFY_RESULT(ioQ_all, Qa, Qh); 
        
        -- S0 = S1 = 1; - load mode
        -- loop for test LOAD
        ioQ_ALL <= "00110001";
--        for i in 0 to 255 loop
            for i2 in 0 to 15 loop
                buffer_sig <= std_logic_vector(to_unsigned(i2, buffer_sig'length));
                wait for 1 ns;
                            
                SL <= buffer_sig(0);
                SR <= buffer_sig(1);
                nOE(0) <= buffer_sig(2);
                nOE(1) <= buffer_sig(3);
                S(0) <= '1';
                S(1) <= '1';
--                ioQ_ALL <= std_logic_vector(to_unsigned(I, ioQ_ALL'length));
                
                ioQ_ALL <= "00110001";
                ioQ_ALL(0) <= buffer_sig(0);
                ioQ_ALL(1) <= buffer_sig(0);
                ioQ_ALL(2) <= buffer_sig(0);
                ioQ_ALL(3) <= buffer_sig(0); 
                                                                        
                VARIFY_RESULT(ioQ_all, Qa, Qh);                                               
                
                wait for 1 ns;
                CLK <= not CLK;  
                VARIFY_RESULT(ioQ_all, Qa, Qh);   
                wait for 1 ns;
                CLK <= not CLK;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                
                -- output mode
                nOE <= "00";
                S <= "00";
                ioQ_ALL <= "ZZZZZZZZ";
                
                wait for 1 ns;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                                
            end loop;
            
            
            buffer_sig <= "0000";
            wait for 10 ns;   
            --for i in 0 to 10 loop 
                --VARIFY_RESULT(ioQ_all, Qa, Qh); 
            --end loop;
            --VARIFY_RESULT(ioQ_all, Qa, Qh); 
            -- loop for SHIFT MODES
            for i in 0 to 3 loop
            
                buffer_sig <= std_logic_vector(to_unsigned(i, buffer_sig'length));
                
                S(0) <= '0';
                S(1) <= '1';
                
                SL <= buffer_sig(0);
                SR <= buffer_sig(1); 
                
                wait for 1 ns;
                CLK <= not CLK;   
                VARIFY_RESULT(ioQ_all, Qa, Qh);  
                wait for 1 ns;
                CLK <= not CLK;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                
                wait for 1 ns;
                CLK <= not CLK; 
                VARIFY_RESULT(ioQ_all, Qa, Qh);    
                wait for 1 ns;
                CLK <= not CLK;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                
                S(0) <= '1';
                S(1) <= '0';
                
                wait for 1 ns;
                CLK <= not CLK;   
                VARIFY_RESULT(ioQ_all, Qa, Qh);  
                wait for 1 ns;
                CLK <= not CLK;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
               
                wait for 1 ns;
                CLK <= not CLK;    
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                wait for 1 ns;
                CLK <= not CLK;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                
                wait for 1 ns;
                CLK <= not CLK;    
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                wait for 1 ns;
                CLK <= not CLK;
                VARIFY_RESULT(ioQ_all, Qa, Qh); 
                
            end loop;
            
--        end loop;  
        
        -- loop for HOLD mode part 1
        S <= "00";
        nOE <= "00";
        buffer_sig <= "0000";
        wait for 10 ns;            
--        for i in 0 to 10 loop 
--            VARIFY_RESULT(ioQ_all, Qa, Qh); 
--        end loop;
        
        for i in 0 to 7 loop
            buffer_sig <= std_logic_vector(to_unsigned(i, buffer_sig'length));
            CLK <= buffer_sig(0);
            SL <= buffer_sig(1);
            SR <= buffer_sig(2);
            wait for 1 ns;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
        end loop;
        
        CLK <= '0';
        buffer_sig <= "0000";
        for i in 0 to 15 loop
            S(0) <= buffer_sig(0);
            S(1) <= buffer_sig(1);
            SL <= buffer_sig(2);
            SR <= buffer_sig(3);
            wait for 1 ns;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
        end loop;
        
        wait for 10 ns;
--        for i in 0 to 10 loop 
--            VARIFY_RESULT(ioQ_all, Qa, Qh); 
--        end loop;
                
        --nCLR <= '0';
        buffer_sig <= "0000";
        -- check load + clear
        for i in 0 to 15 loop
                
            S(0) <= '1';
            S(1) <= '1';
            ioQ_ALL <= "01010101";
            wait for 1 ns;
            CLK <= not CLK; 
            VARIFY_RESULT(ioQ_all, Qa, Qh);    
            wait for 1 ns;
            CLK <= not CLK; 
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            ioQ_ALL <= "ZZZZZZZZ"; 
            buffer_sig <= std_logic_vector(to_unsigned(i, buffer_sig'length));
            
            nOE(0) <= buffer_sig(0);
            nOE(1) <= buffer_sig(1);
            SL <= buffer_sig(2);
            SR <= buffer_sig(3);
            
            nCLR <= '1';         
            wait for 1 ns;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            nCLR <= '0';
            
            S <= "00";
            nOE <= "00";
            wait for 1 ns;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            
        end loop;
        
        wait for 10 ns;
--        for i in 0 to 10 loop 
--            VARIFY_RESULT(ioQ_all, Qa, Qh); 
--        end loop;
        
        buffer_sig <= "0000";
        nCLR <= '1';   
        -- check shift + clear
        for i in 0 to 3 loop
            
            buffer_sig <= std_logic_vector(to_unsigned(i, buffer_sig'length));
                        
            S(0) <= '0';
            S(1) <= '1';
            
            SL <= buffer_sig(0);
            SR <= buffer_sig(1); 
            
            wait for 1 ns;
            CLK <= not CLK;   
            VARIFY_RESULT(ioQ_all, Qa, Qh);  
            wait for 1 ns;
            CLK <= not CLK;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            
            wait for 1 ns;
            CLK <= not CLK;   
            VARIFY_RESULT(ioQ_all, Qa, Qh);  
            wait for 1 ns;
            CLK <= not CLK;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            
            S(0) <= '1';
            S(1) <= '0';
            
            wait for 1 ns;
            CLK <= not CLK; 
            VARIFY_RESULT(ioQ_all, Qa, Qh);    
            wait for 1 ns;
            CLK <= not CLK;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
           
            wait for 1 ns;
            CLK <= not CLK;    
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            wait for 1 ns;
            CLK <= not CLK;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            
            wait for 1 ns;
            CLK <= not CLK;   
            VARIFY_RESULT(ioQ_all, Qa, Qh);  
            wait for 1 ns;
            CLK <= not CLK;
            VARIFY_RESULT(ioQ_all, Qa, Qh); 
            
        end loop;
        
        wait;  
        
    end process;
     
end Behavioral;
