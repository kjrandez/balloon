#include "api.h"
#include "util.h"
#include "kernel.h"

uint32_t multiply(uint32_t a, uint32_t b)
{
	return call_svc(SVC_MULTIPLY, a, b);
}

void start_thread(uint32_t entry, uint32_t param)
{
	call_svc(SVC_START_THREAD, entry, param);
}

void put_char(char out)
{
	call_svc(SVC_PUT_CHAR, out, 0);
}

void get_char()
{
	call_svc(SVC_GET_CHAR, 0, 0);
}
