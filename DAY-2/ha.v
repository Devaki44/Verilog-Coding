//Design code
module ha(a,b,s,cout);
      input  a,b;
      output  s,cout;

      /*//gatelevel
      xor(s,a,b);
      and(cout,a,b);*/

      //dataflowlevel
      assign s=a^b;
      assign cout=a&b;

      /*//behaviourallevel
      input wire a,b;
      output reg s, cout;
      always@(*)
       begin
         s=a^b;
         cout=a&b;
       end*/
endmodule

//Testbench
module ha_tb;
     reg a,b;
     wire s,cout;
ha uut(.a(a),.b(b),.s(s),.cout(cout));
     initial begin
       a=0;b=0;#5;
       a=0;b=1;#5;
       a=1;b=0;#5;
       a=1;b=1;#5;
       $finish;
     end
     initial begin
       $dumpfile("ha.vcd");
       $dumpvars(1,ha_tb);
     end
     initial begin
       $monitor("Time=%0t | a=%b | b=%b | s=%b | cout=%b",$time,a,b,s,cout);
     end
endmodule
