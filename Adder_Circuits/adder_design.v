// Structural Implementation of Adder Circuits

// 1. Foundation Module: Half Adder
module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    // Behavioral continuous assignments
    assign sum   = a ^ b;  // XOR gate logic
    assign carry = a & b;  // AND gate logic
endmodule


// 2. Top-Level Module: Full Adder using Hierarchical Design
module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

    // Internal connection wires
    wire s1, c1, c2;

    // Instantiate the first Half Adder unit
    half_adder HA1 (
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );

    // Instantiate the second Half Adder unit
    half_adder HA2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .carry(c2)
    );

    // Combine the carry bits using an OR gate
    assign cout = c1 | c2;

endmodule
