`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:28 12/11/2018 
// Design Name: 
// Module Name:    ID 
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
module ID(
		input clk,
		input[31:0] instr_in,
		output reg [31:0] imm_out,
		output reg [31:0] val_rs_out,
		output reg [31:0] val_rt_out, 
		output reg [4:0] rwd_out,
		output reg [5:0] opcode_out,
		input[4:0] rwd_in,
		input[31:0] wb_data,
		output reg [2:0] rs_fwd,
		output reg [2:0] rt_fwd,
    );
//module EX(
//		input clk,
//		input[31:0] imm_in,
//		input[31:0] val_rs_in,
//		input[31:0] val_rt_in,
//		output reg [31:0] val_rt_out,
//		input[4:0] rwd_in,
//		output reg [4:0] rwd_out,
//		input[5:0] opcode_in,
//		output reg [5:0] opcode_out,
//		output reg [31:0] alu_res_out,
//		input [2:0] rs_fwd,
//		input [2:0] rt_fwd,
//		input [31:0] alu_out_from_mem,
//		input [31:0] mem_data_from_mem
//    );
		wire [4:0] rs_l, rt_l;
		wire [31:0] imm_l;
		wire [31:0] val_rs_l;
		wire [31:0] val_rt_l;
		wire [4:0] rwd_out_l;
		wire [5:0] opcode_l;
		
		//for forwarding
		reg [5:0] pprev_rwd=0, prev_rwd=0;
//		reg [2:0] rs_fwd=0, rt_fwd=0;
		
		assign rs_l = instr_in[20:16];
		assign imm_l = {(instr_in[15] ? 16'HFFFF : 16'H0000) , instr_in[15:0]};
		assign rt_l[4:0] = ((instr_in[31:26] == `SDW)
										|| (instr_in[31:26] == `BEQ)
										|| (instr_in[31:26] == `LDW)) 
										? instr_in[25:21] : instr_in[15:11];
		assign rwd_out_l = ((instr_in[31:26] == `SDW)
								|| (instr_in[31:26] == `BEQ)
								|| (instr_in[31:26] == `JUMP))
								? 5'b0_0000 : instr_in[25:21];
		assign opcode_l = instr_in[31:26];
		
		
		//J-class/I-class instructions don't need forwarding
		//if prev rwd is R0, don't need forwarding
		wire[2:0] rs_fwd_l, rt_fwd_l;
		assign rs_fwd_l = ((instr_in[31:26] == `SDW)
								|| (instr_in[31:26] == `BEQ)
								|| (instr_in[31:26] == `JUMP)
								|| (prev_rwd==0)
								|| (pprev_rwd==0))
								? 3'd0 :
								(rs_l == prev_rwd) ? 3'd1 :
								(rs_l == pprev_rwd) ? 3'd2 : 3'd0;
		assign rt_fwd_l = ((instr_in[31:26] == `SDW)
								|| (instr_in[31:26] == `BEQ)
								|| (instr_in[31:26] == `JUMP)
								|| (prev_rwd==0)
								|| (pprev_rwd==0))
								? 3'd0 :
								(rt_l == prev_rwd) ? 3'd1 :
								(rt_l == pprev_rwd) ? 3'd2 : 3'd0;
//		assign opcode_l = 6'b00_0000;
//		assign opcode_l = 6'b11_1111;
		
//module RegFiles(
//    input CLK,
//    input [9:0] rs_rt,
//    input [4:0] rwd,
//    output [31:0] val_rs,
//    output [31:0] val_rt,
//    input [31:0] wb_data
//    );	 
	 RegFiles reg_files(clk, {rs_l, rt_l}, rwd_in, val_rs_l, val_rt_l, wb_data);
	 
		
		always@(posedge clk)
			begin
			imm_out <= imm_l;
			val_rs_out <= val_rs_l;
			val_rt_out <= val_rt_l;
			rwd_out <= rwd_out_l;
			opcode_out <= opcode_l;
			pprev_rwd <= prev_rwd;
			prev_rwd <= rwd_out_l;
			from_ex_out <= from_ex_in;
			from_mem_out <= from_mem_in;
			rs_fwd <= rs_fwd_l;
			rt_fwd <= rt_fwd_l;
			end

	initial
		begin
		imm_out=0;
		val_rs_out=0;
		val_rt_out=0;
		rwd_out=0;
		opcode_out=0;
		rs_fwd=0;
		rt_fwd=0;
		end

endmodule
