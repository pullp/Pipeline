`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:50 12/11/2018 
// Design Name: 
// Module Name:    EX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EX(
		input clk,
		input[31:0] imm_in,
		input[31:0] val_rs_in,
		input[31:0] val_rt_in,
		output reg [31:0] val_rt_out,
		input[4:0] rwd_in,
		output reg [4:0] rwd_out,
		input[5:0] opcode_in,
		output reg [5:0] opcode_out,
		output reg [31:0] alu_res_out
    );
//module MEM(
//		input clk,
//		input[31:0] val_rt_in,
//		input[4:0] rwd_in,
//		output reg [4:0] rwd_out,
//		input[5:0] opcode_in,
//		output reg [5:0] opcode_out,
//		input[31:0] alu_res_in,
//		output reg [31:0] alu_res_out,
//		output reg [31:0] mem_data_out,
//    );
	 wire[31:0] imm_or_rt_l;
	 wire[31:0] alu_res_l;
	 assign imm_or_rt_l = ((opcode_in == `LDW)
								|| (opcode_in == `SDW)) 
								? imm_in : val_rt_in;
	 
//	module Alu(
//    input [31:0] a, //rs
//    input [31:0] b, //imm or rt
//    input [5:0] opcode,
//    output [31:0] alu_out,
//    output zf
//    );
	Alu alu(.a(val_rs_in), .b(imm_or_rt_l), .opcode(opcode_in), .alu_out(alu_res_l), .zf());
	
	 always@(posedge clk)
		begin
		val_rt_out <= val_rt_in;
		rwd_out <= rwd_in;
		opcode_out <= opcode_in;
		alu_res_out <= alu_res_l;
		end
		
	initial
		begin
		val_rt_out=0;
		rwd_out=0;
		opcode_out=0;
		alu_res_out=0;
		end
		
endmodule
