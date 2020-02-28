LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY sc_tb IS
    
END sc_tb;

ARCHITECTURE arch OF sc_tb IS
  COMPONENT signal_combination IS
    Port ( 
           t_valid : in std_logic;
         data_in : in std_logic_vector(15 downto 0);
         data_out_ch0 : out std_logic_vector(15 downto 0);
         data_out_ch1 : out std_logic_vector(15 downto 0);
         data_out_ch2 : out std_logic_vector(15 downto 0);
         data_out_ch3 : out std_logic_vector(15 downto 0));
end component signal_combination;


signal  t_valid_tb :  STD_LOGIC:='0';
signal dout_ch0_tb : std_logic_vector(15 downto 0):=(others=>'0');
signal dout_ch1_tb : std_logic_vector(15 downto 0):=(others=>'0');
signal dout_ch2_tb : std_logic_vector(15 downto 0):=(others=>'0');
signal dout_ch3_tb : std_logic_vector(15 downto 0):=(others=>'0');
signal din_tb : std_logic_vector(15 downto 0):=(others=>'0');

begin


   instance1:COMPONENT signal_combination
  PORT MAP(            data_out_ch0 => dout_ch0_tb,
                       data_out_ch1 => dout_ch1_tb,
                       data_out_ch2 => dout_ch2_tb,
                       data_out_ch3 => dout_ch3_tb,
                            t_valid => t_valid_tb,
                            data_in => din_tb );

--clk_process: process                                       -- test clock 
--    begin
--             wait for 50 ns;
--             clk_tb<=NOT(clk_tb);
--    end process;


din_tb <= "1111111111111111",
                    "0000000000000000" after 1700 ns;

t_valid_tb <= '0',
              '1' after 100 ns,
              '0' after 200 ns,
              '1' after 500 ns,
              '0' after 600 ns,
              '1' after 900 ns,
              '0' after 1000 ns,
              '1' after 1300 ns,
              '0' after 1400 ns,
              '1' after 1700 ns,
              '0' after 1800 ns,
              '1' after 2100 ns,
              '0' after 2200 ns,
              '1' after 2500 ns,
              '0' after 2600 ns,
              '1' after 2900 ns,
              '0' after 3000 ns;






 END ARCHITECTURE arch;