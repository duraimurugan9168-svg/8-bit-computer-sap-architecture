`timescale 1ns / 1ps

module instruction_register(
input clock,reset,ii,io,
input [7:0]bus_in,
output reg[7:4]opcode,
output reg[3:0]operand,
output [3:0]cu_in,
output [3:0]bus_out
);
always@(posedge clock or posedge reset)
begin
  if(reset)
    begin
       opcode <= 4'b0000;
       operand <= 4'b0000;
    end
  else if(ii)
    begin
       opcode <= bus_in[7:4];
       operand <= bus_in[3:0];
    end
end
assign cu_in = opcode ;
assign bus_out =(io) ? operand : 4'bzzzz;

endmodule
