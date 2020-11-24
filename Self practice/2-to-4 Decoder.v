//////////An 2-to-4 Decoder
//////////Using assign statement

`timescale 10ns / 10ps
module Decoder(in,En,out);
input wire [1:0]in;
input wire En;
output wire [3:0]out;

assign out[0] = ~in[0] & ~in[1] & En;
assign out[1] = in[0] & ~in[1] & En;
assign out[2] = ~in[0] & in[1] & En;
assign out[3] = in[0] & in[1] & En;
  

endmodule
