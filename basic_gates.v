// Basic Logic Gates Behavioral Model
module basic_gates (
    input wire a,
    input wire b,
    output wire out_and,
    output wire out_nand
);
    // Assigning outputs using continuous assignment
    assign out_and  = a & b;   // AND logic
    assign out_nand = ~(a & b); // NAND logic

endmodule
