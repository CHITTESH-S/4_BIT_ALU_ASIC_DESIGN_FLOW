module alu4bit (
    input        clk,
    input        rst,        // synchronous reset
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] sel,
    output reg [3:0] result
);

    reg [3:0] alu_out;

    // Combinational ALU logic
    always @(*) begin
        case (sel)
            3'b000: alu_out = A & B;   // AND
            3'b001: alu_out = A | B;   // OR
            3'b010: alu_out = A + B;   // ADD
            3'b011: alu_out = A - B;   // SUBTRACT
            3'b100: alu_out = A ^ B;   // XOR
            3'b101: alu_out = A << 1;  // SHIFT LEFT
            3'b110: alu_out = A >> 1;  // SHIFT RIGHT
            3'b111: alu_out = A;       // PASS A
            default: alu_out = 4'b0000;
        endcase
    end

    // Registered output
    always @(posedge clk) begin
        if (rst)
            result <= 4'b0000;
        else
            result <= alu_out;
    end

endmodule
