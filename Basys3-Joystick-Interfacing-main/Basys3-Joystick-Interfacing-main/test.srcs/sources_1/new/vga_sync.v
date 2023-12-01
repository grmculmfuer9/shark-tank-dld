`timescale 1ns / 1ps

module vga_sync(
    input [9:0]h_count,
    input [9:0]v_count,
    output h_sync,
    output v_sync,
    output video_on,
    output [9:0]x_loc,
    output [9:0]y_loc
    );
    
    //horizontal
    localparam HD = 640;
    localparam HF = 16;
    localparam HR = 96;
    localparam HB = 48;
    
    //vertical
    localparam VD = 480;
    localparam VF = 10;
    localparam VR = 2;
    localparam VB = 33;
    
//    reg video_on;
//    reg h_sync;
//    reg v_sync;
//    reg [9:0]x_loc;
//    reg [9:0]y_loc;
    
//    always begin
//    video_on <= h_count < HD ? (v_count <VD ? 1:0):0;
//    h_sync <= (h_count < (HD+HF)) ? 1: (h_count >= (HD+HF+HR)) ? 1:0;
//    v_sync <= (v_count < (VD+VF)) ? 1: (v_count >= (VD+VF+VR)) ? 1:0;
//    x_loc <= h_count;
//    y_loc <= v_count; 
//    end

    assign v_sync = (v_count < (VD+VF)) | (v_count >= (VD+VF+VR)); 
    assign h_sync = (h_count < (HD+HF)) | (h_count >= (HD+HF+HR));
    assign video_on = (h_count < HD) & (v_count<VD);
    
    assign x_loc = h_count;
    assign y_loc = v_count;
    
  
endmodule
