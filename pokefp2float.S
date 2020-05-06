	.irch	armv6
	.cpu	cortex-a53
	.equ	NUL, 0
	.equ	FP_OFFSET, 32 		// (# of regs saved - 1) * 4




	.global	pokeFP2float	

pokeFP2float:
	// pokeFP2float's prolog (do not edit)
	push    {r4-r10, fp, lr}   	// using SP to save preserved regs that might be modified
	add  	fp, sp, #FP_OFFSET	// using SP to update FP to the new stackframe

  //=================== YOUR CODE GOES IN THE SECTION BELOW ===================//
	//if then else
	CMP R0, #0x80     // if (R0 == #0x80){
	BEQ funC          // .
	CMP R0, #0x00     // if (R0 == #0x00){
	BEQ funC          // .  
	
	MOV R4, #0x80     // R4 = #0x80
	AND R5, R0, R4    // R5 = (R0 && R4) 
	MOV R6, #0x70     // R6 = #0x70
	AND R7, R0, R6    // R7 = (R0 && R6)
	MOV R8, #0x0f     // R8 = #0x0f
	AND R9, R0, R8    // R9 = (R0 && R8)
	
	LSR R7, R7, #4    // R7 = R7 >> 4
	SUB R7, R7, #3    // R7 = R7 - 3
	ADD R7, R7, #127  // R7 = R7 +127 
	
	LSL R5,R5,#24     // R5 = R5 << 24
	LSL R7,R7,#23     // R7 = R7 << 23
	LSL R9,R9,#19     // R9 = R9 << 19 

	
	ORR R5, R5, R7    // R5 = R5 || R7
	ORR R5, R5, R9    // R5 = R5 || R9 
	MOV R0, R5        // R0 = R5 
	
	B DONE	          // else 
	
	funC:
		BL zeroPokeFP2float // . 

	DONE:		  // }
		
	


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

	MOV R5, #0x80   // R5 = #0x80
	AND R5, R0, R5  // R5 = R0 + R5
	LSL R5, #24     // R5 << 24
	MOV R0, R5	// R0 = R5  


  //===========================================================================//

	// zeroPokeFP2float's epilog (do not edit)
	sub	sp, fp, #FP_OFFSET	// using FP to restore SP to the old stackframe
	pop     {r4-r10, fp, lr}   	// using SP to restore regs saved in prolog
	bx 	lr                      // using LR to update PC and thereby return
