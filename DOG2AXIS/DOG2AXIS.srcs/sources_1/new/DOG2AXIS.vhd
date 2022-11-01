library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity DOG2AXIS is
    generic (
        HAV : integer := 640;
        VAV : integer := 480;
        BSZ_P2 : natural := 4; -- one "block" size (both x and y), power of 2 (1 << 4 = 16)
        INT_REQ : integer := 40 -- min. data in FIFO for interrupt
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
        
        -- data request interrupt
        int_r : out std_logic := '0'
    );
end DOG2AXIS;

architecture Behavioral of DOG2AXIS is
    --AXIS markers
    ATTRIBUTE X_INTERFACE_INFO : STRING;
    ATTRIBUTE X_INTERFACE_INFO of s_axis_tdata: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_S TDATA";
    ATTRIBUTE X_INTERFACE_INFO of s_axis_tvalid: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_S TVALID";
    ATTRIBUTE X_INTERFACE_INFO of s_axis_tready: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_S TREADY";
    ATTRIBUTE X_INTERFACE_INFO of m_axis_tdata: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_M TDATA";
    ATTRIBUTE X_INTERFACE_INFO of m_axis_tvalid: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_M TVALID";
    ATTRIBUTE X_INTERFACE_INFO of m_axis_tready: SIGNAL is
        "xilinx.com:interface:axis:1.0 AXIS_M TREADY";
    ---------------------------------------------------------------------------
    constant BSZ: integer := to_integer(shift_left(to_unsigned(1, 32), BSZ_P2)); -- 1 << BSZ_P2, all hail stupid VHDL...
    -- sizes in blocks
    constant H_BSIZE: integer := HAV / BSZ;
    constant V_BSIZE: integer := VAV / BSZ;
    -- block values
	constant BBITS: integer := 2; -- bits per block
    constant B_EMPTY: std_logic_vector(1 downto 0) := "00"; -- 0 - used for indexing!
    constant B_SNAKE: std_logic_vector(1 downto 0) := "01"; -- 1
    constant B_HEAD: std_logic_vector(1 downto 0) := "10"; -- 2
    constant B_FOOD: std_logic_vector(1 downto 0) := "11"; -- 3
    -- colors for each value
    type color_t is array (2 downto 0) of std_logic_vector(3 downto 0);
    type color_arr_t is array (natural range <>) of color_t;
    -- (block)(color); R=0, G=1, B=2;
    constant B_COLORS: color_arr_t(3 downto 0) :=(
--        ("0011", "0011", "0011"), -- food,
--        ("0010", "0010", "0010"), -- head,
--        ("0001", "0001", "0001"), -- snake,
--        ("0000", "0000", "0000") -- empty,
        ("1101", "1100", "0001"), -- food
        ("1111", "0010", "1100"), -- head
        ("0100", "0100", "1001"), -- snake
        ("0010", "0010", "0010") -- empty
    );
    ---------------------------------------------------------------------------
    --axi aliases
    -- input: 4 blocks, finish and start bits for tracking
	constant IN_TRAN_LEN: integer := 5; -- should be a divider of TOTAL block count in the frame, otherwise requires some magic at the end
    alias in_first: std_logic is s_axis_tdata(15);
    alias in_last: std_logic is s_axis_tdata(14);
    alias in_vector: std_logic_vector(IN_TRAN_LEN*2-1 downto 0) is s_axis_tdata(IN_TRAN_LEN*2-1 downto 0);
    -- output: 4+4+4, finish and first
    alias out_trash: std_logic_vector (1 downto 0) is m_axis_tdata(15 downto 14);
    alias out_first_f: std_logic is m_axis_tdata(13);
    alias out_finish_f: std_logic is m_axis_tdata(12);
    signal out_color: color_t; -- to be comfy!
    alias out_red: std_logic_vector(3 downto 0) is m_axis_tdata(11 downto 8);
    alias out_green: std_logic_vector(3 downto 0) is m_axis_tdata(7 downto 4);
    alias out_blue: std_logic_vector(3 downto 0) is m_axis_tdata(3 downto 0);
    ---------------------------------------------------------------------------
    -- state machine for upscaler
    type state_t is (
        IDLE, -- during reset
        SKIP, -- wait for start mark
        LOAD, --loading my first line
        FIRST, -- drive first_f, no data yet (skipped by the device)
        SEND -- send data to vga (or maybe not, depends on vga)
    );
    signal state, next_state: state_t := IDLE;
    ---------------------------------------------------------------------------
    -- pixel counters
    signal h_cnt: integer range 0 to HAV-1 := 0;
    signal h_bcnt: natural range 0 to H_BSIZE-1 := 0; --current block number
    signal v_cnt: integer range 0 to VAV-1 := 0;
    signal v_bcnt: natural range 0 to V_BSIZE-1 := 0; --current block number
    signal v_bi: integer range 0 to BSZ-1 := 0; -- index inside block
    signal lastInBL: boolean := false; -- the pixel is last in blockLine and it IS transmitted NOW
    signal lastPxl: boolean := false; -- the pixel is last and it IS transmitted NOW
    -- data buffers - block lines
    type blockLine_t is array (natural range <>) of std_logic_vector (1 downto 0);
    signal in_blocks: blockLine_t (IN_TRAN_LEN - 1 downto 0) := (others => "00"); -- input in blocks (to simplify)
    signal BL_shift: blockLine_t (H_BSIZE - 1 downto 0) := (others => "00"); -- block "line" for buffering input - shiftreg
    signal BL_buffer_loaded: boolean := false; -- true if it's loaded
    signal BL_buffer: blockLine_t (H_BSIZE - 1 downto 0) := (others => "00"); -- block "line" for output - loaded from SR
    signal BL_shift_cnt: integer range 0 to H_BSIZE / IN_TRAN_LEN; -- counts loads
    signal BL_shift_loaded: boolean := false; -- true if it's loaded
	signal can_load: boolean := false; -- ready to load, waiting for VALID
	signal loading: boolean := false; -- loading right now (can_load and VALID)
	signal moving: boolean := false; --if moving data from shift to buffer
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
	-- counter status
	BL_shift_loaded <= BL_shift_cnt = H_BSIZE / IN_TRAN_LEN;
    lastInBL <= state = SEND and h_cnt = HAV-1 and v_bi = BSZ-1 and m_axis_tready = '1';
    lastPxl <= state = SEND and h_cnt = HAV-1 and v_cnt = VAV-1 and m_axis_tready = '1'; -- it IS last pixel, it CAN be transmitted
