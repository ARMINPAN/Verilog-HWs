////////////////A 4-bit comparator with cascade inputs 
///////////////greaerout means in1>in2
/////////////smallerout means in1<in2
////////////and equalout means equal :)
module fourbitCascadeInputsComparator (greater,equal,smaller,in1,in2,greaterout,equalout,smallerout);
input wire greater,equal,smaller;
input wire [3:0]in1;
input wire [3:0]in2;
output wire greaterout,equalout,smallerout;

assign equalout = ((in1==in2) & equal);
assign greaterout = ((in1>in2) ? 1: (in1==in2? (greater? 1 : 0) : 0));
assign smallerout = ((in1<in2) ? 1: (in1==in2? (smaller? 1 : 0) : 0));


endmodule
