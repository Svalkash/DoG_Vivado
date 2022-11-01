// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Oct  8 11:44:43 2022
// Host        : DESKTOP-2B79PL0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_DOG2AXIS_0_0_sim_netlist.v
// Design      : design_1_DOG2AXIS_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DOG2AXIS
   (m_axis_tdata,
    s_axis_tready,
    int_r,
    m_axis_tvalid,
    reset_n,
    clk,
    s_axis_tdata,
    s_axis_tvalid,
    m_axis_tready,
    fifo_data_c);
  output [3:0]m_axis_tdata;
  output s_axis_tready;
  output int_r;
  output m_axis_tvalid;
  input reset_n;
  input clk;
  input [10:0]s_axis_tdata;
  input s_axis_tvalid;
  input m_axis_tready;
  input [23:0]fifo_data_c;

  wire \BL_buffer[39][1]_i_1_n_0 ;
  wire BL_buffer_loaded_i_1_n_0;
  wire BL_buffer_loaded_reg_n_0;
  wire [1:0]\BL_buffer_reg[0] ;
  wire [1:0]\BL_buffer_reg[10] ;
  wire [1:0]\BL_buffer_reg[11] ;
  wire [1:0]\BL_buffer_reg[12] ;
  wire [1:0]\BL_buffer_reg[13] ;
  wire [1:0]\BL_buffer_reg[14] ;
  wire [1:0]\BL_buffer_reg[15] ;
  wire [1:0]\BL_buffer_reg[16] ;
  wire [1:0]\BL_buffer_reg[17] ;
  wire [1:0]\BL_buffer_reg[18] ;
  wire [1:0]\BL_buffer_reg[19] ;
  wire [1:0]\BL_buffer_reg[1] ;
  wire [1:0]\BL_buffer_reg[20] ;
  wire [1:0]\BL_buffer_reg[21] ;
  wire [1:0]\BL_buffer_reg[22] ;
  wire [1:0]\BL_buffer_reg[23] ;
  wire [1:0]\BL_buffer_reg[24] ;
  wire [1:0]\BL_buffer_reg[25] ;
  wire [1:0]\BL_buffer_reg[26] ;
  wire [1:0]\BL_buffer_reg[27] ;
  wire [1:0]\BL_buffer_reg[28] ;
  wire [1:0]\BL_buffer_reg[29] ;
  wire [1:0]\BL_buffer_reg[2] ;
  wire [1:0]\BL_buffer_reg[30] ;
  wire [1:0]\BL_buffer_reg[31] ;
  wire [1:0]\BL_buffer_reg[32] ;
  wire [1:0]\BL_buffer_reg[33] ;
  wire [1:0]\BL_buffer_reg[34] ;
  wire [1:0]\BL_buffer_reg[35] ;
  wire [1:0]\BL_buffer_reg[36] ;
  wire [1:0]\BL_buffer_reg[37] ;
  wire [1:0]\BL_buffer_reg[38] ;
  wire [1:0]\BL_buffer_reg[39] ;
  wire [1:0]\BL_buffer_reg[3] ;
  wire [1:0]\BL_buffer_reg[4] ;
  wire [1:0]\BL_buffer_reg[5] ;
  wire [1:0]\BL_buffer_reg[6] ;
  wire [1:0]\BL_buffer_reg[7] ;
  wire [1:0]\BL_buffer_reg[8] ;
  wire [1:0]\BL_buffer_reg[9] ;
  wire \BL_shift[0]_1 ;
  wire \BL_shift[34][1]_i_1_n_0 ;
  wire \BL_shift[34][1]_i_2_n_0 ;
  wire \BL_shift[39][1]_i_1_n_0 ;
  wire \BL_shift[39]_0 ;
  wire \BL_shift_cnt[0]_i_1_n_0 ;
  wire \BL_shift_cnt[1]_i_1_n_0 ;
  wire \BL_shift_cnt[2]_i_1_n_0 ;
  wire \BL_shift_cnt[2]_i_2_n_0 ;
  wire \BL_shift_cnt[3]_i_1_n_0 ;
  wire \BL_shift_cnt[3]_i_2_n_0 ;
  wire \BL_shift_cnt_reg_n_0_[0] ;
  wire \BL_shift_cnt_reg_n_0_[1] ;
  wire \BL_shift_cnt_reg_n_0_[2] ;
  wire \BL_shift_cnt_reg_n_0_[3] ;
  wire [1:0]\BL_shift_reg[0] ;
  wire [1:0]\BL_shift_reg[10] ;
  wire [1:0]\BL_shift_reg[11] ;
  wire [1:0]\BL_shift_reg[12] ;
  wire [1:0]\BL_shift_reg[13] ;
  wire [1:0]\BL_shift_reg[14] ;
  wire [1:0]\BL_shift_reg[15] ;
  wire [1:0]\BL_shift_reg[16] ;
  wire [1:0]\BL_shift_reg[17] ;
  wire [1:0]\BL_shift_reg[18] ;
  wire [1:0]\BL_shift_reg[19] ;
  wire [1:0]\BL_shift_reg[1] ;
  wire [1:0]\BL_shift_reg[20] ;
  wire [1:0]\BL_shift_reg[21] ;
  wire [1:0]\BL_shift_reg[22] ;
  wire [1:0]\BL_shift_reg[23] ;
  wire [1:0]\BL_shift_reg[24] ;
  wire [1:0]\BL_shift_reg[25] ;
  wire [1:0]\BL_shift_reg[26] ;
  wire [1:0]\BL_shift_reg[27] ;
  wire [1:0]\BL_shift_reg[28] ;
  wire [1:0]\BL_shift_reg[29] ;
  wire [1:0]\BL_shift_reg[2] ;
  wire [1:0]\BL_shift_reg[30] ;
  wire [1:0]\BL_shift_reg[31] ;
  wire [1:0]\BL_shift_reg[32] ;
  wire [1:0]\BL_shift_reg[33] ;
  wire [1:0]\BL_shift_reg[34] ;
  wire [1:0]\BL_shift_reg[35] ;
  wire [1:0]\BL_shift_reg[36] ;
  wire [1:0]\BL_shift_reg[37] ;
  wire [1:0]\BL_shift_reg[38] ;
  wire [1:0]\BL_shift_reg[39] ;
  wire [1:0]\BL_shift_reg[3] ;
  wire [1:0]\BL_shift_reg[4] ;
  wire [1:0]\BL_shift_reg[5] ;
  wire [1:0]\BL_shift_reg[6] ;
  wire [1:0]\BL_shift_reg[7] ;
  wire [1:0]\BL_shift_reg[8] ;
  wire [1:0]\BL_shift_reg[9] ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire clk;
  wire [23:0]fifo_data_c;
  wire [5:0]h_bcnt;
  wire [9:0]h_cnt;
  wire h_cnt0;
  wire \h_cnt[5]_i_1_n_0 ;
  wire \h_cnt[6]_i_1_n_0 ;
  wire \h_cnt[7]_i_2_n_0 ;
  wire \h_cnt[7]_i_3_n_0 ;
  wire \h_cnt[9]_i_3_n_0 ;
  wire \h_cnt[9]_i_4_n_0 ;
  wire \h_cnt[9]_i_5_n_0 ;
  wire \h_cnt_reg_n_0_[0] ;
  wire \h_cnt_reg_n_0_[1] ;
  wire \h_cnt_reg_n_0_[2] ;
  wire \h_cnt_reg_n_0_[3] ;
  wire int_r;
  wire int_r1;
  wire int_r1_carry__0_i_1_n_0;
  wire int_r1_carry__0_i_2_n_0;
  wire int_r1_carry__0_i_3_n_0;
  wire int_r1_carry__0_i_4_n_0;
  wire int_r1_carry__0_n_0;
  wire int_r1_carry__0_n_1;
  wire int_r1_carry__0_n_2;
  wire int_r1_carry__0_n_3;
  wire int_r1_carry__1_i_1_n_0;
  wire int_r1_carry__1_i_2_n_0;
  wire int_r1_carry__1_i_3_n_0;
  wire int_r1_carry__1_i_4_n_0;
  wire int_r1_carry__1_n_1;
  wire int_r1_carry__1_n_2;
  wire int_r1_carry__1_n_3;
  wire int_r1_carry_i_1_n_0;
  wire int_r1_carry_i_2_n_0;
  wire int_r1_carry_i_3_n_0;
  wire int_r1_carry_i_4_n_0;
  wire int_r1_carry_i_5_n_0;
  wire int_r1_carry_n_0;
  wire int_r1_carry_n_1;
  wire int_r1_carry_n_2;
  wire int_r1_carry_n_3;
  wire [3:0]m_axis_tdata;
  wire \m_axis_tdata[0]_INST_0_i_10_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_11_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_12_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_13_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_14_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_15_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_16_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_17_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_1_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_2_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_3_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_4_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_5_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_6_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_7_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_8_n_0 ;
  wire \m_axis_tdata[0]_INST_0_i_9_n_0 ;
  wire \m_axis_tdata[12]_INST_0_i_1_n_0 ;
  wire \m_axis_tdata[12]_INST_0_i_2_n_0 ;
  wire \m_axis_tdata[12]_INST_0_i_3_n_0 ;
  wire \m_axis_tdata[12]_INST_0_i_4_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_10_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_11_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_12_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_13_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_14_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_15_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_16_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_17_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_18_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_19_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_1_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_2_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_3_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_4_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_5_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_6_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_7_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_8_n_0 ;
  wire \m_axis_tdata[1]_INST_0_i_9_n_0 ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [1:0]next_state;
  wire reset_n;
  wire [10:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tready_INST_0_i_1_n_0;
  wire s_axis_tready_INST_0_i_2_n_0;
  wire s_axis_tready_INST_0_i_3_n_0;
  wire s_axis_tready_INST_0_i_4_n_0;
  wire s_axis_tready_INST_0_i_5_n_0;
  wire s_axis_tready_INST_0_i_6_n_0;
  wire s_axis_tready_INST_0_i_7_n_0;
  wire s_axis_tvalid;
  wire [2:0]state;
  wire [3:0]v_bi;
  wire [8:0]v_cnt;
  wire \v_cnt[4]_i_1_n_0 ;
  wire \v_cnt[8]_i_1_n_0 ;
  wire \v_cnt[8]_i_3_n_0 ;
  wire \v_cnt_reg_n_0_[4] ;
  wire \v_cnt_reg_n_0_[5] ;
  wire \v_cnt_reg_n_0_[6] ;
  wire \v_cnt_reg_n_0_[7] ;
  wire \v_cnt_reg_n_0_[8] ;
  wire [3:0]NLW_int_r1_carry_O_UNCONNECTED;
  wire [3:0]NLW_int_r1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_int_r1_carry__1_O_UNCONNECTED;

  LUT4 #(
    .INIT(16'h08FF)) 
    \BL_buffer[39][1]_i_1 
       (.I0(s_axis_tready_INST_0_i_3_n_0),
        .I1(\v_cnt[8]_i_1_n_0 ),
        .I2(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I3(reset_n),
        .O(\BL_buffer[39][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    \BL_buffer[39][1]_i_2 
       (.I0(s_axis_tready_INST_0_i_2_n_0),
        .I1(\BL_shift_cnt_reg_n_0_[2] ),
        .I2(\BL_shift_cnt_reg_n_0_[3] ),
        .I3(\BL_shift_cnt_reg_n_0_[0] ),
        .I4(\BL_shift_cnt_reg_n_0_[1] ),
        .O(\BL_shift[0]_1 ));
  LUT6 #(
    .INIT(64'hFFFF0FFF08080808)) 
    BL_buffer_loaded_i_1
       (.I0(s_axis_tready_INST_0_i_1_n_0),
        .I1(s_axis_tready_INST_0_i_2_n_0),
        .I2(s_axis_tready_INST_0_i_3_n_0),
        .I3(\v_cnt[8]_i_1_n_0 ),
        .I4(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I5(BL_buffer_loaded_reg_n_0),
        .O(BL_buffer_loaded_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    BL_buffer_loaded_reg
       (.C(clk),
        .CE(1'b1),
        .D(BL_buffer_loaded_i_1_n_0),
        .Q(BL_buffer_loaded_reg_n_0),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[0][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[0] [0]),
        .Q(\BL_buffer_reg[0] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[0][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[0] [1]),
        .Q(\BL_buffer_reg[0] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[10][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[10] [0]),
        .Q(\BL_buffer_reg[10] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[10][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[10] [1]),
        .Q(\BL_buffer_reg[10] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[11][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[11] [0]),
        .Q(\BL_buffer_reg[11] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[11][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[11] [1]),
        .Q(\BL_buffer_reg[11] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[12][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[12] [0]),
        .Q(\BL_buffer_reg[12] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[12][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[12] [1]),
        .Q(\BL_buffer_reg[12] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[13][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[13] [0]),
        .Q(\BL_buffer_reg[13] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[13][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[13] [1]),
        .Q(\BL_buffer_reg[13] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[14][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[14] [0]),
        .Q(\BL_buffer_reg[14] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[14][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[14] [1]),
        .Q(\BL_buffer_reg[14] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[15][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[15] [0]),
        .Q(\BL_buffer_reg[15] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[15][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[15] [1]),
        .Q(\BL_buffer_reg[15] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[16][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[16] [0]),
        .Q(\BL_buffer_reg[16] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[16][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[16] [1]),
        .Q(\BL_buffer_reg[16] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[17][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[17] [0]),
        .Q(\BL_buffer_reg[17] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[17][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[17] [1]),
        .Q(\BL_buffer_reg[17] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[18][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[18] [0]),
        .Q(\BL_buffer_reg[18] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[18][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[18] [1]),
        .Q(\BL_buffer_reg[18] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[19][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[19] [0]),
        .Q(\BL_buffer_reg[19] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[19][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[19] [1]),
        .Q(\BL_buffer_reg[19] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[1][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[1] [0]),
        .Q(\BL_buffer_reg[1] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[1][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[1] [1]),
        .Q(\BL_buffer_reg[1] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[20][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[20] [0]),
        .Q(\BL_buffer_reg[20] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[20][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[20] [1]),
        .Q(\BL_buffer_reg[20] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[21][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[21] [0]),
        .Q(\BL_buffer_reg[21] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[21][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[21] [1]),
        .Q(\BL_buffer_reg[21] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[22][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[22] [0]),
        .Q(\BL_buffer_reg[22] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[22][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[22] [1]),
        .Q(\BL_buffer_reg[22] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[23][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[23] [0]),
        .Q(\BL_buffer_reg[23] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[23][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[23] [1]),
        .Q(\BL_buffer_reg[23] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[24][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[24] [0]),
        .Q(\BL_buffer_reg[24] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[24][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[24] [1]),
        .Q(\BL_buffer_reg[24] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[25][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[25] [0]),
        .Q(\BL_buffer_reg[25] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[25][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[25] [1]),
        .Q(\BL_buffer_reg[25] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[26][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[26] [0]),
        .Q(\BL_buffer_reg[26] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[26][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[26] [1]),
        .Q(\BL_buffer_reg[26] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[27][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[27] [0]),
        .Q(\BL_buffer_reg[27] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[27][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[27] [1]),
        .Q(\BL_buffer_reg[27] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[28][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[28] [0]),
        .Q(\BL_buffer_reg[28] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[28][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[28] [1]),
        .Q(\BL_buffer_reg[28] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[29][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[29] [0]),
        .Q(\BL_buffer_reg[29] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[29][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[29] [1]),
        .Q(\BL_buffer_reg[29] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[2][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[2] [0]),
        .Q(\BL_buffer_reg[2] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[2][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[2] [1]),
        .Q(\BL_buffer_reg[2] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[30][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[30] [0]),
        .Q(\BL_buffer_reg[30] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[30][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[30] [1]),
        .Q(\BL_buffer_reg[30] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[31][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[31] [0]),
        .Q(\BL_buffer_reg[31] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[31][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[31] [1]),
        .Q(\BL_buffer_reg[31] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[32][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[32] [0]),
        .Q(\BL_buffer_reg[32] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[32][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[32] [1]),
        .Q(\BL_buffer_reg[32] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[33][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[33] [0]),
        .Q(\BL_buffer_reg[33] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[33][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[33] [1]),
        .Q(\BL_buffer_reg[33] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[34][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[34] [0]),
        .Q(\BL_buffer_reg[34] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[34][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[34] [1]),
        .Q(\BL_buffer_reg[34] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[35][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[35] [0]),
        .Q(\BL_buffer_reg[35] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[35][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[35] [1]),
        .Q(\BL_buffer_reg[35] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[36][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[36] [0]),
        .Q(\BL_buffer_reg[36] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[36][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[36] [1]),
        .Q(\BL_buffer_reg[36] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[37][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[37] [0]),
        .Q(\BL_buffer_reg[37] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[37][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[37] [1]),
        .Q(\BL_buffer_reg[37] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[38][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[38] [0]),
        .Q(\BL_buffer_reg[38] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[38][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[38] [1]),
        .Q(\BL_buffer_reg[38] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[39][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[39] [0]),
        .Q(\BL_buffer_reg[39] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[39][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[39] [1]),
        .Q(\BL_buffer_reg[39] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[3][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[3] [0]),
        .Q(\BL_buffer_reg[3] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[3][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[3] [1]),
        .Q(\BL_buffer_reg[3] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[4][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[4] [0]),
        .Q(\BL_buffer_reg[4] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[4][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[4] [1]),
        .Q(\BL_buffer_reg[4] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[5][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[5] [0]),
        .Q(\BL_buffer_reg[5] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[5][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[5] [1]),
        .Q(\BL_buffer_reg[5] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[6][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[6] [0]),
        .Q(\BL_buffer_reg[6] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[6][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[6] [1]),
        .Q(\BL_buffer_reg[6] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[7][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[7] [0]),
        .Q(\BL_buffer_reg[7] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[7][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[7] [1]),
        .Q(\BL_buffer_reg[7] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[8][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[8] [0]),
        .Q(\BL_buffer_reg[8] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[8][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[8] [1]),
        .Q(\BL_buffer_reg[8] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[9][0] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[9] [0]),
        .Q(\BL_buffer_reg[9] [0]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_buffer_reg[9][1] 
       (.C(clk),
        .CE(\BL_shift[0]_1 ),
        .D(\BL_shift_reg[9] [1]),
        .Q(\BL_buffer_reg[9] [1]),
        .R(\BL_buffer[39][1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \BL_shift[34][1]_i_1 
       (.I0(\BL_shift_cnt_reg_n_0_[1] ),
        .I1(\BL_shift_cnt_reg_n_0_[0] ),
        .I2(\BL_shift_cnt_reg_n_0_[3] ),
        .I3(\BL_shift_cnt_reg_n_0_[2] ),
        .I4(s_axis_tready_INST_0_i_2_n_0),
        .I5(reset_n),
        .O(\BL_shift[34][1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5400)) 
    \BL_shift[34][1]_i_2 
       (.I0(s_axis_tready_INST_0_i_1_n_0),
        .I1(s_axis_tready_INST_0_i_2_n_0),
        .I2(s_axis_tready_INST_0_i_3_n_0),
        .I3(reset_n),
        .O(\BL_shift[34][1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \BL_shift[39][1]_i_1 
       (.I0(s_axis_tready_INST_0_i_1_n_0),
        .I1(s_axis_tready_INST_0_i_3_n_0),
        .I2(s_axis_tready_INST_0_i_2_n_0),
        .I3(reset_n),
        .O(\BL_shift[39][1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h08A8)) 
    \BL_shift[39][1]_i_2 
       (.I0(reset_n),
        .I1(s_axis_tready_INST_0_i_2_n_0),
        .I2(s_axis_tready_INST_0_i_3_n_0),
        .I3(s_axis_tready_INST_0_i_1_n_0),
        .O(\BL_shift[39]_0 ));
  LUT6 #(
    .INIT(64'hA5A5A5A5A5A5A4A5)) 
    \BL_shift_cnt[0]_i_1 
       (.I0(s_axis_tready_INST_0_i_1_n_0),
        .I1(\BL_shift_cnt_reg_n_0_[1] ),
        .I2(\BL_shift_cnt_reg_n_0_[0] ),
        .I3(\BL_shift_cnt_reg_n_0_[3] ),
        .I4(\BL_shift_cnt_reg_n_0_[2] ),
        .I5(s_axis_tready_INST_0_i_2_n_0),
        .O(\BL_shift_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9A009A000000AA00)) 
    \BL_shift_cnt[1]_i_1 
       (.I0(\BL_shift_cnt_reg_n_0_[1] ),
        .I1(s_axis_tready_INST_0_i_1_n_0),
        .I2(\BL_shift_cnt_reg_n_0_[0] ),
        .I3(reset_n),
        .I4(s_axis_tready_INST_0_i_2_n_0),
        .I5(s_axis_tready_INST_0_i_3_n_0),
        .O(\BL_shift_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9A009A000000AA00)) 
    \BL_shift_cnt[2]_i_1 
       (.I0(\BL_shift_cnt_reg_n_0_[2] ),
        .I1(s_axis_tready_INST_0_i_1_n_0),
        .I2(\BL_shift_cnt[2]_i_2_n_0 ),
        .I3(reset_n),
        .I4(s_axis_tready_INST_0_i_2_n_0),
        .I5(s_axis_tready_INST_0_i_3_n_0),
        .O(\BL_shift_cnt[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \BL_shift_cnt[2]_i_2 
       (.I0(\BL_shift_cnt_reg_n_0_[0] ),
        .I1(\BL_shift_cnt_reg_n_0_[1] ),
        .O(\BL_shift_cnt[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB800B8000000AA00)) 
    \BL_shift_cnt[3]_i_1 
       (.I0(\BL_shift_cnt_reg_n_0_[3] ),
        .I1(s_axis_tready_INST_0_i_1_n_0),
        .I2(\BL_shift_cnt[3]_i_2_n_0 ),
        .I3(reset_n),
        .I4(s_axis_tready_INST_0_i_2_n_0),
        .I5(s_axis_tready_INST_0_i_3_n_0),
        .O(\BL_shift_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \BL_shift_cnt[3]_i_2 
       (.I0(\BL_shift_cnt_reg_n_0_[3] ),
        .I1(\BL_shift_cnt_reg_n_0_[0] ),
        .I2(\BL_shift_cnt_reg_n_0_[1] ),
        .I3(\BL_shift_cnt_reg_n_0_[2] ),
        .O(\BL_shift_cnt[3]_i_2_n_0 ));
  FDRE \BL_shift_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\BL_shift_cnt[0]_i_1_n_0 ),
        .Q(\BL_shift_cnt_reg_n_0_[0] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE \BL_shift_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\BL_shift_cnt[1]_i_1_n_0 ),
        .Q(\BL_shift_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \BL_shift_cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\BL_shift_cnt[2]_i_1_n_0 ),
        .Q(\BL_shift_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \BL_shift_cnt_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\BL_shift_cnt[3]_i_1_n_0 ),
        .Q(\BL_shift_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[0][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[5] [0]),
        .Q(\BL_shift_reg[0] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[0][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[5] [1]),
        .Q(\BL_shift_reg[0] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[10][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[15] [0]),
        .Q(\BL_shift_reg[10] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[10][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[15] [1]),
        .Q(\BL_shift_reg[10] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[11][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[16] [0]),
        .Q(\BL_shift_reg[11] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[11][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[16] [1]),
        .Q(\BL_shift_reg[11] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[12][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[17] [0]),
        .Q(\BL_shift_reg[12] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[12][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[17] [1]),
        .Q(\BL_shift_reg[12] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[13][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[18] [0]),
        .Q(\BL_shift_reg[13] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[13][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[18] [1]),
        .Q(\BL_shift_reg[13] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[14][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[19] [0]),
        .Q(\BL_shift_reg[14] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[14][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[19] [1]),
        .Q(\BL_shift_reg[14] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[15][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[20] [0]),
        .Q(\BL_shift_reg[15] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[15][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[20] [1]),
        .Q(\BL_shift_reg[15] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[16][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[21] [0]),
        .Q(\BL_shift_reg[16] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[16][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[21] [1]),
        .Q(\BL_shift_reg[16] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[17][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[22] [0]),
        .Q(\BL_shift_reg[17] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[17][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[22] [1]),
        .Q(\BL_shift_reg[17] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[18][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[23] [0]),
        .Q(\BL_shift_reg[18] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[18][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[23] [1]),
        .Q(\BL_shift_reg[18] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[19][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[24] [0]),
        .Q(\BL_shift_reg[19] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[19][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[24] [1]),
        .Q(\BL_shift_reg[19] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[1][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[6] [0]),
        .Q(\BL_shift_reg[1] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[1][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[6] [1]),
        .Q(\BL_shift_reg[1] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[20][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[25] [0]),
        .Q(\BL_shift_reg[20] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[20][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[25] [1]),
        .Q(\BL_shift_reg[20] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[21][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[26] [0]),
        .Q(\BL_shift_reg[21] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[21][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[26] [1]),
        .Q(\BL_shift_reg[21] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[22][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[27] [0]),
        .Q(\BL_shift_reg[22] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[22][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[27] [1]),
        .Q(\BL_shift_reg[22] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[23][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[28] [0]),
        .Q(\BL_shift_reg[23] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[23][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[28] [1]),
        .Q(\BL_shift_reg[23] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[24][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[29] [0]),
        .Q(\BL_shift_reg[24] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[24][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[29] [1]),
        .Q(\BL_shift_reg[24] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[25][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[30] [0]),
        .Q(\BL_shift_reg[25] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[25][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[30] [1]),
        .Q(\BL_shift_reg[25] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[26][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[31] [0]),
        .Q(\BL_shift_reg[26] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[26][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[31] [1]),
        .Q(\BL_shift_reg[26] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[27][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[32] [0]),
        .Q(\BL_shift_reg[27] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[27][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[32] [1]),
        .Q(\BL_shift_reg[27] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[28][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[33] [0]),
        .Q(\BL_shift_reg[28] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[28][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[33] [1]),
        .Q(\BL_shift_reg[28] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[29][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[34] [0]),
        .Q(\BL_shift_reg[29] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[29][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[34] [1]),
        .Q(\BL_shift_reg[29] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[2][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[7] [0]),
        .Q(\BL_shift_reg[2] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[2][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[7] [1]),
        .Q(\BL_shift_reg[2] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[30][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[35] [0]),
        .Q(\BL_shift_reg[30] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[30][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[35] [1]),
        .Q(\BL_shift_reg[30] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[31][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[36] [0]),
        .Q(\BL_shift_reg[31] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[31][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[36] [1]),
        .Q(\BL_shift_reg[31] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[32][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[37] [0]),
        .Q(\BL_shift_reg[32] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[32][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[37] [1]),
        .Q(\BL_shift_reg[32] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[33][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[38] [0]),
        .Q(\BL_shift_reg[33] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[33][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[38] [1]),
        .Q(\BL_shift_reg[33] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[34][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[39] [0]),
        .Q(\BL_shift_reg[34] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[34][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[39] [1]),
        .Q(\BL_shift_reg[34] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[35][0] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[0]),
        .Q(\BL_shift_reg[35] [0]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[35][1] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[1]),
        .Q(\BL_shift_reg[35] [1]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[36][0] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[2]),
        .Q(\BL_shift_reg[36] [0]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[36][1] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[3]),
        .Q(\BL_shift_reg[36] [1]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[37][0] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[4]),
        .Q(\BL_shift_reg[37] [0]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[37][1] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[5]),
        .Q(\BL_shift_reg[37] [1]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[38][0] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[6]),
        .Q(\BL_shift_reg[38] [0]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[38][1] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[7]),
        .Q(\BL_shift_reg[38] [1]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[39][0] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[8]),
        .Q(\BL_shift_reg[39] [0]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[39][1] 
       (.C(clk),
        .CE(\BL_shift[39]_0 ),
        .D(s_axis_tdata[9]),
        .Q(\BL_shift_reg[39] [1]),
        .R(\BL_shift[39][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[3][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[8] [0]),
        .Q(\BL_shift_reg[3] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[3][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[8] [1]),
        .Q(\BL_shift_reg[3] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[4][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[9] [0]),
        .Q(\BL_shift_reg[4] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[4][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[9] [1]),
        .Q(\BL_shift_reg[4] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[5][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[10] [0]),
        .Q(\BL_shift_reg[5] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[5][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[10] [1]),
        .Q(\BL_shift_reg[5] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[6][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[11] [0]),
        .Q(\BL_shift_reg[6] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[6][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[11] [1]),
        .Q(\BL_shift_reg[6] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[7][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[12] [0]),
        .Q(\BL_shift_reg[7] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[7][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[12] [1]),
        .Q(\BL_shift_reg[7] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[8][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[13] [0]),
        .Q(\BL_shift_reg[8] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[8][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[13] [1]),
        .Q(\BL_shift_reg[8] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[9][0] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[14] [0]),
        .Q(\BL_shift_reg[9] [0]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BL_shift_reg[9][1] 
       (.C(clk),
        .CE(\BL_shift[34][1]_i_2_n_0 ),
        .D(\BL_shift_reg[14] [1]),
        .Q(\BL_shift_reg[9] [1]),
        .R(\BL_shift[34][1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF4FDF5FDF4FDF4FD)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(BL_buffer_loaded_reg_n_0),
        .I4(\m_axis_tdata[12]_INST_0_i_1_n_0 ),
        .I5(\v_cnt[8]_i_1_n_0 ),
        .O(next_state[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAEAAA)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(s_axis_tvalid),
        .I2(s_axis_tdata[10]),
        .I3(state[0]),
        .I4(state[1]),
        .I5(state[2]),
        .O(next_state[1]));
  LUT6 #(
    .INIT(64'h0B000B0000000F00)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(BL_buffer_loaded_reg_n_0),
        .I1(s_axis_tdata[10]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(m_axis_tready),
        .I5(state[0]),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(reset_n),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:100,load:011,first:010,send:000,skip:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(next_state[0]),
        .Q(state[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:100,load:011,first:010,send:000,skip:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(next_state[1]),
        .Q(state[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:100,load:011,first:010,send:000,skip:001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(state[2]),
        .S(\FSM_sequential_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \h_cnt[0]_i_1 
       (.I0(\h_cnt_reg_n_0_[0] ),
        .O(h_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \h_cnt[1]_i_1 
       (.I0(\h_cnt_reg_n_0_[1] ),
        .I1(\h_cnt_reg_n_0_[0] ),
        .O(h_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \h_cnt[2]_i_1 
       (.I0(\h_cnt_reg_n_0_[2] ),
        .I1(\h_cnt_reg_n_0_[1] ),
        .I2(\h_cnt_reg_n_0_[0] ),
        .O(h_cnt[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6CCC)) 
    \h_cnt[3]_i_1 
       (.I0(\h_cnt_reg_n_0_[2] ),
        .I1(\h_cnt_reg_n_0_[3] ),
        .I2(\h_cnt_reg_n_0_[1] ),
        .I3(\h_cnt_reg_n_0_[0] ),
        .O(h_cnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \h_cnt[4]_i_1 
       (.I0(h_bcnt[0]),
        .I1(\h_cnt_reg_n_0_[2] ),
        .I2(\h_cnt_reg_n_0_[3] ),
        .I3(\h_cnt_reg_n_0_[1] ),
        .I4(\h_cnt_reg_n_0_[0] ),
        .O(h_cnt[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \h_cnt[5]_i_1 
       (.I0(h_bcnt[1]),
        .I1(\h_cnt_reg_n_0_[0] ),
        .I2(\h_cnt_reg_n_0_[1] ),
        .I3(\h_cnt_reg_n_0_[3] ),
        .I4(\h_cnt_reg_n_0_[2] ),
        .I5(h_bcnt[0]),
        .O(\h_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \h_cnt[6]_i_1 
       (.I0(h_bcnt[2]),
        .I1(s_axis_tready_INST_0_i_4_n_0),
        .I2(h_bcnt[0]),
        .I3(h_bcnt[1]),
        .O(\h_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDF00DFDF00DF0000)) 
    \h_cnt[7]_i_1 
       (.I0(h_bcnt[5]),
        .I1(\h_cnt[9]_i_4_n_0 ),
        .I2(\h_cnt[7]_i_2_n_0 ),
        .I3(\h_cnt[7]_i_3_n_0 ),
        .I4(h_bcnt[2]),
        .I5(h_bcnt[3]),
        .O(h_cnt[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \h_cnt[7]_i_2 
       (.I0(\h_cnt_reg_n_0_[3] ),
        .I1(h_bcnt[0]),
        .I2(h_bcnt[1]),
        .O(\h_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \h_cnt[7]_i_3 
       (.I0(h_bcnt[1]),
        .I1(h_bcnt[0]),
        .I2(\h_cnt_reg_n_0_[2] ),
        .I3(\h_cnt_reg_n_0_[3] ),
        .I4(\h_cnt_reg_n_0_[1] ),
        .I5(\h_cnt_reg_n_0_[0] ),
        .O(\h_cnt[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \h_cnt[8]_i_1 
       (.I0(h_bcnt[4]),
        .I1(s_axis_tready_INST_0_i_4_n_0),
        .I2(h_bcnt[0]),
        .I3(h_bcnt[1]),
        .I4(h_bcnt[2]),
        .I5(h_bcnt[3]),
        .O(h_cnt[8]));
  LUT4 #(
    .INIT(16'h0004)) 
    \h_cnt[9]_i_1 
       (.I0(state[0]),
        .I1(m_axis_tready),
        .I2(state[1]),
        .I3(state[2]),
        .O(h_cnt0));
  LUT6 #(
    .INIT(64'h6266666662626262)) 
    \h_cnt[9]_i_2 
       (.I0(\h_cnt[9]_i_3_n_0 ),
        .I1(h_bcnt[5]),
        .I2(\h_cnt[9]_i_4_n_0 ),
        .I3(\h_cnt_reg_n_0_[3] ),
        .I4(h_bcnt[0]),
        .I5(h_bcnt[1]),
        .O(h_cnt[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \h_cnt[9]_i_3 
       (.I0(h_bcnt[4]),
        .I1(s_axis_tready_INST_0_i_4_n_0),
        .I2(h_bcnt[0]),
        .I3(h_bcnt[1]),
        .I4(h_bcnt[2]),
        .I5(h_bcnt[3]),
        .O(\h_cnt[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF7FF)) 
    \h_cnt[9]_i_4 
       (.I0(h_bcnt[0]),
        .I1(h_bcnt[2]),
        .I2(h_bcnt[3]),
        .I3(h_bcnt[1]),
        .I4(\h_cnt[9]_i_5_n_0 ),
        .I5(h_bcnt[4]),
        .O(\h_cnt[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \h_cnt[9]_i_5 
       (.I0(\h_cnt_reg_n_0_[0] ),
        .I1(\h_cnt_reg_n_0_[1] ),
        .I2(\h_cnt_reg_n_0_[2] ),
        .O(\h_cnt[9]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[0] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[0]),
        .Q(\h_cnt_reg_n_0_[0] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[1] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[1]),
        .Q(\h_cnt_reg_n_0_[1] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[2] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[2]),
        .Q(\h_cnt_reg_n_0_[2] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[3] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[3]),
        .Q(\h_cnt_reg_n_0_[3] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[4] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[4]),
        .Q(h_bcnt[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[5] 
       (.C(clk),
        .CE(h_cnt0),
        .D(\h_cnt[5]_i_1_n_0 ),
        .Q(h_bcnt[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[6] 
       (.C(clk),
        .CE(h_cnt0),
        .D(\h_cnt[6]_i_1_n_0 ),
        .Q(h_bcnt[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[7] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[7]),
        .Q(h_bcnt[3]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[8] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[8]),
        .Q(h_bcnt[4]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cnt_reg[9] 
       (.C(clk),
        .CE(h_cnt0),
        .D(h_cnt[9]),
        .Q(h_bcnt[5]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  CARRY4 int_r1_carry
       (.CI(1'b0),
        .CO({int_r1_carry_n_0,int_r1_carry_n_1,int_r1_carry_n_2,int_r1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,int_r1_carry_i_1_n_0}),
        .O(NLW_int_r1_carry_O_UNCONNECTED[3:0]),
        .S({int_r1_carry_i_2_n_0,int_r1_carry_i_3_n_0,int_r1_carry_i_4_n_0,int_r1_carry_i_5_n_0}));
  CARRY4 int_r1_carry__0
       (.CI(int_r1_carry_n_0),
        .CO({int_r1_carry__0_n_0,int_r1_carry__0_n_1,int_r1_carry__0_n_2,int_r1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_int_r1_carry__0_O_UNCONNECTED[3:0]),
        .S({int_r1_carry__0_i_1_n_0,int_r1_carry__0_i_2_n_0,int_r1_carry__0_i_3_n_0,int_r1_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__0_i_1
       (.I0(fifo_data_c[15]),
        .I1(fifo_data_c[14]),
        .O(int_r1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__0_i_2
       (.I0(fifo_data_c[13]),
        .I1(fifo_data_c[12]),
        .O(int_r1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__0_i_3
       (.I0(fifo_data_c[11]),
        .I1(fifo_data_c[10]),
        .O(int_r1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__0_i_4
       (.I0(fifo_data_c[9]),
        .I1(fifo_data_c[8]),
        .O(int_r1_carry__0_i_4_n_0));
  CARRY4 int_r1_carry__1
       (.CI(int_r1_carry__0_n_0),
        .CO({int_r1,int_r1_carry__1_n_1,int_r1_carry__1_n_2,int_r1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_data_c[23],1'b0,1'b0,1'b0}),
        .O(NLW_int_r1_carry__1_O_UNCONNECTED[3:0]),
        .S({int_r1_carry__1_i_1_n_0,int_r1_carry__1_i_2_n_0,int_r1_carry__1_i_3_n_0,int_r1_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__1_i_1
       (.I0(fifo_data_c[23]),
        .I1(fifo_data_c[22]),
        .O(int_r1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__1_i_2
       (.I0(fifo_data_c[21]),
        .I1(fifo_data_c[20]),
        .O(int_r1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__1_i_3
       (.I0(fifo_data_c[19]),
        .I1(fifo_data_c[18]),
        .O(int_r1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry__1_i_4
       (.I0(fifo_data_c[17]),
        .I1(fifo_data_c[16]),
        .O(int_r1_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    int_r1_carry_i_1
       (.I0(fifo_data_c[1]),
        .O(int_r1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry_i_2
       (.I0(fifo_data_c[7]),
        .I1(fifo_data_c[6]),
        .O(int_r1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry_i_3
       (.I0(fifo_data_c[5]),
        .I1(fifo_data_c[4]),
        .O(int_r1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    int_r1_carry_i_4
       (.I0(fifo_data_c[3]),
        .I1(fifo_data_c[2]),
        .O(int_r1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    int_r1_carry_i_5
       (.I0(fifo_data_c[1]),
        .I1(fifo_data_c[0]),
        .O(int_r1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    int_r_INST_0
       (.I0(reset_n),
        .I1(int_r1),
        .O(int_r));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    \m_axis_tdata[0]_INST_0 
       (.I0(\m_axis_tdata[0]_INST_0_i_1_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_2_n_0 ),
        .I2(\m_axis_tdata[0]_INST_0_i_2_n_0 ),
        .I3(h_bcnt[5]),
        .I4(\m_axis_tdata[0]_INST_0_i_3_n_0 ),
        .I5(\m_axis_tdata[1]_INST_0_i_5_n_0 ),
        .O(m_axis_tdata[0]));
  MUXF8 \m_axis_tdata[0]_INST_0_i_1 
       (.I0(\m_axis_tdata[0]_INST_0_i_4_n_0 ),
        .I1(\m_axis_tdata[0]_INST_0_i_5_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_1_n_0 ),
        .S(h_bcnt[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_10 
       (.I0(\BL_buffer_reg[3] [0]),
        .I1(\BL_buffer_reg[2] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[1] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[0] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_11 
       (.I0(\BL_buffer_reg[7] [0]),
        .I1(\BL_buffer_reg[6] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[5] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[4] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_12 
       (.I0(\BL_buffer_reg[11] [0]),
        .I1(\BL_buffer_reg[10] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[9] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[8] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_13 
       (.I0(\BL_buffer_reg[15] [0]),
        .I1(\BL_buffer_reg[14] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[13] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[12] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_14 
       (.I0(\BL_buffer_reg[19] [0]),
        .I1(\BL_buffer_reg[18] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[17] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[16] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_15 
       (.I0(\BL_buffer_reg[23] [0]),
        .I1(\BL_buffer_reg[22] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[21] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[20] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_16 
       (.I0(\BL_buffer_reg[27] [0]),
        .I1(\BL_buffer_reg[26] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[25] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[24] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_17 
       (.I0(\BL_buffer_reg[31] [0]),
        .I1(\BL_buffer_reg[30] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[29] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[28] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_17_n_0 ));
  MUXF8 \m_axis_tdata[0]_INST_0_i_2 
       (.I0(\m_axis_tdata[0]_INST_0_i_6_n_0 ),
        .I1(\m_axis_tdata[0]_INST_0_i_7_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_2_n_0 ),
        .S(h_bcnt[3]));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    \m_axis_tdata[0]_INST_0_i_3 
       (.I0(\m_axis_tdata[0]_INST_0_i_8_n_0 ),
        .I1(h_bcnt[2]),
        .I2(h_bcnt[5]),
        .I3(h_bcnt[4]),
        .I4(\m_axis_tdata[0]_INST_0_i_9_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_3_n_0 ));
  MUXF7 \m_axis_tdata[0]_INST_0_i_4 
       (.I0(\m_axis_tdata[0]_INST_0_i_10_n_0 ),
        .I1(\m_axis_tdata[0]_INST_0_i_11_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_4_n_0 ),
        .S(h_bcnt[2]));
  MUXF7 \m_axis_tdata[0]_INST_0_i_5 
       (.I0(\m_axis_tdata[0]_INST_0_i_12_n_0 ),
        .I1(\m_axis_tdata[0]_INST_0_i_13_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_5_n_0 ),
        .S(h_bcnt[2]));
  MUXF7 \m_axis_tdata[0]_INST_0_i_6 
       (.I0(\m_axis_tdata[0]_INST_0_i_14_n_0 ),
        .I1(\m_axis_tdata[0]_INST_0_i_15_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_6_n_0 ),
        .S(h_bcnt[2]));
  MUXF7 \m_axis_tdata[0]_INST_0_i_7 
       (.I0(\m_axis_tdata[0]_INST_0_i_16_n_0 ),
        .I1(\m_axis_tdata[0]_INST_0_i_17_n_0 ),
        .O(\m_axis_tdata[0]_INST_0_i_7_n_0 ),
        .S(h_bcnt[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_8 
       (.I0(\BL_buffer_reg[39] [0]),
        .I1(\BL_buffer_reg[38] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[37] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[36] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[0]_INST_0_i_9 
       (.I0(\BL_buffer_reg[35] [0]),
        .I1(\BL_buffer_reg[34] [0]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[33] [0]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[32] [0]),
        .O(\m_axis_tdata[0]_INST_0_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \m_axis_tdata[12]_INST_0 
       (.I0(\m_axis_tdata[12]_INST_0_i_1_n_0 ),
        .I1(\m_axis_tdata[12]_INST_0_i_2_n_0 ),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(m_axis_tdata[2]));
  LUT6 #(
    .INIT(64'hFFFFBFFFFFFFFFFF)) 
    \m_axis_tdata[12]_INST_0_i_1 
       (.I0(\v_cnt_reg_n_0_[5] ),
        .I1(\v_cnt_reg_n_0_[6] ),
        .I2(\v_cnt_reg_n_0_[7] ),
        .I3(\v_cnt_reg_n_0_[8] ),
        .I4(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I5(\v_cnt_reg_n_0_[4] ),
        .O(\m_axis_tdata[12]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
    \m_axis_tdata[12]_INST_0_i_2 
       (.I0(\m_axis_tdata[12]_INST_0_i_4_n_0 ),
        .I1(h_bcnt[4]),
        .I2(h_bcnt[5]),
        .I3(h_bcnt[2]),
        .I4(h_bcnt[3]),
        .I5(h_bcnt[1]),
        .O(\m_axis_tdata[12]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \m_axis_tdata[12]_INST_0_i_3 
       (.I0(v_bi[2]),
        .I1(v_bi[0]),
        .I2(v_bi[1]),
        .I3(v_bi[3]),
        .O(\m_axis_tdata[12]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \m_axis_tdata[12]_INST_0_i_4 
       (.I0(h_bcnt[0]),
        .I1(\h_cnt_reg_n_0_[2] ),
        .I2(\h_cnt_reg_n_0_[3] ),
        .I3(\h_cnt_reg_n_0_[1] ),
        .I4(\h_cnt_reg_n_0_[0] ),
        .O(\m_axis_tdata[12]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \m_axis_tdata[13]_INST_0 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(m_axis_tdata[3]));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    \m_axis_tdata[1]_INST_0 
       (.I0(\m_axis_tdata[1]_INST_0_i_1_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_2_n_0 ),
        .I2(\m_axis_tdata[1]_INST_0_i_3_n_0 ),
        .I3(h_bcnt[5]),
        .I4(\m_axis_tdata[1]_INST_0_i_4_n_0 ),
        .I5(\m_axis_tdata[1]_INST_0_i_5_n_0 ),
        .O(m_axis_tdata[1]));
  MUXF8 \m_axis_tdata[1]_INST_0_i_1 
       (.I0(\m_axis_tdata[1]_INST_0_i_6_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_7_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_1_n_0 ),
        .S(h_bcnt[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_10 
       (.I0(\BL_buffer_reg[39] [1]),
        .I1(\BL_buffer_reg[38] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[37] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[36] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_11 
       (.I0(\BL_buffer_reg[35] [1]),
        .I1(\BL_buffer_reg[34] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[33] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[32] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_12 
       (.I0(\BL_buffer_reg[3] [1]),
        .I1(\BL_buffer_reg[2] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[1] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[0] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_13 
       (.I0(\BL_buffer_reg[7] [1]),
        .I1(\BL_buffer_reg[6] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[5] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[4] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_14 
       (.I0(\BL_buffer_reg[11] [1]),
        .I1(\BL_buffer_reg[10] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[9] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[8] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_15 
       (.I0(\BL_buffer_reg[15] [1]),
        .I1(\BL_buffer_reg[14] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[13] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[12] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_16 
       (.I0(\BL_buffer_reg[19] [1]),
        .I1(\BL_buffer_reg[18] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[17] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[16] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_17 
       (.I0(\BL_buffer_reg[23] [1]),
        .I1(\BL_buffer_reg[22] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[21] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[20] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_18 
       (.I0(\BL_buffer_reg[27] [1]),
        .I1(\BL_buffer_reg[26] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[25] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[24] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \m_axis_tdata[1]_INST_0_i_19 
       (.I0(\BL_buffer_reg[31] [1]),
        .I1(\BL_buffer_reg[30] [1]),
        .I2(h_bcnt[1]),
        .I3(\BL_buffer_reg[29] [1]),
        .I4(h_bcnt[0]),
        .I5(\BL_buffer_reg[28] [1]),
        .O(\m_axis_tdata[1]_INST_0_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[1]_INST_0_i_2 
       (.I0(h_bcnt[2]),
        .I1(h_bcnt[5]),
        .I2(h_bcnt[4]),
        .O(\m_axis_tdata[1]_INST_0_i_2_n_0 ));
  MUXF8 \m_axis_tdata[1]_INST_0_i_3 
       (.I0(\m_axis_tdata[1]_INST_0_i_8_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_9_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_3_n_0 ),
        .S(h_bcnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    \m_axis_tdata[1]_INST_0_i_4 
       (.I0(\m_axis_tdata[1]_INST_0_i_10_n_0 ),
        .I1(h_bcnt[2]),
        .I2(h_bcnt[5]),
        .I3(h_bcnt[4]),
        .I4(\m_axis_tdata[1]_INST_0_i_11_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \m_axis_tdata[1]_INST_0_i_5 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(\m_axis_tdata[1]_INST_0_i_5_n_0 ));
  MUXF7 \m_axis_tdata[1]_INST_0_i_6 
       (.I0(\m_axis_tdata[1]_INST_0_i_12_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_13_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_6_n_0 ),
        .S(h_bcnt[2]));
  MUXF7 \m_axis_tdata[1]_INST_0_i_7 
       (.I0(\m_axis_tdata[1]_INST_0_i_14_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_15_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_7_n_0 ),
        .S(h_bcnt[2]));
  MUXF7 \m_axis_tdata[1]_INST_0_i_8 
       (.I0(\m_axis_tdata[1]_INST_0_i_16_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_17_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_8_n_0 ),
        .S(h_bcnt[2]));
  MUXF7 \m_axis_tdata[1]_INST_0_i_9 
       (.I0(\m_axis_tdata[1]_INST_0_i_18_n_0 ),
        .I1(\m_axis_tdata[1]_INST_0_i_19_n_0 ),
        .O(\m_axis_tdata[1]_INST_0_i_9_n_0 ),
        .S(h_bcnt[2]));
  LUT2 #(
    .INIT(4'h1)) 
    m_axis_tvalid_INST_0
       (.I0(state[0]),
        .I1(state[2]),
        .O(m_axis_tvalid));
  LUT6 #(
    .INIT(64'h545454FF54545454)) 
    s_axis_tready_INST_0
       (.I0(s_axis_tready_INST_0_i_1_n_0),
        .I1(s_axis_tready_INST_0_i_2_n_0),
        .I2(s_axis_tready_INST_0_i_3_n_0),
        .I3(state[2]),
        .I4(state[1]),
        .I5(state[0]),
        .O(s_axis_tready));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFDEFF)) 
    s_axis_tready_INST_0_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(s_axis_tvalid),
        .I4(s_axis_tdata[10]),
        .O(s_axis_tready_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h00400000FFFFFFFF)) 
    s_axis_tready_INST_0_i_2
       (.I0(\m_axis_tdata[1]_INST_0_i_5_n_0 ),
        .I1(s_axis_tready_INST_0_i_4_n_0),
        .I2(s_axis_tready_INST_0_i_5_n_0),
        .I3(s_axis_tready_INST_0_i_6_n_0),
        .I4(s_axis_tready_INST_0_i_7_n_0),
        .I5(BL_buffer_loaded_reg_n_0),
        .O(s_axis_tready_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    s_axis_tready_INST_0_i_3
       (.I0(\BL_shift_cnt_reg_n_0_[1] ),
        .I1(\BL_shift_cnt_reg_n_0_[0] ),
        .I2(\BL_shift_cnt_reg_n_0_[3] ),
        .I3(\BL_shift_cnt_reg_n_0_[2] ),
        .O(s_axis_tready_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    s_axis_tready_INST_0_i_4
       (.I0(\h_cnt_reg_n_0_[0] ),
        .I1(\h_cnt_reg_n_0_[1] ),
        .I2(\h_cnt_reg_n_0_[3] ),
        .I3(\h_cnt_reg_n_0_[2] ),
        .O(s_axis_tready_INST_0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    s_axis_tready_INST_0_i_5
       (.I0(h_bcnt[1]),
        .I1(h_bcnt[0]),
        .I2(h_bcnt[5]),
        .I3(h_bcnt[2]),
        .O(s_axis_tready_INST_0_i_5_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    s_axis_tready_INST_0_i_6
       (.I0(h_bcnt[3]),
        .I1(h_bcnt[4]),
        .O(s_axis_tready_INST_0_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    s_axis_tready_INST_0_i_7
       (.I0(m_axis_tready),
        .I1(v_bi[3]),
        .I2(v_bi[1]),
        .I3(v_bi[0]),
        .I4(v_bi[2]),
        .O(s_axis_tready_INST_0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \v_cnt[0]_i_1 
       (.I0(v_bi[0]),
        .O(v_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \v_cnt[1]_i_1 
       (.I0(v_bi[0]),
        .I1(v_bi[1]),
        .O(v_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \v_cnt[2]_i_1 
       (.I0(v_bi[2]),
        .I1(v_bi[0]),
        .I2(v_bi[1]),
        .O(v_cnt[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \v_cnt[3]_i_1 
       (.I0(v_bi[3]),
        .I1(v_bi[1]),
        .I2(v_bi[0]),
        .I3(v_bi[2]),
        .O(v_cnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \v_cnt[4]_i_1 
       (.I0(\v_cnt_reg_n_0_[4] ),
        .I1(v_bi[3]),
        .I2(v_bi[1]),
        .I3(v_bi[0]),
        .I4(v_bi[2]),
        .O(\v_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FFFF007F0000)) 
    \v_cnt[5]_i_1 
       (.I0(\v_cnt_reg_n_0_[8] ),
        .I1(\v_cnt_reg_n_0_[7] ),
        .I2(\v_cnt_reg_n_0_[6] ),
        .I3(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I4(\v_cnt_reg_n_0_[4] ),
        .I5(\v_cnt_reg_n_0_[5] ),
        .O(v_cnt[5]));
  LUT6 #(
    .INIT(64'hFF0FFF7F00F00000)) 
    \v_cnt[6]_i_1 
       (.I0(\v_cnt_reg_n_0_[8] ),
        .I1(\v_cnt_reg_n_0_[7] ),
        .I2(\v_cnt_reg_n_0_[4] ),
        .I3(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I4(\v_cnt_reg_n_0_[5] ),
        .I5(\v_cnt_reg_n_0_[6] ),
        .O(v_cnt[6]));
  LUT6 #(
    .INIT(64'hFF37FFFF00C00000)) 
    \v_cnt[7]_i_1 
       (.I0(\v_cnt_reg_n_0_[8] ),
        .I1(\v_cnt_reg_n_0_[6] ),
        .I2(\v_cnt_reg_n_0_[5] ),
        .I3(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I4(\v_cnt_reg_n_0_[4] ),
        .I5(\v_cnt_reg_n_0_[7] ),
        .O(v_cnt[7]));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \v_cnt[8]_i_1 
       (.I0(h_cnt0),
        .I1(\v_cnt[8]_i_3_n_0 ),
        .I2(h_bcnt[5]),
        .I3(h_bcnt[4]),
        .I4(h_bcnt[0]),
        .I5(s_axis_tready_INST_0_i_4_n_0),
        .O(\v_cnt[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFFFFF20000000)) 
    \v_cnt[8]_i_2 
       (.I0(\v_cnt_reg_n_0_[4] ),
        .I1(\m_axis_tdata[12]_INST_0_i_3_n_0 ),
        .I2(\v_cnt_reg_n_0_[5] ),
        .I3(\v_cnt_reg_n_0_[6] ),
        .I4(\v_cnt_reg_n_0_[7] ),
        .I5(\v_cnt_reg_n_0_[8] ),
        .O(v_cnt[8]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \v_cnt[8]_i_3 
       (.I0(h_bcnt[2]),
        .I1(h_bcnt[3]),
        .I2(h_bcnt[1]),
        .O(\v_cnt[8]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[0] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[0]),
        .Q(v_bi[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[1] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[1]),
        .Q(v_bi[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[2] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[2]),
        .Q(v_bi[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[3] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[3]),
        .Q(v_bi[3]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[4] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(\v_cnt[4]_i_1_n_0 ),
        .Q(\v_cnt_reg_n_0_[4] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[5] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[5]),
        .Q(\v_cnt_reg_n_0_[5] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[6] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[6]),
        .Q(\v_cnt_reg_n_0_[6] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[7] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[7]),
        .Q(\v_cnt_reg_n_0_[7] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cnt_reg[8] 
       (.C(clk),
        .CE(\v_cnt[8]_i_1_n_0 ),
        .D(v_cnt[8]),
        .Q(\v_cnt_reg_n_0_[8] ),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_DOG2AXIS_0_0,DOG2AXIS,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "DOG2AXIS,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset_n,
    s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready,
    fifo_data_c,
    int_r);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF AXIS_S:AXIS_M, FREQ_HZ 25000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK1, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXIS_S TDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME AXIS_S, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 25000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0" *) input [15:0]s_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXIS_S TVALID" *) input s_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXIS_S TREADY" *) output s_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXIS_M TDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME AXIS_M, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 25000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0" *) output [15:0]m_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXIS_M TVALID" *) output m_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXIS_M TREADY" *) input m_axis_tready;
  input [31:0]fifo_data_c;
  output int_r;

  wire \<const0> ;
  wire clk;
  wire [31:0]fifo_data_c;
  wire int_r;
  wire [13:8]\^m_axis_tdata ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire reset_n;
  wire [15:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;

  assign m_axis_tdata[15] = \<const0> ;
  assign m_axis_tdata[14] = \<const0> ;
  assign m_axis_tdata[13:12] = \^m_axis_tdata [13:12];
  assign m_axis_tdata[11] = \<const0> ;
  assign m_axis_tdata[10] = \<const0> ;
  assign m_axis_tdata[9:8] = \^m_axis_tdata [9:8];
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5:4] = \^m_axis_tdata [9:8];
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1:0] = \^m_axis_tdata [9:8];
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DOG2AXIS U0
       (.clk(clk),
        .fifo_data_c(fifo_data_c[31:8]),
        .int_r(int_r),
        .m_axis_tdata({\^m_axis_tdata [13:12],\^m_axis_tdata [9:8]}),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .reset_n(reset_n),
        .s_axis_tdata({s_axis_tdata[15],s_axis_tdata[9:0]}),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
