//////////A 4bit adder in base 3.
//////////the inputs are CODED_Binary which means (2100)3 will be given to the input like 10 01 00 00 with 8bits in binary
///////with a little bit of calculating, we can find out that we have to add each 2bits and if it is 3 or 4 we have to pass a carry to the next sum.
/////////we add the carry to the 2LSB nums sum;
module fourbitadderbase3(in1,in2,out,Cout,Cin);
    input wire [7:0]in1;
    input wire [7:0]in2;
    input wire Cin;
    output reg [7:0]out;
    output reg Cout;
    reg [3:0]Carry;

    always@(in1,in2,Cin)
        begin
            {Carry[0],out[1],out[0]} = {in1[1],in1[0]} + {in2[1],in2[0]} + Cin;
            {Carry[1],out[3],out[2]} = {in1[3],in1[2]} + {in2[3],in2[2]} + Carry[0];
            {Carry[2],out[5],out[4]} = {in1[5],in1[4]} + {in2[5],in2[4]} + Carry[1];
            {Carry[3],out[7],out[6]} = {in1[7],in1[6]} + {in2[7],in2[6]} + Carry[2];
            Cout = Carry[3];

            //////here we have to make sure if any 2bits aren`t 11 and if is there any, we have to make it 0 or 1 depends on 3 or 4 it is going to be and give a carry to the next 2.
            if({out[1],out[0]} == 2'b11)
                begin
                    if({out[3],out[2]} == 2'b11)
                        begin
                            {out[3],out[2]} = 2'b00;
                             if({out[5],out[4]} == 2'b11)
                                begin
                                    {out[5],out[4]} = 2'b00;
                                    if({out[7],out[6]} == 2'b11)
                                        begin
                                            {out[7],out[6]} = 2'b00;
                                            Cout = 1'b1;
                                        end
                                    {out[7],out[6]} = {out[7],out[6]} + 2'b01;
                                end
                            {out[5],out[4]} = {out[5],out[4]} + 2'b01;
                        end
                    {out[3],out[2]} = {out[3],out[2]} + 2'b01; 
                    {out[1],out[0]} = 2'b00;
                end

            if({out[3],out[2]} == 2'b11)
                begin
                    if({out[5],out[4]} == 2'b11)
                        begin
                            {out[5],out[4]} = 2'b00;
                             if({out[7],out[6]} == 2'b11)
                                begin
                                    {out[7],out[6]} = 2'b00;
                                    Cout = 1'b1;
                                end
                            {out[7],out[6]} = {out[7],out[6]} + 2'b01;
                        end
                    {out[5],out[4]} = {out[5],out[4]} + 2'b01; 
                    {out[3],out[2]} = 2'b00;
                end
                
            if({out[5],out[4]} == 2'b11)
                begin
                    if({out[7],out[6]} == 2'b11)
                        begin
                            {out[7],out[6]} = 2'b00;
                            Cout = 1'b1;
                        end
                    {out[7],out[6]} = {out[7],out[6]} + 2'b01; 
                    {out[5],out[4]} = 2'b00;
                end

            if({out[7],out[6]} == 2'b11)
                begin
                    {out[7],out[6]} = 2'b00;
                    Cout = 1'b1;
                end
        end

endmodule
