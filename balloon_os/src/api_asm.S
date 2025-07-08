.arm

.global call_svc

.section .text

call_svc:
	push {lr}

	# R0 - call
	# R1 - param 0
	# R2 - param 1
	svc 0

	# R0 - result

	pop {lr}
	bx lr
