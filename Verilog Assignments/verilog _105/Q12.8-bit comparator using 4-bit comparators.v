//Design code
module comp_8b(
  input [7:0]a,b,
  output greater,lesser,equal);
  wire x,y,z;
  wire p,q,r;
  comp_4b ins1(a[3:0],b[3:0],x,y,z);
  comp_4b ins2(a[7:4],b[7:4],p,q,r);
  
  assign greater= (p>x) ? 1 :0 ;
  assign lesser= (q>y) ? 1 : 0 ;
  assign equal= (z==r) ? 1 :0 ;
endmodule
    


module comp_4b(
  input [3:0]a,b,
  output reg greater,lesser,equal);
  
  always@(*)begin
    if(a>b)begin
      greater=1;
      lesser=0;
      equal=0;
    end
    
    else if(a<b)begin
      greater=0;
      lesser=1;
      equal=0;
    end
    
    else begin
      greater=0;
      lesser=0;
      equal=1;
    end
  end
endmodule



//Testbench
module comp_4b_tb;
  reg [3:0]a,b;
  wire greater,lesser,equal;
  
  comp_4b uut(a,b,greater,lesser,equal);
  initial begin
    repeat(5)
    begin
     a=$random;b=$random;#5;
    end
    $finish;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,greater=%b,lesser=%b,equal=%b",$time,a,b,greater,lesser,equal);
  end
endmodule
   
  
