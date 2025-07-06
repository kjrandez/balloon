#include "uart.h"

#define read_reg(BaseAddress, RegOffset) \
	Xil_In32((BaseAddress) + (uint32_t)(RegOffset))

#define write_reg(BaseAddress, RegOffset, RegisterValue) \
	Xil_Out32((BaseAddress) + (uint32_t)(RegOffset), (uint32_t)(RegisterValue))

#define is_receive_data(BaseAddress)			 \
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

void uart_send(uint32_t BaseAddress, uint8_t Data)
{
	/* Wait until there is space in TX FIFO */
	while (is_transmit_full(BaseAddress));

	/* Write the byte into the TX FIFO */
	write_reg(BaseAddress, XUARTPS_FIFO_OFFSET, (uint32_t)Data);
}

void uart_reset(uint32_t BaseAddress)
{

	/* Disable interrupts */
	write_reg(BaseAddress, XUARTPS_IDR_OFFSET, XUARTPS_IXR_MASK);

	/* Disable receive and transmit */
	write_reg(BaseAddress, XUARTPS_CR_OFFSET,
				((uint32_t)XUARTPS_CR_RX_DIS | (uint32_t)XUARTPS_CR_TX_DIS));

	/*
	 * Software reset of receive and transmit
	 * This clears the FIFO.
	 */
	write_reg(BaseAddress, XUARTPS_CR_OFFSET,
				((uint32_t)XUARTPS_CR_TXRST | (uint32_t)XUARTPS_CR_RXRST));

	/* Clear status flags - SW reset wont clear sticky flags. */
	write_reg(BaseAddress, XUARTPS_ISR_OFFSET, XUARTPS_IXR_MASK);

	/*
	 * Mode register reset value : All zeroes
	 * Normal mode, even parity, 1 stop bit
	 */
	write_reg(BaseAddress, XUARTPS_MR_OFFSET,
				XUARTPS_MR_CHMODE_NORM);

	/* Rx and TX trigger register reset values */
	write_reg(BaseAddress, XUARTPS_RXWM_OFFSET,
				XUARTPS_RXWM_RESET_VAL);
	write_reg(BaseAddress, XUARTPS_TXWM_OFFSET,
				XUARTPS_TXWM_RESET_VAL);

	/* Rx timeout disabled by default */
	write_reg(BaseAddress, XUARTPS_RXTOUT_OFFSET,
				XUARTPS_RXTOUT_DISABLE);

	/* Baud rate generator and dividor reset values */
	write_reg(BaseAddress, XUARTPS_BAUDGEN_OFFSET,
				XUARTPS_BAUDGEN_RESET_VAL);
	write_reg(BaseAddress, XUARTPS_BAUDDIV_OFFSET,
				XUARTPS_BAUDDIV_RESET_VAL);

	/*
	 * Control register reset value -
	 * RX and TX are disable by default
	 */
	write_reg(BaseAddress, XUARTPS_CR_OFFSET,
				((uint32_t)XUARTPS_CR_RX_DIS | (uint32_t)XUARTPS_CR_TX_DIS |
						(uint32_t)XUARTPS_CR_STOPBRK));

}
