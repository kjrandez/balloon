#include "drivers/uart.h"
#include "drivers/time.h"
#include "printf.h"

uint32_t intr_svc_call(uint32_t param);

uint32_t intr_svc(uint32_t param) {
	xil_printf("! SVC Interrupt\n");

	return param * 3;
}

void intr_irq() {
	xil_printf("! IRQ Interrupt\n");
}

void intr_fiq() {
	xil_printf("! FIQ Interrupt\n");
}

uint32_t time_seconds() {
	uint64_t time_counts;

	time_get(&time_counts);

	return time_counts / COUNTS_PER_SECOND;
}

void kernel_main()
{
	time_reset();
	//uart_reset(STDOUT_BASEADDRESS);

	xil_printf("Hello kernel\n");

	uint32_t res = intr_svc_call(12);

	xil_printf("Completed call: %u\n", res);

	uint32_t time = time_seconds();
	uint32_t status;

	while (1) {
		if (time_seconds() != time) {
			time = time_seconds();
			status = time_irq_status();
			xil_printf("Time: %u, Status: %u\n", time, status);

			if (status) {
				time_irq_clear();
			}
		}
	}
}
