//DESIGN CODE
// Code your design here
//module nor_g(a,b,y);
//  input wire a,b;
//  output reg y;
//  nor(y,a,b);
//endmodule
module nor_sw(
  input a,b,
  output y);
  wire w;
  supply1 vdd;
  supply0 gnd;
  nmos n1(y,gnd,a);
  nmos n2(y,gnd,b);
  pmos p1(w,vdd,a);
  pmos p2(y,w,b);
endmodule


//TESTBENCH
module nor_gtb;
  reg a,b;
  wire y;
  nor_sw uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("nor_g.vcd");
    $dumpvars(1,nor_gtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
  
