///////Greater means in1 > in2
///////Equal means equal :)

`timescale 10ns / 10ps
module sixteenbitComparator(In1,In2,greater,equal,less);
  
    input wire [15:0]In1;
    input wire [15:0]In2;
    output wire greater,equal,less;
    wire [3:0]Bigger;
    wire [3:0]Equ;
    
    wire [3:0]A4,A3,A2,A1;
    wire [3:0]B4,B3,B2,B1;
    assign A4 = In1[15:12];
    assign A3 = In1[11:8];
    assign A2 = In1[7:4];
    assign A1 = In1[3:0];
    assign B4 = In2[15:12];
    assign B3 = In2[11:8];
    assign B2 = In2[7:4];
    assign B1 = In2[3:0];

            ////COMPARE 4 MSB bits
            fourbitComparator Num4(.in1(A4), .in2(B4), .Greater(Bigger[3]), .Equal(Equ[3]));
            ////COMPARE 4 Second MSB bits
            fourbitComparator Num3(.in1(A3), .in2(B3), .Greater(Bigger[2]), .Equal(Equ[2]));    
            ////COMPARE 4 Second LSB bits
            fourbitComparator Num2(.in1(A2), .in2(B2), .Greater(Bigger[1]), .Equal(Equ[1]));  
            ////COMPARE 4 LSB bits
            fourbitComparator Num1(.in1(A1), .in2(B1), .Greater(Bigger[0]), .Equal(Equ[0]));  
            //////////Check
            assign equal = (Equ[3] & Equ[2] & Equ[1] & Equ[0]);
            assign greater = ((Bigger[3]) | (Equ[3] & Bigger[2]) | (Equ[3] & Equ[2] &  Equ[1] & Bigger[0]));
            assign less = ~(equal | greater);
endmodule




