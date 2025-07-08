#include "util.h"

void *memcpy (void *__restrict dest, const void *__restrict src, unsigned int size)
{
	uint8_t* dest_ptr = dest;
	const uint8_t* src_ptr = src;
	const uint8_t* src_ptr_end = src_ptr + size;

	while (src_ptr < src_ptr_end) {
		*dest_ptr = *src_ptr;
		dest_ptr++;
		src_ptr++;
	}

	return dest;
}
