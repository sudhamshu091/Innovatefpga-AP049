
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_NANO_ADC(

	//////////// ADC //////////
	output		          		ADC_CONVST,
	output		          		ADC_SCK,
	output		          		ADC_SDI,
	input 		          		ADC_SDO,

	//////////// ARDUINO //////////
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,

	//////////// CLOCK //////////
	input 		          		FPGA_CLK1_50,
	input 		          		FPGA_CLK2_50,
	input 		          		FPGA_CLK3_50,

	//////////// HDMI //////////
	inout 		          		HDMI_I2C_SCL,
	inout 		          		HDMI_I2C_SDA,
	inout 		          		HDMI_I2S,
	inout 		          		HDMI_LRCLK,
	inout 		          		HDMI_MCLK,
	inout 		          		HDMI_SCLK,
	output		          		HDMI_TX_CLK,
	output		    [23:0]		HDMI_TX_D,
	output		          		HDMI_TX_DE,
	output		          		HDMI_TX_HS,
	input 		          		HDMI_TX_INT,
	output		          		HDMI_TX_VS,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [7:0]		LED,

	//////////// SW //////////
	input 		     [3:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================
DE10_NANO_QSYS u0 (
        .clk_clk                        (FPGA_CLK1_50),     // clk.clk
        .reset_reset_n                  (KEY[0]),           // reset.reset_n
	.sw_external_connection_export  (counter[24:23]),     // sw_external_connection.export
        .adc_ltc2308_conduit_end_CONVST (ADC_CONVST),       // adc_ltc2308_conduit_end.CONVST
        .adc_ltc2308_conduit_end_SCK    (ADC_SCK),          //.SCK
        .adc_ltc2308_conduit_end_SDI    (ADC_SDI),          //.SDI
        .adc_ltc2308_conduit_end_SDO    (ADC_SDO)           //.SDO
    );

reg [24: 0] counter;
always @(posedge FPGA_CLK1_50 or posedge KEY[0]) begin
    if (KEY[0]) begin
        counter <= 0;
    end

	else if (counter == 16777210) begin
        counter <= 0;
    end
    else begin
        counter <= counter + 1'b1;
	end
end
endmodule
