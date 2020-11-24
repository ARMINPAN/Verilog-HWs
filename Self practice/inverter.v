//Logic Inverter

module MyInverter (in,out);
  input wire in;
  output wire out;
  
  assign out = ~ in;
  
endmodule
