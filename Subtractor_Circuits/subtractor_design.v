// Structural Implementation of Subtractor Circuits

// 1. Foundation Module: Half Subtractor
module half_subtractor (
    input wire a,
    input wire b,
    output wire diff,
    output wire borrow
);
    // Behavioral continuous assignments
    assign diff   = a ^ b;   // XOR gate logic for difference
    assign borrow = ~a & b;  // NOT + AND gate logic for borrow
endmodule


// 2. Top-Level Module: Full Subtractor using Hierarchical Design
module full_subtractor (
    input wire a,
    input wire b,
    input wire bin,
    output wire diff,
    output wire bout
);

    // Internal connection wires
    wire d1, b1, b2;

    // Instantiate the first Half Subtractor unit
    half_subtractor HS1 (
        .a(a),
        .b(b),
        .diff(d1),
        .borrow(b1)
    );

    // Instantiate the second Half Subtractor unit
    half_subtractor HS2 (
        .a(d1),
        .b(bin),
        .diff(diff),
        .borrow(b2)
    );

    // Combine the borrow bits using an OR gate
    assign bout = b1 | b2;

endmodule
