`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg clk;
    reg D0, D1, D2, D7, B1, B2, J, T5, B3, T3;
    reg [7:0] DR;
    reg [7:0] INPR;
    reg [7:0] AC;

    // Outputs
    wire [7:0] alu_out;
    wire E;

    // Instantiate the ALU module
    ALU uut (
        .clk(clk),
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D7(D7),
        .B1(B1),
        .B2(B2),
        .J(J),
        .T5(T5),
        .B3(B3),
        .T3(T3),
        .DR(DR),
        .INPR(INPR),
        .AC(AC),
        .alu_out(alu_out),
        .E(E)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test vectors
    initial begin
        // Initialize inputs
        clk = 0;
        D0 = 0;
        D1 = 0;
        D2 = 0;
        D7 = 0;
        B1 = 0;
        B2 = 0;
        J = 0;
        T5 = 0;
        B3 = 0;
        T3 = 0;
        DR = 8'b00000000;
        INPR = 8'b00000000;
        AC = 8'b00000000;

        // Test Case 1: CIR operation
        // Set inputs for CIR operation
        D0 = 0;
        D1 = 0;
        D2 = 0;
        D7 = 1;
        B1 = 1;
        B2 = 0;
        J = 0;
        T5 = 1;
        B3 = 0;
        T3 = 1;
        DR = 8'b00000000;
        INPR = 8'b00000000;
        AC = 8'b11001100;
        // Wait for a few clock cycles
        #10;
        // Expected output for CIR operation
        // Since the first bit is 1, it should be shifted out
        // and the carry flag (E) should be set to 1
        // Expected output: alu_out = 7'b1001100, E = 1
        if (alu_out !== 8'b10011000 || E !== 1)
            $display("Test case 1 failed!");

        // Test Case 2: CIL operation
        // Set inputs for CIL operation
        D0 = 0;
        D1 = 0;
        D2 = 0;
        D7 = 1;
        B1 = 0;
        B2 = 1;
        J = 0;
        T5 = 1;
        B3 = 0;
        T3 = 1;
        DR = 8'b00000000;
        INPR = 8'b00000000;
        AC = 8'b00110011;
        // Wait for a few clock cycles
        #10;
        // Expected output for CIL operation
        // Since the last bit is 1, it should be shifted out
        // and the carry flag (E) should be set to 1
        // Expected output: alu_out = 7'b01100110, E = 1
        if (alu_out !== 8'b01100110 || E !== 1)
            $display("Test case 2 failed!");

        // Additional test cases can be added similarly

        // End simulation
        $finish;
    end

endmodule
