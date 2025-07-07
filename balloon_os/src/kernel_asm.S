.arm

.global call_svc
.global get_cpsr
.global set_cpsr

.section .text

call_svc:
	push {lr}

	# R0 passed and returned
	svc 0

	pop {lr}
	bx lr

get_cpsr:
	mrs r0, cpsr
	bx lr

set_cpsr:
	msr cpsr, r0
	bx lr
