`timescale 1ns / 1ps

module tb_adder_design;

    // Testbench registers for inputs
    reg a;
    reg b;
    reg cin;

    // Testbench wires for outputs
    wire sum;
    wire cout;

    // Unit Under Test (UUT) Instance
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Generate the VCD waveform file for EDA Playground
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_adder_design);

        // Apply all 8 possible combinations for a 3-input truth table
        a = 0; b = 0; cin = 0; #10; // 0 + 0 + 0 = Sum: 0, Carry: 0
        a = 0; b = 0; cin = 1; #10; // 0 + 0 + 1 = Sum: 1, Carry: 0
        a = 0; b = 1; cin = 0; #10; // 0 + 1 + 0 = Sum: 1, Carry: 0
        a = 0; b = 1; cin = 1; #10; // 0 + 1 + 1 = Sum: 0, Carry: 1
        a = 1; b = 0; cin = 0; #10; // 1 + 0 + 0 = Sum: 1, Carry: 0
        a = 1; b = 0; cin = 1; #10; // 1 + 0 + 1 = Sum: 0, Carry: 1
        a = 1; b = 1; cin = 0; #10; // 1 + 1 + 0 = Sum: 0, Carry: 1
        a = 1; b = 1; cin = 1; #10; // 1 + 1 + 1 = Sum: 1, Carry: 1
        
        $finish; // End simulation
    end

endmodule
