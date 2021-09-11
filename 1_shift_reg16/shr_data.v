module shr_data (
    input [15:0] din,
    input [3:0] s,
    output wire [15:0] dout
);
    wire [15:0] dec_out;

    decoder_rsh dec0(s, dec_out);

    assign dout = din & dec_out;

endmodule //shr_data