
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_combination is
    Port ( 
             t_valid : in std_logic;
         data_in : in std_logic_vector(15 downto 0);
          t_last : out std_logic;
         data_out_ch0 : out std_logic_vector(15 downto 0);
         data_out_ch1 : out std_logic_vector(15 downto 0);
         data_out_ch2 : out std_logic_vector(15 downto 0);
         data_out_ch3 : out std_logic_vector(15 downto 0));
end signal_combination;

architecture Behavioral of signal_combination is

signal count_number : integer range 0 to 600 :=0 ;
signal out0_signal : std_logic_vector(15 downto 0) ;
signal out1_signal : std_logic_vector(15 downto 0) ;
signal out2_signal : std_logic_vector(15 downto 0) ;
signal out3_signal : std_logic_vector(15 downto 0) ;
signal cnt : std_logic := '0';
signal t_last_signal : std_logic := '0' ;


begin

data_out_ch0 <=  out0_signal;
data_out_ch1 <=  out1_signal;
data_out_ch2 <=  out2_signal;
data_out_ch3 <=  out3_signal;
t_last<=cnt;

process(t_valid)
begin

  if(rising_edge(t_valid)) then   
     if (count_number = 3 )then
              out3_signal <= data_in;
                count_number <= 0;
              cnt<= '1';

         elsif (count_number = 0 )then
              out0_signal <= data_in;
             count_number <= count_number + 1;

            elsif (count_number = 1 )then
                 out1_signal <= data_in;
                count_number <= count_number + 1;

                elsif (count_number = 2 )then
                     out2_signal <= data_in;
                    count_number <= count_number + 1;
		         --    cnt <= '1';

                          else
                            count_number <= count_number + 1;
     end if;          
  end if;

         if (falling_edge(t_valid)and (cnt='1')) then                   
 		--t_last_signal <= '0';
	           cnt <= '0';

end if;
end process;


end Behavioral;
