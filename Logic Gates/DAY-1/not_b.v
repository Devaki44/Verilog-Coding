//Design code
module not_b(a,y);
  input wire a;
  output reg y;
  always@(*)
   begin
     if(a==1'b0)
       y=1'b1;
     else
       y=1'b0;
   end
endmodule

//Testbench
module not_btb;
  reg a;
  wire y;
not_b uut(.a(a),.y(y));
  initial begin
   a=0;#5;
   a=1;#5;
  end
  initial begin
    $dumpfile("not_b.vcd");
    $dumpvars(0,not_btb);
  end
  initial begin
    $monitor("$Time=%0t a=%b y=%b",$time,a,y);
  end
endmodule
  
