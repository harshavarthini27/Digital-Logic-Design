`timescale 1ns / 1ps

module tb_traffic_light;

    // Testbench registers to drive inputs
    reg clk;
    reg rst;

    // Testbench monitoring wire output vector [Red, Yellow, Green]
    wire [2:0] light;

    // Instantiate State Machine Unit Under Test (UUT)
    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    // Continuous 10ns System Clock Period (5ns Low, 5ns High)
    always #5 clk = ~clk;

    initial begin
        // Generate structural VCD waveform file
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_traffic_light);

        // Initialize and pulse system reset line
        clk = 0;
        rst = 1;
        #12;
        rst = 0; // Release reset to let the state machine cycle

        // Run simulation for 150ns to watch the lights cycle multiple times
        #150;
        
        $finish; // End simulation
    end

endmodule
