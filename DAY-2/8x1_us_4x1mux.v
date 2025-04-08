//Design code
module mux4x1(sel,x,y);
  input wire [1:0]sel;
  input wire [3:0]x;
  output reg y;
  always@(*)begin
      case(sel)
        2'b00:y=x[0];
        2'b01:y=x[1];
        2'b10:y=x[2];
        2'b11:y=x[3];
        default:y=x[0];
      endcase
  end
endmodule
module mux2x1(sel,p,q,y);
  input wire sel;
  input wire p,q;
  output reg y;
  always@(*)begin
      case(sel)
        1'b0:y=p;
        1'b1:y=q;
        default:y=p;
      endcase
  end
endmodule
module mux8x1(sel,x,y);
  input wire [2:0]sel;
  input wire [7:0]x;
  output wire y;
  wire p,q;
  mux4x1 m1(.sel(sel[2:1]),.x(x[7:4]),.y(p));
  mux4x1 m2(.sel(sel[2:1]),.x(x[3:0]),.y(q));
  mux2x1 m3(.sel(sel[0]),.p(q),.q(p),.y(y));
endmodule


//Testbench
module mux8x1_tb;
  reg [2:0]sel;
  reg [7:0]x;
  wire y;
 mux8x1 uut(.sel(sel),.x(x),.y(y));
  initial begin
    x = 8'b10000000;#5;
    sel=3'b000;#5;
    sel=3'b001;#5;
    sel=3'b010;#5;
    sel=3'b011;#5;
    
    sel=3'b100;#5;
    sel=3'b101;#5;
    sel=3'b110;#5;
    sel=3'b111;#5;
    
    $finish;
  end
  initial begin
    $dumpfile("mux8x1.vcd");
    $dumpvars(1,mux8x1_tb);
  end
  initial begin
    $monitor("Time=%0t | sel=%b | x=%b | y=%b ",$time,sel,x,y);
  end
endmodule
  
  
