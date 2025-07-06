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

void kernel_main()
{
	xil_printf("Hello kernel\n");

	uint32_t res = intr_svc_call(12);

	xil_printf("Completed call: %u\n", res);
}
