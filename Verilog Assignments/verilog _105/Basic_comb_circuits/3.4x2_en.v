//Design code
module en_4x2(
  input [3:0]in,
  output reg[1:0]out);
  
  always@(*)begin
    case(in)
      4'b0001:out=2'b00;
      4'b0010:out=2'b01;
      4'b0100:out=2'b10;
      4'b1000:out=2'b11;
      default:out=2'bxx;
    endcase
  end
endmodule

//Testbench

module en_4x2_tb;
  reg [3:0]in;
  wire [1:0]out;
  
  en_4x2 uut(in,out);
  
  initial begin
    in=4'b0000;#5;
    in=4'b0100;#5;
    in=4'b1000;#5;
    in=4'b0101;#5;
    in=4'b0010;#5;
    in=4'b0001;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,in=%b,out=%b",$time,in,out);
  end
endmodule
