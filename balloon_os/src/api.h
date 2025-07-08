#pragma once

#include "inttypes.h"

uint32_t call_svc(uint32_t call, uint32_t param0, uint32_t param1);
uint32_t multiply(uint32_t a, uint32_t b);
void thread_start(uint32_t entry, uint32_t param);
void put_char(char out);
void get_char();
