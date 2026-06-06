// Basic Logic Gates Behavioral Model
module basic_gates (
    input wire a,
    input wire b,
    output wire out_and,
    output wire out_nand,
    output wire out_or,
    output wire out_nor,
    output wire out_not_a,
    output wire out_xor
);
    // Assigning outputs using continuous assignment
    assign out_and  = a & b;   // AND logic
    assign out_nand = ~(a & b); // NAND logic
    assign out_or    = a | b;   // OR logic
    assign out_nor   = ~(a | b); // NOR logic
    assign out_not_a = ~a;       // NOT logic (Inverter for input A)
    assign out_xor   = a ^ b;   // XOR logic

endmodule
