module demorgan
(
	input A,	// Single bit inputs
	input B,
	// ~(AB)
	output AandB,
	output nAandB,
	// ~A + ~B
	output nA,
	output nB,
	output nAornB,
	// ~(A + B)
	output AorB, // Output intermediate or-ed inputs
	output nAorB, // ~(A + B)
	// (~A) * (~B)
	// some outputs (nA and nB) are defined first for ~A + ~B
	output nAandnB	// Single bit output, (~A) * (~B)
);

	// ~(AB)
	wire AandB;
	and andgateAB(AandB, A, B); // AND gate produces AandB from A and B
	not AandBinv(nAandB, AandB); // Inverter produces nAandB from AandB
	// ~A + ~B
	wire nA;
	wire nB;
	not Ainv(nA, A);	// Top inverter is named Ainv, takes signal A as input and produces signal nA
	not Binv(nB, B);
	or orgatenAnB(nAornB, nA, nB);
	// ~(A + B)
	wire AorB;
	or orgateAB(AorB, A, B); // OR gate produces AorB from A and B
	not AorBinv(nAorB, AorB); // Inverter produces nAorB from AorB
	// (~A) * (~B)
	// some inputs not reproduced here because defined first by ~A + ~B
	and andgatenAnB(nAandnB, nA, nB);	// AND gate produces nAandnB from nA and nB

endmodule
