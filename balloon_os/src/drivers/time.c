#include "time.h"

#include "xilinx/xil_io.h"


void time_reset()
{
	uint64_t time = 0;
	uint32_t period = COUNTS_PER_SECOND / 1000;

	// Disable Global Timer
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_CONTROL_OFFSET, 0);

	// Clear Global Timer Event Interrupt
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_INTR_OFFSET, 1);

	// Updating Timer Counter Register
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_COUNTER_LOWER_OFFSET, (uint32_t)time);
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_COUNTER_UPPER_OFFSET, (uint32_t)(time >> 32U));

	// Updating Comparator Register
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_COMP_LOWER_OFFSET, period);
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_COMP_UPPER_OFFSET, 0);

	// Update Auto-increment Register (moves comparator forward by one period)
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_AUTOINC_OFFSET, period);

	// Enable Global Timer With:
	// b3 - auto inc enable
	// b2 - irq enable
	// b1 - comp enable
	// b0 - enable
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_CONTROL_OFFSET, 0x0F);
}

uint32_t time_irq_status()
{
	return Xil_In32(GLOBAL_TMR_BASEADDR + GTIMER_INTR_OFFSET);
}

void time_irq_clear()
{
	Xil_Out32(GLOBAL_TMR_BASEADDR + GTIMER_INTR_OFFSET, 1);
}

uint64_t time_get()
{
	uint32_t low;
	uint32_t high;

	/* Reading Global Timer Counter Register */
	do
	{
		high = Xil_In32(GLOBAL_TMR_BASEADDR + GTIMER_COUNTER_UPPER_OFFSET);
		low = Xil_In32(GLOBAL_TMR_BASEADDR + GTIMER_COUNTER_LOWER_OFFSET);
	} while(Xil_In32(GLOBAL_TMR_BASEADDR + GTIMER_COUNTER_UPPER_OFFSET) != high);

	uint64_t time = (((uint64_t) high) << 32U) | (uint64_t) low;

	return time;
}

uint32_t time_get_seconds() {
	uint64_t time_counts = time_get();

	return time_counts / COUNTS_PER_SECOND;
}

uint32_t time_get_milliseconds() {
	uint64_t time_counts = time_get();

	return time_counts * 1000 / COUNTS_PER_SECOND;
}
