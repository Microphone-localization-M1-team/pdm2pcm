
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_combination is
    Port ( 
           clk : in std_logic;
         data_in : in std_logic_vector(15 downto 0);
         data_out_ch0 : out std_logic_vector(15 downto 0);
         data_out_ch1 : out std_logic_vector(15 downto 0);
         data_out_ch2 : out std_logic_vector(15 downto 0);
         data_out_ch3 : out std_logic_vector(15 downto 0));
end signal_combination;

architecture Behavioral of signal_combination is

signal count_number : integer range 0 to 600;
signal out0_signal : std_logic_vector(15 downto 0) ;
signal out1_signal : std_logic_vector(15 downto 0) ;
signal out2_signal : std_logic_vector(15 downto 0) ;
signal out3_signal : std_logic_vector(15 downto 0) ;


begin

data_out_ch0 <=  out0_signal;
data_out_ch1 <=  out1_signal;
data_out_ch2 <=  out2_signal;
data_out_ch3 <=  out3_signal;


process(clk)
begin

  if(rising_edge(clk)) then   
     if (count_number = 511 )then
             count_number <= 0;

         elsif (count_number = 0 )then
              out0_signal <= data_in;
             count_number <= count_number + 1;

            elsif (count_number = 128 )then
                 out1_signal <= data_in;
                count_number <= count_number + 1;

                elsif (count_number = 256 )then
                     out2_signal <= data_in;
                    count_number <= count_number + 1;

                    elsif (count_number = 384 )then
                         out3_signal <= data_in;
                        count_number <= count_number + 1;

                          else
                            count_number <= count_number + 1;
     end if;          
  end if;

end process;


end Behavioral;
