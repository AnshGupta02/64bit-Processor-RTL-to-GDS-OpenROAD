module RegFile64(
    input clk,
    input rst,

    input [4:0] rs1, rs2, rd,   // 5-bit for 32 registers
    input [63:0] write_data,
    input reg_write,

    output [63:0] read_data1,
    output [63:0] read_data2
);

reg [63:0] regfile [31:0];   // 32 registers of 64-bit
integer i;

// Reset
always @(posedge clk or posedge rst) begin
    if (rst) begin
        for (i = 0; i < 32; i = i + 1)
            regfile[i] <= 64'b0;
    end
    else if (reg_write) begin
        regfile[rd] <= write_data;
    end
end

// Read (combinational)
assign read_data1 = regfile[rs1];
assign read_data2 = regfile[rs2];

endmodule
