`timescale 1ns / 1ps

module tb_subtractor_design;

    // Testbench registers for inputs
    reg a;
    reg b;
    reg bin;

    // Testbench wires for outputs
    wire diff;
    wire bout;

    // Unit Under Test (UUT) Instance
    full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
    );

    initial begin
        // Generate the VCD waveform file for EDA Playground
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_subtractor_design);

        // Apply all 8 possible combinations for a 3-input truth table
        a = 0; b = 0; bin = 0; #10; // 0 - 0 - 0 = Diff: 0, Borrow: 0
        a = 0; b = 0; bin = 1; #10; // 0 - 0 - 1 = Diff: 1, Borrow: 1
        a = 0; b = 1; bin = 0; #10; // 0 - 1 - 0 = Diff: 1, Borrow: 1
        a = 0; b = 1; bin = 1; #10; // 0 - 1 - 1 = Diff: 0, Borrow: 1
        a = 1; b = 0; bin = 0; #10; // 1 - 0 - 0 = Diff: 1, Borrow: 0
        a = 1; b = 0; bin = 1; #10; // 1 - 0 - 1 = Diff: 0, Borrow: 0
        a = 1; b = 1; bin = 0; #10; // 1 - 1 - 0 = Diff: 0, Borrow: 0
        a = 1; b = 1; bin = 1; #10; // 1 - 1 - 1 = Diff: 1, Borrow: 1
        
        $finish; // End simulation
    end

endmodule
