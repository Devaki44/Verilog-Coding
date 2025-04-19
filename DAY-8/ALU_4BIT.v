//Design code
module ALU_operation (
  input  [3:0]A,B,
  input [1:0]sel,
  output reg [3:0]ALU_out);
  wire [3:0]out1,out2,out3,out4;
  
  andg inst1(A,B,out1);
  org inst2(A,B,out2);
  nandg inst3(A,B,out3);
  norg inst4(A,B,out4);
  
  always@(*)begin
    case(sel)
     2'b00:ALU_out=out1;
     2'b01:ALU_out=out2;
     2'b10:ALU_out=out3;
     2'b11:ALU_out=out4;
     default:ALU_out=4'b0000;
    endcase
  end
endmodule
module andg(
  input [3:0]x1,y1,
  output [3:0]out1);
  assign out1=x1&y1;
endmodule
module org(
  input [3:0]x2,y2,
  output [3:0]out2);
  assign out2=x2|y2;
endmodule
module nandg(
  input [3:0]x3,y3,
  output [3:0]out3);
  assign out3=~(x3&y3);
endmodule
module norg(
  input [3:0]x4,y4,
  output [3:0]out4);
  assign out4=~(x4|y4);
endmodule


//Testbench
module ALU_operation_tb();
    reg [3:0]A;
    reg [3:0]B;
    reg [1:0]sel;
    wire[3:0] ALU_out;
    ALU_operation uut(.A(A),.B(B),.sel(sel),.ALU_out(ALU_out));
    initial begin
      A=4'b0011; B=4'b0101;
      sel=2'b00;#5;
      sel=2'b01;#5;
      sel=2'b10;#5;
      sel=2'b11;#5;
      $finish;
    end
    initial begin
      $monitor("$Time=%0t|A=%b|B=%b|sel=%b|ALU_out=%b",$time,A,B,sel,ALU_out);
    end
endmodule
