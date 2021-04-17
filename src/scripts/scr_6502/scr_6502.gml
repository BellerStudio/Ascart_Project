// https://www.obelisk.me.uk/6502/

#macro MAX_MEM 1024*64

globalvar MEM;
MEM = {
	
	Data : array_create(MAX_MEM),
	
	Initialise : function() {
		for (var i = 0; i < MAX_MEM; i++) {
			
			Data[i] = 0;
		}
	},
	
	// Read 1 byte
	///@function operator(Address)
	operator : function(Address) {
		
		return Data[Address];
	}
}


globalvar CPU;
CPU = {

	PC : 0,  // Program Counter (0 - 65535)
	SP : 0,  // Stack Pointer (0 - 65536)
	
	// Registers (0 - 255)
	A : 0,
	X : 0,
	Y : 0,
	
	// Status Flags			   1		0
	C : 0,  // Carry Flag	-> True,	False
	Z : 0,  // Zero Flag	-> Zero,	Not Zero
	I : 0,  // IRQ Disable	-> Disable, Enable
	D : 0,  // Decimal Mode -> True,	False
	B : 0,  // Break		-> Break,	No Break
	V : 0,  // Overflow		-> True,	False
	N : 0,  // Negative		-> ----     +++++
	
	Reset : function(memory) {
		
		PC = $FFFC;
		SP = $0100;
		C = 0; Z = 0; I = 0; D = 0; B = 0; V = 0; N = 0;
		A = 0; X = 0; Y = 0;
		
		memory.Initialise();
	},
	
	// Cycles are passed using an array (for reference)
	FetchByte : function(memory, Cycles) {
		
		var Data = memory[PC];
		PC++;
		Cycles[@ 0]--;
		return Data;
	},
	
	Execute : function(memory, Cycles) {
		
		while (Cycles > 0) {
			
			Ins = FetchByte(memory, Cycles);
		}
	}
	
}







































