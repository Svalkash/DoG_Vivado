// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Oct  8 11:44:43 2022
// Host        : DESKTOP-2B79PL0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_DOG2AXIS_0_0_stub.v
// Design      : design_1_DOG2AXIS_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "DOG2AXIS,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, reset_n, s_axis_tdata, s_axis_tvalid, 
  s_axis_tready, m_axis_tdata, m_axis_tvalid, m_axis_tready, fifo_data_c, int_r)
/* synthesis syn_black_box black_box_pad_pin="clk,reset_n,s_axis_tdata[15:0],s_axis_tvalid,s_axis_tready,m_axis_tdata[15:0],m_axis_tvalid,m_axis_tready,fifo_data_c[31:0],int_r" */;
  input clk;
  input reset_n;
  input [15:0]s_axis_tdata;
  input s_axis_tvalid;
  output s_axis_tready;
  output [15:0]m_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  input [31:0]fifo_data_c;
  output int_r;
endmodule
