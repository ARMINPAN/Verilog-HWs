//////This program gets a 5bit binary number in input and puts zero between two 1s
/////for exmaple if we give 10111, the output will be 1010101
//////////for noticing if there is 2 ones together or not we use AND gate
//////////we define an output with 9 bits for when input is 11111 and 4 zeros will be added to number. If we don`t have to add zero, we will make that high Impdenace(z);
module ZeroCircuitAdder(in,out);
    input wire[4:0] in;
    output reg[8:0] out;


    always@(in)
        begin
        {out[8], out[6], out[4], out[2], out[0]} = in;
            if((in[0]&in[1]) == 1'b1)
                begin
                    out[1] = 1'b0;
                end
            else
                begin
                    out[1] = 1'bz;
                end
            if((in[1]&in[2]) == 1'b1)
                begin
                    out[3] = 1'b0;
                end
            else
                begin
                    out[3] = 1'bz;
                end
            if((in[2]&in[3]) == 1'b1)
                begin
                    out[5] = 1'b0;
                end
            else
                begin
                    out[5] = 1'bz;
                end
            if((in[3]&in[4]) == 1'b1)
                begin
                    out[7] = 1'b0;
                end
            else
                begin
                    out[7] = 1'bz;
                end
        end

endmodule