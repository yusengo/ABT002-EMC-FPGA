module emc_io(input clk_10M,input n_rst,
output reg[3:0] F_Alarm,output reg[3:0] F_Home,output reg[7:0] F_LimitPN,
output reg[15:0] F_IO_Input,input [15:0] F_IO_Output,input[15:0] F_IO_RSEN,//FPGA
//
input[3:0] EX_Alarm,input [3:0] EX_Home,input [7:0] EX_LimitPN,input [15:0] EX_IO_Input,
output reg[15:0] EX_IO_Output,output reg[3:0] EX_Reset,output reg[3:0] EX_Enable);//BOARD

//EX_LimitPN [7:0]	: 3+- 2+- 1+- 0+- 
always@(posedge clk_10M or negedge n_rst)
begin
	if(!n_rst)
	begin
		EX_IO_Output[15:0] 	<= 16'd0;
		F_Home[3:0] 			<= 4'd0;
		F_LimitPN[7:0] 		<= 8'd0;
		F_IO_Input[15:0]		<= 16'd0;
		EX_Enable[3:0]			<= 4'd0;
		EX_Reset[3:0]			<= 4'd0;
		F_Alarm[3:0]			<= 4'd0;
	end
	else
	begin
		EX_IO_Output[15:0] 	<= F_IO_Output[15:0];
		F_Home[3:0] 			<= EX_Home[3:0];
		F_LimitPN[7:0] 		<= EX_LimitPN[7:0];
		F_IO_Input[15:0]		<= EX_IO_Input[15:0];
		EX_Enable[3:0]			<= F_IO_RSEN[3:0];
		EX_Reset[3:0]			<= F_IO_RSEN[7:4];
		F_Alarm[3:0]			<= EX_Alarm[3:0];
	end
	
end


endmodule
