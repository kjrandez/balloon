.arm

.global call_svc
.global get_cpsr
.global set_cpsr
.global hang

.section .text

get_cpsr:
	mrs r0, cpsr
	bx lr

set_cpsr:
	msr cpsr, r0
	bx lr

call_svc:
	push {lr}

	# R0 - call
	# R1 - param 0
	# R2 - param 1
	svc 0

	# R0 - result

	pop {lr}
	bx lr

hang:
	b hang
