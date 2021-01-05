module test1;
// Inputs
reg in;
reg CLK;
reg reset;
// Outputs
wire out;
wire [3:0]counter;
wire a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2;
// Instantiate the Unit Under Test (UUT)
FSM uut (
.in(in),
.CLK(CLK),
.out(out),
.reset(reset),
.counter(counter),
.a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1), .f1(f1), .g1(g1), .a2(a2), .b2(b2), .c2(c2), .d2(d2), .e2(e2), .f2(f2), .g2(g2),
);

initial begin
// Initialize Inputs
in = 0;
CLK = 0;
reset = 0;

#100;
reset = 1;
end
always CLK=#5 ~CLK;
always@(posedge CLK)
begin
in= $random();
end
endmodule