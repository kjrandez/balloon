#pragma once

#include "inttypes.h"

uint32_t get_cpsr();
void set_cpsr(uint32_t new_val);
uint32_t call_svc(uint32_t call, uint32_t param0, uint32_t param1);
void hang();
void *memcpy (void *__restrict, const void *__restrict, unsigned int);

