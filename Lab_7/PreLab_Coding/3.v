////////////Load is synchronous and CLR is asynchronous and when shift is one the register shifts and when zero it holds;
/////////////if load is zero nothing happens but when its one, the user`s input will be loaded
////////////our shift register is serial input parallel output (SIPO)
module shiftregister8bit(in,out0,out1,out2,out3,out4,out5,out6,out7,Load,CLR,shift,CLK,loadinput);
    input wire in,Load,CLR,shift,CLK;
    input wire [7:0]loadinput;
    output reg out0,out1,out2,out3,out4,out5,out6,out7;

    always@(posedge CLK,posedge CLR)
        begin
            if(shift == 1'b1)
                begin
                    if(CLR == 1'b0 && Load == 1'b0)
                        begin
                            out0 <= in;
                            {out7,out6,out5,out4,out3,out2,out1} <= {out6,out5,out4,out3,out2,out1,out0};
                        end
                    if(CLR == 1'b1 && Load == 1'b0)
                        begin
                            out7 <= 0'b0;
                            out6 <= 0'b0;
                            out5 <= 0'b0;
                            out4 <= 0'b0;
                            out3 <= 0'b0;
                            out2 <= 0'b0;
                            out1 <= 0'b0;
                            out0 <= 0'b0;
                        end        
                    if(CLR == 1'b1 && Load == 1'b1)    
                        begin
                            out7 <= 0'b0;
                            out6 <= 0'b0;
                            out5 <= 0'b0;
                            out4 <= 0'b0;
                            out3 <= 0'b0;
                            out2 <= 0'b0;
                            out1 <= 0'b0;
                            out0 <= 0'b0;
                        end      
                    if(CLR == 1'b0 && Load == 1'b1)
                        begin
                            {out7,out6,out5,out4,out3,out2,out1,out0} <= loadinput;
                        end    
                end
        end
endmodule