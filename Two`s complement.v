`timescale 1ns / 1ps
module second_complement(in,out);
  input wire [7:0]in;
  output wire [7:0]out;
  integer i;


  for ( i = 0 ; i < 7 ; i = i + 1)
    assign out[i] = ~in[i];

  assign out = out + 8'b00000001;



