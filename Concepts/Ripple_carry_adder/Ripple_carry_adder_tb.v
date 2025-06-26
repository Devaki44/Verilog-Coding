module rca_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  
  rca uut(a,b,cin,sum,cout);
  
  initial begin
    a=4'B1010;b=4'B0101;cin=1'b0;#5;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
  end
endmodule
