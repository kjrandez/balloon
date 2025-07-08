#include "api.h"

uint32_t call_svc(uint32_t call, uint32_t param0, uint32_t param1);

uint32_t multiply(uint32_t a, uint32_t b)
{
	return call_svc(0, a, b);
}

void thread_start(uint32_t entry, uint32_t param)
{
	call_svc(1, entry, param);
}

void put_char(char out)
{
	call_svc(2, out, 0);
}

void get_char()
{
	call_svc(3, 0, 0);
}
