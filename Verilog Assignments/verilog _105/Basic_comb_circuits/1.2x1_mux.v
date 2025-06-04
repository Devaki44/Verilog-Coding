//Design code
module mux_2x1(
  input a,b,
  input sel,
  output reg y);
  always@(*)begin
    case(sel)
      1'b0:y=a;
      1'b1:y=b;
    endcase
  end
endmodule


//Testbench
module mux_2x1_tb;
  reg a,b;
  reg sel;
  wire out;
  
  mux_2x1 uut(a,b,sel,out);
  
  initial begin
    
    a=0;b=0;sel=1'b0;#5;
    a=0;b=1;sel=1'b0;#5;
    a=1;b=0;sel=1'b1;#5;
    a=1;b=1;sel=1'b1;#5;
    
    $finish;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,sel=%b,out=%b",$time,a,b,sel,out);
  end
endmodule
