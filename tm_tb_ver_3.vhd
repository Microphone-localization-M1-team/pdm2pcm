
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb IS
    
END tb;

ARCHITECTURE arch OF tb IS
  COMPONENT time_multiplexer IS
    Port ( pdm_data_0 : in STD_LOGIC;
    pdm_data_1 : in STD_LOGIC;
    pdm_data_2 : in STD_LOGIC;
    pdm_data_3 : in STD_LOGIC;
           clk : in std_logic;
         start : in std_logic;
       t_valid : out std_logic;
        t_last : out std_logic;
      t_tready : out std_logic;
      cic_data : out STD_LOGIC_VECTOR (7 downto 0));
end component time_multiplexer;



signal clk_signal : STD_LOGIC:='0';
signal pdm_data_0_signal : STD_LOGIC:='0';
signal pdm_data_1_signal : STD_LOGIC:='0';
signal pdm_data_2_signal : std_logic:='0';
signal pdm_data_3_signal : std_logic:='0';
signal cic_data_signal : STD_LOGIC_VECTOR (7 downto 0);
signal start_signal : std_logic:='0';
signal t_valid_signal : std_logic:='0';
signal t_last_signal : std_logic:='0';
signal t_tready_signal : std_logic:='0';



begin

   instance1:COMPONENT time_multiplexer
  PORT MAP(            pdm_data_0 => pdm_data_0_signal,
                       pdm_data_1 => pdm_data_1_signal,
                       pdm_data_2 => pdm_data_2_signal,
                       pdm_data_3 => pdm_data_3_signal,
	                      clk => clk_signal,
                            start => start_signal,
                          t_valid => t_valid_signal,
                           t_last =>  t_last_signal,
                         t_tready => t_tready_signal, 
		         cic_data => cic_data_signal);

clk_process: process
    begin
             wait for 50 ns;
             clk_signal<=NOT(clk_signal);
    end process;

start_signal<= '0',
                         '1' after 20 ns,
                         '0' after 50 ns;


pdm_data_0_signal<='1',           
                                   '0' AFTER 100 ns,
                                   '1' AFTER 450 ns,
                                   '0' after 500 ns;
--				   '0' AFTER 150 ns,           
--                                   '0' AFTER 250 ns,
--                                   '0' AFTER 350 ns,
--				   '0' AFTER 450 ns,
--				   '1' AFTER 550 ns,      
--				   '1' AFTER 650 ns,     
--                                   '1' AFTER 750 ns;    
       
pdm_data_1_signal<='0',          
                                   '1' AFTER 100 ns,
				   '0' AFTER 200 ns,
                                   '1' after 550 ns,
                                   '0' after 600 ns;       
--                                   '0' AFTER 250 ns,
--                                   '0' AFTER 350 ns,
--				   '1' AFTER 450 ns, 
--				   '0' AFTER 550 ns, 
--				   '1' AFTER 650 ns,               
--                                   '1' AFTER 750 ns;                    

pdm_data_2_signal<='0';           
--                                   '0' AFTER 50 ns,
--                                   '0' AFTER 150 ns, 
--                                   '1' AFTER 250 ns, 
--                                   '0' AFTER 350 ns,
--				   '1' AFTER 450 ns,
--				   '1' AFTER 550 ns,  
--				   '0' AFTER 650 ns,   
--                                   '1' AFTER 750 ns;    

pdm_data_3_signal<='0',         
                                   '1' AFTER 300 ns,
                                   '0' AFTER 400 ns;
--                                   '0' AFTER 250 ns, 
--                                   '1' AFTER 350 ns,
--				   '1' AFTER 450 ns, 
--				   '1' AFTER 550 ns,
--				   '1' AFTER 650 ns,     
--                                   '0' AFTER 750 ns;    

--test:
--  PROCESS
--  BEGIN
--    WAIT FOR 100 ns;--100
--	ASSERT (cic_data_signal="00000010")
--	REPORT "Error for select channel 0  (100ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--200
--	ASSERT (cic_data_signal="00000010")
--	REPORT "Error for select channel 1 (200ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--300
--	ASSERT (cic_data_signal="00000010")
--	REPORT "Error for select channel 2 (300ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--400
--	ASSERT (cic_data_signal="00000010")
--	REPORT "Error for select channel 3 (400ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--500
--	ASSERT (cic_data_signal="00000000")
--	REPORT "Error for select channel 0  (500ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--600
--	ASSERT (cic_data_signal="00000000")
--	REPORT "Error for select channel 1 (600ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--700
--	ASSERT (cic_data_signal="00000000")
--	REPORT "Error for select channel 2 (700ns)"
--	SEVERITY ERROR; 
--
--    WAIT FOR 100 ns;--800
--	ASSERT (cic_data_signal="00000000")
--	REPORT "Error for select channel 3 (800ns)"
--	SEVERITY ERROR; 
--
--  END PROCESS test;
 END ARCHITECTURE arch;