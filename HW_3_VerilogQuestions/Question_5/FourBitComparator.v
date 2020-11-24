
///////Greater means in1 > in2
///////Equal means equal :)

`timescale 10ns / 10ps
module fourbitComparator(in1,in2,Greater,Equal);
  
    input wire [3:0]in1;
    input wire [3:0]in2;
    output reg Greater=1'b0,Equal=1'b0;
    always@(in1,in2)
        begin
            if(in1>in2)
                begin
                    Greater = 1'b1;
                    Equal = 1'b0;
                end
            if(in1==in2)
                begin
                    Greater = 1'b0;
                    Equal = 1'b1;
                end
        end
  
endmodule



