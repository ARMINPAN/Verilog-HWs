////////////////A 4-bit comparator with cascade inputs 
///////////////greaerout means in1>in2
/////////////smallerout means in1<in2
////////////and equalout means equal :)

//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //
module fourbitCascadeInputsComparator (greater,equal,smaller,in1,in2,greaterout,equalout,smallerout);
input wire greater,equal,smaller;
input wire [3:0]in1;
input wire [3:0]in2;
output reg a,b,c,d,e,f,g;

always@(greater,equal,smaller,in1,in2)
    begin
        if(in1>in2)
            begin
                {a, b, c, d, e, f, g}=7'b1111011; ///////////////bigger on
                {a, b, c, d, e, f, g}=7'b0000000; //////////////smaller off
                {a, b, c, d, e, f, g}=7'b0000000; ////////////// equal off
            end
        if(in1<in2)
            begin
                {a, b, c, d, e, f, g}=7'b0000000; ///////////////bigger off
                {a, b, c, d, e, f, g}=7'b1011011; //////////////smaller on
                {a, b, c, d, e, f, g}=7'b0000000; ////////////// equal off
            end
        if(in1==in2)
            begin
                if(greater == 1)
                    begin
                        {a, b, c, d, e, f, g}=7'b1111011; ///////////////bigger on
                        {a, b, c, d, e, f, g}=7'b0000000; //////////////smaller off
                        {a, b, c, d, e, f, g}=7'b0000000; ////////////// equal off
                    end
                if(smaller == 1)
                    begin
                        {a, b, c, d, e, f, g}=7'b0000000; ///////////////bigger off
                        {a, b, c, d, e, f, g}=7'b1011011; //////////////smaller on
                        {a, b, c, d, e, f, g}=7'b0000000; ////////////// equal off
                    end
                if(equal == 1)
                    begin
                        {a, b, c, d, e, f, g}=7'b0000000; ///////////////bigger off
                        {a, b, c, d, e, f, g}=7'b0000000; //////////////smaller off
                        {a, b, c, d, e, f, g}=7'b1001111; ////////////// equal on
                    end
            end
    end


endmodule
