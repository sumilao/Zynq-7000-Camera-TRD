// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:sobel_ip:1.0
// IP Revision: 1907261109

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_sobel_ip_0_1 (
  s_axi_AXILiteS_AWADDR,
  s_axi_AXILiteS_AWVALID,
  s_axi_AXILiteS_AWREADY,
  s_axi_AXILiteS_WDATA,
  s_axi_AXILiteS_WSTRB,
  s_axi_AXILiteS_WVALID,
  s_axi_AXILiteS_WREADY,
  s_axi_AXILiteS_BRESP,
  s_axi_AXILiteS_BVALID,
  s_axi_AXILiteS_BREADY,
  s_axi_AXILiteS_ARADDR,
  s_axi_AXILiteS_ARVALID,
  s_axi_AXILiteS_ARREADY,
  s_axi_AXILiteS_RDATA,
  s_axi_AXILiteS_RRESP,
  s_axi_AXILiteS_RVALID,
  s_axi_AXILiteS_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  p_src_TVALID,
  p_src_TREADY,
  p_src_TDATA,
  p_src_TKEEP,
  p_src_TSTRB,
  p_src_TUSER,
  p_src_TLAST,
  p_src_TID,
  p_src_TDEST,
  p_dst_x_TVALID,
  p_dst_x_TREADY,
  p_dst_x_TDATA,
  p_dst_x_TKEEP,
  p_dst_x_TSTRB,
  p_dst_x_TUSER,
  p_dst_x_TLAST,
  p_dst_x_TID,
  p_dst_x_TDEST,
  p_dst_y_TVALID,
  p_dst_y_TREADY,
  p_dst_y_TDATA,
  p_dst_y_TKEEP,
  p_dst_y_TSTRB,
  p_dst_y_TUSER,
  p_dst_y_TLAST,
  p_dst_y_TID,
  p_dst_y_TDEST
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR" *)
input wire [4 : 0] s_axi_AXILiteS_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID" *)
input wire s_axi_AXILiteS_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY" *)
output wire s_axi_AXILiteS_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA" *)
input wire [31 : 0] s_axi_AXILiteS_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB" *)
input wire [3 : 0] s_axi_AXILiteS_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID" *)
input wire s_axi_AXILiteS_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY" *)
output wire s_axi_AXILiteS_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP" *)
output wire [1 : 0] s_axi_AXILiteS_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID" *)
output wire s_axi_AXILiteS_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY" *)
input wire s_axi_AXILiteS_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR" *)
input wire [4 : 0] s_axi_AXILiteS_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID" *)
input wire s_axi_AXILiteS_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY" *)
output wire s_axi_AXILiteS_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA" *)
output wire [31 : 0] s_axi_AXILiteS_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP" *)
output wire [1 : 0] s_axi_AXILiteS_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID" *)
output wire s_axi_AXILiteS_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_AXILiteS, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 150000000,\
 ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY" *)
input wire s_axi_AXILiteS_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_AXILiteS:p_src:p_dst_x:p_dst_y, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 150000000, P\
HASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TVALID" *)
input wire p_src_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TREADY" *)
output wire p_src_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TDATA" *)
input wire [7 : 0] p_src_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TKEEP" *)
input wire [0 : 0] p_src_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TSTRB" *)
input wire [0 : 0] p_src_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TUSER" *)
input wire [0 : 0] p_src_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TLAST" *)
input wire [0 : 0] p_src_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TID" *)
input wire [0 : 0] p_src_TID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_src, TDATA_NUM_BYTES 1, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, LAYERED_METADATA undef, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_src TDEST" *)
input wire [0 : 0] p_src_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TVALID" *)
output wire p_dst_x_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TREADY" *)
input wire p_dst_x_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TDATA" *)
output wire [7 : 0] p_dst_x_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TKEEP" *)
output wire [0 : 0] p_dst_x_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TSTRB" *)
output wire [0 : 0] p_dst_x_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TUSER" *)
output wire [0 : 0] p_dst_x_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TLAST" *)
output wire [0 : 0] p_dst_x_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TID" *)
output wire [0 : 0] p_dst_x_TID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_dst_x, TDATA_NUM_BYTES 1, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_t\
ype immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 8 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} ma\
ximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TUSER_WIDTH 1}, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_x TDEST" *)
output wire [0 : 0] p_dst_x_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TVALID" *)
output wire p_dst_y_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TREADY" *)
input wire p_dst_y_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TDATA" *)
output wire [7 : 0] p_dst_y_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TKEEP" *)
output wire [0 : 0] p_dst_y_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TSTRB" *)
output wire [0 : 0] p_dst_y_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TUSER" *)
output wire [0 : 0] p_dst_y_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TLAST" *)
output wire [0 : 0] p_dst_y_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TID" *)
output wire [0 : 0] p_dst_y_TID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_dst_y, TDATA_NUM_BYTES 1, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_t\
ype immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 8 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} ma\
ximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TUSER_WIDTH 1}, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 p_dst_y TDEST" *)
output wire [0 : 0] p_dst_y_TDEST;

  sobel_ip #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(5),
    .C_S_AXI_AXILITES_DATA_WIDTH(32)
  ) inst (
    .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
    .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
    .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
    .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
    .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
    .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
    .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
    .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
    .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
    .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .p_src_TVALID(p_src_TVALID),
    .p_src_TREADY(p_src_TREADY),
    .p_src_TDATA(p_src_TDATA),
    .p_src_TKEEP(p_src_TKEEP),
    .p_src_TSTRB(p_src_TSTRB),
    .p_src_TUSER(p_src_TUSER),
    .p_src_TLAST(p_src_TLAST),
    .p_src_TID(p_src_TID),
    .p_src_TDEST(p_src_TDEST),
    .p_dst_x_TVALID(p_dst_x_TVALID),
    .p_dst_x_TREADY(p_dst_x_TREADY),
    .p_dst_x_TDATA(p_dst_x_TDATA),
    .p_dst_x_TKEEP(p_dst_x_TKEEP),
    .p_dst_x_TSTRB(p_dst_x_TSTRB),
    .p_dst_x_TUSER(p_dst_x_TUSER),
    .p_dst_x_TLAST(p_dst_x_TLAST),
    .p_dst_x_TID(p_dst_x_TID),
    .p_dst_x_TDEST(p_dst_x_TDEST),
    .p_dst_y_TVALID(p_dst_y_TVALID),
    .p_dst_y_TREADY(p_dst_y_TREADY),
    .p_dst_y_TDATA(p_dst_y_TDATA),
    .p_dst_y_TKEEP(p_dst_y_TKEEP),
    .p_dst_y_TSTRB(p_dst_y_TSTRB),
    .p_dst_y_TUSER(p_dst_y_TUSER),
    .p_dst_y_TLAST(p_dst_y_TLAST),
    .p_dst_y_TID(p_dst_y_TID),
    .p_dst_y_TDEST(p_dst_y_TDEST)
  );
endmodule
