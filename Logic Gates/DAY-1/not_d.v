//Design code 
module not_d(a,y);
  input wire a;
  output reg y;
  assign y=~a;
endmodule

//Testbench
module not_dtb;
  wire y;
  reg a;
not_d uut(.a(a),.y(y));
  initial begin
   a=0;#5;
   a=1;#5;
  end
  initial begin
    $dumpfile("not_d.vcd");
    $dumpvars(0,not_dtb);
  end
  initial begin
    $monitor("$Time=%0t a=%b y=%b",$time,a,y);
  end
endmodule
