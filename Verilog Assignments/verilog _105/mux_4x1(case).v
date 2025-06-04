//Design code
module mux_4x1(
  input a,b,c,d,
  input [1:0]sel,
  output reg y);
  always@(*)begin
    case(sel)
      2'b00:y=a;
      2'b01:y=b;
      2'b10:y=c;
      2'b11:y=d;
    endcase
  end
endmodule


//Testbench
module mux_4x1_tb;
  reg a,b,c,d;
  reg [1:0]sel;
  wire y;
  
  mux_4x1 uut(a,b,c,d,sel,y);
  
  initial begin
    a=0;b=0;c=1;d=1;sel=2'b00;#5;
    a=1;b=1;c=1;d=1;sel=2'b01;#5;
    a=0;b=1;c=1;d=1;sel=2'b10;#5;
    a=0;b=1;c=1;d=0;sel=2'b11;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,c=%b,d=%b,sel=%b,y=%b",$time,a,b,c,d,sel,y);
  end
endmodule