---------------------------------------------------------------------------
    --state machine
    state_p: process(clk)
    begin
        if clk'event and clk = '1' then
            if reset_n = '0' then
                state <= IDLE;
            else
                state <= next_state;
            end if;
        end if;
    end process state_p;
    
    next_state_p: process(state, in_first, s_axis_tvalid, m_axis_tready, lastPxl, BL_buffer_loaded)
    begin
        case state is
            when IDLE =>
                -- start waiting after reset
                next_state <= SKIP;
            when SKIP =>
                -- wait until the data is valid and FIRST
                if in_first = '1' and s_axis_tvalid = '1' then
                    next_state <= LOAD;
                else
                    next_state <= SKIP;
                end if;
            when LOAD =>
                -- wait until the data is valid and FIRST
                if BL_buffer_loaded then
                    next_state <= FIRST;
                else
                    next_state <= LOAD;
                end if;
            when FIRST =>
                if m_axis_tready = '1' then
                    next_state <= SEND;
                else
                    next_state <= FIRST;
                end if;
            when SEND =>
                if lastPxl or not BL_buffer_loaded then
                    next_state <= SKIP;
                else
                    next_state <= SEND;
                end if;
        end case;
        
    end process next_state_p;
    
---------------------------------------------------------------------------
	-- loading logic
	moving <= BL_shift_loaded and (not BL_buffer_loaded or lastInBL); -- when shift is loaded, and buffer is empty or useless
	can_load <= (state = LOAD or state = FIRST or state = SEND) and in_first = '0' and (not BL_shift_loaded or moving); -- if second is not loaded or moving
	loading <= can_load and s_axis_tvalid = '1';
	s_axis_tready <= '1' when can_load or state = SKIP else '0';
    -- block "alias" for input
    in_blocks_p: for i in 0 to IN_TRAN_LEN-1 generate
        in_blocks(i) <= in_vector(2*i + 1 downto 2*i);
    end generate;

    -- buffer shifting and loading
	shift_p: process(clk)
    begin
        if clk'event and clk = '1' then
            if reset_n = '0' or state = SKIP then
