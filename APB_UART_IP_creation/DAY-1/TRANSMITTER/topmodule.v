`include "baud_gen.v"
`include "uart_tx.v"

module top_module(
  input clk,
  input rst,
  input transfer,
  input [7:0]data_in,
  output reg tx,
  output reg busy);
  
  baud_gen b(clk,rst,baud_tick);
  uart_tx  t(clk,rst,baud_tick,transfer,data_in,tx,busy);
  
endmodule
      
