//////////////////7seg1 is for unity and 7seg2 for tens
///////////////we use a flag for reg and green light////if flag is 1 the light is green and if 0, red;
///////////////////time of green light is 88 clocks and for red light 12 clocks
//////////////////we start from red light
////////////////////we have yellow light in here too
//   a   //
//f     b//
//   g   //   :)
//e     c//
//   d   //
module TrafficLightCounter(CLK,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2);
    input wire CLK;
    output reg a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2;
    reg [3:0]tens;
    reg [3:0]unity;
    reg [1:0]flag = 2'b00;
    reg flag2 = 1'b1;
    reg atzero = 1'b1;
    reg [1:0]yellowcounterflash = 2'b00;
    reg [2:0]yellowcoutner = 3'b000;
    reg yellowlight = 1'b1;

    always@(posedge CLK)
        begin
            if(flag2 == 1'b1)
                begin
                    tens = 4'b0001;
                    unity = 4'b0010;
                    flag2 = 1'b0;
                end
            /////////////////////////////red light
            if(flag == 2'b00)
                begin
                    if(unity != 4'b0000)
                        begin
                            unity = unity - 4'b0001;
                        end
                    if(unity == 0 && tens != 4'b0000)
                        begin
                            if(atzero == 1'b0)                            
                                begin
                                    unity = 4'b1001;
                                    tens = tens - 4'b0001;
                                    atzero = 1'b1;
                                end
                            else
                                atzero = 1'b0;
                        end
                    if(unity == 4'b0000 && tens == 4'b0000)    
                        begin
                            if(atzero == 1'b0)
                                begin
                                    tens = 4'b1000;
                                    unity = 4'b1000;
                                    flag = 2'b11;
                                    atzero = 1'b1;
                                end   
                            else
                                atzero = 1'b0;
                        end  
                end
            //////////////////////yellow light
            if(flag == 2'b01)
                begin
                    if(yellowcounterflash == 2'b11)
                        begin
                            yellowlight = 1'b1;
                            yellowcoutner = yellowcoutner +3'b001;
                            if(yellowcoutner == 3'b100)
                                begin
                                    flag = 2'b00;
                                    yellowlight = 1'b0;
                                    tens = 4'b0001;
                                    unity = 4'b0010;
                                end
                        end
                    else
                        begin
                            yellowcounterflash = yellowcounterflash + 2'b01;
                            yellowlight = ~yellowlight;
                        end
                end
            //////////////////////green light
            if(flag == 2'b11)
                begin
                    if(unity != 4'b0000)
                        begin
                            unity = unity - 4'b0001;
                        end
                    if(unity == 0 && tens != 4'b0000)
                        begin
                            if(atzero == 1'b0)                            
                                begin
                                    unity = 4'b1001;
                                    tens = tens - 4'b0001;
                                    atzero = 1'b1;
                                end
                            else
                                atzero = 1'b0;
                        end
                    if(unity == 4'b0000 && tens == 4'b0000)    
                        begin
                            if(atzero == 1'b0)
                                begin
                                    tens = 4'b0000;
                                    unity = 4'b0000;
                                    flag = 2'b01;
                                    atzero = 1'b1;
                                end   
                            else
                                atzero = 1'b0;
                        end  
                end
            /////////////7segs
            case(unity)
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
            case(tens)
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


