/////////////A neg edge JK Flipflop with an asynchronous CLR;
////////the CLR input is active high;
module JKFF(J,K,CLK,CLR,Q,Qprime);
    input wire J,K,CLK,CLR;
    output reg Q;
    output wire Qprime;

    always@(negedge CLK,posedge CLR)
        begin
            if(J == 1'b0 && K == 1'b0 && CLR == 1'b0)   
                Q <= Q;
            if(J == 1'b0 && K == 1'b1 && CLR == 1'b0)   
                Q <= 1'b0;
            if(J == 1'b1 && K == 1'b0 && CLR == 1'b0)   
                Q <= 1'b1;
            if(J == 1'b1 && K == 1'b1 && CLR == 1'b0)   
                Q <= ~Q;
            if(CLR == 1'b1)
                Q <= 1'b0;
        end
    assign Qprime = ~Q;
endmodule