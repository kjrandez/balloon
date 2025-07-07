#include "xilinx/xparameters.h"
#include "uart.h"

#define read_reg(BaseAddress, RegOffset) \
	Xil_In32((BaseAddress) + (uint32_t)(RegOffset))

#define write_reg(BaseAddress, RegOffset, RegisterValue) \
	Xil_Out32((BaseAddress) + (uint32_t)(RegOffset), (uint32_t)(RegisterValue))

#define has_receive_data(BaseAddress)			 \
	!((Xil_In32((BaseAddress) + XUARTPS_SR_OFFSET) & 	\
	(uint32_t)XUARTPS_SR_RXEMPTY) == (uint32_t)XUARTPS_SR_RXEMPTY)

#define is_transmit_full(BaseAddress)			 \
	((Xil_In32((BaseAddress) + XUARTPS_SR_OFFSET) & 	\
	 (uint32_t)XUARTPS_SR_TXFULL) == (uint32_t)XUARTPS_SR_TXFULL)

#define is_transmit_fifo_empty(BaseAddress)			 \
	((Xil_In32((BaseAddress) + XUARTPS_SR_OFFSET) & 	\
	 (uint32_t)XUARTPS_SR_TXEMPTY) == (uint32_t)XUARTPS_SR_TXEMPTY)

#define is_transmit_active(BaseAddress)			 \
	((Xil_In32((BaseAddress) + XUARTPS_SR_OFFSET) & 	\
	 (uint32_t)XUARTPS_SR_TACTIVE) == (uint32_t)XUARTPS_SR_TACTIVE)

void uart_send(uint8_t Data)
{
	/* Wait until there is space in TX FIFO */
	while (is_transmit_full(XPAR_PS7_UART_1_BASEADDR));

	/* Write the byte into the TX FIFO */
	write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_FIFO_OFFSET, (uint32_t)Data);
}

uint32_t uart_recv(char* buffer, uint32_t length)
{
	uint32_t index = 0;

	while((index < length) && has_receive_data(XPAR_PS7_UART_1_BASEADDR)) {
		buffer[index++] = (char)read_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_FIFO_OFFSET);
	}

	return index;
}

uint32_t uart_irq_status()
{
	uint32_t status = read_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_IMR_OFFSET);
	status &= read_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_ISR_OFFSET);

	return status;
}

void uart_irq_clear(uint32_t status)
{
	write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_ISR_OFFSET, status);
}

void uart_reset()
{
	// Disable all interrupts
	//write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_IDR_OFFSET, XUARTPS_IXR_MASK);

	// Clear status flags - SW reset wont clear sticky flags.
	//write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_ISR_OFFSET, XUARTPS_IXR_MASK);

	// Rx and TX trigger register reset values
	write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_RXWM_OFFSET, 1);
	//write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_TXWM_OFFSET, XUARTPS_TXWM_RESET_VAL);

	// Enable RX trigger over interrupt
	write_reg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_IER_OFFSET, XUARTPS_IXR_RXOVR); // enable some
}
