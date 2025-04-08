//Design code
module ha(a,b,s,c);
  input a,b;
  output s,c;
  assign s=a^b;
  assign c=a&b;
endmodule
module fa(A,B,cin,sum,cout);
  input A,B,cin;
  output sum,cout;
  wire w,x,y;
  
ha ha1(.a(A),.b(B),.s(w),.c(x));
ha ha2(.a(w),.b(cin),.s(sum),.c(y));
assign cout=x|y;
endmodule

//Testbench
module fa_tb;
  reg A,B,cin;
  wire sum,cout;
  fa uut(.A(A),.B(B),.cin(cin),.sum(sum),.cout(cout));
  initial begin
    A=0;B=0;cin=0;#5;
    A=0;B=0;cin=1;#5;
    A=0;B=1;cin=0;#5;
    A=0;B=1;cin=1;#5;
    A=1;B=0;cin=0;#5;
    A=1;B=0;cin=1;#5;
    A=1;B=1;cin=0;#5;
    A=1;B=1;cin=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("ha.vcd");
    $dumpvars(1,fa_tb);
  end
  initial begin
   $monitor("Time=%0t|A=%b|B=%b|cin=%b|sum=%b|cout=%b",$time,A,B,cin,sum,cout);
  end
endmodule
    
