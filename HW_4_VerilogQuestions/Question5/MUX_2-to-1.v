/////////////2-to-1 Multiplexer
///////in[0] is the first input and in[1] is the second input
module MUX(in,selector,out);
input wire [1:0]in;
input wire selector;
output wire out;

assign out = ~selector&in[0] | selector&in[1];
endmodule