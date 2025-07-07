#pragma once

#include <inttypes.h>
#include "xstatus.h"

/************************** Function Prototypes ******************************/
#ifdef ENABLE_SAFETY
extern uint32_t XStl_RegUpdate(uint32_t RegAddr, uint32_t RegVal);
#endif

/***************** Macros (Inline Functions) Definitions *********************/
#if defined __GNUC__
#if defined (__MICROBLAZE__)
#  define INST_SYNC		mbar(0) /**< Instruction Synchronization Barrier */
#  define DATA_SYNC		mbar(1) /**<  Data Synchronization Barrier  */
# else
#  define SYNCHRONIZE_IO	dmb() /**< Data Memory Barrier */
#  define INST_SYNC		isb() /**< Instruction Synchronization Barrier */
#  define DATA_SYNC		dsb() /**<  Data Synchronization Barrier  */
# endif
#else
# define SYNCHRONIZE_IO /**< Data Memory Barrier */
# define INST_SYNC /**< Instruction Synchronization Barrier */
# define DATA_SYNC /**<  Data Synchronization Barrier  */
# define INST_SYNC /**< Instruction Synchronization Barrier */
# define DATA_SYNC /**<  Data Synchronization Barrier  */
#endif

#if defined (__GNUC__) || defined (__ICCARM__) || defined (__MICROBLAZE__)
#define INLINE inline /**< static inline keyword */
#else
#define INLINE __inline /**<static inline keyword */
#endif

/*****************************************************************************/
/**
*
* @brief    Performs an input operation for a memory location by reading
*           from the specified address and returning the 8 bit Value read from
*            that address.
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 8 bit Value read from the specified input address.

*
******************************************************************************/
static INLINE uint8_t Xil_In8(uint32_t Addr)
{
	return *(volatile uint8_t *) Addr;
}

/*****************************************************************************/
/**
*
* @brief    Performs an input operation for a memory location by reading from
*           the specified address and returning the 16 bit Value read from that
*           address.
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 16 bit Value read from the specified input address.
*
******************************************************************************/
static INLINE uint16_t Xil_In16(uint32_t Addr)
{
	return *(volatile uint16_t *) Addr;
}

/*****************************************************************************/
/**
*
* @brief    Performs an input operation for a memory location by
*           reading from the specified address and returning the 32 bit Value
*           read  from that address.
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 32 bit Value read from the specified input address.
*
******************************************************************************/
static INLINE uint32_t Xil_In32(uint32_t Addr)
{
	return *(volatile uint32_t *) Addr;
}

