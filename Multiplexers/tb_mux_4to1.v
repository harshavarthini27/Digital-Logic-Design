`timescale 1ns / 1ps

module tb_mux_4to1;

    // Testbench registers for inputs
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    reg [1:0] sel;

    // Testbench wire for output
    wire y;

    // Instantiate Unit Under Test (UUT)
    mux_4to1 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Generate the VCD waveform file
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_mux_4to1);

        // Assign fixed, alternating test values to data inputs
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b1;
        
        // Cycle through select signals at 10ns intervals
        sel = 2'b00; #10; // Output y should follow i0 (0)
        sel = 2'b01; #10; // Output y should follow i1 (1)
        sel = 2'b10; #10; // Output y should follow i2 (0)
        sel = 2'b11; #10; // Output y should follow i3 (1)
        
        $finish; // End simulation
    end

endmodule
