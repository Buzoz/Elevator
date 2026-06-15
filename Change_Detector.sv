`timescale 1ns / 1ps
module Change_Detector(
            input logic         clk,
            input logic         rst,
            input logic[1:0]    in,
            output logic        change
    );
    
    logic[1:0] in_p;
    
    always_ff @(posedge clk) begin
        if(rst)
            in_p <=0;
        else
            in_p=in;
    end
    
    assign change = (in!=in_p);
    
endmodule
