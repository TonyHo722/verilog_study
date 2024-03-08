
module sky130_ef_io__gpiov2_pad_wrapped (DM, result
    );

input [2:0] DM;
output [2:0] result;

//only support below mode for DM[2:0]
// 3'b001 input (output disable), no my_pullup or my_pulldown
// 3'b010 input (output disable), with my_pullup
// 3'b011 input (output disable), with my_pulldown
// 3'b110 output enable
// others, set to default mode = 3'b001

reg out_en;
reg my_pullup;
reg my_pulldown;

assign result[2:0] = {out_en, my_pullup, my_pulldown};

  always @(*) begin
    case( DM[2:0] )
      3'b001: begin
          out_en = 0;
          my_pullup = 0;
          my_pulldown = 0;
        end
      3'b010: begin
          out_en = 0;
          my_pullup = 1;
          my_pulldown = 0;
        end
      3'b011: begin
          out_en = 0;
          my_pullup = 0;
          my_pulldown = 1;
        end
      3'b110: begin
          out_en = 1;
          my_pullup = 0;
          my_pulldown = 0;
        end
      default: begin
          out_en = 0;
          my_pullup = 0;
          my_pulldown = 0;
        end
    endcase
 end


endmodule

