//////a FSM which counts number of 1110 in input, Mealy
//////reset will get us to the initial state
/////reset is active low
module FSM(in,CLK,out,reset,counter,a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2);
    input wire in,CLK,reset;
    output reg out;
    output wire [3:0]counter;
    output wire a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2;
    reg [1:0]NS,CS;
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

    ////////////counter module
    counter counts(.in(out), .CLK(CLK), .out(counter));
    ///////////7segs
    sevenSeg shows(.in(counter), .CLK(CLK), .a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1), .f1(f1), .g1(g1), .a2(a2), .b2(b2), .c2(c2), .d2(d2), .e2(e2), .f2(f2), .g2(g2));

endmodule