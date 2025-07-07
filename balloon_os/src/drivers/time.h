#pragma once

#include <inttypes.h>
#include "xilinx/xparameters.h"

void time_reset();
uint64_t time_get();
uint32_t time_get_seconds();
uint32_t time_irq_status();
void time_irq_clear();

/************************** Constant Definitions *****************************/
#define GLOBAL_TMR_BASEADDR               XPAR_GLOBAL_TMR_BASEADDR
#define GTIMER_COUNTER_LOWER_OFFSET       0x00U
#define GTIMER_COUNTER_UPPER_OFFSET       0x04U
#define GTIMER_CONTROL_OFFSET             0x08U
#define GTIMER_INTR_OFFSET				  0x0CU
#define GTIMER_COMP_LOWER_OFFSET		  0x10U
#define GTIMER_COMP_UPPER_OFFSET		  0x14U
#define GTIMER_AUTOINC_OFFSET			  0x18U

#define COUNTS_PER_SECOND          (XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ / 2)
