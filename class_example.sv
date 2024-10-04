// issue is that classes are not able to compile in quartus (but can be simulated?)

class myPacket;
	bit [2:0] header;
	bit encode;
	bit [2:0] mode;
	bit [7:0] data;
	bit 	stop;
	
	function new (bit [2:0] header = 3'h1, bit[2:0] mode = 5);
		this.header = header;
		this.encode = 0;
		this.mode = mode;
		this.stop = 1;
	endfunction
	
	function display();
		$display("Header = 0x%0h, Encode = %0b, Mode = 0x%0h, Stop = %0b", this.header, this.encode, this.mode, this.stop);
	endfunction
endclass

// function new() is the constructor and is called upon object creation
	// function new() has default arguments
// this keyword for current class
// display is a function


// inheritance to subclass

class networkPkt extends myPacket;
	bit parity;
	bit [1:0] crc;
	
	function new();
		super.new(); // call to base class constructor, no arguments passed in this example
		this.parity = 1;
		this.crc = 3;
	endfunction
	
	function display();
		super.display();
		$display("Parity = %0b, CRC = 0x%0h", this.parity, this.crc);
	endfunction
endclass

// call to  classes here

module tb_top;
	myPacket pkt0, pkt1;
	
	initial begin
		pkt0 = new(3'h2, 2'h3);
		pkt0.display();
		
		pkt1 = new();
		pkt1.display();
	end // initial
endmodule