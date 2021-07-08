module dm(
	input wire [31:0] D,
	input wire Memtoreg,
	input wire Memwrite,
	input wire Clk,
	input wire Reset,
	input wire [4:0] A,
	output reg [31:0] out_DM
);
	
	reg [31:0] M[0:31];
	
	parameter _o={32{1'b0}};
	integer i; 

	always @(posedge Clk)
	begin
		if(Reset)
		begin
			for(i=0;i<=31;i=i+1)
				M[i]<=_o;
		end
		if(Memwrite)
			M[A]=D;
		if(Memtoreg)
			out_DM=M[A];
		$display("dm: Mw%d A%d out%h",Memwrite,A,out_DM);
	end

endmodule