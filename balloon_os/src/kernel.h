#pragma once

#include "inttypes.h"

typedef struct {
	uint32_t cpsr;
	uint32_t lr;
	uint32_t sp;
	uint32_t r[13]; // r0-r12
	uint32_t pc;
} intr_context_t;

typedef struct {
	intr_context_t intr_context;
} thread_state_t;

void intr_svc(intr_context_t* intr_context);
void intr_irq(intr_context_t* intr_context);
