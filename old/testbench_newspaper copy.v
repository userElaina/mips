// 
// Maybe there are some bugs in the sample testbench file. :)
// Fix them!
//
// gxp@buaa.edu.cn
//
module  testbench_;	
	//
	reg clock;	
	reg [1:0] coin;	
	reg reset;
	reg [1:0] res;
	wire newspaper;	
	
	// instantiate the controller module
	vend_ctrl qwq(coin,clock,reset,newspaper,res);	
	
	// Display the output
	initial
	begin
		$display("\t\t(Time Reset Newspaper Coin Res)\n");	
		$monitor("%d %d %d %d %d",$time,reset,newspaper,coin,res);	
	end
		
	// 
	initial
	begin
		clock=0;	
		coin=0;
		res=0;
		reset=1;						   // reset the controller
		#40 
		reset=0;	
		
		@(negedge clock);					  // wait for negtive edge of the first clock
		
		// test the case of 3 5-cent coins
		#120 coin=1; #40 coin=0;		  // 1st 5-cent coin
		#80 coin=1; #40 coin=0;		  // 2nd 5-cent coin
		#80 coin=1; #40 coin=0;		  // 3rd 5-cent coin
		
		// test the case of 5 --> 10
		#120 coin=1; #40 coin=0;		 // 1st 5-cent coin
		#80 coin=2; #40 coin=0;		  // 2nd 10-cent coin

		#120 coin=2; #40 coin=0;
		#80 coin=2; #40 coin=0;
		
		/*
			You should write other test cases here to make sure 
			that all cases have been tested!
		 */
		
		#80 $finish;
	end
	
	always  
		#20 clock=~clock;	

endmodule