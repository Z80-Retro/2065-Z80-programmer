//****************************************************************************
//
//    2065-Z80-programmer I2C FLASH Programmer Application
//
//    Copyright (C) 2021 John Winans
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public
//    License as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//    Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public
//    License along with this library; if not, write to the Free Software
//    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
//    USA
//
//****************************************************************************

// Raspberry PI application to program the SST39SF010A FLASH
// chip on a 2063-Z80 board by way of using a 2065-Z80-programmer 
// adapter board.
//
// The PI communicates with the 2065-Z80-programmer using I2C.


#include <errno.h>

#include <unistd.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <sys/ioctl.h>
#include <sys/file.h>
#include <sys/time.h>
#include <string.h>
#include <time.h>

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

#include <sys/ioctl.h>

#include <linux/i2c-dev.h>
#include <i2c/smbus.h>

#include <stdint.h>

#include "dbg.h"


#define I2C_DEV "/dev/i2c-1"

// MCP23017 (expand-o chip) I2C addresses
#define I2C_EX1		(0x26)	///< the one connected to the address bus
#define I2C_EX2		(0x24)	///< the one connected to the control and data bus


// I2C_EX1 A addr [0..7]
// I2C_EX1 B addr [8..15]
// I2C_EX2 A data [0..7]
// I2C_EX2 B bus control [RESET, /RD, /WR, /MREQ, /IORQ, /BUSRQ, /BUSACK, /M1]

// control bus pin assignment on EX2 port B
#define	IO_RESET	(0x01)	///< ALWAYS output
#define	IO_RD		(0x02)	///< output when take over the bus, else input/float
#define	IO_WR		(0x04)	///< output when take over the bus, else input/float
#define	IO_MREQ		(0x08)	///< output when take over the bus, else input/float
#define	IO_IORQ		(0x10)	///< output when take over the bus, else input/float
#define	IO_BUSRQ	(0x20)	///< ALWAYS output
#define	IO_BUSACK	(0x40)	///< ALWAYS input
#define	IO_M1		(0x80)	///< ALWAYS input

// These are used to configure the control ports when transitioning from 
// passive to active control mode (ie, when the Z80 bus is taken over by the
// programmer.  Direction control = 1 for inputs, 0 for outputs.
#define IO_DIR_BUS_CTL_ON	(IO_BUSACK|IO_M1)		// all out (0) except /BUSACK & /M1
#define IO_DIR_BUS_CTL_OFF	(~(IO_RESET|IO_BUSRQ))	// /BUSRQ & RESET = out, all others=in


// These are used to set the direction of all 8 bits of a port to in or out
// mode when configuring the address and data lines.
#define IO_DIR_BUS_AD_IN	(0xff)	// all bits = 1 = input
#define IO_DIR_BUS_AD_OUT	(0)		// all bits = 0 = output


/**
* This is used to make the logic that has to toggle one bit (without
* knowing the state of the others) easier to implement.
* It is initialized to the power-on-reset value of the MCP23017 chip.
*****************************************************************************/
static uint8_t ctl_cache = 0xff;		// a copy of the last-written control latch value

/**
* This is a copy of the last-written data-direction seting.
* We use it to figure out if it needs to be changed or not when
* we need to put it into a given direction.
* It is initialized into an impossible value so that the 'first time'
* it is checked, it will indicate that it needs to be set.
*****************************************************************************/
static uint8_t data_dir_cache = 0x0f;


/**
* Open the I2C port.
* @param dev The device file to open (on a PI, use /dev/i2c-1)
* @return The file-descriptor or -1 if the open failed.
*****************************************************************************/
static int openIIC(
    const char *dev
    )
{
    // Create a file descriptor for the I2C bus
    int fd = open(dev, O_RDWR);
    if (fd<0)
        DBG("open failed. dev='%s'\n", dev);

    return fd;
}


/**
* Write the given values to ports A and B of the addr-specified MCP23017.
* @param iic The iic file handle
* @param addr The iic address of the MCP23017 device to write data into
* @param a The value to write to the GPIO A port register
* @param b The value to write to the GPIO B port register
*****************************************************************************/
int mcp23017_write(int iic, int addr, uint8_t a, uint8_t b)
{
    int rc = 0;
    rc = ioctl(iic, I2C_SLAVE, addr);
    if (rc < 0)
	{
        DBG("ioctl(I2C_SLAVE, %d) failed.  rc=%d\n", addr, rc);
		return -1;
	}

    uint8_t txbuf[5];
    txbuf[0] = 0x12;				// register 0x12 = GPIOA
    txbuf[1] = a;					// GPIOA value
    txbuf[2] = b;					// GPIOB value
    if ((rc=write(iic, txbuf, 3)) != 3)
	{
        DBG("write() failed %d\n", rc);
		return -1;
	}
	return 0;
}

