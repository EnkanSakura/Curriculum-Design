module univ_shifter (
    input [15:0] data_in,
    input [3:0] shift,
    input [2:0] mode,
    output reg [15:0] data_out
);

    wire [15:0] din_lsh, din_shr, din_sar;
    wire [3:0] lshift;
    wire [15:0] dout_rol, dout_ror, dout_lsh, dout_shr, dout_sar;

    // add4 a0(.a(shift), .b({4{0}}), .cin(1), .sum(lshift));
    s_reverse a0(shift, lshift);
    lsh_data d1(data_in, shift, din_lsh);
    shr_data d2(data_in, shift, din_shr);
    sar_data d3(data_in, shift, din_sar);
    
    ror_shifter16 s0(data_in, lshift, dout_rol);
    ror_shifter16 s1(data_in, shift, dout_ror);
    ror_shifter16 s2(din_lsh, lshift, dout_lsh);
    ror_shifter16 s3(din_shr, shift, dout_shr);
    ror_shifter16 s4(din_sar, shift, dout_sar);

    always @(*) begin
        case (mode)
            3'b100: data_out <= dout_rol;
            3'b110: data_out <= dout_rol;
            3'b101: data_out <= dout_ror;
            3'b111: data_out <= dout_ror;
            3'b000: data_out <= dout_lsh;
            3'b010: data_out <= dout_lsh;
            3'b001: data_out <= dout_shr;
            3'b011: data_out <= dout_sar;
            default: data_out <= data_in;
        endcase
    end

endmodule //univ_shifter