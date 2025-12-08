module tb;
reg clk;
reg rst;
reg d;
wire q;

// DUT instantiation
dff_negedge_sync_reset dut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation (50 MHz → 10 ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;   // Toggle clock every 5 ns
end

// Stimulus
initial begin
    // Initialize inputs
    rst = 1;
    d   = 0;

    // Apply reset
    #10;
    rst = 0;

    // Apply test values
    #10 d = 1;
    #20 d = 0;
    #20 d = 1;

    // Apply asynchronous reset in between
    #7 rst = 1;      // apply async reset (not aligned to clock)
    #5 rst = 0;

    // More test values
    #15 d = 0;
    #10 d = 1;

    #50 $finish;
end

// Monitor the signals
initial begin
    $monitor("Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b",
              $time, clk, rst, d, q);
end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
