//Design code
module mux_4x1(
  input S0,S1,
  input i0,i1,i2,i3,
  output y);
  assign y = S1 ? (S0 ? i3 : i2) : (S0 ? i1 : i0); 
endmodule



//Testbench
module mux_4x1_tb();
  reg S0,S1,i0,i1,i2,i3;
  wire y;
  mux_4x1 uut(S0,S1,i0,i1,i2,i3,y);
  initial begin
    i0=1;i1=1;i2=0;i3=1;
    S0=0;S1=0;#5;
    S0=0;S1=1;#5;
    S0=1;S1=0;#5;
    S0=1;S1=1;#5;
    $finish;
  end
  initial begin
    $monitor("Time=%0t|S0=%b|S1=%b|i0=%b|i1=%b|i2=%b|i3=%b|y=%b",$time,S0,S1,i0,i1,i2,i3,y);
  end
endmodule