/*****************************************************************************/
/**
*
* @brief     Performs an input operation for a memory location by reading the
*            64 bit Value read  from that address.
*
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 64 bit Value read from the specified input address.
*
******************************************************************************/
static INLINE uint64_t Xil_In64(uint32_t Addr)
{
	return *(volatile uint64_t *) Addr;
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for an memory location by
*           writing the 8 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains the 8 bit Value to be written at the specified
*           address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xil_Out8(uint32_t Addr, uint8_t Value)
{
	/* write 8 bit value to specified address */
	volatile uint8_t *LocalAddr = (volatile uint8_t *)Addr;
	*LocalAddr = Value;
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for a memory location by writing the
*            16 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains the Value to be written at the specified address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xil_Out16(uint32_t Addr, uint16_t Value)
{
	/* write 16 bit value to specified address */
	volatile uint16_t *LocalAddr = (volatile uint16_t *)Addr;
	*LocalAddr = Value;
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for a memory location by writing the
*           32 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains the 32 bit Value to be written at the specified
*           address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xil_Out32(uint32_t Addr, uint32_t Value)
{
	/* write 32 bit value to specified address */
#ifndef ENABLE_SAFETY
	volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
	*LocalAddr = Value;
#else
	XStl_RegUpdate(Addr, Value);
#endif
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for a memory location by writing the
*           64 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains 64 bit Value to be written at the specified address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xil_Out64(uint32_t Addr, uint64_t Value)
{
	/* write 64 bit value to specified address */
	volatile uint64_t *LocalAddr = (volatile uint64_t *)Addr;
	*LocalAddr = Value;
}

/*****************************************************************************/
/**
 *
 * @brief	Performs an output operation for a memory location by writing the
 *       	32 bit Value to the the specified address and then reading it
 *       	back to verify the value written in the register.
 *
 * @param	Addr contains the address to perform the output operation
 * @param	Value contains 32 bit Value to be written at the specified address
 *
 * @return	Returns Status
 *        	- XST_SUCCESS on success
 *        	- XST_FAILURE on failure
 *
 *****************************************************************************/
static INLINE int Xil_SecureOut32(uint32_t Addr, uint32_t Value)
{
	int Status = XST_FAILURE;
	uint32_t ReadReg;
	uint32_t ReadRegTemp;

	/* writing 32 bit value to specified address */
	Xil_Out32(Addr, Value);

	/* verify value written to specified address with multiple reads */
	ReadReg = Xil_In32(Addr);
	ReadRegTemp = Xil_In32(Addr);

	if( (ReadReg == Value) && (ReadRegTemp == Value) ) {
		Status = XST_SUCCESS;
	}

	return Status;
}

/*****************************************************************************/
/**
*
* @brief    Perform a 16-bit endian conversion.
*
* @param	Data 16 bit value to be converted
*
* @return	16 bit Data with converted endianness
*
******************************************************************************/
static INLINE __attribute__((always_inline)) uint16_t Xil_EndianSwap16(uint16_t Data)
{
	return (uint16_t) (((Data & 0xFF00U) >> 8U) | ((Data & 0x00FFU) << 8U));
}

/*****************************************************************************/
/**
*
* @brief    Perform a 32-bit endian conversion.
*
* @param	Data : 32 bit value to be converted
*
* @return	32 bit data with converted endianness
*
******************************************************************************/
static INLINE __attribute__((always_inline)) uint32_t Xil_EndianSwap32(uint32_t Data)
{
	uint16_t LoWord;
	uint16_t HiWord;

	/* get each of the half words from the 32 bit word */

	LoWord = (uint16_t) (Data & 0x0000FFFFU);
	HiWord = (uint16_t) ((Data & 0xFFFF0000U) >> 16U);

	/* byte swap each of the 16 bit half words */

	LoWord = (uint16_t)(((LoWord & 0xFF00U) >> 8U) | ((LoWord & 0x00FFU) << 8U));
	HiWord = (uint16_t)(((HiWord & 0xFF00U) >> 8U) | ((HiWord & 0x00FFU) << 8U));

	/* swap the half words before returning the value */

	return ((((uint32_t)LoWord) << (uint32_t)16U) | (uint32_t)HiWord);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
# define Xil_In16LE	Xil_In16 /**< Register Read of 16 Bits in Little Endian */
# define Xil_In32LE	Xil_In32 /**< Register Read of 32 Bits in Little Endian */
# define Xil_Out16LE	Xil_Out16 /**< Register Write of 16 Bits in Little Endian */
# define Xil_Out32LE	Xil_Out32 /**< Register Write of 32 Bits in Little Endian */
# define Xil_Htons	Xil_EndianSwap16 /**< Endian swap of 16 bits */
# define Xil_Htonl	Xil_EndianSwap32 /**< Endian swap of 32 bits */
# define Xil_Ntohs	Xil_EndianSwap16 /**< Endian swap of 16 bits */
# define Xil_Ntohl	Xil_EndianSwap32 /**< Endian swap of 32 bits */
# else
# define Xil_In16BE	Xil_In16 /**< Register Read of 16 Bits in Big Endian */
# define Xil_In32BE	Xil_In32 /**< Register Read of 32 Bits in Big Endian */
# define Xil_Out16BE	Xil_Out16 /**< Register Write of 16 Bits in Big Endian */
# define Xil_Out32BE	Xil_Out32 /**< Register Write of 32 Bits in Big Endian */
# define Xil_Htons(Data) (Data) /**< Endian swap of 16 bits */
# define Xil_Htonl(Data) (Data) /**< Endian swap of 32 bits */
# define Xil_Ntohs(Data) (Data) /**< Endian swap of 16 bits */
# define Xil_Ntohl(Data) (Data) /**< Endian swap of 32 bits */
#endif
#else
# define Xil_In16LE	Xil_In16 /**< Register Read of 16 Bits in Little Endian */
# define Xil_In32LE	Xil_In32 /**< Register Read of 32 Bits in Little Endian */
# define Xil_Out16LE	Xil_Out16 /**< Register Write of 16 Bits in Little Endian */
# define Xil_Out32LE	Xil_Out32 /**< Register Write of 32 Bits in Little Endian */
# define Xil_Htons	Xil_EndianSwap16 /**< Endian swap of 16 bits */
# define Xil_Htonl	Xil_EndianSwap32 /**< Endian swap of 32 bits */
# define Xil_Ntohs	Xil_EndianSwap16 /**< Endian swap of 16 bits */
# define Xil_Ntohl	Xil_EndianSwap32 /**< Endian swap of 32 bits */
#endif

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE uint16_t Xil_In16BE(uint32_t Addr) /**< Static inline function to Read
                                                Register of 16 Bits in Big Endian */
#else
static INLINE uint16_t Xil_In16LE(uint32_t Addr) /**< Static inline function to Read
                                                Register of 16 Bits in Little Endian */
#endif
#else
/**
* Static inline function to Read Register of 16 Bits in Big Endian.
**********************************************************************************/
static INLINE uint16_t Xil_In16BE(uint32_t Addr)
#endif
{
	uint16_t value = Xil_In16(Addr);
	return Xil_EndianSwap16(value);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE uint32_t Xil_In32BE(uint32_t Addr) /**< Static inline function to Read
                                                Register of 32 Bits in Big Endian */
#else
static INLINE uint32_t Xil_In32LE(uint32_t Addr) /**< Static inline function to Read
                                                Register of 32 Bits in Little Endian */
#endif
#else
/**
* Static inline function to Read Register of 32 Bits in Big Endian.
**********************************************************************************/
static INLINE uint32_t Xil_In32BE(uint32_t Addr)
#endif
{
	uint32_t value = Xil_In32(Addr);
	return Xil_EndianSwap32(value);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE void Xil_Out16BE(uint32_t Addr, uint16_t Value) /**< Static inline function to write
                                                Register of 16 Bits in Big Endian */
#else
static INLINE void Xil_Out16LE(uint32_t Addr, uint16_t Value) /**< Static inline function to write
                                                Register of 16 Bits in Little Endian */
#endif
#else
/**
* Static inline function to write Register of 16 Bits in Big Endian.
**********************************************************************************/
static INLINE void Xil_Out16BE(uint32_t Addr, uint16_t Value)
#endif
{
	Value = Xil_EndianSwap16(Value);
	Xil_Out16(Addr, Value);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE void Xil_Out32BE(uint32_t Addr, uint32_t Value) /**< Static inline function to write
                                                Register of 32 Bits in Big Endian */
#else
static INLINE void Xil_Out32LE(uint32_t Addr, uint32_t Value) /**< Static inline function to write
                                                Register of 32 Bits in Little Endian */
#endif
#else
/**
* Static inline function to Read Register of 16 Bits in Big Endian.
**********************************************************************************/
static INLINE void Xil_Out32BE(uint32_t Addr, uint32_t Value)
#endif
{
	Value = Xil_EndianSwap32(Value);
	Xil_Out32(Addr, Value);
}
