	.arch	armv6
	.cpu	cortex-a53
	.equ	NUL, 0
	.equ	FP_OFFSET, 32 		// (# of regs saved - 1) * 4




	.global	pokeFP2float	

pokeFP2float:
	// pokeFP2float's prolog (do not edit)
	push    {r4-r10, fp, lr}   	// using SP to save preserved regs that might be modified
	add  	fp, sp, #FP_OFFSET	// using SP to update FP to the new stackframe

  //=================== YOUR CODE GOES IN THE SECTION BELOW ===================//
	
	CMP R0, #0x80  //if r0 == -0
	BEQ funC
	CMP R0, #0x00  //else if r0==0
	BEQ funC
	
	MOV R4, #0x80    // assign r4 to be a -0
	AND R5, R0, R4  // this should get us the signe bit 
	MOV R6, #0x70
	AND R7, R0, R6  // this operation is to extract the expo
	MOV R8, #0x0f
	AND R9, R0, R8  // this operation is to extract the mantissa
	
	LSR R7, R7, #4    // shift the bist 4 to the begining
	SUB R7, R7, #3    // subtract 3 from the expo
	ADD R7, R7, #127   // add  127 to the result 
	
	LSL R5,R5,#24       // sign sheft the sign bit all the way to the front MSB
	LSL R7,R7,#23       // expo sheft the exponent all the way to one before the sign 
	LSL R9,R9,#19       // mentissa sheft the mentissa all the way to one before the expo 

	
	ORR R5, R5, R7    // overlay the sign and expo 
	ORR R5, R5, R9    // overlay sign exp with mantissa 
	MOV R0, R5       // return the IEEE 
	
	B DONE		//skip over the funciton
	
	funC:
		BL zeroPokeFP2float

	DONE:
		
	


  //===========================================================================//

	// pokeFP2float's epilog (do not edit)
	sub	sp, fp, #FP_OFFSET	// using FP to restore SP to the old stackframe
	pop     {r4-r10, fp, lr}   	// using SP to restore regs saved in prolog
	bx 	lr                      // using LR to update PC and thereby return




	.global zeroPokeFP2float

zeroPokeFP2float:
	// zeroPokeFP2float's prolog (do not edit)
	push    {r4-r10, fp, lr}   	// using SP to save preserved regs that might be modified
	add	fp, sp, #FP_OFFSET	// using SP to update FP to the new stackframe

  //=================== YOUR CODE GOES IN THE SECTION BELOW ===================//

	MOV R5, #0x80   // create an a new immediate reg
	AND R5, R0, R5 // take the input from r0
	LSL R5, #24   // shift the sign bit all the way to the front
	MOV R0, R5	// return the IEEE


  //===========================================================================//

	// zeroPokeFP2float's epilog (do not edit)
	sub	sp, fp, #FP_OFFSET	// using FP to restore SP to the old stackframe
	pop     {r4-r10, fp, lr}   	// using SP to restore regs saved in prolog
	bx 	lr                      // using LR to update PC and thereby return
