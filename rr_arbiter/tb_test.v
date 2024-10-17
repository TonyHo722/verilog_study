module tb_test #(
  parameter N=16
  )
  ();
  reg clk;
  reg rst;
  reg [N-1:0] req;
  wire [N-1:0] grant;


  round_robin_arbiter #(
    .N(N)
  )
  dut (
    .clk(clk),
    .rst(rst),
    .req(req),
    .grant(grant)
  );
  initial begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    req = 'h01;
    #100;
    req = 'h101;
    #100;
    req = 'h105;
    #100;
    req = 'h505;
    #200;
    $finish;


  end

  always #(5) clk = ~clk;

endmodule


