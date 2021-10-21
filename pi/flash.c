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

#define I2C_EX1		(0x26)
#define I2C_EX2		(0x24)

// I2C_EX1 A addr [0..7]
// I2C_EX1 B addr [8..15]
// I2C_EX2 A data [0..7]
// I2C_EX2 B bus control [RESET, /RD, /WR, /MREQ, /IORQ, /BUSRQ, /BUSACK, /M1]

// control bus pin assignment on EX2 port B
#define	IO_RESET	(0x01)	// out
#define	IO_RD		(0x02)	// out
#define	IO_WR		(0x04)	// out
#define	IO_MREQ		(0x08)	// out
#define	IO_IORQ		(0x10)	// out
#define	IO_BUSRQ	(0x20)	// out
#define	IO_BUSACK	(0x40)	// out
#define	IO_M1		(0x80)	// out

/**
* Open the I2C port.
* @param dev The device file to open (on a PI, use /dev/i2c-1)
* @return Te file-descriptor or -1 if the open failed.
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
* Return 16-bit value from ports B and A (B=msb & A=lsb)
*****************************************************************************/
int mcp23017_read(int iic, int addr)
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
* Set up the mcp23017.
* @note This will leave asserted the RESET and /BUSRQ signals.
*****************************************************************************/
void mcp23017_init(int fd) 
{
	// preset the addres bus to zero
	mcp23017_write(fd, I2C_EX1, 0, 0);

	// preset the control lines to "off" & assert /BUSRQ
	mcp23017_write(fd, I2C_EX2, 0xff, ~IO_BUSRQ);

	// put all bits of EX1 into output mode
	mcp23017_set_dir(fd, I2C_EX1, 0, 0);	

	// put EX2.A (databus) into input and EX2.B (control) as appropriate
	mcp23017_set_dir(fd, I2C_EX2, 0xff, IO_BUSACK);	
}


/**
* Release the bus & de-assert the RESET signal.
*****************************************************************************/
void release_bus(int iic)
{
	// Float all the address, data, and control lines EXCEPT for RESET
	mcp23017_set_dir(iic, I2C_EX1, 0xff, 0xff);	// the address lines

	mcp23017_set_dir(iic, I2C_EX2, 0xff, ~IO_RESET);	// data and all ctl except reset

	// de-assert the RESET signal
	mcp23017_write(iic, I2C_EX2, 0, 0);	// This changes only the one RESET output bit to low
										// to shut off the external transistor
}


/**
* @param mem True if memory cycle else iorq cycle
*****************************************************************************/
int flash_write_cycle(int iic, uint16_t addr, uint8_t data)
{
	// set the value on the address bus
//	mcp23017_write(iic, I2C_EX1, addr&0xff, (addr>>8)&0xff);
	mcp23017_write(iic, I2C_EX1, (addr>>8)&0xff, addr&0xff);

	// stage the data to write
	mcp23017_write(iic, I2C_EX2, data, ~IO_BUSRQ);

	// turn on the data drivers
	mcp23017_set_dir(iic, I2C_EX2, 0, IO_BUSACK);

	// assert /MREQ & /WR
	mcp23017_write(iic, I2C_EX2, data, (~IO_MREQ)&(~IO_WR)&(~IO_BUSRQ));

	// un-assert /MREQ & /WR
	mcp23017_write(iic, I2C_EX2, data, ~IO_BUSRQ);

	// shut off the data drivers
	mcp23017_set_dir(iic, I2C_EX2, 0xff, IO_BUSACK);

	return 0;
}

/**
* read a byte from flash at address: addr.
*****************************************************************************/
int flash_read_cycle(int iic, uint16_t addr)
{
	// set the value on the address bus
//	mcp23017_write(iic, I2C_EX1, addr&0xff, (addr>>8)&0xff);
	mcp23017_write(iic, I2C_EX1, (addr>>8)&0xff, addr&0xff);

	// assert /MREQ & /RD with dummy data
	mcp23017_write(iic, I2C_EX2, 0, (~IO_MREQ)&(~IO_RD)&(~IO_BUSRQ));

	// READ the data bus
	int rc = mcp23017_read(iic, I2C_EX2);

	// un-assert /MREQ & /RD
	mcp23017_write(iic, I2C_EX2, 0, ~IO_BUSRQ);

	return rc&0xff;
}



/**
*****************************************************************************/
int flash_send_sdp(int iic, uint8_t cmd)
{
	int rc = 0;
	rc |= flash_write_cycle(iic, 0x5555, 0xAA);
	rc |= flash_write_cycle(iic, 0x2AAA, 0x55);
	rc |= flash_write_cycle(iic, 0x5555, cmd);
	return rc;
}

/**
* Read and print the Product ID.
*****************************************************************************/
int flash_read_product_id(int iic)
{
	flash_send_sdp(iic, 0x90);				// Software ID read

	int mfg = flash_read_cycle(iic, 0);		// read a byte from address 0
	int prod = flash_read_cycle(iic, 1);	// read a byte from address 1
	printf("Product ID: 0x%02x, 0x%02x\n", mfg, prod);

	flash_send_sdp(iic, 0xf0);				// Software ID Exit
	return 0;
}

/**
* Erase the entire chip.
* This operation can take up to 100msec.
*****************************************************************************/
int flash_chip_erase(int iic)
{
	printf("Begin chip erase\n");
	flash_send_sdp(iic, 0x80);
	flash_send_sdp(iic, 0x10);
	usleep(200000);		// some extra margin!
	printf("End chip erase\n");
	return 0;
}

/**
* Program one single byte data into address addr.
* This operation can take up to 20usec.
*****************************************************************************/
int flash_program_byte(int iic, uint16_t addr, uint8_t data)
{
	flash_send_sdp(iic, 0xa0);
	flash_write_cycle(iic, addr, data);
	usleep(25);		// some extra margin!
	return(0);
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
* When hit EOF, read the entire contents of the FLASH back in and print it out.
* Assert the /RESET signal.
* Float all the MCP23017 GPIO bits except /RESET (this will un-assert /BUSRQ.)
* Release the /RESET signal (by letting it float.)
*****************************************************************************/
int main()
{
    int     iic;

    iic = openIIC(I2C_DEV);
	mcp23017_init(iic);

	flash_read_product_id(iic);

	uint16_t addr = 0;
#if 1

#if 1
	flash_chip_erase(iic);
#endif

#if 1
	// Program the flash direct from stdin 
	uint8_t b;
	while(read(fileno(stdin), &b, 1) == 1)
	{
		flash_program_byte(iic, addr, b);
		printf("0x%02x: %02x\n", addr, b);
		++addr;
	}

	printf("**********************************************************\n");
#endif

#endif
	// read the flash back again
	if (addr == 0)
		addr = 0x100;

	uint raddr = 0;
	while(raddr < addr)
	{
		uint8_t b = flash_read_cycle(iic, raddr);
		printf("0x%02x: %02x\n", raddr, b);
		++raddr;
	}

	release_bus(iic);

	return 0;
}
