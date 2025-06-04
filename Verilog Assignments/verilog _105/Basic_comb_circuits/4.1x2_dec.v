//Design code
module dec_1x2(
  input in,
  output reg [1:0]out);
  
  always@(*)begin
    case(in)
      1'b0:out=2'b01;
      1'b1:out=2'b10;
      default:out=2'bxx;
    endcase
  end
endmodule


//TESTBENCH
module dec_1x2_tb;
  reg in;
  wire [1:0]out;
  
  dec_1x2 uut(in,out);
  
  initial begin
    in=1'b0;#5;
    in=1'b1;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,in=%b,out=%b",$time,in,out);
  end
endmodule
