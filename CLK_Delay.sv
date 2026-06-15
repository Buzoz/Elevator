`timescale 1ns / 1ps
module CLK_Delay(
                    input logic clk,
                    input logic rst,
                    input logic en,
                    output logic clk_delay
    );
    
    logic[31:0] sem;
    
    always_ff @(posedge clk) begin
        if(rst)
            sem<=0;
          else
            if (en==1)
          sem<=sem+1;
  end  
    
    assign clk_delay=sem[27];
endmodule
