`timescale 1ns / 1ps

module tb_clock_divider;

    reg clk_in;
    reg rst;
    wire clk_out;

    // Instantiate Unit Under Test with DIVISOR = 4
    clock_divider #(.DIVISOR(4)) uut (
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Fast 10ns Input Clock (100 MHz)
    always #5 clk_in = ~clk_in;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_clock_divider);

        // Initialize signals
        clk_in = 0;
        rst = 1;
        #12 rst = 0;

        // Run simulation for 100ns to see multiple divided clock cycles
        #100;

        $finish;
    end

endmodule
