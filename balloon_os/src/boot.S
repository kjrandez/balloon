.global _vector_table
.global _stack
.global _irq_stack
.global _svc_stack

.section .vectors

_vector_table:
	B	_boot_handler
	B	_undef_handler
	B	_svc_handler
	B	_pf_abort_handler
	B	_data_abort_handler
	NOP
	B	_irq_handler
	B	_fiq_handler

.section .boot,"ax"

.set vector_table_addr, _vector_table
.set CRValMmuCac,	0b01000000000101 // Enables IDC and MMU
.set SVC_stack,		_svc_stack
.set IRQ_stack,		_irq_stack
.set SYS_stack,		_stack
.set IRQ_MODE,		0x12
.set SVC_MODE, 		0x13
.set SYS_MODE, 		0x1F

_boot_handler:
    b _start

_undef_handler:
	# unhandled
	b _undef_handler

_svc_handler:
	// preserve registers including original PC, which was auto-stored in LR
	push {r0-r12, lr} // +14

	// temporarily switch to previous mode to record shadowed registers SP, LR
	cps #SYS_MODE
	mov r0, sp
	mov r1, lr
	cps #SVC_MODE

	// preserve SP, LR
	push {r0}
	push {r1} // +2

	// save current SPSR (returning cpu execution state)
	mrs r0, spsr
	push {r0} // + 1

	// pass stack pointer as arg 0 pointing to the list of preserved registers (17 words)
	mov r0, sp
	bl intr_svc

	// restore saved SPSR
	pop {r0} // -1
	msr spsr, r0

	// fetch SP, LR
	pop {r1} // -2
	pop {r0}

	// temporarily switch to previous mode to restore shadowed registers
	cps #SYS_MODE
	mov lr, r1
	mov sp, r0
	cps #SVC_MODE

	// restore registers
	pop {r0-r12, lr} // -14

	// return, note the "s" suffix is restoring SPSR to CPSR
	movs pc, lr

_pf_abort_handler:
	# unhandled
	b _pf_abort_handler

_data_abort_handler:
	# unhandled
	b _data_abort_handler

_irq_handler:
	// when an IRQ has occurred we need to return to one instruction before the saved PC
	sub lr, lr, #4

	// preserve registers including original PC, which was auto-stored in LR
	push {r0-r12, lr} // +14

	// temporarily switch to previous mode to record shadowed registers SP, LR
	cps #SYS_MODE
	mov r0, sp
	mov r1, lr
	cps #IRQ_MODE

	// preserve SP, LR
	push {r0} // +2
	push {r1}

	// save current SPSR (returning cpu execution state)
	mrs r0, spsr
	push {r0} // + 1

	// pass stack pointer as arg 0 pointing to the list of preserved registers (17 words)
	mov r0, sp
	bl intr_irq

	// restore saved SPSR
	pop {r0} // -1
	msr spsr, r0

	// fetch SP, LR
	pop {r1} // -2
	pop {r0}

	// temporarily switch to previous mode to restore shadowed registers
	cps #SYS_MODE
	mov lr, r1
	mov sp, r0
	cps #IRQ_MODE

	// restore registers
	pop {r0-r12, lr} // -14

	// return, note the "s" suffix is restoring SPSR to CPSR
	movs pc, lr

_fiq_handler:
	# unhandled
	b _fiq_handler

.section ".got2","aw"
.align	2

	.text
.Lsbss_start:
	.long	__sbss_start

.Lsbss_end:
	.long	__sbss_end

.Lbss_start:
	.long	__bss_start

.Lbss_end:
	.long	__bss_end

.Lstack:
	.long	_stack

_start:
	ldr r0, =SYS_stack
	ldr r0, =SVC_stack
	ldr r0, =IRQ_stack

	// Set VBAR reg to vector table address, since we're mapped to 0x100000 instead of 0x0
	ldr	r0, =vector_table_addr
	mcr	p15, 0, r0, c12, c0, 0

	// Enable mmu, icahce and dcache (apparently)
	ldr	r0,=CRValMmuCac
	mcr	p15,0,r0,c1,c0,0 	// Enable cache and MMU
	dsb 					// dsb allow the MMU to start up
	isb						// isb flush prefetch buffer

	// Set up IRQ Mode Stack
	cps #IRQ_MODE
	ldr	r13, =IRQ_stack		// set stack pointer for this mode

	// Set up SVC Mode Stack
	cps #SVC_MODE
	ldr	r13, =SVC_stack

	// Set up SYS (Current) Mode Stack
	cps #SYS_MODE
	ldr	r13, =SYS_stack

	mov	r0, #0

	/* clear sbss */
	ldr 	r1,.Lsbss_start		/* calculate beginning of the SBSS */
	ldr	r2,.Lsbss_end		/* calculate end of the SBSS */

.Lloop_sbss:
	cmp	r1,r2
	bge	.Lenclsbss		/* If no SBSS, no clearing required */
	str	r0, [r1], #4
	b	.Lloop_sbss

.Lenclsbss:
	/* clear bss */
	ldr	r1,.Lbss_start		/* calculate beginning of the BSS */
	ldr	r2,.Lbss_end		/* calculate end of the BSS */

.Lloop_bss:
	cmp	r1,r2
	bge	.Lenclbss		/* If no BSS, no clearing required */
	str	r0, [r1], #4
	b	.Lloop_bss

.Lenclbss:

    // run global constructors
    bl __libc_init_array

	// run kernel
	bl	kernel_main

    // cleanup global constructors
    bl __libc_fini_array

.Lexit:
	b .Lexit

.Lstart:
	.size	_start,.Lstart-_start
