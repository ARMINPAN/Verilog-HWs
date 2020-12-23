/////////////////a counter between 0 to 13 which counts up to 13 and then counts down to zero and so on
/////we start from zero
////////when flagposneg is 1 it counts up and when zero it counts down
module counter(CLK);
    input wire CLK;
    reg [3:0]counter;
    reg flag = 1'b1;
    reg flagPosNeg = 1'b1;
    always@(posedge CLK)
        begin
            if(flag == 1'b1)
                begin
                    counter = -1;
                    flag = 1'b0;
                end
            if(flag == 1'b0 && counter == 4'b1101)
                begin
                    flagPosNeg = 1'b0;
                end
            if(flag == 1'b0 && counter == 4'b0000)
                begin
                    flagPosNeg = 1'b1;
                end
            if(flag == 1'b0)
                begin
                    if(flagPosNeg == 1'b1)
                        counter = counter + 4'b0001;
                    if(flagPosNeg == 1'b0)
                        counter = counter - 4'b0001;
                end
        end
endmodule