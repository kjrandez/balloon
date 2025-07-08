#pragma once

#include "inttypes.h"

#define SVC_MULTIPLY 		(0)
#define SVC_START_THREAD	(1)
#define SVC_PUT_CHAR 		(2)
#define SVC_GET_CHAR 		(3)

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
