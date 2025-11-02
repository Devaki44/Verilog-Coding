module code#(parameter LEN = 8,parameter[LEN-1 : 0]pattern = 8'b1011_1101)(
  input clk,
  input rst,
  input din,
  output reg detect);
  
  reg[LEN-1 : 0]shift_reg;
  wire [LEN-1:0]next_shift = {shift_reg[LEN-2:0], din};

  always @(posedge clk) begin
    if (rst) begin
      shift_reg <= '0;
      detect    <= 1'b0;
    end 
    else begin
      shift_reg <= next_shift;
      detect    <= (next_shift == pattern); 
    end
  end

endmodule
