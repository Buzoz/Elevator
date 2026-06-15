`timescale 1ns / 1ps
module Counter
#(parameter width=4)
(
                input logic             clk,
                input logic             rst,
                input logic             en,
                output logic[width-1:0] changes_count
    );
    
    always_ff @(posedge clk) begin
        if(rst)
            changes_count <=0;
        else
            if(en==1)
                changes_count <=changes_count+1;
    end   
endmodule
