////////////A BCD counter - both upcounter and downcounter - with a synchronous Load 
/////////////when load is 1, the input of user will be loaded 
////////////the output is on a 7 seg
////////////we put a signal which moves our counter between up and down counter. zero is upcounter and one is downcounter
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //

module Counter(loadinput,signal,CLK,Load,a,b,c,d,e,f,g);
    input wire CLK,Load,signal;
    input wire [3:0]loadinput;
    reg [3:0]counter;
    reg flag = 1'b0;
    output reg a,b,c,d,e,f,g;
    
    always@(posedge CLK,posedge Load)
        begin
            if(flag == 1'b0 && Load == 1'b0)    
                begin
                    counter = 4'b0000;
                    flag = flag + 1'b1;
                end
            if(Load == 1'b0 && signal == 1'b0)
                begin
                    if(counter == 4'b1001)
                        counter = 4'b0000;
                    else
                        counter = counter + 4'b0001;
                end
            if(Load == 1'b0 && signal == 1'b1)
                begin
                    if(counter == 4'b0000)
                        counter = 4'b1001;
                    else
                        counter = counter - 4'b0001;
                end
            if(Load == 1'b1)
                counter = loadinput;
            //////////////////////////////////7-seg
            case(counter)
                4'b0000: {a, b, c, d, e, f, g}=7'b1111110;
                4'b0001: {a, b, c, d, e, f, g}=7'b0110000;
                4'b0010: {a, b, c, d, e, f, g}=7'b1101101;
                4'b0011: {a, b, c, d, e, f, g}=7'b1111001;
                4'b0100: {a, b, c, d, e, f, g}=7'b0110011;
                4'b0101: {a, b, c, d, e, f, g}=7'b1011011;
                4'b0110: {a, b, c, d, e, f, g}=7'b1011111;
                4'b0111: {a, b, c, d, e, f, g}=7'b1110000;
                4'b1000: {a, b, c, d, e, f, g}=7'b1111111;
                4'b1001: {a, b, c, d, e, f, g}=7'b1110011;
            endcase
        end
endmodule