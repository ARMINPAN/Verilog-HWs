////////////a calculator without devide operation -- Reverse polish notation
//////////inputs are Natural nums, inputs have 8bits,
//////////ai s are switches for giving the input to the system
///////////b c d are for three seven segments which shows the most up number in the stack
//////////if operation is 00 we multiply/if 01 +/if 10 -;
/////////we use Dynamic arrays for stack
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //
//////////a,b,c,d,e,f,g : sseg

module Calculator(a0,a1,a2,a3,a4,a5,a6,a7,sseg1,sseg2,sseg3,ssegOut,operation,flagOperation,flagPush,flagdelete,flagdeleteAll);
    input wire a0,a1,a2,a3,a4,a5,a6,a7;
    output reg [6:0]sseg1,sseg2,sseg3,ssegOut;
    input wire [1:0]operation;
    input wire flagPush,flagOperation,flagdelete,flagdeleteAll;
    reg [7:0]stack;
    reg [7:0]stackArray [99:0];
    integer counter = 0;
    reg [3:0]unity,tens,hundreds;
    integer i;
    reg [7:0]stackArrayprime;

    always@(posedge flagOperation,posedge flagPush,a0,a1,a2,a3,a4,a5,a6,a7,operation,posedge flagdelete,posedge flagdeleteAll)
        begin
            stack = {a7,a6,a5,a4,a3,a2,a1,a0};
            if(flagPush == 1'b1)
                begin
                    stackArray[counter] = stack;
                    stackArrayprime = stackArray[counter];
                    counter = counter + 1;
                end
            if(flagOperation == 1'b1)
                begin
                    if(operation == 2'b00)
                        begin
                            ///////////if  the result is negetive we find the absoulute and put a minus befor it
                            if((stackArray[counter-2]+stackArray[counter-1]) < 0)
                                begin
                                    stackArray[counter-2] = stackArray[counter-2] * stackArray[counter-1];
                                    stackArrayprime = ~(stackArray[counter-2] - 8'b00000001);
                                    ssegOut = 7'b0000001;
                                end
                            else
                                begin
                                    ssegOut = 7'bz;
                                    stackArray[counter-2] = stackArray[counter-2] * stackArray[counter-1];
                                    stackArrayprime = stackArray[counter-2];
                                end
                            stackArray[counter-1] = 8'bz;
                            counter = counter - 1;
                        end
                    if(operation == 2'b01)
                        begin
                            ///////////if  the result is negetive we find the absoulute and put a minus befor it
                            if((stackArray[counter-2]+stackArray[counter-1]) < 0)
                                begin
                                    stackArray[counter-2] = stackArray[counter-2] + stackArray[counter-1];
                                    stackArrayprime = ~(stackArray[counter-2] - 8'b00000001);
                                    ssegOut = 7'b0000001;
                                end
                            else
                                begin
                                    ssegOut = 7'bz;
                                    stackArray[counter-2] = stackArray[counter-2] + stackArray[counter-1];
                                    stackArrayprime = stackArray[counter-2];
                                end
                            stackArray[counter-1] = 8'bz;
                            counter = counter - 1;
                        end
                    if(operation == 2'b10)
                        begin
                            ///////////if  the result is negetive we find the absoulute and put a minus befor it
                            if(stackArray[counter-2]<stackArray[counter-1])
                                begin
                                    stackArray[counter-2] = stackArray[counter-2] - stackArray[counter-1];
                                    stackArrayprime = ~(stackArray[counter-2] - 8'b00000001);
                                    ssegOut = 7'b0000001;
                                end
                            else
                                begin
                                    ssegOut = 7'bz;
                                    stackArray[counter-2] = stackArray[counter-2] - stackArray[counter-1];
                                    stackArrayprime = stackArray[counter-2];
                                end
                            stackArray[counter-1] = 8'bz;
                            counter = counter - 1;
                        end
                end
            if(flagdelete == 1'b1)
                begin
                    stackArray[counter-1] = 8'bz;
                    counter = counter - 1;
                end
            if(flagdeleteAll == 1'b1)
                begin
                    for(i = counter-1; i >= 0; i = i - 1)
                        begin
                            stackArray[i] = 8'bz;
                        end
                    counter = 0;
                end
            /////////////sevensegment
            unity = stackArrayprime[counter-1] % 10;
            tens = (stackArrayprime[counter-1]/10) % 10;
            hundreds = (stackArrayprime[counter-1]/100);
            case(unity)
                4'b0000: sseg1=7'b1111110;
                4'b0001: sseg1=7'b0110000;
                4'b0010: sseg1=7'b1101101;
                4'b0011: sseg1=7'b1111001;
                4'b0100: sseg1=7'b0110011;
                4'b0101: sseg1=7'b1011011;
                4'b0110: sseg1=7'b1011111;
                4'b0111: sseg1=7'b1110000;
                4'b1000: sseg1=7'b1111111;
                4'b1001: sseg1=7'b1110011;
            endcase
            case(tens)
                4'b0000: sseg2=7'b1111110;
                4'b0001: sseg2=7'b0110000;
                4'b0010: sseg2=7'b1101101;
                4'b0011: sseg2=7'b1111001;
                4'b0100: sseg2=7'b0110011;
                4'b0101: sseg2=7'b1011011;
                4'b0110: sseg2=7'b1011111;
                4'b0111: sseg2=7'b1110000;
                4'b1000: sseg2=7'b1111111;
                4'b1001: sseg2=7'b1110011;
            endcase
            case(hundreds)
                4'b0000: sseg3=7'b1111110;
                4'b0001: sseg3=7'b0110000;
                4'b0010: sseg3=7'b1101101;
                4'b0011: sseg3=7'b1111001;
                4'b0100: sseg3=7'b0110011;
                4'b0101: sseg3=7'b1011011;
                4'b0110: sseg3=7'b1011111;
                4'b0111: sseg3=7'b1110000;
                4'b1000: sseg3=7'b1111111;
                4'b1001: sseg3=7'b1110011;
            endcase
        end
    
endmodule



