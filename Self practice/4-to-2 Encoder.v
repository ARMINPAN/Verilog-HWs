//////////An 2-to-4 Encoder
/////////Using case statement

`timescale 10ns / 10ps
module Encoder(in,out);
input wire [3:0]in;
output reg [1:0]out;

always@(in)
    begin
        case(in)
            4'b0001: out = {1'b0, 1'b0};
            4'b0010: out = {1'b0, 1'b1};
            4'b0100: out = {1'b1, 1'b0};
            4'b1000: out = {1'b1, 1'b1};
            default: out = {1'b0, 1'b0};
        endcase
    end 

endmodule