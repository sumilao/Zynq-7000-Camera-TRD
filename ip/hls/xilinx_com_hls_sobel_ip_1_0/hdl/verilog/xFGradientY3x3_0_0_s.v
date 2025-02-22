// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module xFGradientY3x3_0_0_s (
        ap_ready,
        t0_V,
        t1_V,
        t2_V,
        b0_V,
        b1_V,
        b2_V,
        ap_return
);


output   ap_ready;
input  [7:0] t0_V;
input  [7:0] t1_V;
input  [7:0] t2_V;
input  [7:0] b0_V;
input  [7:0] b1_V;
input  [7:0] b2_V;
output  [7:0] ap_return;

wire   [8:0] M00_fu_70_p3;
wire   [8:0] M01_fu_82_p3;
wire   [8:0] lhs_V_fu_94_p1;
wire   [8:0] rhs_V_fu_98_p1;
wire   [8:0] r_V_fu_102_p2;
wire   [8:0] lhs_V_1_fu_112_p1;
wire   [8:0] rhs_V_1_fu_116_p1;
wire   [8:0] r_V_1_fu_120_p2;
wire   [9:0] M01_cast_fu_90_p1;
wire   [9:0] M00_cast_fu_78_p1;
wire   [9:0] out_pix_fu_130_p2;
wire   [10:0] A00_cast_fu_108_p1;
wire  signed [10:0] out_pix_cast_fu_136_p1;
wire   [10:0] out_pix_1_fu_140_p2;
wire   [10:0] S00_cast_fu_126_p1;
wire   [10:0] out_pix_2_fu_146_p2;
wire   [2:0] tmp_17_fu_164_p4;
wire   [0:0] tmp_16_fu_156_p3;
wire   [0:0] not_tmp_s_fu_180_p2;
wire   [0:0] icmp_fu_174_p2;
wire   [0:0] tmp_fu_194_p2;
wire   [7:0] p_cast_fu_186_p3;
wire   [7:0] g_y_V_fu_152_p1;

assign A00_cast_fu_108_p1 = r_V_fu_102_p2;

assign M00_cast_fu_78_p1 = M00_fu_70_p3;

assign M00_fu_70_p3 = {{t1_V}, {1'd0}};

assign M01_cast_fu_90_p1 = M01_fu_82_p3;

assign M01_fu_82_p3 = {{b1_V}, {1'd0}};

assign S00_cast_fu_126_p1 = r_V_1_fu_120_p2;

assign ap_ready = 1'b1;

assign ap_return = ((tmp_fu_194_p2[0:0] === 1'b1) ? p_cast_fu_186_p3 : g_y_V_fu_152_p1);

assign g_y_V_fu_152_p1 = out_pix_2_fu_146_p2[7:0];

assign icmp_fu_174_p2 = (($signed(tmp_17_fu_164_p4) > $signed(3'd0)) ? 1'b1 : 1'b0);

assign lhs_V_1_fu_112_p1 = t0_V;

assign lhs_V_fu_94_p1 = b0_V;

assign not_tmp_s_fu_180_p2 = (tmp_16_fu_156_p3 ^ 1'd1);

assign out_pix_1_fu_140_p2 = ($signed(A00_cast_fu_108_p1) + $signed(out_pix_cast_fu_136_p1));

assign out_pix_2_fu_146_p2 = (out_pix_1_fu_140_p2 - S00_cast_fu_126_p1);

assign out_pix_cast_fu_136_p1 = $signed(out_pix_fu_130_p2);

assign out_pix_fu_130_p2 = (M01_cast_fu_90_p1 - M00_cast_fu_78_p1);

assign p_cast_fu_186_p3 = ((not_tmp_s_fu_180_p2[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign r_V_1_fu_120_p2 = (lhs_V_1_fu_112_p1 + rhs_V_1_fu_116_p1);

assign r_V_fu_102_p2 = (lhs_V_fu_94_p1 + rhs_V_fu_98_p1);

assign rhs_V_1_fu_116_p1 = t2_V;

assign rhs_V_fu_98_p1 = b2_V;

assign tmp_16_fu_156_p3 = out_pix_2_fu_146_p2[32'd10];

assign tmp_17_fu_164_p4 = {{out_pix_2_fu_146_p2[10:8]}};

assign tmp_fu_194_p2 = (tmp_16_fu_156_p3 | icmp_fu_174_p2);

endmodule //xFGradientY3x3_0_0_s