/**
* Write the given value to port A of the addr-specified MCP23017.
* @param iic The iic file handle
* @param addr The iic address of the MCP23017 device to write data into
* @param a The value to write to the GPIO A port register
*****************************************************************************/
int mcp23017_write_a(int iic, int addr, uint8_t a)
{
    int rc = 0;
    rc = ioctl(iic, I2C_SLAVE, addr);
    if (rc < 0)
	{
        DBG("ioctl(I2C_SLAVE, %d) failed.  rc=%d\n", addr, rc);
		return -1;
	}

    uint8_t txbuf[5];
    txbuf[0] = 0x12;				// register 0x12 = GPIOA
    txbuf[1] = a;					// GPIOA value
    if ((rc=write(iic, txbuf, 2)) != 2)
	{
        DBG("write() failed %d\n", rc);
		return -1;
	}
	return 0;
}
/**
* Write the given value to port B of the addr-specified MCP23017.
* @param iic The iic file handle
* @param addr The iic address of the MCP23017 device to write data into
* @param b The value to write to the GPIO B port register
*****************************************************************************/
int mcp23017_write_b(int iic, int addr, uint8_t b)
{
    int rc = 0;
    rc = ioctl(iic, I2C_SLAVE, addr);
    if (rc < 0)
	{
        DBG("ioctl(I2C_SLAVE, %d) failed.  rc=%d\n", addr, rc);
		return -1;
	}

    uint8_t txbuf[5];
    txbuf[0] = 0x13;				// register 0x13 = GPIOB
    txbuf[1] = b;					// GPIOB value
    if ((rc=write(iic, txbuf, 2)) != 2)
	{
        DBG("write() failed %d\n", rc);
		return -1;
	}
	return 0;
}


/**
* Return 16-bit value from ports B and A (B=msb & A=lsb)
* @param iic The iic file handle
* @param addr The iic address of the MCP23017 device to write data into
* @return a 16-bit value comprised of the value read from port A (in the lsb)
*	and the value of port B (in the MSB).
*****************************************************************************/
uint16_t mcp23017_read(int iic, int addr)
{
    int rc = 0;
    rc = ioctl(iic, I2C_SLAVE, addr);
    if (rc < 0)
	{
        DBG("ioctl(I2C_SLAVE, %d) failed.  rc=%d\n", addr, rc);
		return -1;
	}

    uint8_t xbuf[5];
    xbuf[0] = 0x12;				// register 0x12 = GPIOA
    if ((rc=write(iic, xbuf, 1)) != 1)
	{
        DBG("write() failed %d\n", rc);
		return -1;
	}

	if ((rc=read(iic, xbuf, 2)) != 2)
	{
        DBG("read() failed %d\n", rc);
		return -1;
	}

	return xbuf[0]|(xbuf[1]<<8);	// A=lsb
}

/**
* Set the direction control of each of the pins of ports A and B of the
* MCP23017 at the given address.
* @param iic The iic file handle
* @param addr The iic address of the MCP23017 device to set the bit-directions
* @param a An 8-bit value indicating which pins are to be configured for
* output (0) and which for input (1). 
*****************************************************************************/
int mcp23017_set_dir(int iic, uint8_t addr, uint8_t a, uint8_t b)
{
    int rc = 0;
    rc = ioctl(iic, I2C_SLAVE, addr);
    if (rc < 0)
	{
        DBG("ioctl(I2C_SLAVE, %d) failed.  rc=%d\n", addr, rc);
		return -1;
	}

    uint8_t txbuf[5];
    txbuf[0] = 0;					// register 0 = DIRA
    txbuf[1] = a;					// DIRA value
    txbuf[2] = b;					// DIRB value
    if ((rc=write(iic, txbuf, 3)) != 3)
	{
        DBG("write() failed %d\n", rc);
		return -1;
	}
	return 0;
}

