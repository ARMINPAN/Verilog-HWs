////////////////A 4-bit comparator with cascade inputs 
///////////////greaerout means in1>in2
/////////////smallerout means in1<in2
////////////and equalout means equal :)
module fourbitCascadeInputsComparator (greater,equal,smaller,in1,in2,greaterout,equalout,smallerout);
input wire greater,equal,smaller;
input wire [3:0]in1;
input wire [3:0]in2;
output wire greaterout,equalout,smallerout;

assign equalout = (equal & ((in1[3]==in2[3]) & (in1[2]==in2[2]) & (in1[1]==in2[1]) & (in1[0]==in2[0])));
assign greaterout = (greater ? 1: (equalout? (in1>in2? 1 : 0) : 0));
assign smallerout = (smaller? 1: (equalout? (in1<in2? 1 : 0) : 0));


endmodule
