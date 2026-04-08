module ALU64(
	input [63:0] A,
	input [63:0] B,
	input [2:0] sel,
	output reg [63:0] Y,
	output reg carry,
	output reg zero
);
reg [64:0] temp;         //temp is used because addition can produce an extra carry
always @(*) begin
	carry = 0;
	zero = 0;       
	case(sel)
		3'b000: begin
			temp = A+B;          //Addition 
			Y = temp[63:0];        
			carry = temp[64];     // If there is overflow (65th bit), it goes to carry	
		end
		3'b001: begin
			temp = A-B;          //Subtraction
			Y = temp[63:0];
			carry = temp[64];     //here carry acts as a borrow
		end
		3'b010: Y = A&B;        //bitwise AND
		3'b011: Y = A|B;        //bitwise OR
		3'b100: Y = A^B;	//biwise XOR
		3'b101: Y = ~(A^B);     //biwise XNOR
		3'b110: Y = ~A;         //bitwise NOT
		3'b111: Y = A;          //PASS A
		default: Y = 64'b0;  
	endcase
	zero = (Y==64'b0);       //it shows that when Y=0 then zero=1
end
endmodule