/**
* Set up the MCP23017 with all CTL line directions set to input (floating) 
* except for RESET & /BUSRQ.
* @param iic The iic file handle
* @note This will leave the /BUSRQ signal asserted (and RESET not asserted.)
*****************************************************************************/
void mcp23017_init(int fd) 
{
	// preset the addres bus to zero (it doesn't really matter)
	mcp23017_write(fd, I2C_EX1, 0, 0);

	// preset all the control lines to un-asserted except /BUSRQ
	ctl_cache = (~IO_BUSRQ)&(~IO_RESET);
	mcp23017_write(fd, I2C_EX2, 0xff, ctl_cache);	// data value = don't care

	// put EX2.A (databus) into input and EX2.B (control) as appropriate
	data_dir_cache = IO_DIR_BUS_AD_IN;
	mcp23017_set_dir(fd, I2C_EX2, data_dir_cache, IO_DIR_BUS_CTL_OFF);	// this will assert /BUSRQ 

	// Cycle the RESET signal here to make sure the FLASH select logic is reset
	mcp23017_write_b(fd, I2C_EX2, ctl_cache|IO_RESET);
	mcp23017_write_b(fd, I2C_EX2, ctl_cache);	

	// Note that the Z80 is likely to glitch the /BUSACK here due
	// to it getting reset, but that is OK.

	// At this point, the Z80 will have yielded control of the bus... 
	// so take over the rest of the control signals.
	// We don't care about /BUSACK because we want this to work even if
	// there is no Z80 on the motherboard.
	mcp23017_set_dir(fd, I2C_EX2, data_dir_cache, IO_DIR_BUS_CTL_ON);	

	// put all bits of EX1 (address bus) into output mode
	mcp23017_set_dir(fd, I2C_EX1, IO_DIR_BUS_AD_OUT, IO_DIR_BUS_AD_OUT);	

}

/**
* De-assert /BUSRQ and cycle the RESET signal.
* @param iic The iic file handle
*****************************************************************************/
void bus_release(int iic)
{
	// Float all the address, data, and control lines EXCEPT for RESET & /BUSRQ
	mcp23017_set_dir(iic, I2C_EX1, IO_DIR_BUS_AD_IN, IO_DIR_BUS_AD_IN);		// release the address lines
	mcp23017_set_dir(iic, I2C_EX2, IO_DIR_BUS_AD_IN, IO_DIR_BUS_CTL_OFF);	// release most of the ctl signals

	// /BUSRQ will have already be asserted 
	ctl_cache = IO_RESET|IO_BUSRQ; 		// de-assert /BUSRQ and assert RESET
	mcp23017_write_b(iic, I2C_EX2, ctl_cache);	

	// de-assert the RESET (while keeping /BUSRQ signal de-asserted)
	ctl_cache &= ~IO_RESET;				// RESET=0, leave IO_BUSRQ=1
	mcp23017_write_b(iic, I2C_EX2, ctl_cache);
}

/**
* Program a byte in the FLASH
*
* @param iic The iic file handle
* @param addr The address of the byte to be programmed
* @param data The byte value to write into the FLASH
* @note It is assumed that mcp23017_init() is called before this.
*****************************************************************************/
int bus_write_cycle(int iic, uint16_t addr, uint8_t data)
{
	// set the value on the address bus
	mcp23017_write(iic, I2C_EX1, (addr>>8)&0xff, addr&0xff);

	// stage the data to write 
	mcp23017_write_a(iic, I2C_EX2, data);

	if (data_dir_cache!=IO_DIR_BUS_AD_OUT)
	{
		// turn on the data drivers
		data_dir_cache=IO_DIR_BUS_AD_OUT;
		mcp23017_set_dir(iic, I2C_EX2, data_dir_cache, IO_DIR_BUS_CTL_ON);
	}

	// assert /MREQ & /WR
	mcp23017_write_b(iic, I2C_EX2, ctl_cache&(~IO_MREQ)&(~IO_WR));

	// un-assert /MREQ & /WR
	mcp23017_write_b(iic, I2C_EX2, ctl_cache);

	return 0;
}

/**
* Read a byte from flash at address: addr.
* @param iic The iic file handle
* @param addr The address of the byte to be read
* @return The byte value read from the FLASH
* @note It is assumed that mcp23017_init() is called before this.
*****************************************************************************/
uint8_t bus_read_cycle(int iic, uint16_t addr)
{
	// set the value on the address bus
	mcp23017_write(iic, I2C_EX1, (addr>>8)&0xff, addr&0xff);

	if (data_dir_cache!=IO_DIR_BUS_AD_IN)
	{
		// turn off the data drivers
		data_dir_cache=IO_DIR_BUS_AD_IN;
		mcp23017_set_dir(iic, I2C_EX2, data_dir_cache, IO_DIR_BUS_CTL_ON);
	}

	// assert /MREQ & /RD
	mcp23017_write_b(iic, I2C_EX2, ctl_cache&(~IO_MREQ)&(~IO_RD));

	// READ the data bus
	int rc = mcp23017_read(iic, I2C_EX2);

	// un-assert /MREQ & /RD
	mcp23017_write_b(iic, I2C_EX2, ctl_cache);

	return rc&0xff;
}



//***************************************************************************
//***************************************************************************
//***************************************************************************
//***************************************************************************




