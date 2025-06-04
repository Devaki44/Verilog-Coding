//Design code
module gray_to_binary(
  input [3:0]g,
  output [3:0]b);
  
  assign b[3]=g[3];
  assign b[2]=b[3]^g[2];
  assign b[1]=b[2]^g[1];
  assign b[0]=b[1]^g[0];
endmodule


//Testbench
module gray_to_binary_tb;
  reg [3:0]g;
  wire [3:0]b;
  
  gray_to_binary uut(g,b);
  initial begin
    g=4'b0001;#5;
    g=4'b1101;#5;
    g=4'b0111;#5;
    g=4'b0101;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,g=%b,b=%b",$time,g,b);
  end
  
endmodule
