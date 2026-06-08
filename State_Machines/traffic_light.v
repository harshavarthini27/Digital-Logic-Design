// Behavioral Modeling of an FSM Traffic Light Controller
module traffic_light (
    input wire clk,       // System Clock
    input wire rst,       // Asynchronous Reset
    output reg [2:0] light // Output Vector: [Red, Yellow, Green]
);

    // State Encodings
    parameter S_GREEN  = 2'b00;
    parameter S_YELLOW = 2'b01;
    parameter S_RED    = 2'b10;

    reg [1:0] current_state;
    reg [1:0] next_state;
    reg [3:0] count;

    // 1. State Memory (Sequential)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= S_GREEN;
            count         <= 4'd0;
        end else begin
            current_state <= next_state;
            if (current_state != next_state)
                count <= 4'd0;
            else
                count <= count + 1'b1;
        end
    end

    // 2. Next State Logic (Combinational)
    always @(*) begin
        case (current_state)
            S_GREEN: begin
                if (count >= 4'd4) next_state = S_YELLOW; // 5 cycles
                else               next_state = S_GREEN;
            end
            S_YELLOW: begin
                if (count >= 4'd1) next_state = S_RED;    // 2 cycles
                else               next_state = S_YELLOW;
            end
            S_RED: begin
                if (count >= 4'd4) next_state = S_GREEN;  // 5 cycles
                else               next_state = S_RED;
            end
            default: next_state = S_GREEN;
        endcase
    end

    // 3. Output Logic
    always @(*) begin
        case (current_state)
            S_GREEN:  light = 3'b001; // Green ON
            S_YELLOW: light = 3'b010; // Yellow ON
            S_RED:    light = 3'b100; // Red ON
            default:  light = 3'b001;
        endcase
    end

endmodule
