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
    input wire CLK;s
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
        end


endmodule