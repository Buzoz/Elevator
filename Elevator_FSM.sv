`timescale 1ns / 1ps
module Elevator_FSM(
        input logic         clk,
        input logic         rst,
        input logic         stop,
        input logic[1:0]    in,
        output logic[1:0]   floor

    );
    
localparam Floor0 = 2'b00;
localparam Floor1 = 2'b01;
localparam Floor2 = 2'b10;
localparam Floor3 = 2'b11;

logic [1:0] state, state_next;

always_ff @(posedge clk) begin
    if(rst == 1)
        state <= Floor0;
    else
        state <= state_next;
end
    
  always_comb begin
    state_next = state;
        case(state)
                Floor0: begin
                         if(in == 0 || stop==1) state_next = Floor0;
                            else
                         if(in>0) state_next= Floor1;
                     end
                     
                 Floor1: begin
                         if(in == 1 || stop==1) state_next = Floor1;
                            else
                         if(in>1) state_next= Floor2;
                            else
                                state_next= Floor1;
                     end     
                Floor2: begin
                         if(in == 2 || stop==1) state_next = Floor2;
                            else
                         if(in>2) state_next= Floor3;
                            else
                                state_next= Floor2;
                     end     
                Floor3: begin
                         if(in == 3 || stop==1) state_next = Floor3;
                            else
                         if(in<1) state_next= Floor2;
                     end     
             default: state_next = Floor0;
    endcase
  end      
         assign floor = state;           
                     
endmodule
