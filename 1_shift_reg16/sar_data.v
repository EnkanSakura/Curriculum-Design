module sar_data (
    input [15:0] din,
    input [3:0] s,
    output wire [15:0] dout
);
    wire [15:0] dec_out_0, dec_out_1;

    decoder_sar dec0(s, dec_out_0);
    decoder_rsh dec1(s, dec_out_1);

    assign dout = (din & dec_out_1) | ({ 16{ din[15] } } & dec_out_0);

endmodule //sar_data