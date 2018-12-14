`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:15 12/11/2018 
// Design Name: 
// Module Name:    IF 
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
module IF(
	input clk,
	output [31:0] instr_out,
	output reg [31:0] pc_out,
	output [2:0] ld_rs,
	output [2:0] ld_rt
    );

//	reg[31:0] pc = 0;
	
//module CodeMem(
//    input [31:0] pc,
//    output [31:0] instr
//    );
	wire[31:0] instr_read_l;
	CodeMem code_mem(.pc(pc_out), .instr(instr_read_l));
	
	wire [4:0] rs_l, rt_l, rwd_out_l;
	wire [5:0] opcode_l;
	reg [5:0] ld_pprev_rwd=0, ld_prev_rwd=0;
	reg need_stall;
	
	assign opcode_l = instr_read_l[31:26];
	assign rwd_out_l = ((opcode_l == `SDW)
						|| (opcode_l == `BEQ)
						|| (opcode_l == `JUMP))
						? 5'b0_0000 : instr_read_l[25:21];
	assign rs_l = instr_read_l[20:16];
	assign rt_l = ((opcode_l == `SDW)
						|| (opcode_l == `BEQ)
						|| (opcode_l == `LDW)) 
						? instr_read_l[25:21] : instr_read_l[15:11];
	
	
	// forwaring from mem_data to alu_input
	wire[2:0] ld_rs_l, ld_rt_l;
	assign ld_rs_l = (opcode_l == `JUMP)
								? 3'd0 :
								({1'b0,rs_l} == ld_pprev_rwd) ? 3'd2 : 3'd0;  //3'd2 means distance is 2
	assign ld_rt_l = (opcode_l == `JUMP)
								? 3'd0 :
								({1'b0,rt_l} == ld_pprev_rwd) ? 3'd2 : 3'd0;
	assign ld_rs=ld_rs_l;
	assign ld_rt=ld_rt_l;
	assign stall_l = (({1'b0,rs_l}==ld_prev_rwd)
						    ||({1'b0,rt_l}==ld_prev_rwd)) ? 1'd1 : 1'd0;
						
	assign instr_out = stall_l ? {`_STALL, 26'b0} : instr_read_l;
	always@(posedge clk)
		begin
		pc_out <= (instr_out[31:26] == `JUMP) ? 0 :
					stall_l ? pc_out :pc_out+1;
		ld_pprev_rwd <= ld_prev_rwd;
		ld_prev_rwd <= (instr_out[31:26] == `LDW)?{1'b0, rwd_out_l}:6'b10_0000;
		need_stall <= stall_l;
//		ld_rs <= ld_rs_l;
//		ld_rt <= ld_rt_l;
		end
	//MAYBE ERROR
	
	initial
		begin
		pc_out = 0;
		ld_prev_rwd = 6'b10_0000;
		ld_pprev_rwd = 6'b10_0000;
		need_stall = 0;
//		ld_rs=0;
//		ld_rt=0;
		end

endmodule
