library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity TB_DOG2AXIS is
    generic (
        -- AXIS2VGA params
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
        
        INT_REQ : integer := 2048;
        
        -- DOG2AXIS params
        BSZ_P2 : natural := 4; -- one "block" size (both x and y), power of 2 (1 << 4 = 16)
        INT_REQ_DOG : integer := 40 -- min. data in FIFO for interrupt
    );
end TB_DOG2AXIS;

architecture Behavioral of TB_DOG2AXIS is
    component AXIS2VGA_IP is
        -- ��������� �����
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
            
            -- ����������� ���������� �������� �� ������� ������.
            INT_REQ : integer := 40
        );
        -- �����
        port(
            -- ������ ������������� � ������.
            -- !!! ����� ���������� � �������� ������ �������.
            clk : in std_logic;
            reset_n : in std_logic;
            
            -- ���� AXIS
            axis_data : in std_logic_vector(15 downto 0);
            axis_valid : in std_logic;
            axis_tready : out std_logic := '0';
            
            -- ������� ������ � FIFO
            fifo_data_c : in std_logic_vector(31 downto 0);
            
            -- ������ ���������
            int_r : out std_logic := '0';
            
            -- ��������� VGA
            vga_red : out std_logic_vector(3 downto 0);
            vga_green : out std_logic_vector(3 downto 0);
            vga_blue : out std_logic_vector(3 downto 0);
            vga_hsync : out std_logic;
            vga_vsync : out std_logic
        );
    end component;
    --------------------------------------------------------------------------------
    component DOG2AXIS is 
        generic (
            HAV : integer := 640;
            VAV : integer := 480;
            BSZ_P2 : natural := 4; -- one "block" size (both x and y), power of 2 (1 << 4 = 16)
            INT_REQ : integer := 512 -- min. data in FIFO for interrupt
        );
        port(
            clk : in std_logic;
            reset_n : in std_logic; --sync, active low
            
            -- axis slave (from FIFO)
            s_axis_tdata : in std_logic_vector(15 downto 0);
            s_axis_tvalid : in std_logic;
            s_axis_tready : out std_logic := '0';
            
            -- axis mastter (to VGA)
            m_axis_tdata : out std_logic_vector(15 downto 0);
            m_axis_tvalid : out std_logic;
            m_axis_tready : in std_logic := '0';
            
            -- fifo data counter, useless?
            fifo_data_c : in std_logic_vector(31 downto 0);
            
            -- ������ ����������
            int_r : out std_logic := '0'
        );
    end component;
    --------------------------------------------------------------------------------
    constant CLK_PERIOD : time := 40 ns; -- 25 MHz
    --------------------------------------------------------------------------------
    --shared signals
    signal clk : std_logic := '0';
    signal reset_n : std_logic := '0';
    --------------------------------------------------------------------------------
    -- TB <-> DOG2AXIS
    signal s_axis_tdata : std_logic_vector(15 downto 0) := (others => '0');
    signal s_axis_tvalid : std_logic := '0';
    signal s_axis_tready : std_logic := '0';
    signal fifo_data_c: std_logic_vector(31 downto 0) := (others => '0');
    signal int_r : std_logic := '0';
    --------------------------------------------------------------------------------
    -- DOG2AXIS <-> AXIS2VGA
    signal m_axis_tdata : std_logic_vector(15 downto 0);
    signal m_axis_tvalid : std_logic;
    signal m_axis_tready : std_logic := '0';
    --------------------------------------------------------------------------------
    -- AXIS2VGA -> TB
    signal vga_red : std_logic_vector(3 downto 0);
    signal vga_green : std_logic_vector(3 downto 0);
    signal vga_blue : std_logic_vector(3 downto 0);
    signal vga_hsync : std_logic;
    signal vga_vsync : std_logic;
    --------------------------------------------------------------------------------
    -- TB-specific
    constant BSZ: integer := to_integer(shift_left(to_unsigned(1, 32), BSZ_P2)); -- 1 << BSZ_P2, all hail stupid VHDL...
    constant H_BSIZE: integer := HAV / BSZ;
    constant V_BSIZE: integer := VAV / BSZ;
    constant DATA_SZ: integer := 4;
    type dataArray_t is array (natural range <>) of std_logic_vector (9 downto 0); -- without start/finish, only data
    constant DATA: dataArray_t (DATA_SZ-1 downto 0) := ("1100010001", "1001000110", "1110010001", "1001000100");
    signal b_cnt: integer range 0 to H_BSIZE*V_BSIZE - 1 := 0;
        
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
    dog: DOG2AXIS
    generic map (
        HAV => HAV,
        VAV => VAV,
        BSZ_P2 => BSZ_P2,
        INT_REQ => INT_REQ_DOG
    ) port map (
        clk => clk,
        reset_n => reset_n,
        s_axis_tdata => s_axis_tdata,
        s_axis_tvalid => s_axis_tvalid,
        s_axis_tready => s_axis_tready,
        m_axis_tdata => m_axis_tdata,
        m_axis_tvalid => m_axis_tvalid,
        m_axis_tready => m_axis_tready,
        fifo_data_c => fifo_data_c,
        int_r => int_r        
    );
    --------------------------------------------------------------------------------
    vga : AXIS2VGA_IP
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
        axis_data => m_axis_tdata,
        axis_valid => m_axis_tvalid,
        axis_tready => m_axis_tready,
        fifo_data_c => (others => '0'),
        int_r => open,
        vga_red => vga_red,
        vga_green => vga_green,
        vga_blue => vga_blue,
        vga_hsync => vga_hsync,
        vga_vsync => vga_vsync
    );
    --------------------------------------------------------------------------------
    clk_gen_p : process
    begin
        clk <= '1';
        wait for CLK_PERIOD/2;
        clk <= '0';
        wait for CLK_PERIOD/2;
    end process clk_gen_p;
    --------------------------------------------------------------------------------
    test_p: process
    begin
        wait for 10us;
        reset_n <= '1';
        loop
            -- wait for data request
            wait until clk'event and clk = '1' and int_r = '1';
            -- fuflo loading
            while int_r = '1' loop
                fifo_data_c <= fifo_data_c + x"00000010";
                wait until clk'event and clk = '1';
            end loop;
            -- lessgooo
            wait until clk'event and clk = '1' and s_axis_tready = '1';
            s_axis_tvalid <= '1';
            s_axis_tdata <= x"8000"; -- first
            -- data
            wait until clk'event and clk = '1' and s_axis_tready = '1';
            for bi5 in 1 to (H_BSIZE*V_BSIZE / 5) loop
                b_cnt <= bi5 * 5;
                s_axis_tdata(15) <= '0';
                if bi5 * 5 = H_BSIZE*V_BSIZE then
                    s_axis_tdata(14) <= '1';
                else
                    s_axis_tdata(14) <= '0';
                end if;
                s_axis_tdata(13 downto 10) <= b"0000";
                s_axis_tdata(9 downto 0) <= DATA(bi5 * 5 mod DATA_SZ);
                wait until clk'event and clk = '1' and s_axis_tready = '1';
            end loop;
            -- drop some trash
            for ti in 1 to 5 loop
                s_axis_tdata <= x"3FFF";
                wait until clk'event and clk = '1' and s_axis_tready = '1';
            end loop;
            -- nuke stuff
            s_axis_tvalid <= '0';
            fifo_data_c <= x"00000000";
        end loop;
    end process test_p;
end Behavioral;
