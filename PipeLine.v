`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    19:30:29 12/11/2018
// Design Name:
// Module Name:    PipeLine
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
module PipeLine(
    input clk,
	 output[31:0] pc,
	 output[31:0] instr,
	 output[31:0] wb_data,
	 output[4:0] rwd
    );

	wire [31:0] instr_ID;
	wire [31:0] imm_EX ;
	wire [31:0] rs_EX, rt_EX,  rt_MEM ;
	wire [5:0] opcode_EX, opcode_MEM, opcode_WB;
	wire [4:0] rwd_EX, rwd_MEM, rwd_WB, rwd_BACK;
	wire [31:0] alures_MEM, alures_WB;
	wire [31:0] memdata_WB;
	wire [31:0]	wbdata_BACK;
	wire [31:0] pc_ID ;
	
	assign instr = instr_ID;
	assign wb_data = wbdata_BACK;
	assign rwd = rwd_BACK;
	assign pc = pc_ID;
//module IF(
//  input clk,
//  output[31:0] instr_out
//    );
     IF _if(.clk(clk), .instr_out(instr_ID), .pc_out(pc_ID));

//module ID(
//		input clk,
//		input[31:0] instr_in,
//		output reg [31:0] imm_out,
//		output reg [31:0] val_rs_out,
//		output reg [31:0] val_rt_out, 
//		output reg [4:0] rwd_out,
//		output reg [5:0] opcode_out,
//		input[4:0] rwd_in,
//		input[31:0] wb_data,
//    );
     ID _id(.clk(clk), .instr_in(instr_ID), .imm_out(imm_EX),
            .val_rs_out(rs_EX), .val_rt_out(rt_EX), .rwd_out(rwd_EX), .opcode_out(opcode_EX),
            .rwd_in(rwd_BACK), .wb_data(wbdata_BACK));


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
//    );
     EX _ex(.clk(clk), .imm_in(imm_EX),
            .val_rs_in(rs_EX), .val_rt_in(rt_EX),
            .val_rt_out(rt_MEM), .rwd_in(rwd_EX), .rwd_out(rwd_MEM), .opcode_in(opcode_EX),
            .opcode_out(opcode_MEM), .alu_res_out(alures_MEM));


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
     MEM _mem(.clk(clk),  .val_rt_in(rt_MEM),
            .rwd_in(rwd_MEM), .rwd_out(rwd_WB), .opcode_in(opcode_MEM),
            .opcode_out(opcode_WB), .alu_res_in(alures_MEM), .alu_res_out(alures_WB),
				.mem_data_out(memdata_WB));
				
//module WB(
//		input[4:0] rwd_in,
//		output[4:0] rwd_out,
//		input[5:0] opcode_in,
//		input[31:0] alu_res_in,
//		input[31:0] mem_data_in,
//		output[31:0] wb_data
//    );
		WB _wb(.rwd_in(rwd_WB),
				.rwd_out(rwd_BACK), .opcode_in(opcode_WB), .alu_res_in(alures_WB), .mem_data_in(memdata_WB),
				.wb_data(wbdata_BACK));

endmodule
