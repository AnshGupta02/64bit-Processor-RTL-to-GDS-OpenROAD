module Processor64 (
    input clk,
    input rst,
    input [31:0] instruction,

    output [63:0] result,
    output zero,
    output carry
);

wire [4:0] rs1, rs2, rd;
wire [2:0] alu_sel;
wire reg_write;

// ----------------------
// Control Unit
// ----------------------
ControlUnit64 CU (
    .instruction(instruction),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .alu_sel(alu_sel),
    .reg_write(reg_write)
);

// ----------------------
// Datapath
// ----------------------
Datapath64 DP (
    .clk(clk),
    .rst(rst),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .alu_sel(alu_sel),
    .reg_write(reg_write),
    .result(result),
    .zero(zero),
    .carry(carry)
);

endmodule
