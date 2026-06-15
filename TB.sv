`timescale 1ns / 1ps

module TB();

logic         clk;          
logic         rst;          
logic         stop;         
logic[1:0]    in;          
logic[1:0]   floor;       
logic[3:0]   changes_count; 

Elevator DUT(
                .clk(clk),            
                .rst(rst),         
                .stop(stop),        
                .in(in),          
                .floor(floor),        
                .changes_count(changes_count)
);

initial begin
        clk=0;
        forever begin #10 clk=~clk;
        end
    end

initial begin

        clk=1;
        rst=1;
        stop=0;
        in=0;
        
        #10 rst=0;
        #10 in=3;
        
        #30 in=1;
        
        #20 in=2;
            stop=1;
        
        #30 stop=0;
        
        #10 in=3;
            stop=1;
            #20 in=0;
            #10 stop=0;
            
            #40;
            $stop;
        
            
        
        


end



endmodule