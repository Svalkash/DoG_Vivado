library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity AXIS2VGA_IP is
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
        
        -- ����������� ���������� �������� ��� ������� ������.
        INT_REQ : integer := 2048
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
        
        -- ������ ����������
        int_r : out std_logic := '0';
        
        -- ��������� VGA
        vga_red : out std_logic_vector(3 downto 0);
        vga_green : out std_logic_vector(3 downto 0);
        vga_blue : out std_logic_vector(3 downto 0);
        vga_hsync : out std_logic;
        vga_vsync : out std_logic
);
end AXIS2VGA_IP;


architecture AXIS2VGA_IP_arch of AXIS2VGA_IP is
    -- ��� �������� �������� Vivado � ���������� �������������� ����������
    -- ������� ���� AXIS, � ������ ��� ��� ������ ����, � �� ��������� �������.
    ATTRIBUTE X_INTERFACE_INFO : STRING;
    ATTRIBUTE X_INTERFACE_INFO of axis_data: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_S TDATA";
    ATTRIBUTE X_INTERFACE_INFO of axis_valid: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_S TVALID";
    ATTRIBUTE X_INTERFACE_INFO of axis_tready: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_S TREADY";
    ---------------------------------------------------------------------------
    -- ��������� � ������������� ��������� �� ����������� � ���������.
    -- ��� �������� ����������� ���������� � ������ � ���������.
    constant H_MAX : integer := HAV + HBP + HFP + HSP;
    constant V_MAX : integer := VAV + VBP + VFP + VSP;
    -- ��������� �������� ����� �����
    constant HAV_START : integer := HSP + HBP;
    constant HAV_END : integer := HAV + HSP + HBP;
    constant VAV_START : integer := VSP + VBP;
    constant VAV_END : integer := VAV + VSP + VBP;
    ---------------------------------------------------------------------------
    -- ������� ���������. ��� �������� �������� ������� ���� ������������� ���.
    type state_s is (
        IDLE, -- ��������� ����� ������
        SKIP, -- ������� �������� �� ������ �����
        WAIT_AV, -- �������� ������ ��������� �����
        SEND -- �������� ������
    );
    signal state, next_state : state_s := IDLE;
    ---------------------------------------------------------------------------
    -- �������� ��������
    signal h_cnt : integer range 0 to H_MAX-1 := 0;
    signal v_cnt : integer range 0 to V_MAX-1 := 0;
    
    -- ���� �������� ����� �����.
    signal av : std_logic; 
   signal av_d : std_logic;
   
   -- �������� ��� �������� ������� ������� ������
   alias first_f : std_logic is axis_data(13);
    alias finish_f : std_logic is axis_data(12);
    alias red : std_logic_vector(3 downto 0) is axis_data(11 downto 8);
    alias green : std_logic_vector(3 downto 0) is axis_data(7 downto 4);
    alias blue : std_logic_vector(3 downto 0) is axis_data(3 downto 0);
    -------------------------------------------------------------------------------
    begin
    -------------------------------------------------------------------------------
    --������� �������� ���������
    state_p : process(clk)
    begin
        if clk'event and clk = '1' then
            if reset_n = '0' then
                state <= IDLE;
            else
                state <= next_state;
            end if;
        end if;
    end process state_p;
    
    -- �� �� ����� �������� ���������, ����������� ��������� ���������.
    next_state_p : process(state,first_f,h_cnt,v_cnt,axis_valid)
    begin
        case state is
            -- �� ��������� ��������� ����� ��������� � ���������
            -- ������ ������ ����� �� ������� ������
            when IDLE =>
                next_state <= SKIP; -- ����� ����� ������ ������� ��������� � �������� ������
            -- �������� ����� �����.
            when SKIP =>
                if first_f = '1' and axis_valid = '1' then
                    next_state <= WAIT_AV;
                else
                    next_state <= SKIP;
                end if;
            -- ����� ������ �������� ����� ����� ��������� � ���������
            -- �������� �����
            when WAIT_AV =>
                if h_cnt = HAV_START-1 and v_cnt = VAV_START then
                    next_state <= SEND;
                else
                    next_state <= WAIT_AV; end if;
                -- ����� ���������� �������� ����� ����� ���� ������
                -- ���������� �� ������� ������. ��� �� ���� ���������� ��������� ������.
            when SEND =>
                if (h_cnt = HAV_END and v_cnt = VAV_END) or axis_valid = '0' then
                    next_state <= SKIP;
                else
                    next_state <= SEND;
                end if;
        end case;
    end process next_state_p; ---------------------------------------------------------------------------
    -- �������� �������� � �����. �� ��� ����������� ������� ������������� �
    -- ��������������� �����, ����� ��� av.
    cnt_p : process(clk)
    begin
        if clk'event and clk = '1' then
            if reset_n = '0' then
                h_cnt <= 0;
                v_cnt <= 0;
            else
                if h_cnt = H_MAX-1 then
                    h_cnt <= 0;
                    if v_cnt = V_MAX-1 then
                        v_cnt <= 0;
                    else
                        v_cnt <= v_cnt + 1;
                    end if;
                else
                    h_cnt <= h_cnt + 1;
                end if;
            end if;
        end if;
    end process cnt_p;
    -- ������� �������������
    vga_hsync <= HPL when h_cnt < HSP else not HPL;
    vga_vsync <= VPL when v_cnt < VSP else not VPL;
    av <= '1' when  h_cnt >= HAV_START and h_cnt < HAV_END and
                    v_cnt >= VAV_START and v_cnt < VAV_END else '0';
    av_d <= av when clk'event and clk = '1';
    ---------------------------------------------------------------------------
    vga_red <= red when av_d = '1' and axis_valid = '1' else "0000";
    vga_green <= green when av_d = '1' and axis_valid = '1' else "0000";
    vga_blue <= blue when av_d = '1' and axis_valid = '1' else "0000";
    ---------------------------------------------------------------------------
    axis_tready <=  '1' when av = '1' and state = SEND else
                    '1' when state = SKIP else '0';
    ---------------------------------------------------------------------------
    -- ������������ ������� ����������
    int_r <= '1' when conv_integer(fifo_data_c) < INT_REQ and reset_n = '1' else '0';
end AXIS2VGA_IP_arch;