///////////Showing an 8bit number on 3 seven segments
//////////////the maximum value of an 8bit number in decimal is 255, So the hundreds can`t be more than 2, tens&unity can be from 0 to 9.
/////////////a[2]....g[2] is the MSB 7seg, ...... , a[0]......g[0] is the LSB 7seg
//////////A 7seg
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //

module sevensegS(in,a,b,c,d,e,f,g);
    input wire [7:0]in;
    reg [7:0]inprime;
    output reg [2:0]a,b,c,d,e,f,g;
    reg [1:0]hundreds;
    reg [3:0]tens;
    always@(in)
        begin
                    hundreds = in / (8'b01100100);
                    inprime = in - hundreds * (8'b01100100);
                    case(hundreds)
                        2'b00: {a[2], b[2], c[2], d[2], e[2], f[2], g[2]}=7'b1111110;
                        2'b01: {a[2], b[2], c[2], d[2], e[2], f[2], g[2]}=7'b0110000;
                        2'b10: {a[2], b[2], c[2], d[2], e[2], f[2], g[2]}=7'b1101101;
                    endcase
                    tens = inprime / (4'b1010);
                    inprime = inprime - tens * (4'b1010);
                    case(tens)
                        4'b0000: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1111110;
                        4'b0001: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b0110000;
                        4'b0010: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1101101;
                        4'b0011: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1111001;
                        4'b0100: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b0110011;
                        4'b0101: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1011011;
                        4'b0110: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1011111;
                        4'b0111: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1110000;
                        4'b1000: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1111111;
                        4'b1001: {a[1], b[1], c[1], d[1], e[1], f[1], g[1]}=7'b1110011;
                    endcase
                    case(inprime)
                        8'b00000000: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1111110;
                        8'b00000001: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b0110000;
                        8'b00000010: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1101101;
                        8'b00000011: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1111001;
                        8'b00000100: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b0110011;
                        8'b00000101: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1011011;
                        8'b00000110: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1011111;
                        8'b00000111: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1110000;
                        8'b00001000: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1111111;
                        8'b00001001: {a[0], b[0], c[0], d[0], e[0], f[0], g[0]}=7'b1110011;
                    endcase
        end

endmodule