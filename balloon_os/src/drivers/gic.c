#include "stdbool.h"
#include "../printf.h"
#include "gic.h"


void gic_reset()
{
	// Disable GIC distribution
	XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_DIST_EN_OFFSET, 0);

	// All shared interrupts (> 32) set to level sensitive, active high (0)
	for (uint32_t intr = 32; intr < XSCUGIC_MAX_NUM_INTR_INPUTS; intr += 16) {
		XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_INT_CFG_OFFSET_CALC(intr), 0U);
	}

	// All interrupt priorities set to a default priority
	for (uint32_t intr = 0; intr < XSCUGIC_MAX_NUM_INTR_INPUTS; intr += 4) {
		XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_PRIORITY_OFFSET_CALC(intr), 0xa0a0a0a0U);
	}

	// All interrupts are disabled
	for (uint32_t intr = 0; intr < XSCUGIC_MAX_NUM_INTR_INPUTS; intr += 32) {
		uint32_t reg_offset = (intr / 32) * 4;
		XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_DISABLE_OFFSET + reg_offset, 0xFFFFFFFF);
	}

	// Enable GIC distribution
	XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_DIST_EN_OFFSET, 1);

	// Program interrupt priority mask for this CPU to a greater value than default priority
	XScuGic_WriteReg(XPAR_SCUGIC_0_CPU_BASEADDR, XSCUGIC_CPU_PRIOR_OFFSET, 0xF0U);

	// Enable GIC signaling of interrupts to CPU
	XScuGic_WriteReg(XPAR_SCUGIC_0_CPU_BASEADDR, XSCUGIC_CONTROL_OFFSET, 0x07U);
}

uint32_t gic_intr_ack()
{
	return XScuGic_ReadReg(XPAR_SCUGIC_0_CPU_BASEADDR, XSCUGIC_INT_ACK_OFFSET);
}

void gic_intr_end(uint32_t intr_desc)
{
	XScuGic_WriteReg(XPAR_SCUGIC_0_CPU_BASEADDR, XSCUGIC_EOI_OFFSET, intr_desc);
}

void gic_intr_enable(int intr)
{
	// 32 consecutive interrupts per register, each 1 bit
	uint32_t reg_offset = (intr / 32) * 4;
	uint32_t reg_bit = intr % 32;
	uint32_t reg_val = 1 << reg_bit;

	XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_ENABLE_SET_OFFSET + reg_offset, reg_val);

	// For shared interrupts, need to set which CPUs to route to
	if (intr >= 32) {
		reg_offset = (intr / 4) * 4;
		reg_bit = (intr % 4) * 8;

		reg_val = XScuGic_ReadReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_SPI_TARGET_OFFSET + reg_offset);
		reg_val |= 1 << reg_bit;

		XScuGic_WriteReg(XPAR_SCUGIC_0_DIST_BASEADDR, XSCUGIC_SPI_TARGET_OFFSET + reg_offset, reg_val);
	}
}

