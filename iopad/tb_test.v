module tb_test ();

  reg OUT;
  reg [2:0] DM;
  wire IN;
  wire PAD;
  reg PAD_driving;

  
  sky130_ef_io__gpiov2_pad_wrapped dut(
    .IN(IN),
    .OUT(OUT),
    .DM(DM),
    .PAD(PAD)
  );
  
  initial begin
    DM = 3'b001;	//input
    PAD_driving = 1'b0;
    OUT = 0;
	
    #10;
    PAD_driving = 1'b1;
    OUT = 0;

    #10;
    PAD_driving = 1'bz;
    OUT = 0;

    PAD_driving = 1'b0;
    OUT = 1;
	
    #10;
    PAD_driving = 1'b1;
    OUT = 1;

    #10;
    PAD_driving = 1'bz;
    OUT = 1;

    #10
    PAD_driving = 1'b0;
    OUT = 1'bz;
	
    #10;
    PAD_driving = 1'b1;
    OUT = 1'bz;

    #10;
    PAD_driving = 1'bz;
    OUT = 1'bz;

    #10;
    DM = 3'b110;	//output
    PAD_driving = 1'b0;
    OUT = 0;
	
    #10;
    PAD_driving = 1'b1;
    OUT = 0;

    #10;
    PAD_driving = 1'bz;
    OUT = 0;

    PAD_driving = 1'b0;
    OUT = 1;
	
    #10;
    PAD_driving = 1'b1;
    OUT = 1;

    #10;
    PAD_driving = 1'bz;
    OUT = 1;

    #10
    PAD_driving = 1'b0;
    OUT = 1'bz;
	
    #10;
    PAD_driving = 1'b1;
    OUT = 1'bz;

    #10;
    PAD_driving = 1'bz;
    OUT = 1'bz;



    #10;
    $finish;
  end
  
  assign PAD = ( DM == 3'b001) ? PAD_driving : 1'bz;
  //assign PAD = PAD_driving ;
  
endmodule  
