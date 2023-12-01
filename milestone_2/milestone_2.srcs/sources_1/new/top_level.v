`timescale 1ns / 1ps

module toplevel(clk,h_count, v_counter);
input clk;
output [9:0] h_count;
output [9:0] v_counter;
wire clk_d;
wire trig_v;

clock_divider cd1(clk, clk_d);
h_counter h_cnt(clk_d, h_count, trig_v);
v_counter v_cnt(clk_d, trig_v, v_counter);


endmodule
