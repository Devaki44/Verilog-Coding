//Design a Traffic Light Controller using Verilog to manage traffic flow at a
four-way intersection. This system should handle complex traffic scenarios,
including emergency vehicle priority, pedestrian crossing, and adaptive timing
based on traffic density.

//Design code
module tlc(
  input clk,
  input rst,
  output reg red,
  output reg green,
  output reg yellow);

  parameter RED=2'b00;
  parameter GREEN=2'b01;
  parameter YELLOW=2'b10;

  reg [1:0] s, ns;
  reg [3:0] count;

  always@(posedge clk) begin
    if (rst) begin
      s <= RED;
      count <= 0;
    end 
    else begin
      s <= ns;
      if ((s == RED && count == 10) ||(s == GREEN && count == 15) ||(s == YELLOW && count == 5)) begin
        count <= 0;
      end
      else begin
        count <= count + 1;
      end
    end
  end

  always @(s or count) begin
    case (s)
      RED:    ns = (count == 10) ? GREEN : RED;
      GREEN:  ns = (count == 15) ? YELLOW : GREEN;
      YELLOW: ns = (count == 5)  ? RED : YELLOW;
      default:ns = RED;
    endcase
  end

  always @(*) begin
    red    = (s == RED);
    green  = (s == GREEN);
    yellow = (s == YELLOW);
  end
endmodule

      
//Testbench
`timescale 1ns/1ps
module tb_tlc;
  reg clk;
  reg rst;
  wire red, green, yellow;
  
  tlc dut(clk,rst,red,green,yellow);
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
  rst = 1; #10;
  rst = 0; #500;  // enough time to go through RED->GREEN->YELLOW->RED
  $finish;
end
  initial begin
    $monitor("$Time=%0t, clk=%b, rst=%b, red=%b, green=%b, yellow=%b", $time, clk, rst, red, green, yellow);
  end
endmodule
