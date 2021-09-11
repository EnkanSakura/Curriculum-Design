module univ_shift_reg (
    input clk, rstn, load,
    input [15:0] data_in,
    input [3:0] shift,
    input [2:0] mode,
    output reg [15:0] data_out
);

    reg [15:0] data;
    wire [15:0] data_shift;

    univ_shifter u0(data, shift, mode, data_shift);

    always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
            data <= 16'b0;
        end
        else if (load)begin
            data <= data_in;
            data_out <= data_in;
        end
        else begin
            data <= data_shift;
            data_out <= data_shift;
        end
    end

endmodule //univ_shift_reg