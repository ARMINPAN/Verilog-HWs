///////Greater means in1 > in2
///////Less means in1 < in2
///////Equal means equal :)

`timescale 10ns / 10ps
module TwobitComparator(in1,in2,Greater,Equal,Less);
  
    input wire [1:0]in1;
    input wire [1:0]in2;
    output reg Greater,Equal,Less;
    
    always@(in1,in2)
        begin
            if(in1>in2)
                begin
                    Greater = 1;
                    Equal = 0;
                    Less = 0;
                end
            if(in1<in2)
                 begin
                    Greater = 0;
                    Equal = 0;
                    Less = 1;
                end
            if(in1==in2)
                begin
                    Greater = 0;
                    Equal = 1;
                    Less = 0;
                end
        end
  
  
endmodule

