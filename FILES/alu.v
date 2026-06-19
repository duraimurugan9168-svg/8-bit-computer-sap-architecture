module alu (
    input add,
    input sub,
    input xra,
    input xnra,
    input ana,
    input ora,
    input diva,
    input alo,
    input [7:0] a_out,
    input [7:0] b_out,
    output [7:0] bus_out,
    output carry_flag,
    output zero_flag
);
reg [8:0] result;
always @(*) begin
    result = 9'd0;
    if (add)
        result = {1'b0, a_out} + {1'b0, b_out};
    else if (sub)
        result = {1'b0, a_out} - {1'b0, b_out};
    else if (xra)
        result = {1'b0, (a_out ^ b_out)};
    else if (xnra)
        result = {1'b0, (a_out ~^ b_out)};
    else if (ana)
        result = {1'b0, (a_out & b_out)};
    else if (ora)
        result = {1'b0, (a_out | b_out)};
    else if (diva)
        result = (b_out != 8'd0) ?
                 {1'b0, (a_out / b_out)} :
                 9'd0;
end
assign bus_out = (alo) ? result[7:0] : 8'bzzzz_zzzz;
assign carry_flag = result[8];
assign zero_flag  = (result[7:0] == 8'd0);

endmodule
