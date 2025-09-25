
`include "synchronizer.v"
`include "wptr_handler.v"
`include "rptr_handler.v"
`include "fifo.v"

module top_module #(parameter DEPTH = 8,DATA_WIDTH = 3)
  (   
  input w_clk,r_clk,
  input w_en,r_en,
  input w_rst,r_rst,
  input [DATA_WIDTH-1 : 0]data_in,
  
  output reg [DATA_WIDTH-1 :0]data_out,
  output reg full,empty);
  
  parameter PTR_WIDTH = $clog2(DEPTH);
  
  reg [PTR_WIDTH : 0]g_rptr_sync,g_wptr_sync;
  reg [PTR_WIDTH : 0]b_wptr,g_wptr  ;
  reg [PTR_WIDTH : 0]b_rptr,g_rptr ;
  
  
  synchronizer #(PTR_WIDTH) w(w_clk,w_rst,g_rptr,g_rptr_sync);
  synchronizer #(PTR_WIDTH) r(r_clk,r_rst,g_wptr,g_wptr_sync);
  
  wptr_handler #(PTR_WIDTH) w1(w_clk,w_en,w_rst,g_rptr_sync,b_wptr,g_wptr,full);
  
  rptr_handler #(PTR_WIDTH) r1(r_clk,r_en,r_rst,g_wptr_sync,b_rptr,g_rptr,empty);
  
  fifo #(DATA_WIDTH,PTR_WIDTH,DEPTH) f1(w_clk,w_en,b_wptr,r_clk,r_en,b_rptr,data_in,full,empty,data_out);
  
endmodule



// `include "synchronizer.v"
// `include "wptr_handler.v"
// `include "rptr_handler.v"
// `include "fifo.v"

// module top_module #(parameter DEPTH = 8, DATA_WIDTH = 3) (
//     input w_clk, r_clk,
//     input w_en, r_en,
//     input w_rst, r_rst,
//     input [DATA_WIDTH-1:0] data_in,
//     output reg [DATA_WIDTH-1:0] data_out,
//     output reg full, empty
// );

//     localparam PTR_WIDTH = $clog2(DEPTH);

//     reg [PTR_WIDTH:0] g_rptr_sync, g_wptr_sync;
//     reg [PTR_WIDTH:0] b_wptr, g_wptr;
//     reg [PTR_WIDTH:0] b_rptr, g_rptr;

//     synchronizer #(PTR_WIDTH) w (
//         .clk(w_clk),
//         .rst(w_rst),
//         .data_in(g_rptr),
//         .data_out(g_rptr_sync)
//     );

//     synchronizer #(PTR_WIDTH) r (
//         .clk(r_clk),
//         .rst(r_rst),
//         .data_in(g_wptr),
//         .data_out(g_wptr_sync)
//     );

//     wptr_handler #(PTR_WIDTH) w1 (
//         .w_clk(w_clk),
//         .w_en(w_en),
//         .w_rst(w_rst),
//         .g_rptr_sync(g_rptr_sync),
//         .b_wptr(b_wptr),
//         .g_wptr(g_wptr),
//         .full(full)
//     );

//     rptr_handler #(PTR_WIDTH) r1 (
//         .r_clk(r_clk),
//         .r_en(r_en),
//         .r_rst(r_rst),
//         .g_wptr_sync(g_wptr_sync),
//         .b_rptr(b_rptr),
//         .g_rptr(g_rptr),
//         .empty(empty)
//     );

//     fifo #(DATA_WIDTH, PTR_WIDTH, DEPTH) f1 (
//         .w_clk(w_clk),
//         .w_en(w_en),
//         .w_ptr(b_wptr),
//         .r_clk(r_clk),
//         .r_en(r_en),
//         .r_ptr(b_rptr),
//         .data_in(data_in),
//         .full(full),
//         .empty(empty),
//         .data_out(data_out)
//     );

// endmodule
