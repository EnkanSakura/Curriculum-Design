module ror_shifter16 (
    input [15:0] din,
    input [3:0] s,
    output wire [15:0] dout
);
    wire [15:0] dout_1, dout_2, dout_3;

    mux4b2_1  m0(din[15:12], din[7:4], s[3], dout_3[15:12]);
    mux4b2_1  m1(din[11:8], din[3:0], s[3], dout_3[11:8]);
    mux4b2_1  m2(din[7:4], din[15:12], s[3], dout_3[7:4]);
    mux4b2_1  m3(din[3:0], din[11:8], s[3], dout_3[3:0]);

    mux4b2_1  m4(dout_3[15:12], dout_3[3:0], s[2], dout_2[15:12]);
    mux4b2_1  m5(dout_3[11:8], dout_3[15:12], s[2], dout_2[11:8]);
    mux4b2_1  m6(dout_3[7:4], dout_3[11:8], s[2], dout_2[7:4]);
    mux4b2_1  m7(dout_3[3:0], dout_3[7:4], s[2], dout_2[3:0]);

    mux4b2_1  m8(dout_2[15:12], { dout_2[1:0], dout_2[15:14] }, s[1], dout_1[15:12]);
    mux4b2_1  m9(dout_2[11:8], dout_2[13:10], s[1], dout_1[11:8]);
    mux4b2_1 m10(dout_2[7:4], dout_2[9:6], s[1], dout_1[7:4]);
    mux4b2_1 m11(dout_2[3:0], dout_2[5:2], s[1], dout_1[3:0]);

    mux4b2_1 m12(dout_1[15:12], { dout_1[0], dout_1[15:13] }, s[0], dout[15:12]);
    mux4b2_1 m13(dout_1[11:8], dout_1[12:9], s[0], dout[11:8]);
    mux4b2_1 m14(dout_1[7:4], dout_1[8:5], s[0], dout[7:4]);
    mux4b2_1 m15(dout_1[3:0], dout_1[4:1], s[0], dout[3:0]);

endmodule //ror_shifter16