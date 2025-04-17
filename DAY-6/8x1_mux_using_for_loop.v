//Design code
module mux8x1(
  input [7:0]x,
  input [2:0]sel,
  output reg y);
  integer i;
  always@(*)begin
    for(i=0;i<8;i=i+1)begin
     if(sel==i)begin
      y=x[i];
     end
    end
  end
endmodule


/Testbench
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
  
  
      
