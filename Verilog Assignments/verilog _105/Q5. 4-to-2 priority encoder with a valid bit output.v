//Design code
module pri_en_4x2(
  input [3:0]in,
  output reg[1:0]out,
  output reg valid);
  
  always@(*)begin
    case(in)
      4'b0001:begin
                out=2'b00;
                valid=1'b1;
              end
      4'b0010:begin
                out=2'b01;
                valid=1'b1;
              end
      4'b0100:begin
                out=2'b10;
                valid=1'b1;
              end
      4'b1000:begin
                out=2'b11;
                valid=1'b1;
              end
      default:begin
                out=2'bxx;
                valid=1'b0;
              end
    endcase
  end
endmodule


//Testbench
module pri_en_4x2_tb;
  reg [3:0]in;
  wire [1:0]out;
  wire valid;
  
  pri_en_4x2 uut(in,out,valid);
  
  initial begin
    in=4'b0000;#5;
    in=4'b0001;#5;
    in=4'b1100;#5;
    in=4'b1000;#5;
    in=4'b1101;#5;
    in=4'b1001;#5;
    in=4'b1111;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,in=%b,out=%b,valid=%b",$time,in,out,valid);
  end
endmodule
