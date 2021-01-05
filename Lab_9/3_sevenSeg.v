
module sevenSeg(in,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,CLK);
    input wire in,CLK;
    output reg a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2;
    reg unity,tens;

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


endmodule