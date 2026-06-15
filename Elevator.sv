`timescale 1ns / 1ps
module Elevator(
        input logic         clk,
        input logic         rst,
        input logic         stop,
        input logic[1:0]    in,
        output logic[1:0]   floor,
        output logic[3:0]   changes_count
    );
    logic count_enable;
    
    Elevator_FSM Elevator_FSM0(
            .clk(clk),  
            .rst(rst),  
            .stop(stop), 
            .in(in),   
            .floor(floor) 
    ); 
    Change_Detector Change_Detector0(
                 .clk(clk),  
                 .rst(rst),  
                 .in(in),   
                 .change(count_enable)
                 );
       Counter Counter0(
                .clk(clk),         
                .rst(rst),         
                .en(count_enable),          
                .changes_count(changes_count)   
               );   
                 
    
endmodule
