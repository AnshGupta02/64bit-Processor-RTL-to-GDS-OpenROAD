`timescale 1ns/1ps

module tb_Datapath64;

reg clk, rst;
reg [4:0] rs1, rs2, rd;
reg [2:0] alu_sel;
reg reg_write;

wire [63:0] result;
wire zero, carry;

// Instantiate Datapath
Datapath64 uut (
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

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("datapath.vcd");
    $dumpvars(0, tb_Datapath64);

    clk = 0;
    rst = 1;
    reg_write = 0;

    #10 rst = 0;

    // -------------------------
    // Write values into registers
    // -------------------------
    
    // R1 = 10
    rd = 5'd1;
    rs1 = 0; rs2 = 0;
    alu_sel = 3'b000;
    reg_write = 1;
    #10;

    // R2 = 5
    rd = 5'd2;
    #10;

    // -------------------------
    // Perform ADD: R3 = R1 + R2
    // -------------------------
    
    rs1 = 5'd1;
    rs2 = 5'd2;
    rd  = 5'd3;
    alu_sel = 3'b000; // ADD
    reg_write = 1;
    #10;

    // -------------------------
    // Perform SUB: R4 = R1 - R2
    // -------------------------
    
    rd = 5'd4;
    alu_sel = 3'b001; // SUB
    #10;

    // -------------------------
    // Perform AND
    // -------------------------
    
    rd = 5'd5;
    alu_sel = 3'b010;
    #10;

    // Stop simulation
    $finish;
end

endmodule  
