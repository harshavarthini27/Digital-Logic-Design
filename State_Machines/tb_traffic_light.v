`timescale 1ns / 1ps

module tb_traffic_light;

    // Testbench registers to drive inputs
    reg clk;
    reg rst;

    // Testbench monitoring wire output vector [Red, Yellow, Green]
    wire [2:0] light;

    // --- NEW: Hierarchical Wires to Probe Inside the FSM ---
    wire [1:0] debug_current_state;
    wire [1:0] debug_next_state;
    wire [3:0] debug_internal_count;

    // Assign testbench wires to look inside the Unit Under Test (uut)
    assign debug_current_state  = uut.current_state;
    assign debug_next_state     = uut.next_state;
    assign debug_internal_count = uut.count;

    // Instantiate State Machine Unit Under Test (UUT)
    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    // Continuous 10ns System Clock Period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_traffic_light);

        // Initialize and pulse system reset line
        clk = 0;
        rst = 1;
        #12;
        rst = 0; 

        // Run simulation for 150ns
        #150;
        
        $finish; 
    end

endmodule
