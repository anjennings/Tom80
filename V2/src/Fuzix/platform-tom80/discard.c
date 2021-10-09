#include <kernel.h>
#include <kdata.h>
#include <printf.h>
#include <blkdev.h>
#include "config.h"

uint8_t platform_param(char *p)
{
	used(p);
	return 0;
}

/* Nothing to do for the map of init */
void map_init(void)
{
}

void platform_copyright()
{
	kprintf("FUZIX for Tom80, 2021 Aidan Jennings\n");
}
