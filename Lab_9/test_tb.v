module test_tb;
	// Inputs
	reg in;
	reg CLK;
    reg reset;
	// Outputs
	wire out;
	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.in(in),
		.CLK(CLK),		
		.out(out),
        .reset(reset)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		CLK = 0;
	end
	always CLK=#100 ~CLK;
	always@(posedge CLK)
	begin
	in= $random();
	end
endmodule