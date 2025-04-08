//Design code
module mux4_1(sel,x,y);
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


//Testbench
module mux4_1_tb;
  reg [1:0]sel;
  reg [3:0]x;
  wire y;
 mux4_1 uut(.sel(sel),.x(x),.y(y));
  initial begin
    x = 4'b1010;#5;
    sel=2'b00;#5;
    sel=2'b01;#5;
    sel=2'b10;#5;
    sel=2'b11;#5;
    $finish;
  end
  initial begin
    $dumpfile("mux4_1.vcd");
    $dumpvars(1,mux4_1_tb);
  end
  initial begin
    $monitor("Time=%0t | sel=%b | x=%b | y=%b ",$time,sel,x,y);
  end
endmodule
  
