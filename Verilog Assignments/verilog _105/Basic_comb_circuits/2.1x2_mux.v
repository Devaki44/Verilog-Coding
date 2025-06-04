//Design code
module demux_1x2(
  input in,
  input sel,
  output reg a,b);
  always@(*)begin
    case(sel)
      1'b0:a=in;
      1'b1:b=in;
    endcase
  end
endmodule


//testbench
module demux_1x2_tb;
  reg in;
  reg sel;
  wire a,b;
  
  demux_1x2 uut(in,sel,a,b);
  
  initial begin
    in=0;sel=1'b0;#5;
    in=0;sel=1'b1;#5;
    in=1;sel=1'b0;#5;
    in=1;sel=1'b1;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,in=%b,sel=%b,a=%b,b=%b",$time,in,sel,a,b);
  end
endmodule
