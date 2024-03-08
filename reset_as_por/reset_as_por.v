module reset_as_por(
    input clk,
    //inout PAD,
    input PAD,
    output wire rstb_h,
    output wire porb_h,
    output wire porb_l,
    output wire por_l
  );

  wire resetb_in;
  reg [1:0] de_glitch;

  reg [2:0] cnt;

  assign porb_h = de_glitch[1];
  assign porb_h = de_glitch[1];
  assign porb_l = de_glitch[1];
  assign por_l = !de_glitch[1];
  assign rstb_h = cnt[2];

  always @(posedge clk or negedge resetb_in) begin
    if(!resetb_in)
      de_glitch[1:0] <= 2'b00;
    else begin
      de_glitch[0] <= 1'b1;
      de_glitch[1] <= de_glitch[0];
    end
  end

  always @(posedge clk or negedge resetb_in) begin
    if(!resetb_in)
      cnt[2:0] <= 3'b000;
    else begin
      cnt[0] <= de_glitch[1];
      cnt[1] <= cnt[0];
      cnt[2] <= cnt[1];
    end
  end

`ifdef test
  I1025EW reset_pad(
    .DOUT(resetb_in),
    .R_EN(1'b1),
    .PADI(PAD)
  );
`else
    assign resetb_in = PAD;
`endif

endmodule


