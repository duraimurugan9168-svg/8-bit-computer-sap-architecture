module program_counter (
    input clk,
    input reset,
    input co,              
    input cl,              
    input ce,              
    input [3:0] bus_in,
    output [3:0] bus_out,
    output reg [3:0] pc_out
);
always @(posedge clk or posedge reset)
begin
    if (reset)
        pc_out <= 4'b0000;       
    else if (cl)
        pc_out <= bus_in;        
    else if (ce)
        pc_out <= pc_out + 1'b1;  
end
assign bus_out = (co) ? pc_out : 4'bzzzz;
endmodule
