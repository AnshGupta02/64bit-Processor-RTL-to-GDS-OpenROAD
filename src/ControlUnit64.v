module ControlUnit64 (
    input [31:0] instruction,

    output reg [4:0] rs1, rs2, rd,
    output reg [2:0] alu_sel,
    output reg reg_write
);

// Extract fields from instruction
wire [5:0] opcode;

assign opcode = instruction[31:26];

always @(*) begin
    // Extract register addresses
    rs1 = instruction[25:21];
    rs2 = instruction[20:16];
    rd  = instruction[15:11];

    // Default values
    reg_write = 1;

    case(opcode)
        6'b000000: alu_sel = 3'b000; // ADD
        6'b000001: alu_sel = 3'b001; // SUB
        6'b000010: alu_sel = 3'b010; // AND
        6'b000011: alu_sel = 3'b011; // OR
        6'b000100: alu_sel = 3'b100; // XOR
        6'b000101: alu_sel = 3'b101; // XNOR
        6'b000110: alu_sel = 3'b110; // NOT
        6'b000111: alu_sel = 3'b111; // PASS A

        default: begin
            alu_sel = 3'b000;
            reg_write = 0;
        end
    endcase
end

endmodule
