.global _prestart
.global _boot
.global _vector_table

.equ UART.BASE, 0xE0001000
.equ UART.SR,   0xE000102C
.equ UART.FIFO, 0xE0001030

.section .vectors

_vector_table:
	B	_boot
	B	_hang
	B	_hang
	B	_hang
	B	_hang
	NOP
	B	_hang
	B	_hang

.section .boot,"ax"

_prestart:

_boot:
    ldr r0,=UART.FIFO
    mov r1, #'z'
    strb r1,[r0]
    strb r1,[r0]
    strb r1,[r0]

_hang:
    b _hang
