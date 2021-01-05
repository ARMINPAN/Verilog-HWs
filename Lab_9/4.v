//////a FSM which counts number of 1110 in input, Mealy
//////reset will get us to the initial state
/////reset is active low
/////counter counts how many times 1110 is in input
//////////A BCD/7seg
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //

module FSM(in,CLK,out,reset);
    input wire in,CLK,reset;
    output reg out;
    reg [3:0]counter = 4'b0000;
    reg [3:0]tens,unity;
    reg [1:0]NS,CS;
    reg a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2;
    parameter A = 2'b00, B = 2'b01, C = 2'b11, D = 2'b10;

    always@(in,CS)
        begin
            case (CS)
                    A:  if(in == 0)
                            begin
                                NS = A; 
                                out = 0;
                            end
                        else
                            begin
                                NS = B; 
                                out = 0;                              
                            end
                    /////////////////////////
                    B:  if(in == 0)
                            begin
                                NS = A; 
                                out = 0;
                            end
                        else
                            begin
                                NS = C; 
                                out = 0;                              
                            end
                    /////////////////////////
                    C:  if(in == 0)
                            begin
                                NS = A; 
                                out = 0;
                            end
                        else
                            begin
                                NS = D; 
                                out = 0;                              
                            end
                    ////////////////////////
                    D:  if(in == 0)
                            begin
                                NS = A; 
                                out = 1;
                                counter = counter + 4'b0001;
                                unity = counter % 10;
                                tens = counter / 10;
                                //////////////////////////////7segs
                                        case(unity)
                                            4'b0000: {a1, b1, c1, d1, e1, f1, g1}=7'b1111110;
                                            4'b0001: {a1, b1, c1, d1, e1, f1, g1}=7'b0110000;
                                            4'b0010: {a1, b1, c1, d1, e1, f1, g1}=7'b1101101;
                                            4'b0011: {a1, b1, c1, d1, e1, f1, g1}=7'b1111001;
                                            4'b0100: {a1, b1, c1, d1, e1, f1, g1}=7'b0110011;
                                            4'b0101: {a1, b1, c1, d1, e1, f1, g1}=7'b1011011;
                                            4'b0110: {a1, b1, c1, d1, e1, f1, g1}=7'b1011111;
                                            4'b0111: {a1, b1, c1, d1, e1, f1, g1}=7'b1110000;
                                            4'b1000: {a1, b1, c1, d1, e1, f1, g1}=7'b1111111;
                                            4'b1001: {a1, b1, c1, d1, e1, f1, g1}=7'b1110011;
                                        endcase
                                        case(tens)
                                            4'b0000: {a2, b2, c2, d2, e2, f2, g2}=7'b1111110;
                                            4'b0001: {a2, b2, c2, d2, e2, f2, g2}=7'b0110000;
                                        endcase
                            end
                        else
                            begin
                                NS = D; 
                                out = 0;                              
                            end
                endcase
        end
    always@(posedge CLK,negedge reset)
        begin
            if(reset == 0)
                CS <= A;
            else 
                CS <= NS;
        end
endmodule
