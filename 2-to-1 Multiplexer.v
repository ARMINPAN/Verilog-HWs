/////////////2-to-1 Multiplexer
`timescale 10ns / 10ps
module MUX(in,selector,out);
input wire [1:0]in;
input wire selector;
output wire out;

assign out = ~selector&in[0] | selector&in[1];
endmodule
