// module swap_blocking;
//   reg [3:0]a,b;
  
//   reg [3:0]temp;
  
//   initial begin
//     a= 3;b=4;
// //     #5
    
//     temp = a;
//     a=b;
//     b= temp;
//     $monitor("a=%d,b=%d",a,b);
//   end
// endmodule


module swap_non_blocking;
  reg [3:0]a,b;
  
//   reg [3:0]temp;
  
  initial begin
    a= 3;b=4;
    #5
    
    a <= b;
    b <= a;
    $monitor("a=%d,b=%d",a,b);
  end
endmodule
