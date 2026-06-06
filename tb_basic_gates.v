// Testbench to verify the Complete Logic Gates Model
`timescale 1ns / 1ps

module tb_basic_gates;

    // Inputs modeled as registers
    reg a;
    reg b;

    // Outputs modeled as wires
    wire out_and;
    wire out_nand;
    wire out_or;
    wire out_nor;
    wire out_not_a;
    wire out_xor;

    // Instantiate the main design module
    basic_gates uut (
        .a(a),
        .b(b),
        .out_and(out_and),
        .out_nand(out_nand),
        .out_or(out_or),
        .out_nor(out_nor),
        .out_not_a(out_not_a),
        .out_xor(out_xor)
    );

    initial begin
        // Apply all possible input combinations
        a = 0; b = 0; #10; // Input 00, wait 10 nanoseconds
        a = 0; b = 1; #10; // Input 01, wait 10 nanoseconds
        a = 1; b = 0; #10; // Input 10, wait 10 nanoseconds
        a = 1; b = 1; #10; // Input 11, wait 10 nanoseconds
        
        $finish; // End the simulation
    end

endmodule
