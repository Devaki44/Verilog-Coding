//Design code
module epg(
  input a,b,c,
  output out);
  assign out=a^b^c;
endmodule

//Testbench
module epg_tb;
  reg a,b,c;
  wire out;
  epg uut(a,b,c,out);
  initial begin
    repeat(5)begin
     a=$random;b=$random;c=$random;#5;
    end
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,c=%b,out=%b",$time,a,b,c,out);
  end
endmodule
