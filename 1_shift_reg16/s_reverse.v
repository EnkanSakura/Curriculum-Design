module s_reverse (
    input [3:0] sin,
    output wire [3:0] sout
);

    assign sout[3:0] = ~sin + 1;

endmodule //s_reverse