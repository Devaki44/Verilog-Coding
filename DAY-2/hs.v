//Design code
module hs(a,b,d,bout);
      input  a,b;
      output  d,bout;

      /*//gatelevel
      xor(d,a,b);
      and(bout,~a,b);*/

      //dataflowlevel
      assign d=a^b;
      assign bout=~a&b;

      /*//behaviourallevel
      input wire a,b;
      output reg d, bout;
      always@(*)
       begin
         d=~a^b;
         bout=~a&b;
       end*/
endmodule

//Testbench
module hs_tb;
     reg a,b;
     wire d,bout;
hs uut(.a(a),.b(b),.d(d),.bout(bout));
     initial begin
       a=0;b=0;#5;
       a=0;b=1;#5;
       a=1;b=0;#5;
       a=1;b=1;#5;
       $finish;
     end
     initial begin
       $dumpfile("hs.vcd");
       $dumpvars(1,hs_tb);
     end
     initial begin
       $monitor("Time=%0t | a=%b | b=%b | d=%b | bout=%b",$time,a,b,d,bout);
     end
endmodule
