module timer_counter_inp_tb();
parameter F = 16;

reg clk, reset_n, enable;
reg [F-1:0] final_value;
wire done;

timer_counter_inp #(.N(F)) uut(
       .clk(clk),
       .reset_n(reset_n),
       .enable(enable),
       .final_value(final_value),
       .done(done)
);
localparam T = 20;
always
begin
    clk = 1'b0;
    #(T/2)
     clk = 1'b1;
    #(T/2);
end

initial 
begin
reset_n = 1'b0;
#T
final_value = 256;
reset_n = 1'b1;
enable = 1'b1;
#(final_value * T * 3);
final_value = 49_999;

#(final_value * T * 2);
$stop;
end
endmodule
