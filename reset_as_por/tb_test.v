module tb_test ();

  wire porb_h;
  wire porb_l;
  wire por_l;
  wire rstb_h;
  reg reset;
  reg clk;
  
  reset_as_por dut(
    .clk(clk),
    .PAD(reset),
    .porb_h(porb_h),
    .porb_l(porb_l),
    .por_l(por_l),
    .rstb_h(rstb_h)
  );
  
  initial begin
    clk = 0;
    reset = 0;
    #10;
    #10;
    #10;
    reset = 1;
    #100;
    
    reset = 0;
    #11
    reset = 1;
    #3
    reset = 0;
    #3
    reset = 1;
    #100;
    $finish;
  end
  
  always #(5) clk = ~clk;
  
endmodule  
