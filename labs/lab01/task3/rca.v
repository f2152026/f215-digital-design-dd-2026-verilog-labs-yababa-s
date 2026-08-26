module rca(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

    wire c1, c2, c3;

    FA_Gate fa0 (sum[0], c1, a[0], b[0], cin);
    FA_Gate fa1 (sum[1], c2, a[1], b[1], c1);
    FA_Gate fa2 (sum[2], c3, a[2], b[2], c2);
    FA_Gate fa3 (sum[3], cout, a[3], b[3], c3);

endmodule