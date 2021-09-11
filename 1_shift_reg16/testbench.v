module testbench;

    reg clk, rstn, load;
    reg [15:0] data_in;
    reg [3:0] shift;
    reg [2:0] mode;
    wire [15:0] data_out;

    univ_shift_reg UUT(clk, rstn, load, data_in, shift, mode, data_out);

    initial begin
        clk = 0;
    end
    always begin
        #5  clk = ~clk;
    end

    initial begin
        #0
            rstn = 0;
        #10
            rstn = 1;
            load = 1;
            data_in = 16'b1100_0110_1001_0011;
        #10
            load = 0;
            mode = 3'b100;      //rol
            shift = 4'b0011;
        #90
            load = 1;
        #10
            load = 0;
            mode = 3'b101;      //ror
            shift = 4'b0010;
        #60
            load = 1;
        #10
            load = 0;
            mode = 3'b000;      //lsh
            shift = 4'b011;
        #40
            load = 1;
        #10
            load = 0;
            mode = 3'b001;      //shr
            shift = 4'b100;
        #40
            load = 1;
        #10
            load = 0;
            mode = 3'b011;      //sar
            shift = 4'b010;
        #90 $finish();
    end

endmodule //testbench