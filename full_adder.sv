// full adder 

	// "logic", same as "reg" is a data type requires a single driver (forbids multiple drivers). it has 4 states 
	
	// "wire" is a net data object (variable is also a data object)
	// wire can have multiple drivers and associated resolution function (legacy Verilog)
	/*
	// Port declaration
	<port direction> <net type or variable type> <data type> <port name>

	// Internal signal declaration
	<net type or variable type> <data type> <signal name>
	
	If port direction is omitted, it defaults to inout port.
	If net/variable type is omitted for an input port, it defaults to net type: wire
	If net/variable type is omitted for an output port, it depends on the data type.
	If data type is omitted as well, it defaults to net type: wire
	If data type is declared explicitly, it defaults to variable type
	If data type is omitted for any signal or port, it defaults to logic type. (Universal data type!)
	If net/variable type is omitted for an internal signal and is not used in port connections/port mapping, it defaults to variable type.
	*/

module fullAdder (A, B, cin, sum, cout);
	input logic A, B, cin; 
	output logic sum, cout;
	
	assign sum = A ^ B ^ cin;
	assign cout = A&B | cin & (A^B);

endmodule

module fullAdder_testbench();
	logic A, B, cin, sum, cout;
	
	fullAdder dut (A, B, cin, sum, cout);
	
	/*initial begin
	// this could be looped
		A = 0;	B = 0;	cin = 0; #10;
								cin = 1; #10;
					B = 1;	cin = 0; #10;
								cin = 1; #10;
		A = 1;	B = 0;	cin = 0; #10;
								cin = 1; #10;
					B = 1;	cin = 0; #10;
								cin = 1; #10;
	$stop
	end // initial*/
	
	integer i;
	
	initial begin
		for (i = 0; i < 2**3; i++) begin
			{A, B, cin} = i; #10;
		end
	end // initial
	
endmodule

// what is initial begin --> executes once. vs always will always execute
// what is #10 -> delay operation to wait 10 cycles
