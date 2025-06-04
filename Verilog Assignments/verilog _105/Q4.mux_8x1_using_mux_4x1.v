//Design code
module mux_8x1(
  input [7:0]x,
  input [2:0]sel,
  output out);
  wire p,q;
  mux_4x1 ins_1(x[0],x[1],x[2],x[3],sel[1:0],p);
  mux_4x1 ins_2(x[4],x[5],x[6],x[7],sel[1:0],q);
  mux_2x1 ins_3(p,q,sel[2],out);
endmodule

module mux_4x1(
  input a,b,c,d,
  input [1:0]sel,
  output reg y);
  always@(*)begin
    case(sel)
      2'b00:y=a;
      2'b01:y=b;
      2'b10:y=c;
      2'b11:y=d;
    endcase
  end
endmodule

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
module mux_4x1_tb;
  reg [7:0]x;
  reg [2:0]sel;
  wire out;
  
  mux_8x1 uut(x,sel,out);
  
  initial begin
    x=8'b01001001;
    
    sel=3'b000;#5;
    sel=3'b001;#5;
    sel=3'b010;#5;
    sel=3'b100;#5;
    sel=3'b111;#5;
    
    $finish;
  end
  initial begin
    $monitor("$time=%0t,x=%b,sel=%b,out=%b",$time,x,sel,out);
  end
endmodule
   
