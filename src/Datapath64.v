module Datapath64 (
    input clk,
    input rst,

    input [4:0] rs1, rs2, rd,
    input [2:0] alu_sel,
    input reg_write,

    output [63:0] result,
    output zero,
    output carry
);

// Internal wires
wire [63:0] read_data1, read_data2;
wire [63:0] alu_out;

// Register File
RegFile64 RF (
    .clk(clk),
    .rst(rst),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_out),   // write back from ALU
    .reg_write(reg_write),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// ALU
ALU64 ALU (
    .A(read_data1),
    .B(read_data2),
    .sel(alu_sel),
    .Y(alu_out),
    .carry(carry),
    .zero(zero)
);

// Output-
assign result = alu_out;

endmodule
