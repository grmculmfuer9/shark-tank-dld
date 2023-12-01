`timescale 1ns / 1ps
module h_counter(clk,h_count,trig_v);
    input clk;
    output [9:0] h_count;
    output trig_v;
    reg [9:0] h_count;
    reg trig_v;
    initial trig_v = 0;
    initial h_count = 0;
always @ (posedge clk)
    begin
        if (h_count==798)
            begin
                trig_v<=1;
                h_count<=h_count+1;
            end
        else if (h_count==0)
            begin
                trig_v<=0;
            end
        if (h_count<799)
            begin
                h_count <= h_count+1;
            end
        else if (h_count==799)
            begin
                h_count <= 0;
                trig_v<=0;
            end
    end
endmodule
