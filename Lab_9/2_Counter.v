module counter(in,out,CLK);
    input wire in,CLK;
    output wire [3:0]out;
    reg [3:0]count = 4'b0000;

    assign out = count;
    always@(posedge CLK)
        begin
            if(in == 1)
                begin
                        count = count + 4'b0001;
                end
        end
        
endmodule