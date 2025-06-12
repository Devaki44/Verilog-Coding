//Testbench
module rca_tb;
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  
  rca uut(a,b,cin,sum,cout);
  
  initial begin
    repeat(5)begin
     a=$random%4 ;b=$random%4 ;cin=$random%1;#50;
     $finish;
    end
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
  end
endmodule
