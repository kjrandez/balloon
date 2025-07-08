.arm

.global call_svc
.global get_cpsr
.global set_cpsr

.section .text

get_cpsr:
	mrs r0, cpsr
	bx lr

set_cpsr:
	msr cpsr, r0
	bx lr
