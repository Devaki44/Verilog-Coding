module fa(
  input a,
  input b,
  input cin,
  output sum,
  output cout);
  assign {cout,sum}=a+b+cin ;
endmodule
module rca(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]sum,
  output cout);
  
  wire [3:0]c;
  
  fa ins1(a[0],b[0],cin,sum[0],c[0]);
  
  genvar i;
  generate
    for(i=1;i<4;i=i+1)begin
      fa ins2(a[i],b[i],c[i-1],sum[i],c[i]);
    end
  endgenerate
  
  assign cout = c[3] ;
endmodule
  
