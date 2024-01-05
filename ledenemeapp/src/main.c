/*
 * main.c
 */
#include "xparameters.h"
#include "xil_types.h"
#include "sleep.h"

uint32_t* led_addr;

int main()
{
	led_addr = (uint32_t *) XPAR_GPIO_1_BASEADDR;

	while(1)
	{
		*led_addr = 0x0F; // led on
		sleep(1);
		*led_addr = 0x00; // led off
		sleep(1);
	}

	return 0;
}
