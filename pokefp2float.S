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





  //===========================================================================//

	// zeroPokeFP2float's epilog (do not edit)
	sub	sp, fp, #FP_OFFSET	// using FP to restore SP to the old stackframe
	pop     {r4-r10, fp, lr}   	// using SP to restore regs saved in prolog
	bx 	lr                      // using LR to update PC and thereby return
