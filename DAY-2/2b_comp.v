//Design code
module comp(a,b,x,y,z);
     input [1:0]a,b;
     output reg x,y,z;
    always@(*)begin
     if(a==b)
       begin
        x=1'b1;
        y=1'b0;
        z=1'b0;
       end
     else if(a<b)
       begin
        x=1'b0;
        y=1'b1;
        z=1'b0;
       end
     else
       begin
        x=1'b0;
        y=1'b0;
        z=1'b1;
       end
    end
endmodule

//Testbench
module comp_tb;
     wire x,y,z;
     reg [1:0]a,b;
comp uut(.a(a),.b(b),.x(x),.y(y),.z(z));
     initial begin
       a=0;b=0;#5;
       a=0;b=1;#5;
       a=1;b=0;#5;
       a=1;b=1;#5;
       $finish();
     end
     initial begin
      $dumpfile("comp.vcd");
      $dumpvars(1,comp_tb);
     end
     initial begin
      $monitor("Time=%t|a=%b|b=%b|x=%b|y=%b|z=%b",$time,a,b,x,y,z);
     end
endmodule
