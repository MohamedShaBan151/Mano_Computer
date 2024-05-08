module PC(
    input [7:0] DR,
    input D6,
    input D5,
    input D4,
    input T6,
    input T5,
    input T4,
    input T2,
    input T1,
    input R,
    input CLK,
    input [2:0] comm_bus,
    output reg [2:0] PC
);

wire Load;
wire Clear;
wire INR;
assign Load = ~((D4 & T4) | (D5 & T5));
assign Clear = (R & T1);
assign INR = ((~R & T1) | (R & T2));

initial begin
    PC = 3'b000;
end

always @(posedge CLK or posedge Clear) begin
    if (Clear == 1) begin
        PC <= 3'b000;
    end else if (Load == 0) begin
        PC <= comm_bus;
    end else if (INR == 1 || (DR == 0 && D6 & T6)) begin
        PC <= PC + 1'b1;
    end
end

endmodule
