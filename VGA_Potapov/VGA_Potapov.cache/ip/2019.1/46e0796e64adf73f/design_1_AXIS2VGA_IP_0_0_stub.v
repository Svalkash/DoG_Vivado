// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun Sep 25 12:16:04 2022
// Host        : DESKTOP-2B79PL0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_AXIS2VGA_IP_0_0_stub.v
// Design      : design_1_AXIS2VGA_IP_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "AXIS2VGA_IP,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, reset_n, axis_data, axis_valid, axis_tready, 
  fifo_data_c, int_r, vga_red, vga_green, vga_blue, vga_hsync, vga_vsync)
/* synthesis syn_black_box black_box_pad_pin="clk,reset_n,axis_data[15:0],axis_valid,axis_tready,fifo_data_c[31:0],int_r,vga_red[3:0],vga_green[3:0],vga_blue[3:0],vga_hsync,vga_vsync" */;
  input clk;
  input reset_n;
  input [15:0]axis_data;
  input axis_valid;
  output axis_tready;
  input [31:0]fifo_data_c;
  output int_r;
  output [3:0]vga_red;
  output [3:0]vga_green;
  output [3:0]vga_blue;
  output vga_hsync;
  output vga_vsync;
endmodule
