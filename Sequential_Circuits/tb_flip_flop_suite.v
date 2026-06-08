`timescale 1ns / 1ps

module tb_flip_flop_suite;

    // Global Testbench Controls
    reg clk;
    reg rst;

    // Stimulus excitation lines
    reg d, t, j, k, s, r;

    // Monitoring wires connected to each device under test (DUT)
    wire q_d, q_t, q_jk, q_sr;

    // Instantiate all 4 storage blocks operating under identical clock conditions
    d_flip_flop  DFF  (.clk(clk), .rst(rst), .d(d), .q(q_d));
    t_flip_flop  TFF  (.clk(clk), .rst(rst), .t(t), .q(q_t));
    jk_flip_flop JKFF (.clk(clk), .rst(rst), .j(j), .k(k), .q(q_jk));
    sr_flip_flop SRFF (.clk(clk), .rst(rst), .s(s), .r(r), .q(q_sr));

    // Continuous 10ns System Clock Generator (5ns Low, 5ns High)
    always #5 clk = ~clk;

    initial begin
        // Generate the structural VCD waveform file
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_flip_flop_suite); 

        // Initialize all variables to 0
        clk = 0; rst = 0;
        d = 0; t = 0; j = 0; k = 0; s = 0; r = 0;
        #2;

        // Apply global asynchronous reset pulse
        rst = 1; #10;
        rst = 0; #5; // Release reset to start clock-edge tracking

        // --- Test Phase 1: Validating "SET" behavior ---
        d = 1; t = 1; j = 1; k = 0; s = 1; r = 0; #10; 
        
        // --- Test Phase 2: Validating "RESET / HOLD" behavior ---
        d = 0; t = 0; j = 0; k = 1; s = 0; r = 1; #10;

        // --- Test Phase 3: Validating "TOGGLE" behavior (T and JK should invert) ---
        t = 1; j = 1; k = 1; s = 0; r = 0; #10;
        t = 1; j = 1; k = 1; #10; // Allow a second clock edge to toggle them back

        $finish; // Terminate testbench simulation runtime
    end

endmodule
