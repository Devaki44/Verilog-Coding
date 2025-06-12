module fa_tb;
  reg [WIDTH:0]a,b;
  reg cin;
  wire [WIDTH:0]sum;
  wire cout;
  
  parameter WIDTH=4'b1000;
  
  fa uut(a,b,cin,sum,cout);
  initial begin
    a= $random % 4 ;b=$random % 4 ;cin= 1;#100;
    $finish;
  end
  initial begin
    $strobe("$time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
  end
endmodule
