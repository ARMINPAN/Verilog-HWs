module OneBitFullAdder(in1,in2,out,cout);
  input wire in1;
  input wire in2;
  output wire out;
  output wire cout;
  
  assign {cout,out} = in1 + in2;

endmodule 