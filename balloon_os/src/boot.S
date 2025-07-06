.global _vector_table

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

_boot_handler:
    b _start

_undef_handler:
	# unhandled
	b _undef_handler

_svc_handler:
	push {lr}
	bl intr_svc
	pop {lr}
	bx lr

_pf_abort_handler:
	# unhandled
	b _pf_abort_handler

_data_abort_handler:
	# unhandled
	b _data_abort_handler

_irq_handler:
	push {lr}
	bl intr_irq
	pop {lr}
	bx lr

_fiq_handler:
	push {lr}
	bl intr_fiq
	pop {lr}
	bx lr

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
	.long	__stack

_start:
	# Set VBAR reg to vector table address, since we're mapped to 0x100000 instead of 0x0
	ldr	r0, =vector_table_addr
	mcr	p15, 0, r0, c12, c0, 0

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

	/* set stack pointer */
	ldr	r13,.Lstack		/* stack address */

    /* run global constructors */
    bl __libc_init_array

	/* Let her rip */
	bl	kernel_main

    /* Cleanup global constructors */
    bl __libc_fini_array

.Lexit:
	b .Lexit

.Lstart:
	.size	_start,.Lstart-_start
