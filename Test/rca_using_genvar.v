//Design code
module rca(
  input  [3:0] a, b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire [3:0] c; 
  fa fa0 (
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .sum(sum[0]),
    .cout(c[0])
  );

 
  genvar i;
  generate
    for (i = 1; i < 4; i = i + 1) begin : gen_fa
      fa fa_inst (
        .a(a[i]),
        .b(b[i]),
        .cin(c[i-1]),
        .sum(sum[i]),
        .cout(c[i])
      );
    end
  endgenerate

  assign cout = c[3];

endmodule



module fa(
  input  a, b, cin,
  output sum, cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
