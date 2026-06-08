// Unified Storage Suite: Core Sequential Elements with Asynchronous Resets

// 1. D Flip-Flop (Data / Delay)
module d_flip_flop (
    input wire clk, rst, d,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else     q <= d;
    end
endmodule

// 2. T Flip-Flop (Toggle)
module t_flip_flop (
    input wire clk, rst, t,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else if (t) q <= ~q; // Toggle state if t is high
        else     q <= q;     // Hold state
    end
endmodule

// 3. JK Flip-Flop (The Universal Flip-Flop)
module jk_flip_flop (
    input wire clk, rst, j, k,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;    // Hold
                2'b01: q <= 1'b0; // Reset
                2'b10: q <= 1'b1; // Set
                2'b11: q <= ~q;   // Toggle
            endcase
        end
    end
endmodule

// 4. SR Flip-Flop (Set-Reset)
module sr_flip_flop (
    input wire clk, rst, s, r,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;    // Hold
                2'b01: q <= 1'b0; // Reset
                2'b10: q <= 1'b1; // Set
                2'b11: q <= 1'bx; // Invalid/Indeterminate State in hardware
            endcase
        end
    end
endmodule
