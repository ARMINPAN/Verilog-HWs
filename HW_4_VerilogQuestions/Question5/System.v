/////////////8-to-1 Multiplexer made with 2-to-1 MUXs with module instantiation
//////we need seven 2-to-1 MUXs, So we need 7 outputs for each one when the last one is "output out". so we need 6 more.
module eighttooneMUX(In,Selector,Out);
    input wire [7:0]In;
    input wire [2:0]Selector;
    output wire Out;

    wire [5:0]result;
    
    MUX Num1(.in(In[1:0]), .selector(Selector[0]), .out(result[0]));
    MUX Num2(.in(In[3:2]), .selector(Selector[0]), .out(result[1]));
    MUX Num3(.in(In[5:4]), .selector(Selector[0]), .out(result[2]));
    MUX Num4(.in(In[7:6]), .selector(Selector[0]), .out(result[3]));

    MUX Num5(.in({result[1],result[0]}), .selector(Selector[1]), .out(result[4]));
    MUX Num6(.in({result[3],result[2]}), .selector(Selector[1]), .out(result[5]));

    MUX Num7(.in({result[5],result[4]}), .selector(Selector[2]), .out(Out));

endmodule