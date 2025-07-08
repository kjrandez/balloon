#include "program.h"
#include "printf.h"
#include "drivers/time.h"

static void print_time(char my_char, uint32_t ms) {
	// Tests that stack moves correctly

	xil_printf("Thread %c, %u ms\r\n", my_char, ms);
}

void program_entry(char my_char)
{
	uint32_t last_tick = 0;

	while (1) {
		uint32_t ms = time_get_milliseconds();
		uint32_t tick = ms / 100;

		if (tick != last_tick) {
			last_tick = tick;
			print_time(my_char, ms);
		}
	}
}
