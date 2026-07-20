`timescale 1ns / 1ps

module tb_usr_4bit;

    reg clk;
    reg rst;
    reg [1:0] select;
    reg [3:0] d;
    reg s_right_in;
    reg s_left_in;

    wire [3:0] q;

    // Instantiate Unit Under Test (UUT)
    usr_4bit uut (
        .clk(clk),
        .rst(rst),
        .select(select),
        .d(d),
        .s_right_in(s_right_in),
        .s_left_in(s_left_in),
        .q(q)
    );

    // Generate 10ns Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_usr_4bit);

        // Initialize signals
        clk = 0; rst = 1; select = 2'b00; d = 4'b0000;
        s_right_in = 0; s_left_in = 0;
        #12 rst = 0;

        // 1. Parallel Load 4'b1011
        select = 2'b11; d = 4'b1011; #10;

        // 2. Hold state
        select = 2'b00; #10;

        // 3. Shift Right with serial input 1
        select = 2'b01; s_right_in = 1; #20;

        // 4. Shift Left with serial input 0
        select = 2'b10; s_left_in = 0; #20;

        $finish;
    end

endmodule
