// Code your design here
module not_g(a,y);
  input [3:0]a;
  output  [7:0]y;
  
  assign y[7:4]=4'b0000;
  assign y[3:0] = ~a[3:0];

  
//   assign y = {4'b0000, ~a};
  
//     not (y[0], a[0]);
//     not (y[1], a[1]);
//     not (y[2], a[2]);
//     not (y[3], a[3]); 
//     assign y[7:4]=4'b0000;
  
endmodule



//testbench
module not_gtb;
  wire [7:0]y;
  reg [3:0]a;
not_g uut(.a(a),.y(y));
  initial begin
   a=4'b1011;#5;
   a=4'b0011;#5;
  end
  initial begin
    $dumpfile("not_g.vcd");
    $dumpvars(0,not_gtb);
  end
  initial begin
    $monitor("$Time=%0t a=%b y=%b",$time,a,y);
  end
endmodule
  
