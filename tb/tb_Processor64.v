`timescale 1ns/1ps

module tb_Processor64;

reg clk, rst;
reg [31:0] instruction;

wire [63:0] result;
wire zero, carry;

// Instantiate Processor
Processor64 uut (
    .clk(clk),
    .rst(rst),
    .instruction(instruction),
    .result(result),
    .zero(zero),
    .carry(carry)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("processor.vcd");
    $dumpvars(0, tb_Processor64);

    clk = 0;
    rst = 1;
    instruction = 0;

    #10 rst = 0;

    // -------------------------
    // PRELOAD REGISTER VALUES
    // -------------------------

    // R1 = 10
    uut.DP.RF.regfile[1] = 64'd10;

    // R2 = 5
    uut.DP.RF.regfile[2] = 64'd5;

    #10;

    // -------------------------
    // ADD: R3 = R1 + R2 → 15
    // -------------------------
    instruction = 32'b000000_00001_00010_00011;
    #10;

    // -------------------------
    // SUB: R4 = R1 - R2 → 5
    // -------------------------
    instruction = 32'b000001_00001_00010_00100;
    #10;

    // -------------------------
    // AND: R5 = R1 & R2 → 0
    // -------------------------
    instruction = 32'b000010_00001_00010_00101;
    #10;

    // -------------------------
    // OR: R6 = R1 | R2 → 15
    // -------------------------
    instruction = 32'b000011_00001_00010_00110;
    #10;

    // -------------------------
    // XOR: R7 = R1 ^ R2 → 15
    // -------------------------
    instruction = 32'b000100_00001_00010_00111;
    #10;

    $finish;
end

endmodule
