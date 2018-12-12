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
		output reg [31:0] instr_out,
		output reg [31:0] imm_out,
		output reg [31:0] val_rs_out,
		output reg [31:0] val_rt_out, 
		output reg [4:0] rwd_out,
		output reg [5:0] opcode_out,
		input[4:0] rwd_in,
		input[31:0] wb_data,
		input[31:0] pc_in,
		output reg [31:0] pc_out
    );
		wire [9:0] rs_rt_l;
		wire [31:0] imm_l;
		wire [31:0] val_rs_l;
		wire [31:0] val_rt_l;
		wire [4:0] rwd_out_l;
		wire [5:0] opcode_l;

		assign rs_rt_l[9:5] = instr_in[20:16];
		assign imm_l = {(instr_in[15] ? 16'HFFFF : 16'H0000) , instr_in[15:0]};
		assign rs_rt_l[4:0] = ((instr_in[31:26] == `SDW)
										|| (instr_in[31:26] == `BEQ)
										|| (instr_in[31:26] == `LDW)) 
										? instr_in[25:21] : instr_in[15:11];
		assign rwd_out_l = ((instr_in[31:26] == `SDW)
								|| (instr_in[31:26] == `BEQ)
								|| (instr_in[31:26] == `JUMP))
								? 5'b0_0000 : instr_in[25:21];
		assign opcode_l = instr_in[31:26];
		
//module RegFiles(
//    input CLK,
//    input [9:0] rs_rt,
//    input [4:0] rwd,
//    output [31:0] val_rs,
//    output [31:0] val_rt,
//    input [31:0] wb_data
//    );	 
	 RegFiles reg_files(clk, rs_rt_l, rwd_in, val_rs_l, val_rt_l, wb_data);
	 
		
		always@(posedge clk)
			begin
			pc_out <= pc_in;
			instr_out <= instr_in;
			imm_out <= imm_l;
			val_rs_out <= val_rs_l;
			val_rt_out <= val_rt_l;
			rwd_out <= rwd_out_l;
			opcode_out <= opcode_l;
			end

	initial
		begin
		instr_out=0;
		instr_out=0;
		imm_out=0;
		val_rs_out=0;
		val_rt_out=0;
		rwd_out=0;
		opcode_out=0;
		end

endmodule
