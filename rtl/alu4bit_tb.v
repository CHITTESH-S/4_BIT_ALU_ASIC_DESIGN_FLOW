`timescale 1ns/1ps
module alu_tb;

    reg clk;
    reg rst;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] sel;
    wire [3:0] result;

    // DUT Instance
    alu4bit dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .sel(sel),
        .result(result)
    );

    // Clock generation 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        clk = 0;
        rst = 1;

        // Initialize
        A = 4'b0000;
        B = 4'b0000;
        sel = 3'b000;

        // Release reset
        #20 rst = 0;

        // Test vectors (deterministic)
        A = 4'b0111; B = 4'b0101;

        sel = 3'b000; #20; // AND
        sel = 3'b001; #20; // OR
        sel = 3'b010; #20; // ADD
        sel = 3'b011; #20; // SUBTRACT
        sel = 3'b100; #20; // XOR
        sel = 3'b101; #20; // SHIFT LEFT
        sel = 3'b110; #20; // SHIFT RIGHT
        sel = 3'b111; #20; // PASS A

        #100;
        $finish;
    end

endmodule
