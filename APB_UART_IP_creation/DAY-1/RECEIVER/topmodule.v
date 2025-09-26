`include "uart_rx.v"
`include "baud_gen.v"

 module top_module(
  input clk,
  input rst,
  input receive,
  input rx,
  
  output [7:0]data_out);
  
  wire baud_tick;
  
  baud_gen b(clk,rst,baud_tick);
  uart_rx r(clk,rst,receive,baud_tick,rx,data_out);
  
endmodule
