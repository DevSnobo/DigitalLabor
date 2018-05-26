//This design can be synthesized by either Synplify or LeonardoSpectrum.
//The source code contains attributes for both synthesis tools.

// Simple TX Processor 10B12B
//
// Target device: LX256V-5F484C
//
// Parallel 10-bit Transmit data enters TX, 
// The HSI encodes to 10B12B standard and converts to Serial Data stream and outputs.
//
// The TX is assigned to SERDES Block HSI3B
//


module tx_10b12b_vlog (TxD,refclk, sout_p,sout_n,cslock);


	input 	[9:0] 	TxD;
	input 		refclk;

	output sout_p	/* synthesis loc = "PF15"*/;
	output sout_n	/* synthesis loc = "PF14"*/;
	output cslock;

	//exemplar attribute sout_p loc PF15
	//exemplar attribute sout_n loc PF14

	wire sout;

	LVDSOUT I1 (.I(sout), .P_OUT(sout_p), .N_OUT(sout_n));
	
	defparam I2.in_freq = "55.00";

TX_10B12B I2 (
	.TXD0(TxD[0]),
	.TXD1(TxD[1]),
	.TXD2(TxD[2]),
	.TXD3(TxD[3]),
	.TXD4(TxD[4]),
	.TXD5(TxD[5]),
	.TXD6(TxD[6]),
	.TXD7(TxD[7]),
	.TXD8(TxD[8]),
	.TXD9(TxD[9]),
	.REFCLK(refclk),
	.SOUT(sout),
	.CSLOCK(cslock)
	);

// exemplar attribute I2 in_freq 55.00

endmodule
