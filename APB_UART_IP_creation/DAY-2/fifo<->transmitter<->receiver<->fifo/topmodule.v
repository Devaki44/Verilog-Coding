//`include "fifo_tx.v"
//`include "baud_gen.v"
//`include "uart_tx.v"
//`include "uart_rx.v"
//`include "fifo_rx.v"

module topmodule(
  input clk,
  input rst,
  input w_en,
  input [7:0]d_in,

  output [7:0]data_out);

  wire baud_tick;
  wire tx;
  wire busy;
  wire [7:0]d_out;
  wire [7:0]r_out;
  wire ready;
  wire e_tx;

  baud_gen bg  (clk,rst,baud_tick);
  fifo_tx  f_tx(clk,rst,w_en,d_in,d_out,f_tx,e_tx);
  uart_tx  tr  (clk,rst,baud_tick,(~e_tx),d_out,tx,busy);
  uart_rx  rv  (clk,rst,busy,baud_tick,tx,r_out,ready);
  fifo_rx  f_rx(clk,rst,ready,r_out,data_out,f_rx,e_rx);

  
  
  assign data_out	= d_out ;
  assign receive 	= busy ;
  assign rx 		= tx ;
  assign w_en_rx	= ready;
  assign data_in  	= r_out;
  assign transfer       = (~e_tx) ;

endmodule
