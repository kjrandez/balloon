#include "drivers/uart.h"
#include "drivers/time.h"
#include "drivers/gic.h"

#include "printf.h"

#define XREG_CPSR_IRQ_ENABLE (0x80)
#define XREG_CPSR_FIQ_ENABLE (0x40)

uint32_t call_svc(uint32_t param);
uint32_t get_cpsr();
void set_cpsr(uint32_t new_val);

void enable_irq() {
	uint32_t cpsr = get_cpsr();
	cpsr &= ~XREG_CPSR_IRQ_ENABLE;
	set_cpsr(cpsr);
}

uint32_t intr_svc(uint32_t param) {
	xil_printf("[!] SVC Interrupt: %x\r\n", param);

	return param * 3;
}

void intr_irq() {
	char buf[65];
	uint32_t intr_desc = gic_intr_ack();
	uint32_t intr_id = intr_desc & 0x03FF;

	// ignore spurious interrupts
	if (intr_id == 0x3FF)
		return;

	// handle irq based upon valid interrupt id
	switch (intr_id) {
	case 27: {
		xil_printf("Time: %u\r\n", time_get_seconds());
		time_irq_clear();
		break;
	}
	case 82: {
		uint32_t status = uart_irq_status();
		uint32_t len = uart_recv(buf, 64);
		uart_irq_clear(status);

		buf[len] = 0;
		xil_printf("[%s]", buf);
		break;
	}
	default:
		xil_printf("[!] IRQ Interrupt: %x\r\n", intr_desc);
		break;
	}

	// unconditionally end a valid interrupt
	gic_intr_end(intr_desc);
}

void kernel_main()
{
	time_reset();
	gic_reset();
	uart_reset();

	xil_printf("Hello kernel\r\n");

	uint32_t res = call_svc(12);

	xil_printf("Completed call: %u\r\n", res);

	enable_irq();
	gic_intr_enable(27);
	gic_intr_enable(82);

	for (;;);
}
