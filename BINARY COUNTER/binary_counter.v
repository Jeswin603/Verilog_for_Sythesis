/*Model parameterized N bit binary up-down counter with synchronus preset and preclear controls. the counting is synchronized to the rising edge of a clock*/

module Bbinary_counter#( 
parameter Nbits = 2
) 
(
	input [Nbits-1:0] DataIn,
	output[Nbits-1:0] Q,Qn
);


reg [Nbits-1:0] counter;

always @(posedge clk)
	if(PresetClear)
		counter <=0;
	else if(LoadData)
		counter <= DataIn;
	else if(UpDown)
		counter <= counter + 1;
	else
		counter <= counter - 1;
assign Q 	= counter;
assign Qn	= ~counter;
endmodule
