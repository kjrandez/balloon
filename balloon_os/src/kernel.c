#include "kernel.h"
#include "drivers/uart.h"
#include "drivers/time.h"
#include "drivers/gic.h"
#include "printf.h"
#include "api.h"

extern uint32_t _vector_table;
extern uint32_t _stack;
extern uint32_t _stack_end;
extern uint32_t _irq_stack;
extern uint32_t _svc_stack;
extern uint32_t _heap;

static uint32_t mem_size = 0x40000000;

static thread_state_t threads[10];
static int selected_thread = -1;

static void sched_add(intr_context_t* intr_context);
static void sched_tick(intr_context_t* intr_context);

void intr_svc(intr_context_t* intr_context) {
	// arguments for svc call in r0-2
	uint32_t call = intr_context->r[0];
	uint32_t param0 = intr_context->r[1];
	uint32_t param1 = intr_context->r[2];

	switch (call) {
	case SVC_MULTIPLY:
		intr_context->r[0] = param0 * param1;
		break;
	case SVC_START_THREAD:
		sched_add(intr_context);
		break;
	case 2:
		break;
	case 3:
		break;
	default:
		xil_printf("[!] SVC Interrupt: %x\r\n", call);
	}
}

void intr_irq(intr_context_t* intr_context) {
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
		sched_tick(intr_context);
		time_irq_clear();
		break;
	}
	case 82: {
		uint32_t status = uart_irq_status();
		uint32_t len = uart_recv(buf, 64);
		uart_irq_clear(status);

		buf[len] = 0;
		xil_printf("%s", buf);
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

	uint32_t stack_size = (&_stack - &_stack_end) * 4; // end is lower address
	uint32_t heap_size = mem_size - (uint32_t)&_heap;

	xil_printf("Vectors:    0x%08x\r\n", (uint32_t)&_vector_table);
	xil_printf("SYS Stack:  0x%08x - 0x%08x\r\n", (uint32_t)&_stack_end, (uint32_t)&_stack);
	xil_printf("IRQ Stack:  0x%08x\r\n", (uint32_t)&_irq_stack);
	xil_printf("SVC Stack:  0x%08x\r\n", (uint32_t)&_svc_stack);
	xil_printf("SYS Heap:   0x%08x - 0x%08x\r\n", (uint32_t)&_heap, (uint32_t)&_vector_table + mem_size);
	xil_printf("Stack Size: 0x%08x\r\n", stack_size);
	xil_printf("Heap Size:  0x%08x\r\n", heap_size);

	uint32_t res = multiply(3, 12);
	xil_printf("Completed call: %u\r\n", res);

	gic_intr_enable(27);
	gic_intr_enable(82);
}

void sched_add(intr_context_t* intr_context)
{

}

void sched_tick(intr_context_t* intr_context)
{

}