/**
* Send the security sequence to the FLASH
* @param iic The iic file handle
* @param cmd The value of the command byte to send to the FLASH
*****************************************************************************/
int flash_send_sdp(int iic, uint8_t cmd)
{
	int rc = 0;
	rc |= bus_write_cycle(iic, 0x5555, 0xAA);
	rc |= bus_write_cycle(iic, 0x2AAA, 0x55);
	rc |= bus_write_cycle(iic, 0x5555, cmd);
	return rc;
}

/**
* Read and print the FLASH Product ID.
* @param iic The iic file handle
* @return The manufacturer (in the MSB) and the product (in the LSB) 
*	of the FLASH
*****************************************************************************/
uint16_t flash_read_product_id(int iic)
{
	flash_send_sdp(iic, 0x90);				// Software ID read

	uint16_t mfg = bus_read_cycle(iic, 0);	// read a byte from address 0
	uint16_t prod = bus_read_cycle(iic, 1);	// read a byte from address 1
	printf("Product ID: 0x%02x, 0x%02x\n", mfg, prod);

	flash_send_sdp(iic, 0xf0);				// Software ID Exit

	return (mfg<<8)|prod;
}

/**
* Erase the entire FLASH chip.
* @param iic The iic file handle
* @note This operation can take up to 100msec.
*****************************************************************************/
int flash_chip_erase(int iic)
{
	flash_send_sdp(iic, 0x80);
	flash_send_sdp(iic, 0x10);
	usleep(200000);		// some extra margin!
	return 0;
}

/**
* Program one single byte data into address addr.
* @param iic The iic file handle
* @param addr The address of the byte to be programmed
* @param data The byte value to write into the FLASH
* @note This operation can take up to 20usec.
*****************************************************************************/
int flash_program_byte(int iic, uint16_t addr, uint8_t data)
{
#if 1
	if (data == 0xff)
		return 0;		// no need to program 0xff since that is the erased state
#endif

	flash_send_sdp(iic, 0xa0);
	bus_write_cycle(iic, addr, data);
	usleep(21);		// some extra margin!
	return 0;
}



/**
* Modus operandi:
*
* Open the I2C port.
* Initialize the MCP23017s and assert /BUSRQ to steal the Z80 BUS.
* Read and print the FLASH product ID.
* If the ID is invalid, exit with an error.
* Bulk-erase the entire FLASH chip.
* Read and program one byte at-a-time from a binary STDIN stream.
*	The first byte will be written into address 0, the second to address 1,...
* When hit EOF read the entire contents of the FLASH back in, compare it 
*	to the original data, and print a success/fail message.
* Release the Z80 bus.
*****************************************************************************/
int main()
{
    int     iic;
	char	buf[65536];

    iic = openIIC(I2C_DEV);
	mcp23017_init(iic);

	uint16_t d = flash_read_product_id(iic);
	if (d != 0xbfb5 && d != 0xbfb6 && d != 0xbfb7)
	{
		printf("Invalid FLASH signature: 0x%04x != 0xbfb5\n", d);
		exit(1);
	}

#if 0
bus_release(iic);
exit(0);
#endif

	uint16_t addr = 0;
#if 1

#if 1
	printf("Erasing entire chip\n");
	flash_chip_erase(iic);
#endif

#if 1

	printf("Programming\n");
	// Program the flash direct from stdin 
	uint8_t b;
	while(read(fileno(stdin), &b, 1) == 1)
	{
		if (addr%16 == 0)
			printf("%s%04x:", addr==0?"":"\n", addr);
		printf(" %02x", b);

		buf[addr] = b;
		flash_program_byte(iic, addr, b);
		++addr;

		if (addr > sizeof(buf))
		{
			printf("program file is too big, limiting to %d bytes\n", sizeof(buf));
			break;
		}
	}
	printf("\n");

	printf("**********************************************************\n");
#endif

#endif

	printf("Reading\n");
	char	rbuf[65536];

	// read the flash back again
	if (addr == 0)
		addr = 0x100;	// just read 0x100 bytes if we didn't write anything

	uint raddr = 0;
	while(raddr < addr)
	{
		rbuf[raddr] = bus_read_cycle(iic, raddr);

		if (raddr%16 == 0)
			printf("%s%04x:", raddr==0?"":"\n", raddr);
		printf(" %02x", rbuf[raddr]);

		++raddr;
	}
	printf("\n");

	bus_release(iic);

	
	printf("Verifying.\n");
	if (memcmp(buf, rbuf, addr) == 0)
		printf("SUCCESS!\n");
	else
		printf("FAILED!\n");

	return 0;
}
