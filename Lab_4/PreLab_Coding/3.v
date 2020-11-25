//////////A BCD/7seg - Decoder!
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //

module BCDsevenseg(in,a,b,c,d,e,f,g);
input wire [3:0]in;
output reg a,b,c,d,e,f,g;

always@(in)
    begin
        case(in)
            4'b0000: {a, b, c, d, e, f, g}=1111110;
            4'b0001: {a, b, c, d, e, f, g}=0110000;
            4'b0010: {a, b, c, d, e, f, g}=1101101;
            4'b0011: {a, b, c, d, e, f, g}=1111001;
            4'b0100: {a, b, c, d, e, f, g}=0110011;
            4'b0101: {a, b, c, d, e, f, g}=1011011;
            4'b0110: {a, b, c, d, e, f, g}=1011111;
            4'b0111: {a, b, c, d, e, f, g}=1110000;
            4'b1000: {a, b, c, d, e, f, g}=1111111;
            4'b1001: {a, b, c, d, e, f, g}=1110011;
        endcase
    end



endmodule