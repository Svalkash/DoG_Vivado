library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.std_logic_arith.ALL;

entity TB_AXIS2VGA_IP is
    -- ѕараметры кадра
    generic (
        HAV : integer := 640;
        HFP : integer := 16;
        HSP : integer := 96;
        HBP : integer := 48;
        
        VAV : integer := 480;
        VFP : integer := 10;
        VSP : integer := 2;
        VBP : integer := 33;
        
        HPL : std_logic := '0';
        VPL : std_logic := '0';
        
        -- минимальное количество значение дл€ запроса данных.
        INT_REQ : integer := 2048
    );
end TB_AXIS2VGA_IP;

architecture Behavioral of TB_AXIS2VGA_IP is
    component AXIS2VGA_IP is
        -- ѕараметры кадра
        generic (
            HAV : integer := 640;
            HFP : integer := 16;
            HSP : integer := 96;
            HBP : integer := 48;
            
            VAV : integer := 480;
            VFP : integer := 10;
            VSP : integer := 2;
            VBP : integer := 33;
            
            HPL : std_logic := '0';
            VPL : std_logic := '0';
            
            -- минимальное количество значение дл€ запроса данных.
            INT_REQ : integer := 2048
        );
        -- ѕорты
        port(
            -- сигнал синхронизации и сброса.
            -- !!! сброс синхронный с активным низким уровнем.
            clk : in std_logic;
            reset_n : in std_logic;
            
            -- шина AXIS
            axis_data : in std_logic_vector(15 downto 0);
            axis_valid : in std_logic;
            axis_tready : out std_logic := '0';
            
            -- счетчик данных в FIFO
            fifo_data_c : in std_logic_vector(31 downto 0);
            
            -- сигнал прерывани€
            int_r : out std_logic := '0';
            
            -- интерфейс VGA
            vga_red : out std_logic_vector(3 downto 0);
            vga_green : out std_logic_vector(3 downto 0);
            vga_blue : out std_logic_vector(3 downto 0);
            vga_hsync : out std_logic;
            vga_vsync : out std_logic
        );
    end component;
    
    constant CLK_PERIOD : time := 40 ns; -- 25 ћ√ц
    
    signal clk : std_logic := '0';
    signal reset_n : std_logic := '0';
    signal axis_data : std_logic_vector(15 downto 0) := (others => '0');
    signal axis_valid : std_logic := '0';
    signal fifo_data_c : std_logic_vector(31 downto 0) := (others => '0');
    
    signal axis_tready : std_logic := '0';
    signal int_r : std_logic := '0';
    signal vga_red : std_logic_vector(3 downto 0);
    signal vga_green : std_logic_vector(3 downto 0);
    signal vga_blue : std_logic_vector(3 downto 0);
    signal vga_hsync : std_logic;
    signal vga_vsync : std_logic;
    
begin
    -- вставка тестируемого компонента.
    uut : AXIS2VGA_IP
    generic map(
        HAV => HAV,
        HFP => HFP,
        HSP => HSP,
        HBP => HBP,
        
        VAV => VAV,
        VFP => VFP,
        VSP => VSP,
        VBP => VBP,
        
        HPL => HPL,
        VPL => VPL,
        
        INT_REQ => INT_REQ
    )
    port map(
        clk => clk,
        reset_n => reset_n,
        
        axis_data => axis_data,
        axis_valid => axis_valid,
        axis_tready => axis_tready,
        
        fifo_data_c => fifo_data_c,
        int_r => int_r,
        
        vga_red => vga_red,
        vga_green => vga_green,
        vga_blue => vga_blue,
        vga_hsync => vga_hsync,
        vga_vsync => vga_vsync
    );
    
    -- процесс дл€ генерации синхроимпульсов
    clk_gen_p : process
    begin
        clk <= '1';
        wait for CLK_PERIOD/2;
        clk <= '0';
        wait for CLK_PERIOD/2;
    end process clk_gen_p;
    
    -- основной процесс тестовых воздействий
    test_p : process
    begin
        wait for 10us;
        reset_n <= '1';
        
        loop
            -- ждем запроса на данные
            wait until clk'event and clk = '1' and int_r = '1';
            wait for 1us;
            
            -- эмул€ци€ заполнени€ FIFO
            while int_r = '1' loop
                fifo_data_c <= fifo_data_c + x"00000010";
                wait until clk'event and clk = '1';
            end loop;
            
            -- эмул€ци€ передачи кадра
            wait until clk'event and clk = '1' and axis_tready = '1';
            axis_valid <= '1';
            axis_data <= x"2000"; -- дл€ первого пиксел€ 1 в 13 бите
            
            wait until clk'event and clk = '1' and axis_tready = '1';
            for i in 0 to (HAV * VAV) - 1 loop
                axis_data <= x"0" & conv_std_logic_vector(i,12);
                wait until clk'event and clk = '1' and axis_tready = '1';
            end loop;
            
            axis_data <= x"1FFF"; -- дл€ последнего пиксел€ 1 в 12 бите
            wait until clk'event and clk = '1' and axis_tready = '1';
            axis_valid <= '0';
            fifo_data_c <= x"00000000";
        end loop;
        
        wait;
    end process test_p;
    
end Behavioral;