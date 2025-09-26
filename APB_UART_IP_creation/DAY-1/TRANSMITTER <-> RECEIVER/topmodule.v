`include "baud_gen.v"
`include "uart_tx.v"
`include "uart_rx.v"

module topmodule(
  input clk,
  input rst,
  input tranfer,
  input [7:0]data_in,
  
  output [7:0]data_out);
  
  wire baud_tick;
  wire tx;
  wire busy;
  
  baud_gen bg(clk,rst,baud_tick);
  uart_tx  tr(clk,rst,baud_tick,transfer,data_in,tx,busy);
  uart_rx  rv(clk,rst,busy,baud_tick,tx);
  
  assign rx = tx ;
  assign receive = busy ;
  
endmodule
  
  
