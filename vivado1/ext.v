module ext(
	input wire [15:0] A,
	input wire Extop,
	output reg [31:0] B
);
	parameter _={16{1'b0}};
	always @(*)
	begin
		case(Extop)
			0:B={_,A};
			1:B={A,_};
		endcase
		$display("ext: %d %d",A,B);
	end
endmodule