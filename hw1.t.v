`include "hw1.v"

module demorgan_test ();

	// Instantiate device/module under test
	reg A, B;	// Primary test inputs
	wire AandB, nAandB; // ~(AB) test outputs
	wire nA, nB, nAornB; // ~A + ~B test outputs
	wire AorB, nAorB; // ~(A + B) test outputs
	wire nAandnB;	// (~A) * (~B) test outputs (some also in )

	demorgan dut(A, B, // inputs
			AandB, nAandB, // ~(AB)
			nA, nB, nAornB, // ~A + ~B
			AorB, nAorB, // ~(A or B)
			nAandnB // (~A) * (~B)
		);

	// Run sequence of test stimuli
	initial begin
		$display("HW1 14-10-18");
		$display("");

		// Intro: ~(AB) == ~A + ~B
		$display("Truth tables to show that ~(AB) == ~A + ~B");
		$display("");
		// ~(AB)
		$display("~(AB)");
		$display("A B | AB | ~(AB)"); // Prints header for truth table
		A=0;B=0; #1				// Set A and B, wait for update (#1)
		$display("%b %b |  %b |   %b ", A,B, AandB, nAandB);
		A=0;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |  %b |   %b ", A,B, AandB, nAandB);
		A=1;B=0; #1				// Set A and B, wait for new update
		$display("%b %b |  %b |   %b ", A,B, AandB, nAandB);
		A=1;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |  %b |   %b ", A,B, AandB, nAandB);
		$display("");

		// ~A + ~B
		$display("~A + ~B");
		$display("A B | ~A ~B | ~A+~B ");	// Prints header for truth table
		A=0;B=0; #1				// Set A and B, wait for update (#1)
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
		A=0;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
		A=1;B=0; #1				// Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
		A=1;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
		$display("");

		// Intro: ~(A + B) == (~A) * (~B)
		$display("Truth tables to show that ~(A + B) == (~A) * (~B)");
		$display("");
		// ~(A + B)
		$display("~(A + B)");
		$display("A B | A+B | ~(A+B)");// Prints header for truth table
		A=0;B=0; #1				// Set A and B, wait for update (#1)
		$display("%b %b |   %b |     %b ", A,B, AorB, nAorB);
		A=0;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |   %b |     %b ", A,B, AorB, nAorB);
		A=1;B=0; #1				// Set A and B, wait for new update
		$display("%b %b |   %b |     %b ", A,B, AorB, nAorB);
		A=1;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |   %b |     %b ", A,B, AorB, nAorB);

		// (~A) * (~B)
		$display("");
		$display("(~A) * (~B)");
		$display("A B | ~A ~B | ~A~B ");	// Prints header for truth table
		A=0;B=0; #1				// Set A and B, wait for update (#1)
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
		A=0;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
		A=1;B=0; #1				// Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
		A=1;B=1; #1				// Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
	end
endmodule	// End demorgan_test
