module ifu(
	input wire clk,
	input wire reset,
	input wire pc_w,
	input wire pc_a,
	input wire b_succ,
	input wire [31:0] wd,
	output reg [31:0] od,
	output reg [31:0] pc
);

	reg [31:0] M[0:31];
	reg [31:0] lpc;

	// assign od=M[pc[6:2]];

	wire [31:0] pc4;
	assign pc4=pc+4+((pc_a&&b_succ)?(wd*4):0);

	integer sclk=0;
	parameter mo=6;
	wire pclk1;
	assign pclk1=(sclk==1);
	wire pclk5;
	assign pclk5=(sclk==5);
	always @(posedge clk)
	begin
		sclk=(sclk+1)%mo;	
	end

	always @(posedge pclk1) 
	begin
		od=M[pc[6:2]];
	end

	always @(posedge pclk5)
	begin
		if(reset)
		begin
			pc=0;
			M[0]=32'h00228021;
			M[1]=32'h00228823;
			M[2]=32'h34320080;
			M[3]=32'h8c330002;
			M[4]=32'hac310002;
			M[5]=32'h3c14abcd;
			M[6]=32'h10210004;
			M[7]=32'hffffffff;
			M[8]=32'h1042ffe0;
		end
		else
		begin
			$display("ifu: pc%d od0x%h",pc,od);
			pc=pc_w?wd:pc4;
		end
	end
	
endmodule