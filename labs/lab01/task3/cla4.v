module cla4(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

    wire [3:0] p, g;

    wire c1, c2, c3;

    wire w_p0_cin;
    wire w_p1_g0, w_p1_p0_cin;
    wire w_p2_g1, w_p2_p1_g0, w_p2_p1_p0_cin;
    wire w_p3_g2, w_p3_p2_g1, w_p3_p2_p1_g0, w_p3_p2_p1_p0_cin;

    xor #(2) (p[0], a[0], b[0]);
    and #(2) (g[0], a[0], b[0]);

    xor #(2) (p[1], a[1], b[1]);
    and #(2) (g[1], a[1], b[1]);

    xor #(2) (p[2], a[2], b[2]);
    and #(2) (g[2], a[2], b[2]);

    xor #(2) (p[3], a[3], b[3]);
    and #(2) (g[3], a[3], b[3]);

    and #(2) (w_p0_cin, p[0], cin);
    or  #(2) (c1, g[0], w_p0_cin);

    and #(2) (w_p1_g0, p[1], g[0]);
    and #(2) (w_p1_p0_cin, p[1], p[0], cin);
    or  #(2) (c2, g[1], w_p1_g0, w_p1_p0_cin);

    and #(2) (w_p2_g1, p[2], g[1]);
    and #(2) (w_p2_p1_g0, p[2], p[1], g[0]);
    and #(2) (w_p2_p1_p0_cin, p[2], p[1], p[0], cin);
    or  #(2) (c3, g[2], w_p2_g1, w_p2_p1_g0, w_p2_p1_p0_cin);

    and #(2) (w_p3_g2, p[3], g[2]);
    and #(2) (w_p3_p2_g1, p[3], p[2], g[1]);
    and #(2) (w_p3_p2_p1_g0, p[3], p[2], p[1], g[0]);
    and #(2) (w_p3_p2_p1_p0_cin, p[3], p[2], p[1], p[0], cin);
    or  #(2) (cout, g[3], w_p3_g2, w_p3_p2_g1, w_p3_p2_p1_g0, w_p3_p2_p1_p0_cin);

    xor #(2) (sum[0], p[0], cin);
    xor #(2) (sum[1], p[1], c1);
    xor #(2) (sum[2], p[2], c2);
    xor #(2) (sum[3], p[3], c3);

endmodule