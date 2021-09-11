module lsh_data (
    input [15:0] din,
    input [3:0] s,
    output wire [15:0] dout
);
    wire [15:0] dec_out;

    decoder_lsh dec0(s, dec_out);

    assign dout = din & dec_out;

endmodule //lsh_data