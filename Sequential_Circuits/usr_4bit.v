// Behavioral Modeling of a 4-Bit Universal Shift Register (USR)
module usr_4bit (
    input wire clk,              // System Clock
    input wire rst,              // Asynchronous Active-High Reset
    input wire [1:0] select,     // Control Mode Select Pin
    input wire [3:0] d,          // Parallel Data Input Bus
    input wire s_right_in,       // Serial Input for Right Shift
    input wire s_left_in,        // Serial Input for Left Shift
    output reg [3:0] q           // 4-Bit Register Data Output
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 4'b0000;
        end else begin
            case (select)
                2'b00: q <= q;                            // Hold
                2'b01: q <= {s_right_in, q[3:1]};         // Shift Right
                2'b10: q <= {q[2:0], s_left_in};          // Shift Left
                2'b11: q <= d;                            // Parallel Load
                default: q <= q;
            endcase
        end
    end

endmodule