--            if reset_n = '0' then
                -- reset everything to 0
				BL_buffer <= (others => "00");
				BL_buffer_loaded <= false;
				BL_shift <= (others => "00");
				BL_shift_cnt <= 0;
		   elsif moving and loading then
		        -- shift moving to buffer, shift loads new data
		        BL_buffer <= BL_shift;
		        BL_buffer_loaded <= true;
                BL_shift(H_BSIZE - IN_TRAN_LEN - 1 downto 0) <= (others => "00"); --shift old
                BL_shift(H_BSIZE - 1 downto H_BSIZE - IN_TRAN_LEN) <= in_blocks; -- load new
				BL_shift_cnt <= 1; --one pack loaded
		   elsif moving then
		        -- shift moving to buffer, shift is emptied
		        BL_buffer <= BL_shift;
		        BL_buffer_loaded <= true;
		        BL_shift <= (others => "00");
		        BL_shift_cnt <= 0;
		   else
               if loading then
                    -- buffer isn't affected, shift loads new stuff
                    BL_shift(H_BSIZE - IN_TRAN_LEN - 1 downto 0) <= BL_shift(H_BSIZE - 1 downto IN_TRAN_LEN); --shift old
                    BL_shift(H_BSIZE - 1 downto H_BSIZE - IN_TRAN_LEN) <= in_blocks; -- load new
                    BL_shift_cnt <= BL_shift_cnt + 1;
               end if;
               if lastInBL then
                    -- can't load from shift, but invalidating buffer
                    BL_buffer <= (others => "00");
		            BL_buffer_loaded <= false;
               end if;
           end if;
        end if;
    end process shift_p;

---------------------------------------------------------------------------
	-- sending logic
	h_bcnt <= h_cnt / BSZ; -- number of current block, should be optimized
	v_bcnt <= v_cnt / BSZ; -- number of current block, should be optimized
    v_bi <= v_cnt mod BSZ; -- vert. index INSIDE block
	out_color <= B_COLORS(to_integer(unsigned(BL_buffer(h_bcnt)))) when state = SEND else ("0000", "0000", "0000");
	-- all outputs
	m_axis_tvalid <= '1' when state = FIRST or state = SEND else '0';
	out_red <= out_color(2) when state = SEND else "0000";
	out_green <= out_color(1) when state = SEND else "0000";
	out_blue <= out_color(0) when state = SEND else "0000";
	out_first_f <= '1' when state = FIRST else '0';
	out_finish_f <= '1' when state = SEND and h_cnt = HAV-1 and v_cnt = VAV-1 else '0';
	out_trash <= "00";
	
	cnt_p : process(clk)
    begin
        if clk'event and clk = '1' then
            if reset_n = '0' then
                --reset all counters
                h_cnt <= 0;
                v_cnt <= 0;
            elsif state = SEND and m_axis_tready = '1' then --if ready, advance counters
                if h_cnt = HAV-1 then
                    h_cnt <= 0;
                    if v_cnt = VAV-1 then
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
    
    ---------------------------------------------------------------------------
    -- irq thingy
    int_r <= '1' when to_integer(unsigned(fifo_data_c)) < INT_REQ and reset_n = '1' else '0';
	
end Behavioral;
