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
//		output reg stall,
//		output stall,
		input [2:0] ld_rs_in,
		input [2:0] ld_rt_in,
		output reg [2:0] ld_rs_out,
		output reg [2:0] ld_rt_out
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
//		input [31:0] mem_data_from_mem,
//		input [2:0] ld_rs_fwd,
//		input [2:0] ld_rt_fwd
//    );
		wire [4:0] rs_l, rt_l;
		wire [31:0] imm_l;
		wire [31:0] val_rs_l;
		wire [31:0] val_rt_l;
		wire [4:0] rwd_out_l;
		wire [5:0] opcode_l;
		
		//for forwarding
		reg [5:0] pprev_rwd=6'd32, prev_rwd=6'd32;
		//MSB means not LDW instr, no conflicting
//		reg [2:0] rs_fwd=0, rt_fwd=0;
		
		assign rs_l = instr_in[20:16];
		assign imm_l = {(instr_in[15] ? 16'HFFFF : 16'H0000) , instr_in[15:0]};
		assign rt_l = ((instr_in[31:26] == `SDW)
							|| (instr_in[31:26] == `BEQ)
							|| (instr_in[31:26] == `LDW)) 
							? instr_in[25:21] : instr_in[15:11];
							
		assign rwd_out_l = ((instr_in[31:26] == `SDW)
								|| (instr_in[31:26] == `BEQ)
								|| (instr_in[31:26] == `JUMP))
								? 5'b0_0000 : instr_in[25:21];
								
		assign opcode_l = instr_in[31:26];
		
		

		
		
		//J-class instructions don't need forwarding
		//[X] if prev rwd is R0, don't need forwarding
		//R0 still forwarding for simplicity
		wire[2:0] rs_fwd_l, rt_fwd_l;
		assign rs_fwd_l = (instr_in[31:26] == `JUMP)
								? 3'd0 :
								({1'b0,rs_l} == prev_rwd) ? 3'd1 :
								({1'b0,rs_l} == pprev_rwd) ? 3'd2 : 3'd0;
		assign rt_fwd_l = (instr_in[31:26] == `JUMP)
								? 3'd0 :
								({1'b0,rt_l} == prev_rwd) ? 3'd1 :
								({1'b0,rt_l} == pprev_rwd) ? 3'd2 : 3'd0;
								

		
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
			imm_out <= (opcode_l==`_STALL) ? imm_out : imm_l;
			val_rs_out <= (opcode_l==`_STALL) ? val_rs_out : val_rs_l;
			val_rt_out <= (opcode_l==`_STALL) ? val_rt_out : val_rt_l;
			//stall instruciton don't modify any reg or mem
			rwd_out <= (opcode_l==`_STALL) ? 5'b0_0000 : rwd_out_l;
			opcode_out <= opcode_l;
			pprev_rwd <= prev_rwd;
			prev_rwd <= ((opcode_l == `SDW)
								|| (opcode_l == `BEQ)
								|| (opcode_l == `JUMP)
								|| (opcode_l == `LDW)
								|| (opcode_l == `_STALL))?6'b10_0000:
								{1'b0, rwd_out_l};
			rs_fwd <= rs_fwd_l;
			rt_fwd <= rt_fwd_l;
			ld_rs_out <= ld_rs_in;
			ld_rt_out <= ld_rt_in;
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
		ld_rs_out=0;
		ld_rt_out=0;
		end

endmodule
