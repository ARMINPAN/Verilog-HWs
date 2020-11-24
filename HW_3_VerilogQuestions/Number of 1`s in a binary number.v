///////////A code which counts number of bits which are equal to one in a 24-bit num
`timescale 10ns / 10ps
module bit_one_counter(in,counter);
input wire [23:0]in;
output reg [4:0]counter;
integer i;

always@(in)
  begin
    counter = 0;
    for (i=0; i<24; i=i+1) 
    begin
      if(in[i]==1'b1)
        counter = counter + 1;
    end
  end
endmodule