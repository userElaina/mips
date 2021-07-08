module alu(
	input wire [31:0] a,
	input wire [31:0] b,
	input wire [1:0] con,
	output reg [31:0] c
);

	parameter _add=2'b11;
	parameter _sub=2'b10;
	parameter _and=2'b00;
	parameter _or=2'b01;

	always @(*)
	begin
		case(con)
			_add:
			begin
				c=a+b;
				$display("alu:%d+%d=%d",a,b,c);
			end
			_sub:
			begin
				c=a-b;
				$display("alu:%d-%d=%d",a,b,c);
			end
			_and:
			begin
				c=a&b;
				$display("alu:%d&%d=%d",a,b,c);
			end
			_or:
			begin
				c=a|b;
				$display("alu:%d|%d=%d",a,b,c);
			end
		endcase
	end

endmodule

