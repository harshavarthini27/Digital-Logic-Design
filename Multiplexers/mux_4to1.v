// Behavioral Modeling of a 4-to-1 Multiplexer
module mux_4to1 (
    input wire i0,      // Data Input 0
    input wire i1,      // Data Input 1
    input wire i2,      // Data Input 2
    input wire i3,      // Data Input 3
    input wire [1:0] sel, // 2-bit Selection Control Bus
    output reg y        // Output (declared as reg because it is assigned inside an always block)
);

    // Sensitivity list triggers whenever an input or selection line changes
    always @(*) begin
        case (sel)
            2'b00: y = i0; // Route input 0
            2'b01: y = i1; // Route input 1
            2'b10: y = i2; // Route input 2
            2'b11: y = i3; // Route input 3
            default: y = 1'b0; // Default fallback state
        endcase
    end

endmodule
