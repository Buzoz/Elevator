`timescale 1ns / 1ps
module Floor_Transcoder(
  input logic [3:0] in,
  output logic [6:0] out
  );

  always_comb begin
    case(in)
      4'd0: out = 7'b0001100;
      4'd1: out = 7'b1111001;
      4'd2: out = 7'b0100100;
      4'd3: out = 7'b0110000;
      default: out = 7'b0000110;
    endcase 
  end
endmodule
