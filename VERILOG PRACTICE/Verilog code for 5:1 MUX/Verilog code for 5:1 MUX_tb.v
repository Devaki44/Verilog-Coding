module mux_5x1_tb;
  reg [7:0]in;
  reg [2:0]sel;
  wire out;
  mux_5x1 uut(in,sel,out);
  initial begin
    in=5'b01110;sel=3'b100;#5;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    $strobe("$time=%0t,in=%b,sel=%b,out=%b",$time,in,sel,out);
  end
endmodule
