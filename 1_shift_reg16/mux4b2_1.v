module mux4b2_1 (
    input [3:0] a,
    input [3:0] b,
    input sel,
    output reg [3:0] y
);

    always @(*) begin
        if (sel)
            y <= b;
        else
            y <= a;
    end

endmodule //mux4b2_1