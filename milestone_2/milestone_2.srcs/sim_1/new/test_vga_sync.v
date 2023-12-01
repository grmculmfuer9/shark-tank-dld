`timescale 1ns / 1ps

module test_vga_sync();
    reg [9:0] h_count;
    reg [9:0] v_count;
    wire h_sync;
    wire v_sync;
    wire video_on;
    wire [9:0] x_loc;
    wire [9:0] y_loc;
    
    vga_sync vga1 (h_count,v_count, h_sync,v_sync,video_on,x_loc,y_loc);
    initial
    begin
    h_count = 10'b1001111111;
    v_count = 10'b0111011111;
    
    #10
    
    h_count = 10'b1010111100;
    v_count = 10'b0111101010;
    
    
    end
endmodule