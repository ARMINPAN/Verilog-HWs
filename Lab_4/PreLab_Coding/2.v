////////////////A 4-bit comparator with cascade inputs 
///////////////greaerout means in1>in2
/////////////smallerout means in1<in2
////////////and equalout means equal :)
module fourbitCascadeInputsComparator (greater,equal,smaller,in1,in2,greaterout,equalout,smallerout);
input wire greater,equal,smaller;
input wire [3:0]in1;
input wire [3:0]in2;
output reg greaterout,equalout,smallerout;

always@(greater,equal,smaller,in1,in2)
    begin
        if(in1>in2)
            begin
                greaterout = 1;
                smallerout = 0;
                equalout = 0;
            end
        if(in1<in2)
            begin
                greaterout = 0;
                smallerout = 1;
                equalout = 0;
            end
        if(in1==in2)
            begin
                if(greater == 1)
                    begin
                        greaterout = 1;
                        smallerout = 0;
                        equalout = 0;
                    end
                if(smaller == 1)
                    begin
                        greaterout = 0;
                        smallerout = 1;
                        equalout = 0;
                    end
                if(equal == 1)
                    begin
                        greaterout = 0;
                        smallerout = 0;
                        equalout = 1;
                    end
                if(greater == 1 & smaller == 1)
                    begin
                        greaterout = 0;
                        smallerout = 0;
                        equalout = 0;
                    end
                if(greater == 1 & smaller == 1 & equal == 1)
                    begin
                        greaterout = 1;
                        smallerout = 1;
                        equalout = 0;
                    end
            end
    end


endmodule
