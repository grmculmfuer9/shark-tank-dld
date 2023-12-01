`timescale 1ns / 1ps
// Code your design here
module top_level_vga(
  input clk, //clk_div input that we generated in our previous lab to manipulate the frequency to be manageable by the FPGA
  input start,
  output h_sync,
  output v_sync,
  output [3:0] red, // 3 RGB inputs which can be manipulated to create any color on screen.
  output [3:0] blue,
  output [3:0] green,
  input [1:0] buttons,
  input CLK100MHZ,
  input vauxp6,
  input vauxn6,
  input vauxp7,
  input vauxn7,
  input vauxp15,
  input vauxn15,
  input vauxp14,
  input vauxn14,
//  output reg [15:0] LED,
  wire [15:0] LED,
  output [3:0] an,
  output dp,
  output [6:0] seg
);
  wire clk_d, trig_v, video_on;
  wire [9:0] h_count, v_count, x_loc, y_loc; //we define multiple wires to connect our modules in our Top level module
  wire [2:0] state;
  wire [9:0] bird_x, bird_y;
  wire [9:0] pipe1_x, pipe2_x, pipe3_x, pipe1_y, pipe2_y, pipe3_y;
  wire reset, reset2;
  wire [3:0] Vrx;
  wire [3:0] Vry;
  
  XADCdemo joy(clk, vauxp6, vauxn6, vauxp7, vauxn7, vauxp15, vauxn15, vauxp14, vauxn14, LED, an, dp, seg, Vrx, Vry);
  clock_divider c(clk, clk_d);
  h_counter h(clk_d, h_count, trig_v);
  v_counter v(clk_d, trig_v, v_count);
  vga_sync vga(h_count, v_count, h_sync, v_sync, video_on, x_loc, y_loc);
//  mover mov(clk_d, buttons, reset2, bird_x, bird_y, pipe1_x, pipe1_y, pipe2_x, pipe2_y, pipe3_x, pipe3_y);
  mover mov(clk_d, Vry, reset2, bird_x, bird_y, pipe1_x, pipe1_y, pipe2_x, pipe2_y, pipe3_x, pipe3_y);
  pixel_gen pixel(x_loc, y_loc, clk_d, start, video_on, bird_x, bird_y, pipe1_x, pipe1_y, pipe2_x, pipe2_y, pipe3_x, pipe3_y, red, blue, green); //here we call each module and connect it with each other using our pre defined wires and then eventually take the output out.
endmodule
