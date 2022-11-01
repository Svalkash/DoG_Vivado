-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:user:AXIS2VGA_IP:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_AXIS2VGA_IP_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    reset_n : IN STD_LOGIC;
    axis_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_valid : IN STD_LOGIC;
    axis_tready : OUT STD_LOGIC;
    fifo_data_c : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    int_r : OUT STD_LOGIC;
    vga_red : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    vga_green : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    vga_blue : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    vga_hsync : OUT STD_LOGIC;
    vga_vsync : OUT STD_LOGIC
  );
END design_1_AXIS2VGA_IP_0_0;

ARCHITECTURE design_1_AXIS2VGA_IP_0_0_arch OF design_1_AXIS2VGA_IP_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_AXIS2VGA_IP_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT AXIS2VGA_IP IS
    GENERIC (
      HAV : INTEGER;
      HFP : INTEGER;
      HSP : INTEGER;
      HBP : INTEGER;
      VAV : INTEGER;
      VFP : INTEGER;
      VSP : INTEGER;
      VBP : INTEGER;
      HPL : STD_LOGIC;
      VPL : STD_LOGIC;
      INT_REQ : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      reset_n : IN STD_LOGIC;
      axis_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      axis_valid : IN STD_LOGIC;
      axis_tready : OUT STD_LOGIC;
      fifo_data_c : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      int_r : OUT STD_LOGIC;
      vga_red : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      vga_green : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      vga_blue : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      vga_hsync : OUT STD_LOGIC;
      vga_vsync : OUT STD_LOGIC
    );
  END COMPONENT AXIS2VGA_IP;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_AXIS2VGA_IP_0_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 AXIS_S TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axis_valid: SIGNAL IS "xilinx.com:interface:axis:1.0 AXIS_S TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axis_data: SIGNAL IS "XIL_INTERFACENAME AXIS_S, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 25000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axis_data: SIGNAL IS "xilinx.com:interface:axis:1.0 AXIS_S TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF reset_n: SIGNAL IS "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF reset_n: SIGNAL IS "xilinx.com:signal:reset:1.0 reset_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF AXIS_S, FREQ_HZ 25000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : AXIS2VGA_IP
    GENERIC MAP (
      HAV => 640,
      HFP => 16,
      HSP => 96,
      HBP => 48,
      VAV => 480,
      VFP => 10,
      VSP => 2,
      VBP => 33,
      HPL => '0',
      VPL => '0',
      INT_REQ => 2048
    )
    PORT MAP (
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
END design_1_AXIS2VGA_IP_0_0_arch;
