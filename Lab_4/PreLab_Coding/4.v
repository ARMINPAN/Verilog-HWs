/////////////A BCD adder
module BCDadder(in1,in2,out2,out1);
input wire [3:0]in1;
input wire [3:0]in2;
output reg out2;
output reg [3:0]out1;

always@(in1,in2)
    begin 
        if(in1+in2 <= 4'b1001)
            {out2,out1} = in1+in2;
        else
            {out2,out1} = in1+in2+4'b0110;
    end
endmodule