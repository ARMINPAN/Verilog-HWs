`timescale 10ns / 10ps
module hamming(in,out);
input wire [0:6]in;
output reg [3:0]out;
reg [3:0]paritycheckers;

always@(in)
    begin
        paritycheckers[0] = in[6]^in[4]^in[2]^in[0];
        paritycheckers[1] = in[6]^in[5]^in[2]^in[1];
        paritycheckers[2] = in[6]^in[5]^in[4]^in[3];
        ///////////////////////////////////////
        case(paritycheckers)
            3'b111: out = {~in[2], in[4], in[5], in[6]};
            3'b110: out = {in[2], ~in[4], in[5], in[6]};
            3'b101: out = {in[2], in[4], ~in[5], in[6]};
            3'b011: out = {in[2], in[4],  in[5], ~in[6]};
            default: out = {in[2], in[4], in[5], in[6]};
        endcase
    end

endmodule
