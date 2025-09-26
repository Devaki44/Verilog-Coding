module testbench;
  reg clk;
  reg rst;
  reg transfer;
  reg [7:0]data_in;
  wire tx;
  wire busy;
  
  top_module dut(clk,rst,transfer,data_in,tx,busy);
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk ;
  end
  initial begin
    rst = 1;
    #100;
    rst = 0;
    transfer = 1'b1;
    data_in = 8'hd4;
    #500_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    





// module uart_tx_fsm #(
//   parameter DATA_WIDTH = 8
// )(
//   input        clk,
//   input        rst,
//   input        send,         // pulse to start transmission
//   input        baud_tick,
//   input  [DATA_WIDTH-1:0] data_in,
//   output reg   tx,
//   output reg   busy
// );

//   // States
//   localparam IDLE  = 2'd0;
//   localparam START = 2'd1;
//   localparam DATA  = 2'd2;
//   localparam STOP  = 2'd3;

//   reg [1:0] state;
//   reg [3:0] bit_cnt;                // up to 8 bits
//   reg [DATA_WIDTH-1:0] data_reg;
  
//   always @(posedge clk or posedge rst) begin
//     if (rst) begin
//       state    <= IDLE;
//       tx       <= 1;     // idle line is high
//       busy     <= 0;
//       bit_cnt  <= 0;
//       data_reg <= 0;
//     end else begin
//       case (state)
//         IDLE: begin
//           tx   <= 1;
//           busy <= 0;
//           if (send) begin
//             busy     <= 1;
//             data_reg <= data_in;
//             bit_cnt  <= 0;
//             state    <= START;
//           end
//         end

//         START: begin
//           // Transmit start bit (0)
//           if (baud_tick) begin
//             tx    <= 0;
//             state <= DATA;
//           end
//         end

//         DATA: begin
//           if (baud_tick) begin
//             tx <= data_reg[bit_cnt];
//             bit_cnt <= bit_cnt + 1;
//             if (bit_cnt == DATA_WIDTH-1) begin
//               state <= STOP;
//             end
//           end
//          end

//         STOP: begin
//           if (baud_tick) begin
//             tx    <= 1;     // stop bit = 1
//             state <= IDLE;
//             busy  <= 0;
//           end
//         end

//         default: begin
//           state <= IDLE;
//         end
//       endcase
//     end
//   end

// endmodule
