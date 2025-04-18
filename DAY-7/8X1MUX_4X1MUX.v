//Design code
module mux8x1(
  input [7:0]x,
  input S2,S1,S0,
  output y);
  wire a,b;
  mux4x1 inst1(S2,S1,x[7],x[6],x[5],x[4],a);
  mux4x1 inst2(S2,S1,x[3],x[2],x[1],x[0],b);
  mux2x1 inst3(S0,a,b,y);
endmodule
module mux2x1(
  input S,
  input x0,x1,
  output y);
  assign y= S ? x1 : x0 ;
endmodule
module mux4x1(
  input S1,S0,
  input x0,x1,x2,x3,
  output y);
  assign y=S1 ? (S0 ? x3 : x1):(S0 ? x2 : x0) ;
endmodule


//Testbench
module mux8x1_tb();
  reg [7:0]x;
  reg S2,S1,S0;
  wire y;
  mux8x1 uut(x,S2,S1,S0,y);
  initial begin
    x=8'b00110111;
    S2=1'b0;S1=1'b0;S0=1'b0;#5;
    S2=1'b0;S1=1'b0;S0=1'b1;#5;
    S2=1'b0;S1=1'b1;S0=1'b0;#5;
    S2=1'b0;S1=1'b1;S0=1'b1;#5;
    
    S2=1'b1;S1=1'b0;S0=1'b0;#5;
    S2=1'b1;S1=1'b0;S0=1'b1;#5;
    S2=1'b1;S1=1'b1;S0=1'b0;#5;
    S2=1'b1;S1=1'b1;S0=1'b1;#5;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t|x=%b|S2=%b|S1=%b|S0=%b|y=%b",$time,x,S2,S1,S0,y);
  end
endmodule
