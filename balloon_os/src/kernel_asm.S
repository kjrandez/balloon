.arm

.global intr_svc_call

.section .text

intr_svc_call:
	push {lr}

	# R0 passed, R3 returned
	svc 0

	pop {lr}
	bx lr
