//////a FSM which counts number of 1110 in input, Mealy
//////reset will get us to the initial state
/////reset is active low
module FSM(in,CLK,out,reset);
    input wire in,CLK,reset;
    output reg out;

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
                                NS = C; 
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
