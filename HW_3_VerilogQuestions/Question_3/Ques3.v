`timescale 10ns / 10ps
module comparator(in1,in2,out);
    input wire [3:0]in1;
    input wire [3:0]in2;
    output reg [4:0]out;
    always@(in1,in2)
        begin
            ////////////////////different signs
            if(in1[3]<in2[3])
                begin
                    out = in1 + (~(in2-4'b0001));
                end
            if(in1[3]>in2[3])
                begin
                    out = in2 + (~(in1-4'b0001));
                end
            ////////////////////// same signs
            if(in1[3] == in2[3])
                begin
                    if(in1>=in2)
                        out = in1 - in2;
                    if(in1<in2)
                        out = in2 - in1;
                end
            out[4] = 0;
        end
endmodule
