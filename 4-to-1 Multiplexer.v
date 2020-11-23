////////////4-to-2 Multiplexer
`timescale 10ns / 10ps
module MUX(in,selector,out);
input wire [3:0]in;
input wire [1:0]selector;
output wire out;

assign out = ~selector[1]&(~selector[0])&in[0] | (~selector[1]&(selector[0])&in[1]) | (selector[1]&(~selector[0])&in[2]) | (selector[1]&(selector[0])&in[3]);
endmodule

