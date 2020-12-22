//////////////////7seg1 is for unity and 7seg2 for hundreds
///////////////we use a flag for reg and green light////if flag is 1 the light is green and if 0, red;
///////////////////time of green light is 88 clocks and for red light 12 clocks
//////////////////we start from red light
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //
module TrafficLightCounter(CLK,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2);
    input wire CLK;
    output reg a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2;
    reg [3:0]hundreds = 4'b0001;
    reg [3:0]unity = 4'b0010;
    reg flag = 1'b1;

    always@(posedge CLK)
        begin
            if(flag == 1'b0)
                begin
                    if(unity != 0)
                        begin
                            unity = unity - 4'b0001;
                        end
                    if(unity == 0 && hundreds !=0)
                        begin
                            unity = 4'b1001;
                            hundreds = hundreds - 4'b0001;
                        end
                    if(unity == 0 && hundreds ==0)    
                        begin
                            flag = 1'b1;
                            hundreds = 4'b1000;
                            unity = 4'b1000;
                        end        
                end
            if(flag == 1'b1)
                begin
                    if(unity != 0)
                        begin
                            unity = unity - 4'b0001;
                        end
                    if(unity == 0 && hundreds !=0)
                        begin
                            unity = 4'b1001;
                            hundreds = hundreds - 4'b0001;
                        end
                    if(unity == 0 && hundreds ==0)    
                        begin
                            flag = 1'b0;
                            hundreds = 4'b0001;
                            unity = 4'b0010;
                        end    
                end
            case(hundreds)
                4'b0000: {a1,b1,c1,d1,e1,f1,g1}=7'b1111110;
                4'b0001: {a1,b1,c1,d1,e1,f1,g1}=7'b0110000;
                4'b0010: {a1,b1,c1,d1,e1,f1,g1}=7'b1101101;
                4'b0011: {a1,b1,c1,d1,e1,f1,g1}=7'b1111001;
                4'b0100: {a1,b1,c1,d1,e1,f1,g1}=7'b0110011;
                4'b0101: {a1,b1,c1,d1,e1,f1,g1}=7'b1011011;
                4'b0110: {a1,b1,c1,d1,e1,f1,g1}=7'b1011111;
                4'b0111: {a1,b1,c1,d1,e1,f1,g1}=7'b1110000;
                4'b1000: {a1,b1,c1,d1,e1,f1,g1}=7'b1111111;
                4'b1001: {a1,b1,c1,d1,e1,f1,g1}=7'b1110011;
            endcase
            case(unity)
                4'b0000: {a2,b2,c2,d2,e2,f2,g2}=7'b1111110;
                4'b0001: {a2,b2,c2,d2,e2,f2,g2}=7'b0110000;
                4'b0010: {a2,b2,c2,d2,e2,f2,g2}=7'b1101101;
                4'b0011: {a2,b2,c2,d2,e2,f2,g2}=7'b1111001;
                4'b0100: {a2,b2,c2,d2,e2,f2,g2}=7'b0110011;
                4'b0101: {a2,b2,c2,d2,e2,f2,g2}=7'b1011011;
                4'b0110: {a2,b2,c2,d2,e2,f2,g2}=7'b1011111;
                4'b0111: {a2,b2,c2,d2,e2,f2,g2}=7'b1110000;
                4'b1000: {a2,b2,c2,d2,e2,f2,g2}=7'b1111111;
                4'b1001: {a2,b2,c2,d2,e2,f2,g2}=7'b1110011;
            endcase
        end


endmodule