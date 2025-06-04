//Design code
module epc(
  input a,b,c,p,
  output out);
  assign out=(a^b^c^p);
endmodule


//Testbench
module epc_tb;
  reg a,b,c,p;
  wire out;
  epc uut(a,b,c,p,out);
  initial begin
    repeat(5)begin
     a=$random;b=$random;c=$random;p=$random;#5;
    end
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,c=%b,p=%b,out=%b",$time,a,b,c,p,out);
  end
endmodule
