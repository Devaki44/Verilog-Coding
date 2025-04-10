//Design code
module siso(in,clk,rst,out);
     input wire in,clk,rst;
     output reg out;
     always@(posedge clk)
       begin
         if(rst)
            out=1'b0;
         else
            out=in;
       end
endmodule

//Testbench
module siso_tb;
      wire out;
      reg in;
      reg clk,rst;
      siso uut(.in(in),.clk(clk),.rst(rst),.out(out));
      initial begin
       clk=0;
       forever #5 clk=~clk;
      end
      initial begin
        rst=1'b0;#5
        in=1'b0;#5;
        in=1'b1;#5;
        in=1'b1;#5;
        in=1'b1;#5;
        rst=1'b1;#5;
        in=1'b0;#5;
        in=1'b1;#5;
        in=1'b1;#5;
        in=1'b1;#5;
        $finish;
      end
      initial begin
         $dumpfile("siso.vcd");
         $dumpvars(1,siso_tb);
      end
      initial begin
         $monitor("Time=%0t|clk=%b|rst=%b|in=%b|out=%b",$time,clk,rst,in,out);
      end
endmodule
